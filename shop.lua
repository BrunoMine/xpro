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
	
	local formspec = "size[8,6]"
		..default.gui_bg
		..default.gui_bg_img
		.."button_exit[6,0;2,1;close;"..S("Fechar").."]"
		.."label[0,0;"..S("Loja de Itens por XP").."]"
		.."label[0,0.5;"..S("Cash XP: @1", xp_disp).."]"
		.."textlist[3.2,1;4.5,5;menu;"..string_menu_shop.."]"
	
	if aviso then
		formspec = formspec .. "textarea[0.26,1;3.2,1.7;;"..aviso..";]"
	end
	
	-- Nenhum item escolhido
	if acesso.escolha == nil then
		formspec = formspec .. "label[0,2;"..S("Escolha um Item").."]"
	
	-- Exibir item escolhido
	else
		local escolha = xpro.premios[acesso.escolha]
		formspec = formspec .. "label[0,2.5;"..S("Custo: @1 CashXP", escolha.custo).."]"
			.."label[0,3;"..S("Nivel mínimo: @1", escolha.min_level).."]"
			.."label[0,3.5;"..S("Unidades: @1", escolha.qtd).."]"
			.."item_image_button[0,4;2.1,2.1;"..escolha.item..";comprar;"..S("Comprar").."]"
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
				
			elseif xpro.get_player_lvl(name) < escolha.min_level then
				xpro.acessar_shop(name, S("Precisa estar no nivel @1", escolha.min_level))
				
			else
				if xpro.tror.trocar_plus(player, nil, {escolha.item.." "..escolha.qtd}) == false then
					xpro.acessar_shop(name, S("Inventario lotado"))
				else
					player:set_attribute("xpro_xp_gasto", (xp_gasto+escolha.custo))
					xpro.acessar_shop(name, minetest.colorize("#0C0", S("Adiquirido")))
					-- Atualiza formspec do inventario com novo XP Cash disponivel
					xpro.update_inventory_formspec(minetest.get_player_by_name(name))
				end
			end
		end
	end
end)


-- Registrar premios
xpro.registrar_premio = function(name, def)
	-- Verifica em que parte da tabela inserir para manter ordem dos niveis
	local insert = false
	for n,p in ipairs(xpro.premios) do
		if (def.min_level or 1) <= p.min_level then
			table.insert(xpro.premios, n,
				{
					name=name, 
					item=def.item, 
					qtd=def.qtd, 
					custo=def.custo,
					min_level=def.min_level or 1,
				}
			)
			insert = true
			break
		end
	end
	if insert == false then
		table.insert(xpro.premios,
			{
				name=name, 
				item=def.item, 
				qtd=def.qtd, 
				custo=def.custo,
				min_level=def.min_level or 1,
			}
		)
	end
	-- Atualiza lista de exibição
	atualizar_string_menu_shop()
end


