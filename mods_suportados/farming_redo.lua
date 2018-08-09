--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Mod farming do TenPlus
  ]]

if farming == nil or farming.mod ~= "redo" then return end

-- Traduções
local S = xpro.S

-- Crafts
for name,xp in pairs({
	-- Utensilios
	["farming:baking_tray"] = 1,
	["farming:cutting_board"] = 1,
	["farming:mixing_bowl"] = 1,
	["farming:juicer"] = 1,
	["farming:mortar_pestle"] = 1,
	["farming:saucepan"] = 1,
	-- Alimentos complexos
	["farming:beetroot_soup"] = 1,
	["farming:muffin_blueberry"] = 1,
	["farming:blueberry_pie"] = 1,
	["farming:chili_bowl"] = 1,
	["farming:pot"] = 1,
	["farming:potato_salad"] = 1,
	["farming:garlic_bread"] = 1,
	["farming:pineapple_juice"] = 1,
	["farming:porridge"] = 1,
	["farming:skillet"] = 1,
	["farming:toast_sandwich"] = 1,
	["farming:donut_chocolate"] = 1,
	["farming:donut_apple"] = 1,
	["farming:turkish_delight"] = 1,
}) do
	xpro.register_on_craft(name, xp)
end

-- Ao cavar node
for name,xp in pairs({
	-- Plantas
	["farming:pineapple_8"] = 1,
	["farming:chili_8"] = 1,
	["farming:pepper_5"] = 1,
	["farming:pea_5"] = 1,
	["farming:beetroot_5"] = 1,
	["farming:onion_5"] = 1,
	["farming:garlic_5"] = 1,
	["farming:barley_7"] = 1,
	["farming:beanpole_5"] = 1,
	["farming:blueberry_4"] = 1,
	["farming:raspberry_4"] = 1,
	["farming:carrot_8"] = 1,
	["farming:cocoa_4"] = 1,
	["farming:coffee_5"] = 1,
	["farming:corn_8"] = 1,
	["farming:cucumber_4"] = 1,
	["farming:grapes_8"] = 1,
	["farming:hemp_8"] = 1,
	["farming:melon_8"] = 1,
	["farming:potato_4"] = 1,
	["farming:pumpkin_8"] = 1,
	["farming:rhubarb_3"] = 1,
	["farming:tomato_8"] = 1,
}) do
	xpro.register_on_dignode(name, xp)
end



