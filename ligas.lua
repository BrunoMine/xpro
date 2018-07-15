--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Ligas dos Niveis
  ]]

-- Tabela de Ligas
xpro.ligas = {
	-- Liga Novato
	{img="[inventorycube{default_dirt.png{default_dirt.png{default_dirt.png", name="Novato I"}, -- Nivel 1
	{img="[inventorycube{default_grass.png{default_dirt.png&default_grass_side.png{default_dirt.png&default_grass_side.png", name="Novato II"}, -- Nivel 2
	{img="default_apple.png", name="Novato III"}, -- Nivel 3
	-- Liga Madeira
	{img="default_stick.png", name="Madeira I"}, -- Nivel 4
	{img="[inventorycube{default_wood.png{default_wood.png{default_wood.png", name="Madeira II"}, -- Nivel 5
	{img="[inventorycube{default_tree_top.png{default_tree.png{default_tree.png", name="Madeira III"}, -- Nivel 6
	{img="default_tool_woodshovel.png", name="Madeira IV"}, -- Nivel 7
	{img="default_tool_woodaxe.png", name="Madeira V"}, -- Nivel 8
	{img="default_tool_woodpick.png", name="Madeira VI"}, -- Nivel 9
	{img="default_tool_woodsword.png", name="Madeira VII"}, -- Nivel 10
	-- Liga Pedra
	{img="[inventorycube{default_cobble.png{default_cobble.png{default_cobble.png", name="Pedra I"}, -- Nivel 11
	{img="[inventorycube{default_stone.png{default_stone.png{default_stone.png", name="Pedra II"}, -- Nivel 12
	{img="default_tool_stoneshovel.png", name="Pedra III"}, -- Nivel 13
	{img="default_tool_stoneaxe.png", name="Pedra IV"}, -- Nivel 14
	{img="default_tool_stonepick.png", name="Pedra V"}, -- Nivel 15
	{img="default_tool_stonesword.png", name="Pedra VI"}, -- Nivel 16
	-- Liga Ferro
	{img="default_iron_lump.png", name="Ferro I"}, -- Nivel 17
	{img="default_steel_ingot.png", name="Ferro II"}, -- Nivel 18
	{img="default_tool_steelshovel.png", name="Ferro III"}, -- Nivel 19
	{img="default_tool_steelaxe.png", name="Ferro IV"}, -- Nivel 20
	{img="default_tool_steelpick.png", name="Ferro V"}, -- Nivel 21
	{img="default_tool_steelsword.png", name="Ferro VI"}, -- Nivel 22
	-- Liga Mese
	{img="default_mese_crystal_fragment.png", name="Mese I"}, -- Nivel 23
	{img="default_mese_crystal.png", name="Mese II"}, -- Nivel 24
	{img="default_tool_meseshovel.png", name="Mese III"}, -- Nivel 25
	{img="default_tool_meseaxe.png", name="Mese IV"}, -- Nivel 26
	{img="default_tool_mesepick.png", name="Mese V"}, -- Nivel 27
	{img="default_tool_mesesword.png", name="Mese VI"}, -- Nivel 28
	-- Liga Diamante
	{img="[inventorycube{default_stone.png&default_mineral_diamond.png{default_stone.png&default_mineral_diamond.png{default_stone.png&default_mineral_diamond.png", name="Diamante I"}, -- Nivel 29
	{img="default_diamond.png", name="Diamante II"}, -- Nivel 30
	{img="default_tool_diamondshovel.png", name="Diamante III"}, -- Nivel 31
	{img="default_tool_diamondaxe.png", name="Diamante IV"}, -- Nivel 32
	{img="default_tool_diamondpick.png", name="Diamante V"}, -- Nivel 33
	{img="default_tool_diamondsword.png", name="Diamante VI"}, -- Nivel 34
}

