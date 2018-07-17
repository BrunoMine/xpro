--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Eventos de ganho ou perca de XP ao cavar um node
  ]]

-- Lista de itens que geram recompensa
xpro.dig_node_xp_list = {}

-- Chamada global
minetest.register_on_dignode(function(pos, oldnode, digger)
	
	-- Verifica se node gera XP
	if xpro.dig_node_xp_list[oldnode.name] then
		if xpro.dig_node_xp_list[oldnode.name] > 0 then
			xpro.add_xp(digger:get_player_name(), xpro.dig_node_xp_list[oldnode.name])
		else
			xpro.rem_xp(digger:get_player_name(), math.abs(xpro.dig_node_xp_list[oldnode.name]))
		end
	end
end)

-- Registrar item para o evento
xpro.register_on_dignode = function(name, xp)
	if tonumber(xp) == 0 then return end
	xpro.dig_node_xp_list[name] = xp
end








