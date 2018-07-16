--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Eventos de ganho ou perca de XP ao colocar um node
  ]]

-- Lista de itens que geram recompensa
xpro.place_node_xp_list = {
	--["default:stone_with_coal"] = 1,
	--["default:stone_with_mese"] = -5,
}

-- Chamada global
minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)
	
	-- Verifica se node gera XP
	if xpro.place_node_xp_list[newnode.name] then
		if xpro.place_node_xp_list[newnode.name] > 0 then
			xpro.add_xp(placer:get_player_name(), xpro.place_node_xp_list[newnode.name])
		else
			xpro.rem_xp(placer:get_player_name(), math.abs(xpro.place_node_xp_list[newnode.name]))
		end
	end
end)











