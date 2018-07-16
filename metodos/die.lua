--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Regredir pontos de XP ao morrer
  ]]

-- Chamada Global
minetest.register_on_dieplayer(function(player)
	local name = player:get_player_name()
	local lvl = xpro.get_player_lvl(name)
	local xp_rem = 25*lvl
	xpro.rem_xp(name, xp_rem)
end)











