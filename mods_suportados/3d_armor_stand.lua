--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Mod 3D_Armor_Stand
  ]]


if not minetest.get_modpath("3d_armor_stand") then return end

-- Traduções
local S = xpro.S

-- Crafts
for name,xp in pairs({
	["3d_armor_stand:armor_stand"] = 1,
	["3d_armor_stand:locked_armor_stand"] = 1,
}) do
	xpro.register_on_craft(name, xp)
end




