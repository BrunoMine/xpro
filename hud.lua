--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Hud de XP e nivel
  ]]

local S = xpro.S

-- Mod Hudbars
if minetest.get_modpath("hudbars") then
	
	local get_progress = function(my_xp, my_lvl)
		if xpro.niveis[my_lvl+1] == nil then return 100 end
		local xp = xpro.niveis[my_lvl] - my_xp
		local xp_t = xpro.niveis[my_lvl] - xpro.niveis[my_lvl+1]
		local p = xp/xp_t
		local r = math.ceil(p*100)
		if r == 100 and (p*100) < 100 then r = 99 end 
		return r
	end
	
	-- Atualizar barra
	local update_hb = function(name)
		
		local player = minetest.get_player_by_name(name)
		
		local my_xp = xpro.get_player_xp(name)
		local my_lvl = xpro.get_player_lvl(name)
		
		hb.change_hudbar(
			-- player
			player, 
			-- identifier
			"xpro:xp", 
			-- new_value
			get_progress(my_xp, my_lvl)
			-- new_max_value
			--nil,
			-- new_icon
			--"xpro_xp_icon.png", 
			-- new_bgicon
			--"xpro_xp_bar_bgicon.png", 
			-- new_bar
			--"xpro_xp_bar_icon.png", 
			-- new_label
			--"Nivel "..my_lvl,
			-- new_text_color
			--"0xFFFFFF"
		)
	end
	
	-- Inicializa HUD
	minetest.register_on_joinplayer(function(player)
		
		local name = player:get_player_name()
		local my_xp = xpro.get_player_xp(name)
		local my_lvl = xpro.get_player_lvl(name)
		
		hb.init_hudbar(
			-- player
			player, 
			-- identifier
			"xpro:xp", 
			-- start_value
			get_progress(my_xp, my_lvl), 
			-- start_max
			nil, 
			-- start_hidden
			false
		)
		
	end)
	
	-- Registrar barra
	hb.register_hudbar(
		-- identifier
		"xpro:xp", 
		-- text_color
		"0xFFFFFF", 
		-- label
		"XP", 
		-- textures
		{
			bar = "xpro_hudbars_bar_xp.png",
			icon = "xpro_hudbars_icon_xp.png",
			bgicon = "xpro_hudbars_bgicon_xp.png",
		}, 
		-- default_start_value
		0, 
		-- default_start_max
		100, 
		-- default_start_hidden
		false, 
		-- format_string
		"@1: @2%", 
		-- format_string_config
		{ 
			order = {"label", "value"}, 
			textdomain = "xpro" 
		}
	)
	
	-- Alterar barra ao adicionar XP
	xpro.register_on_add_xp(function(name)
		update_hb(name)
	end)
	-- Alterar barra ao remover XP
	xpro.register_on_rem_xp(function(name)
		update_hb(name)
	end)
	
end

-- Exibir pontos recebidos no hub
-- Remover elemento do hud
local remover_hud = function(player, id)
	if player == nil then return end
	player:hud_remove(id)
end
-- Adicionar elemento no hud
local adicionar_hud = function(player, def, time)
	if player == nil then return end
	local id = player:hud_add(def)
	-- Remover apos `time` segundos
	minetest.after(time, remover_hud, player, id)
end

-- Alterar barra ao adicionar XP
xpro.register_on_add_xp(function(name, xp_added, lvl_changed)
	-- Elemento
	local def = {
		hud_elem_type = "text",
		position = {x=(math.random(1, 100)/100)*0.5+0.23,y=(math.random(1, 100)/100)*0.15+0.58},
		scale = {x=500,y=500},
		text = S("+@1XP", xp_added),
		number = 0x00FF00,
		alignment = {x=1,y=1},
		offset = {x=0, y=0},
	}
	adicionar_hud(minetest.get_player_by_name(name), def, 3)
	
	-- Ao evoluir de nivel e liga
	if lvl_changed == true then
		local new_lvl = xpro.get_player_lvl(name)
		local liga = xpro.ligas[new_lvl]
		local def_bg_liga = {
			hud_elem_type = "image",
			position = {x=0.5,y=0.15},
			scale = {x=0.3,y=0.3},
			text = "(xpro_bg_alfa.png^[resize:500x500)^xpro_liga_bg.png",
			alignment = {x=0,y=0},
			offset = {x=0, y=0},
		}
		adicionar_hud(minetest.get_player_by_name(name), def_bg_liga, 8)
		local def_liga = {
			hud_elem_type = "image",
			position = {x=0.5,y=0.15},
			scale = {x=0.27,y=0.27},
			text = "("..liga.img..")^xpro_bg_alfa.png^[resize:500x500",
			alignment = {x=0,y=0},
			offset = {x=0, y=0},
		}
		adicionar_hud(minetest.get_player_by_name(name), def_liga, 8)
		local def_text_liga = {
			hud_elem_type = "text",
			position = {x=0.5,y=0.265},
			scale = {x=500,y=500},
			text = S("Liga @1", liga.name),
			number = 0x00FF00,
			alignment = {x=0,y=0},
			offset = {x=0, y=0},
		}
		adicionar_hud(minetest.get_player_by_name(name), def_text_liga, 8)
		local def_text_lvl = {
			hud_elem_type = "text",
			position = {x=0.5,y=0.29},
			scale = {x=500,y=500},
			text = S("Nivel @1", new_lvl),
			number = 0x00FF00,
			alignment = {x=0,y=0},
			offset = {x=0, y=0},
		}
		adicionar_hud(minetest.get_player_by_name(name), def_text_lvl, 8)
		
		minetest.sound_play("xpro_upgrade_lvl", {
			to_player = name,
			gain = 0.5,
		})
	end
end)
-- Alterar barra ao remover XP
xpro.register_on_rem_xp(function(name, xp_removed, lvl_changed)
	-- Elemento
	local def = {
		hud_elem_type = "text",
		position = {x=(math.random(1, 100)/100)*0.5+0.23,y=(math.random(1, 100)/100)*0.15+0.58},
		scale = {x=500,y=500},
		text = S("-@1XP", xp_removed),
		number = 0xFF0000,
		alignment = {x=1,y=1},
		offset = {x=0, y=0},
	}
	adicionar_hud(minetest.get_player_by_name(name), def, 5)
	
	-- Ao evoluir de nivel e liga
	if lvl_changed == true then
		local new_lvl = xpro.get_player_lvl(name)
		local liga = xpro.ligas[new_lvl]
		local def_bg_liga = {
			hud_elem_type = "image",
			position = {x=0.5,y=0.15},
			scale = {x=0.3,y=0.3},
			text = "(xpro_bg_alfa.png^[resize:500x500)^xpro_liga_bg.png",
			alignment = {x=0,y=0},
			offset = {x=0, y=0},
		}
		adicionar_hud(minetest.get_player_by_name(name), def_bg_liga, 8)
		local def_liga = {
			hud_elem_type = "image",
			position = {x=0.5,y=0.15},
			scale = {x=0.27,y=0.27},
			text = "("..liga.img..")^xpro_bg_alfa.png^[resize:500x500",
			alignment = {x=0,y=0},
			offset = {x=0, y=0},
		}
		adicionar_hud(minetest.get_player_by_name(name), def_liga, 8)
		local def_text_liga = {
			hud_elem_type = "text",
			position = {x=0.5,y=0.265},
			scale = {x=500,y=500},
			text = S("Liga @1", liga.name),
			number = 0xFF0000,
			alignment = {x=0,y=0},
			offset = {x=0, y=0},
		}
		adicionar_hud(minetest.get_player_by_name(name), def_text_liga, 8)
		local def_text_lvl = {
			hud_elem_type = "text",
			position = {x=0.5,y=0.29},
			scale = {x=500,y=500},
			text = S("Nivel @1", new_lvl),
			number = 0xFF0000,
			alignment = {x=0,y=0},
			offset = {x=0, y=0},
		}
		adicionar_hud(minetest.get_player_by_name(name), def_text_lvl, 8)
		
		minetest.sound_play("xpro_downgrade_lvl", {
			to_player = name,
			gain = 0.5,
		})
	end
	
end)

