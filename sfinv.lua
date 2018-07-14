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
		
		local formspec = "label[0,0;Nivel "..my_lvl.."]"
			.."label[0,0.5;Pontos: "..my_xp.."]"
			.."button[4,0;4,1;ranking;Ranking Global]"
		
		return sfinv.make_formspec(player, context, formspec, true)
	end,
	on_player_receive_fields = function(self, player, context, fields)
		if fields.ranking then
			minetest.show_formspec(player:get_player_name(), "xpro:ranking", xpro.ranking_formspec)
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













