--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Evoluir ao cavar um node
  ]]


minetest.register_on_dignode(function(pos, oldnode, digger)
    
    xpro.add_xp(digger:get_player_name(), 200)
    
end)











