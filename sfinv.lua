--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Inventario sfinv
  ]]

if not minetest.get_modpath("sfinv") then return end

-- Traduções
local S = xpro.S

sfinv.register_page("xpro:info", {
	title = S("Nivel"),
	
	get = function(self, player, context)
		
		local name = player:get_player_name()
		
		local my_xp = xpro.get_player_xp(name)
		local my_lvl = xpro.get_player_lvl(name)
		local xp_gasto = player:get_attribute("xpro_xp_gasto")
		local xp_disp = my_xp-xp_gasto
		if xp_disp < 0 then xp_disp = 0 end
		
		-- Calcula progresso da barra
		local progresso = 1
		if xpro.niveis[my_lvl+1] ~= nil then
			local xp = xpro.niveis[my_lvl] - my_xp
			local xp_t = xpro.niveis[my_lvl] - xpro.niveis[my_lvl+1]
			progresso = xp/xp_t
		end
		
		local formspec = "label[0,0;"..S("Nivel @1", my_lvl).."]"
			.."label[0,0.5;"..S("Pontos: @1", my_xp).."]"
			.."label[0,1;"..S("Cash XP: @1", xp_disp).."]"
			.."button[0,1.5;3,1;shop;"..S("Loja de Premios").."]"
			.."button[0,2.5;3,1;ranking;"..S("Ranking Global").."]"
			
			-- Liga
			.."image[3.8,0.34;4,4;xpro_liga_bg.png]"
			.."label[3,0;"..S("Liga @1", xpro.ligas[my_lvl].name).."]"
			.."image[4.17,0.7;3.2,3.2;"..xpro.ligas[my_lvl].img.."]"
			
			.."label[0,3.3;"..S("Progresso").."]"
			.."image[0,3.8;9.65,0.8;xpro_xp_bar_grade.png^[transformR90^[lowpart:"..math.ceil(progresso*100)..":xpro_xp_bar.png^[transformR270]"
			.."image[0,3.8;9.65,0.8;xpro_xp_bar_grade.png]"
		
		return sfinv.make_formspec(player, context, formspec, true)
	end,
	on_player_receive_fields = function(self, player, context, fields)
		if fields.ranking then
			minetest.show_formspec(player:get_player_name(), "xpro:ranking", xpro.ranking_formspec)
		elseif fields.shop then
			xpro.acessar_shop(player:get_player_name())
		end
	end,
	
	
})

-- Atualização do painel ao adicionar ou remover pontos
xpro.register_on_add_xp(function(name, xp_added)
	-- Check if player is online
	local player = minetest.get_player_by_name(name)
	if not player then return end
	sfinv.set_player_inventory_formspec(player)
end)
xpro.register_on_rem_xp(function(name, xp_removed)
	-- Check if player is online
	local player = minetest.get_player_by_name(name)
	if not player then return end
	sfinv.set_player_inventory_formspec(player)
end)

-- Atualizar inventário
xpro.update_inventory_formspec = function(player)
	sfinv.set_player_inventory_formspec(player)
end

-- Abrir inventario na aba de niveis [Não funciona pois o exibir formspec não significa abrir o inventario, os botões sfinv não funcionarão assim]
xpro.show_inventory_formspec = function(player)
	minetest.show_formspec(player:get_player_name(), "", player:get_inventory_formspec())
end










