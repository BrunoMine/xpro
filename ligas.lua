--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Ligas dos Niveis
  ]]

local S = xpro.S

-- Tabela de Ligas
xpro.ligas = {
	-- Liga Novato
	{img="[inventorycube{default_dirt.png{default_dirt.png{default_dirt.png", name=S("Novato I")}, -- Nivel 1
	{img="[inventorycube{default_grass.png{default_dirt.png&default_grass_side.png{default_dirt.png&default_grass_side.png", name=S("Novato II")}, -- Nivel 2
	{img="default_apple.png", name=S("Novato III")}, -- Nivel 3
	-- Liga Madeira
	{img="default_stick.png", name=S("Madeira I")}, -- Nivel 4
	{img="[inventorycube{default_wood.png{default_wood.png{default_wood.png", name=S("Madeira II")}, -- Nivel 5
	{img="[inventorycube{default_tree_top.png{default_tree.png{default_tree.png", name=S("Madeira III")}, -- Nivel 6
	{img="default_tool_woodshovel.png", name=S("Madeira IV")}, -- Nivel 7
	{img="default_tool_woodaxe.png", name=S("Madeira V")}, -- Nivel 8
	{img="default_tool_woodpick.png", name=S("Madeira VI")}, -- Nivel 9
	{img="default_tool_woodsword.png", name=S("Madeira VII")}, -- Nivel 10
	-- Liga Pedra
	{img="[inventorycube{default_cobble.png{default_cobble.png{default_cobble.png", name=S("Pedra I")}, -- Nivel 11
	{img="[inventorycube{default_stone.png{default_stone.png{default_stone.png", name=S("Pedra II")}, -- Nivel 12
	{img="default_tool_stoneshovel.png", name=S("Pedra III")}, -- Nivel 13
	{img="default_tool_stoneaxe.png", name=S("Pedra IV")}, -- Nivel 14
	{img="default_tool_stonepick.png", name=S("Pedra V")}, -- Nivel 15
	{img="default_tool_stonesword.png", name=S("Pedra VI")}, -- Nivel 16
	-- Liga Ferro
	{img="default_iron_lump.png", name=S("Ferro I")}, -- Nivel 17
	{img="default_steel_ingot.png", name=S("Ferro II")}, -- Nivel 18
	{img="default_tool_steelshovel.png", name=S("Ferro III")}, -- Nivel 19
	{img="default_tool_steelaxe.png", name=S("Ferro IV")}, -- Nivel 20
	{img="default_tool_steelpick.png", name=S("Ferro V")}, -- Nivel 21
	{img="default_tool_steelsword.png", name=S("Ferro VI")}, -- Nivel 22
	-- Liga Bronze
	{img="default_bronze_ingot.png", name=S("Bronze II")}, -- Nivel 23
	{img="default_tool_bronzeshovel.png", name=S("Bronze III")}, -- Nivel 24
	{img="default_tool_bronzeaxe.png", name=S("Bronze IV")}, -- Nivel 25
	{img="default_tool_bronzepick.png", name=S("Bronze V")}, -- Nivel 26
	{img="default_tool_bronzesword.png", name=S("Bronze VI")}, -- Nivel 27
	-- Liga Mese
	{img="default_mese_crystal_fragment.png", name=S("Mese I")}, -- Nivel 28
	{img="default_mese_crystal.png", name=S("Mese II")}, -- Nivel 29
	{img="default_tool_meseshovel.png", name=S("Mese III")}, -- Nivel 30
	{img="default_tool_meseaxe.png", name=S("Mese IV")}, -- Nivel 31
	{img="default_tool_mesepick.png", name=S("Mese V")}, -- Nivel 32
	{img="default_tool_mesesword.png", name=S("Mese VI")}, -- Nivel 33
	-- Liga Diamante
	{img="[inventorycube{default_stone.png&default_mineral_diamond.png{default_stone.png&default_mineral_diamond.png{default_stone.png&default_mineral_diamond.png", name=S("Diamante I")}, -- Nivel 34
	{img="default_diamond.png", name=S("Diamante II")}, -- Nivel 35
	{img="default_tool_diamondshovel.png", name=S("Diamante III")}, -- Nivel 36
	{img="default_tool_diamondaxe.png", name=S("Diamante IV")}, -- Nivel 37
	{img="default_tool_diamondpick.png", name=S("Diamante V")}, -- Nivel 38
	{img="default_tool_diamondsword.png", name=S("Diamante VI")}, -- Nivel 39
}

