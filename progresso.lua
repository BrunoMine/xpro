--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Ao evoluir ou regradir niveis
  ]]


xpro.register_on_add_xp(function(name, xp_added, lvl_changed)
	if lvl_changed == true then
		minetest.chat_send_player(name, "Atingiu Nivel "..xpro.get_player_lvl(name))
	end
end)


xpro.register_on_rem_xp(function(name, xp_removed, lvl_changed)
	if lvl_changed == true then
		minetest.chat_send_player(name, "Regrediu ao Nivel "..xpro.get_player_lvl(name))
	end
end)










