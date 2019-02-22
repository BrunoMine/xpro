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
xpro.var.inv_mode = minetest.settings:get("xpro_inventory") or "auto"

-- Tenta identificar mod
if xpro.var.inv_mode == "auto" then
	if minetest.get_modpath("unified_inventory") then
		xpro.var.inv_mode = "unified_inventory"

	-- Se não indetificar nada, usa sfinv por padrão
	else
		xpro.var.inv_mode = "sfinv"
	end
end

if xpro.var.inv_mode == "unified_inventory" then
	dofile(modpath.."/unified_inventory.lua")

elseif xpro.var.inv_mode == "sfinv" then
	dofile(modpath.."/sfinv.lua")
end














