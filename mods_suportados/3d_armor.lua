--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Mod 3D_Armor
  ]]


if not minetest.get_modpath("3d_armor") then return end

-- Traduções
local S = xpro.S

-- Crafts
for name,xp in pairs({
	-- Capacete
	["3d_armor:helmet_wood"] = 1,
	["3d_armor:helmet_cactus"] = 1,
	["3d_armor:helmet_steel"] = 3,
	["3d_armor:helmet_bronze"] = 6,
	["3d_armor:helmet_diamond"] = 9,
	["3d_armor:helmet_gold"] = 5,
	["3d_armor:helmet_mithril"] = 8,
	-- Peitoral
	["3d_armor:chestplate_wood"] = 1,
	["3d_armor:chestplate_cactus"] = 1,
	["3d_armor:chestplate_steel"] = 7,
	["3d_armor:chestplate_bronze"] = 12,
	["3d_armor:chestplate_diamond"] = 16,
	["3d_armor:chestplate_gold"] = 14,
	["3d_armor:chestplate_mithril"] = 15,
	-- Calças
	["3d_armor:leggings_wood"] = 1,
	["3d_armor:leggings_cactus"] = 1,
	["3d_armor:leggings_steel"] = 4,
	["3d_armor:leggings_bronze"] = 7,
	["3d_armor:leggings_diamond"] = 14,
	["3d_armor:leggings_gold"] = 11,
	["3d_armor:leggings_mithril"] = 13,
	-- Botas
	["3d_armor:boots_wood"] = 1,
	["3d_armor:boots_wood"] = 1,
	["3d_armor:boots_cactus"] = 1,
	["3d_armor:boots_steel"] = 3,
	["3d_armor:boots_bronze"] = 5,
	["3d_armor:boots_diamond"] = 7,
	["3d_armor:boots_gold"] = 5,
	["3d_armor:boots_mithril"] = 6,
}) do
	xpro.register_on_craft(name, xp)
end




