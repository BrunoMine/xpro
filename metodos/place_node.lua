--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Evoluir ao colocar um node
  ]]

minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)
    
	xpro.rem_xp(placer:get_player_name(), 30)
    
end)











