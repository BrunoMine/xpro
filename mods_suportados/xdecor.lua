--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Mod Xdecor
  ]]


if not minetest.get_modpath("xdecor") then return end

-- Traduções
local S = xpro.S

-- Crafts
for name,xp in pairs({
	["xdecor:iron_lightbox"] = 2,
	["xdecor:enchantment_table"] = 8,
	["xdecor:cauldron_empty"] = 3,
	["xdecor:enderchest"] = 1,
	["xdecor:coalstone_tile"] = 3,
	["xdecor:barrel"] = 1,
	["xdecor:cabinet"] = 1,
	["xdecor:cactusbrick"] = 1,
	["xdecor:hive"] = 1,
	["xdecor:barricade"] = 1,
	["xdecor:lantern"] = 1,
	["xdecor:itemframe"] = 1,
	["xdecor:desertstone_tile"] = 1,
	["xdecor:cushion"] = 1,
	["xdecor:mailbox"] = 1,
	["xdecor:moonbrick"] = 1,
	["xdecor:empty_shelf"] = 1,
	["xdecor:multishelf"] = 1,
	["xdecor:packed_ice"] = 1,
	["xdecor:stone_rune"] = 1,
	["xdecor:stone_tile"] = 1,
	["xdecor:wooden_lightbox"] = 1,
	["xdecor:woodframed_glass"] = 1,
	["xdecor:potted_geranium"] = 1,
	["xdecor:potted_rose"] = 1,
	["xdecor:potted_tulip"] = 1,
	["xdecor:potted_viola"] = 1,
	["xdecor:potted_dandelion_white"] = 1,
	["xdecor:potted_dandelion_yellow"] = 1,
	["xdecor:potted_geranium"] = 1,
	["xdecor:tv"] = 1,
	["xdecor:tatami"] = 1,
	["xdecor:table"] = 1,
	["xdecor:workbench"] = 1,
	["xdecor:wood_tile"] = 1,
	["doors:woodglass_door"] = 1,
	["xdecor:slide_door"] = 1,
	["xdecor:screen_door"] = 1,
	["xdecor:prison_door"] = 2,
	["xdecor:rusty_prison_door"] = 2,
	["xdecor:japanese_door"] = 1,
	["xdecor:rope"] = 1,
	["xdecor:painting_1"] = 1,
}) do
	xpro.register_on_craft(name, xp)
end




