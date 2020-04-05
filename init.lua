--[[
	Mod Xpro para Minetest
	Copyright (C) 2020 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Inicializador de variaveis e scripts
  ]]

-- Notificador de Inicializador
local notificar = function(msg)
	if minetest.setting_get("log_mods") then
		minetest.debug("[XPro]"..msg)
	end
end

local modpath = minetest.get_modpath("xpro")

-- Variavel global
xpro = {}

-- Carregar scripts
notificar("Carregando scripts...")

-- Criação do banco de dados
xpro.bd = dofile(modpath.."/lib/memor.lua")

-- Lib tror
xpro.tror = dofile(modpath.."/lib/tror.lua")

-- Variaveis personalizaveis
xpro.var = {}

-- API
dofile(modpath.."/tradutor.lua")
dofile(modpath.."/api.lua")
dofile(modpath.."/ligas.lua")
dofile(modpath.."/shop.lua")
dofile(modpath.."/progresso.lua")
dofile(modpath.."/ranking.lua")
dofile(modpath.."/hud.lua")
dofile(modpath.."/inventory.lua")
dofile(modpath.."/comandos.lua")

-- Metodos para evoluir
dofile(modpath.."/metodos/die.lua")
dofile(modpath.."/metodos/craft.lua")
dofile(modpath.."/metodos/dig_node.lua")
dofile(modpath.."/metodos/place_node.lua")

-- Suporte para mods
dofile(modpath.."/mods_suportados/minetest_game.lua")
dofile(modpath.."/mods_suportados/farming_redo.lua")
dofile(modpath.."/mods_suportados/moreores.lua")
dofile(modpath.."/mods_suportados/3d_armor.lua")
dofile(modpath.."/mods_suportados/3d_armor_stand.lua")
dofile(modpath.."/mods_suportados/shields.lua")
dofile(modpath.."/mods_suportados/xdecor.lua")

notificar("OK")

