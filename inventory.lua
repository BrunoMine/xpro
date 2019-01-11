--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Inventario do jogador
  ]]

local modpath = minetest.get_modpath("xpro")

-- Atualizar inventario (por padrão não executa nada)
-- Refresh inventory (by default it does not execute anything)
xpro.update_inventory_formspec = function(player)
	return
end

-- Abrir inventario na aba do niveis (por padrão não executa nada)
xpro.show_inventory_formspec = function(player)
	return
end

-- Metodos de acesso pelo inventario
xpro.var.inv_mode = minetest.settings:get("xpro_inventory") or "sfinv"
if xpro.var.inv_mode == "unified_inventory" then
	dofile(modpath.."/unified_inventory.lua")
else
	xpro.var.inv_mode = "sfinv"
	dofile(modpath.."/sfinv.lua")
end












