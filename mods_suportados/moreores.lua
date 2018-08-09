--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Mod Moreores
  ]]


if not minetest.get_modpath("moreores") then return end

-- Traduções
local S = xpro.S

-- Crafts
for name,xp in pairs({
	-- Ferramentas
	["moreores:pick_mithril"] = 4,
	["moreores:pick_silver"] = 1,
	["moreores:shovel_mithril"] = 4,
	["moreores:shovel_silver"] = 1,
	["moreores:axe_mithril"] = 4,
	["moreores:axe_silver"] = 1,
	["moreores:sword_mithril"] = 4,
	["moreores:sword_silver"] = 1,
	["moreores:hoe_mithril"] = 4,
	["moreores:hoe_silver"] = 1,
}) do
	xpro.register_on_craft(name, xp)
end

-- Ao cavar node
for name,xp in pairs({
	-- Minerios
	["moreores:mineral_silver"] = 1,
	["moreores:mineral_mithril"] = 4,
}) do
	xpro.register_on_dignode(name, xp)
end



