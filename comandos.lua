--[[
	Mod Xpro para Minetest
	Copyright (C) 2020 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Comandos
  ]]

local S = xpro.S


-- Administrador XPro
minetest.register_privilege("xpro_admin", S("Administrador XPro"))

-- Comando "xpro" 
minetest.register_chatcommand("xpro", {
	privs = {xpro_admin = true},
	params = S("[<jogador> | <add/subtract> <xp>]"),
	description = S("Administrar XP dos jogadores"),
	func = function(name,  param)

		-- Consult self account
		if param == "" then 
			return false
		end

		local m = string.split(param, " ")
		local param1, param2, param3 = m[1], m[2], m[3]
		
		-- Check account
		if xpro.bd.verif("player:"..param1, "xp") ~= true then
			return false, S("Jogador inexistente.")
		end
		
		-- Consultar conta
		if param1 and not param2 then 
			local my_xp = xpro.get_player_xp(param1)
			minetest.chat_send_player(name, "***** ".. param1 .." *****")
			minetest.chat_send_player(name, S("XP: @1", my_xp))
			minetest.chat_send_player(name, S("Nivel: @1", xpro.get_player_lvl(param1)))
			minetest.chat_send_player(name, S("Liga: @1", xpro.ligas[xpro.get_player_lvl(param1)].name))
			return
		end

		if param2 and param3 then
			
			-- Check and adjust numeric value
			if not tonumber(param3) then
				return false, S("Valor não numérico '@1'.", param3)
			end
			param3 = tonumber(param3)
			
			-- Substract
			if param2 == "subtract" then
				local my_xp = xpro.get_player_xp(param1)
				
				xpro.rem_xp(param1, param3)
				
				return true, S("XP subtraído. Novo montante é @1.", xpro.get_player_xp(param1))
			end
			
			-- Add
			if param2 == "add" then
				
				xpro.add_xp(param1, param3)
				
				return true, S("XP adicionado. Novo montante é @1.", xpro.get_player_xp(param1))
			end
			
		end
		return false
	end,
})
