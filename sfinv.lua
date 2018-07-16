--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Inventario sfinv
  ]]

if sfinv == nil then return end

local S = xpro.S

sfinv.register_page("xpro:info", {
	title = "Nivel",
	
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
		
		local formspec = "label[0,0;Nivel "..my_lvl.."]"
			.."label[0,0.5;Pontos: "..my_xp.."]"
			.."label[0,1;Cash XP: "..xp_disp.."]"
			.."button[0,1.5;3,1;shop;Loja de Premios]"
			.."button[0,2.5;3,1;ranking;Ranking Global]"
			
			-- Liga
			.."image[3.8,0.34;4,4;xpro_liga_bg.png]"
			.."label[3,0;Liga "..xpro.ligas[my_lvl].name.."]"
			.."image[4.17,0.7;3.2,3.2;"..xpro.ligas[my_lvl].img.."]"
			
			.."label[0,3.3;Progresso]"
			.."image[0,3.8;9.65,0.8;xpro_xp_bar_alfa.png^[lowpart:"..math.ceil(progresso*100)..":xpro_xp_bar.png^[transformR270]"
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
	sfinv.set_player_inventory_formspec(minetest.get_player_by_name(name))
end)
xpro.register_on_rem_xp(function(name, xp_removed)
	sfinv.set_player_inventory_formspec(minetest.get_player_by_name(name))
end)













