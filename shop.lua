--[[
	Mod Xpro para Minetest
	Copyright (C) 2018 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Shopping de XP
  ]]

-- Traduções
local S = xpro.S

-- Assegurar dados
minetest.register_on_joinplayer(function(player)
	if not player:get_attribute("xpro_xp_gasto") then
		player:set_attribute("xpro_xp_gasto", 0)
	end
end)


-- Controle de acessos
local acessos = {}
minetest.register_on_joinplayer(function(player)
	acessos[player:get_player_name()] = {}
end)
minetest.register_on_leaveplayer(function(player)
	acessos[player:get_player_name()] = nil
end)


-- Itens a venda
xpro.premios = {}


-- Lista de itens do menu do shop em formato de string
local string_menu_shop = ""
local atualizar_string_menu_shop = function()
	string_menu_shop = "" -- zera string
	for _,d in pairs(xpro.premios) do
		if string_menu_shop ~= "" then string_menu_shop = string_menu_shop .. "," end
		string_menu_shop = string_menu_shop .. d.name
	end
end
atualizar_string_menu_shop()

-- Acessar shop
xpro.acessar_shop = function(name, aviso)
	
	local player = minetest.get_player_by_name(name)
	local acesso = acessos[name]
	local xp_gasto = player:get_attribute("xpro_xp_gasto")
	local my_xp = xpro.get_player_xp(name)
	local xp_disp = my_xp-xp_gasto
	if xp_disp < 0 then xp_disp = 0 end
	
	local formspec = "size[8,5]"
		..default.gui_bg
		..default.gui_bg_img
		.."label[0,0;"..S("Loja de Itens por XP").."]"
		.."label[0,0.5;"..S("Cash XP: @1", xp_disp).."]"
		.."textlist[3.2,0;4.5,5;menu;"..string_menu_shop.."]"
	
	if aviso then
		formspec = formspec .. "textarea[0.26,1;3.2,1.2;;"..aviso..";]"
	end
	
	-- Nenhum item escolhido
	if acesso.escolha == nil then
		formspec = formspec .. "label[0,2;"..S("Escolha um Item").."]"
	
	-- Exibir item escolhido
	else
		local escolha = xpro.premios[acesso.escolha]
		formspec = formspec .. "label[0,2;"..S("Custo: @1 CashXP", escolha.custo).."]"
			.."label[0,2.5;"..S("Unidades: @1", escolha.qtd).."]"
			.."item_image_button[0,3;2.1,2.1;"..escolha.item..";comprar;"..S("Comprar").."]"
	end
	
	minetest.show_formspec(name, "xpro:shop", formspec)
end

-- Receber Botoes
minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "xpro:shop" then
	
		-- Escolher um item
		if fields.menu then
			local name = player:get_player_name()
			local n = string.split(fields.menu, ":")
			acessos[name].escolha = tonumber(n[2]) or 1
			xpro.acessar_shop(name)
		
		-- Comprar
		elseif fields.comprar then
			local name = player:get_player_name()
			local acesso = acessos[name]
			local escolha = xpro.premios[acesso.escolha]
			local my_xp = xpro.get_player_xp(name)
			local xp_gasto = player:get_attribute("xpro_xp_gasto")
			local xp_disp = my_xp-xp_gasto
			if xp_disp < 0 then xp_disp = 0 end
			
			-- Tenta trocar
			if xp_disp < escolha.custo then
				xpro.acessar_shop(name, S("Cash XP insuficiente"))
			else
				if xpro.tror.trocar_plus(player, nil, {escolha.item.." "..escolha.qtd}) == false then
					xpro.acessar_shop(name, S("Inventario lotado"))
				else
					player:set_attribute("xpro_xp_gasto", (xp_gasto+escolha.custo))
					xpro.acessar_shop(name, minetest.colorize("#0C0", S("Adiquirido")))
					-- Limpa o inventario para exibir novo cash disponivel
					if sfinv then
						sfinv.set_player_inventory_formspec(minetest.get_player_by_name(name))
					end
				end
			end
		end
	end
end)


-- Registrar premios
xpro.registrar_premio = function(name, def)
	table.insert(xpro.premios,
		{
			name=name, 
			item=def.item, 
			qtd=def.qtd, 
			custo=def.custo,
		}
	)
	-- Atualiza lista de exibição
	atualizar_string_menu_shop()
end


