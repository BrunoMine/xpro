--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Eventos de ganho ou perca de XP ao craftar um node
  ]]

-- Lista de itens que geram recompensa
xpro.craft_xp_list = {}

-- Chamada global
minetest.register_on_craft(function(itemstack, player, old_craft_grid, craft_inv)
	
	-- Verifica se node gera XP
	local name = itemstack:get_name()
	if xpro.craft_xp_list[name] then
		if xpro.craft_xp_list[name] > 0 then
			xpro.add_xp(player:get_player_name(), xpro.craft_xp_list[name])
		else
			xpro.rem_xp(player:get_player_name(), math.abs(xpro.craft_xp_list[name]))
		end
	end
end)

-- Registrar item para o evento
xpro.register_on_craft = function(name, xp)
	if tonumber(xp) == 0 then return end
	xpro.craft_xp_list[name] = tonumber(xp)
end
