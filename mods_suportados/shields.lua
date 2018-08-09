--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Mod Shields
  ]]


if not minetest.get_modpath("shields") then return end

-- Traduções
local S = xpro.S

-- Crafts
for name,xp in pairs({
	["shields:shield_wood"] = 1,
	["shields:shield_enhanced_wood"] = 1,
	["shields:shield_cactus"] = 1,
	["shields:shield_enhanced_cactus"] = 2,
	["shields:shield_steel"] = 7,
	["shields:shield_bronze"] = 12,
	["shields:shield_diamond"] = 16,
	["shields:shield_gold"] = 14,
	["shields:shield_mithril"] = 15,
}) do
	xpro.register_on_craft(name, xp)
end




