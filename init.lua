--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Inicializador de variaveis e scripts
  ]]

-- Notificador de Inicializador
local notificar = function(msg)
	if minetest.setting_get("log_mods") then
		minetest.debug("[Xpro]"..msg)
	end
end

local modpath = minetest.get_modpath("xpro")

-- Variavel global
xpro = {}

-- Carregar scripts
notificar("Carregando scripts...")

-- Criação do banco de dados
xpro.bd = dofile(modpath.."/lib/memor.lua")

-- Variaveis personalizaveis
xpro.var = {}

-- API
dofile(modpath.."/api.lua")
dofile(modpath.."/ligas.lua")
dofile(modpath.."/sfinv.lua")
dofile(modpath.."/progresso.lua")
dofile(modpath.."/ranking.lua")

-- Metodos para evoluir
dofile(modpath.."/metodos/dig_node.lua")
dofile(modpath.."/metodos/place_node.lua")

notificar("OK")

