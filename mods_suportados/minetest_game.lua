--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Mods do Minetest Game
  ]]

-- Traduções
local S = xpro.S

-- Crafts
for name,xp in pairs({
	-- Utensilios
	["bucket:bucket_empty"] = 2,
	["default:skeleton_key"] = 1,
	-- Moveis
	["default:furnace"] = 1,
	["doors:door_steel"] = 3,
	["doors:trapdoor_steel"] = 2,
	["beds:bed"] = 1,
	["beds:fancy_bed"] = 1,
	["default:meselamp"] = 3,
	["default:sign_wall_steel"] = 2,
	["default:ladder_steel"] = 2,
	["default:bookshelf"] = 1,
	["default:shelf"] = 1,
	["default:chest"] = 1,
	["default:chest_locked"] = 2,
	-- Tools
	["default:pick_wood"] = 1,
	["default:pick_stone"] = 1,
	["default:pick_steel"] = 2,
	["default:pick_bronze"] = 3,
	["default:pick_mese"] = 4,
	["default:pick_diamond"] = 5,
	["default:shovel_wood"] = 1,
	["default:shovel_stone"] = 1,
	["default:shovel_steel"] = 1,
	["default:shovel_bronze"] = 2,
	["default:shovel_mese"] = 3,
	["default:shovel_diamond"] = 4,
	["default:axe_wood"] = 1,
	["default:axe_stone"] = 1,
	["default:axe_steel"] = 2,
	["default:axe_bronze"] = 3,
	["default:axe_mese"] = 4,
	["default:axe_diamond"] = 5,
	["default:sword_wood"] = 1,
	["default:sword_stone"] = 1,
	["default:sword_steel"] = 2,
	["default:sword_bronze"] = 3,
	["default:sword_mese"] = 4,
	["default:sword_diamond"] = 5,
	["farming:hoe_wood"] = 1,
	["farming:hoe_stone"] = 1,
	["farming:hoe_steel"] = 2,
	["farming:hoe_bronze"] = 3,
	["farming:hoe_mese"] = 4,
	["farming:hoe_diamond"] = 5,
	-- Carts
	["carts:cart"] = 2,
	["carts:rail"] = 1,
	["carts:powerrail"] = 1,
	["carts:brakerail"] = 1,
	-- Farming
	["farming:flour"] = 1,
}) do
	xpro.register_on_craft(name, xp)
end

-- Ao cavar node
for name,xp in pairs({
	["default:stone_with_coal"] = 1,
	["default:stone_with_tin"] = 1,
	["default:stone_with_copper"] = 2,
	["default:stone_with_iron"] = 3,
	["default:stone_with_gold"] = 5,
	["default:stone_with_mese"] = 5,
	["default:stone_with_diamond"] = 5,
	-- Farming
	["farming:wheat_8"] = 1,
	["farming:cotton_8"] = 1,
}) do
	xpro.register_on_dignode(name, xp)
end

-- Ao colocar node
for name,xp in pairs({
	--["default:stone_with_coal"] = 1,
	--["default:stone_with_tin"] = 1,
}) do
	xpro.register_on_placenode(name, xp)
end

-- Premios basicos
for _,dados in ipairs({
	{name=nil, item="default:mese_crystal", qtd=3, custo=180, min_level=10},
	{name=nil, item="default:diamond", qtd=3, custo=250, min_level=15},
	{name=nil, item="default:gold_ingot", qtd=5, custo=400, min_level=8},
	{name=nil, item="default:steel_ingot", qtd=10, custo=250, min_level=6},
	{name=nil, item="default:coal_lump", qtd=30, custo=100, min_level=3},
	{name=nil, item="default:brick", qtd=30, custo=180, min_level=7},
	{name=nil, item="default:clay", qtd=40, custo=180, min_level=1},
	{name=nil, item="default:glass", qtd=50, custo=130, min_level=1},
	{name=nil, item="default:stone", qtd=50, custo=150, min_level=1},
	{name=nil, item="default:desert_stone", qtd=50, custo=150, min_level=1},
	{name=nil, item="default:sand", qtd=50, custo=100, min_level=1},
	{name=nil, item="default:desert_sand", qtd=50, custo=100, min_level=1},
	{name=nil, item="default:silver_sand", qtd=50, custo=100, min_level=1},
	{name=nil, item="default:sandstone", qtd=50, custo=150, min_level=1},
	{name=nil, item="default:desert_sandstone", qtd=50, custo=150, min_level=1},
	{name=nil, item="default:silver_sandstone", qtd=50, custo=150, min_level=1},
	{name=nil, item="default:tree", qtd=50, custo=200, min_level=1},
	{name=nil, item="default:jungletree", qtd=50, custo=200, min_level=1},
	{name=nil, item="default:aspen_tree", qtd=50, custo=200, min_level=1},
	{name=nil, item="default:acacia_tree", qtd=50, custo=200, min_level=1},
	{name=nil, item="default:pine_tree", qtd=50, custo=200, min_level=1},
	{name=nil, item="wool:white", qtd=35, custo=180, min_level=5},
	{name=nil, item="default:obsidian", qtd=35, custo=180, min_level=8},
}) do
	-- Registrar apenas premios existentes
	if minetest.registered_items[dados.item]
		--or minetest.registered_nodes[dados.item]
		--or minetest.registered_craftitems[dados.item]
		--or minetest.registered_tools[dados.item] 
	then
		if dados.name == nil then
			dados.name = minetest.registered_items[dados.item].description
		end
		xpro.registrar_premio(dados.name, {
			item=dados.item, 
			qtd=dados.qtd, 
			custo=dados.custo,
			min_level=dados.min_level,
		})
	end
end




