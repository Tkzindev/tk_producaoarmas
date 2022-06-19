-----------------------------------------------------------------------------------------------------------------------------------
--[ DESENVOLVIDO POR TKZIN#0001 ]--------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
-----------------------------------------------------------------------------------------------------------------------------------
--[ DESENVOLVIDO POR TKZIN#0001 ]--------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local timedown = 0
vRP = Proxy.getInterface("vRP")

tk = Tunnel.getInterface("producao_armas2")
-------------------------------------------------------------------------------------------------
--[ LOCAL ]--------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
local prodMachine = {
	{ ['x'] = -1486.56, ['y'] = 835.77, ['z'] = 177.0 }, -- MILICIA
	{ ['x'] = -1490.55, ['y'] = 833.92, ['z'] = 177.0 }, -- MILICIA
	{ ['x'] = -1518.45, ['y'] = 125.57, ['z'] = 48.66 }, -- MAFIA
	{ ['x'] = -1512.42, ['y'] = 128.33, ['z'] = 48.66 }, -- MAFIA
	{ ['x'] = -1515.12, ['y'] = 130.99, ['z'] = 48.66 } -- MAFIA
}
-----------------------------------------------------------------------------------------------------------------------------------
--[ DESENVOLVIDO POR TKZIN#0001 ]--------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
-----------------------------------------------------------------------------------------------------------------------------------
--[ DESENVOLVIDO POR TKZIN#0001 ]--------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
--[ MENU ]---------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
local menuactive = false
local onmenu = false

function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		TransitionToBlurred(1000)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		TransitionFromBlurred(1000)
		SendNUIMessage({ hidemenu = true })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------
--[ DESENVOLVIDO POR TKZIN#0001 ]--------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
-----------------------------------------------------------------------------------------------------------------------------------
--[ DESENVOLVIDO POR TKZIN#0001 ]--------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------
--[ BOTÕES ]-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "produzir-hk" then
		TriggerServerEvent("produzir-tkzin","hk")
		timedown = 10

	elseif data == "produzir-assaultsmg" then
		TriggerServerEvent("produzir-tkzin","assaultsmg")
		timedown = 10

	elseif data == "produzir-advancedrifle" then
		TriggerServerEvent("produzir-tkzin","advancedrifle")
		timedown = 10

	elseif data == "produzir-fiveseven" then
		TriggerServerEvent("produzir-tkzin","fiveseven")
		timedown = 10

	elseif data == "fechar" then
		ToggleActionMenu()
		onmenu = false
	end
end)


RegisterNetEvent("fechar-nui-tkzin")
AddEventHandler("fechar-nui-tkzin", function()
	ToggleActionMenu()
	onmenu = false

	local ped = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(ped))
	local bowz,cdz = GetGroundZFor_3dCoord(1405.87,1137.8,109.75)
	local distance = GetDistanceBetweenCoords(1405.87,1137.8, cdz, x, y, z, true)

	if distance < 1.2 then
		TriggerEvent("tkzin:posicao1")	
	end
end)

RegisterNetEvent("tkzin:posicao1")
AddEventHandler("tkzin:posicao1", function()
	local ped = PlayerPedId()
	SetEntityHeading(ped, 270.03)
	SetEntityCoords(ped, 1405.87,1137.8,109.75-0.95, false, false, false, false)
end)
-------------------------------------------------------------------------------------------------
--[ AÇÃO ]---------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local tkzin = 1000

		for k,v in pairs(prodMachine) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			local prodMachine = prodMachine[k]
			local idBancada = prodMachine[id]

			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), prodMachine.x, prodMachine.y, prodMachine.z, true ) <= 1 and not onmenu then
				DrawText3D(prodMachine.x, prodMachine.y, prodMachine.z, "~r~E~w~ Para acessar a ~b~BANCADA~w~.")
			end
			if distance <= 5 then
				tkzin = 1
				DrawTextEmoji(prodMachine.x, prodMachine.y, prodMachine.z-0.3,"🔫")
				-- DrawMarker(31, prodMachine.x, prodMachine.y, prodMachine.z-0.6,0,0,0,0.0,0,0,0.8,0.8,0.8,149,0,179,50,0,0,0,1) CASO QUEIRA QUE TENHO O BLIP NO CHÃO SO DESCOMENTAR
				if distance <= 1.2 then
					if IsControlJustPressed(0,38) and tk.checkPermissao() then
						ToggleActionMenu()
						onmenu = true
						print('DESENVOLVIDO POR Tkzin#0001 |ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ')
					end
				end
			end
		end
		Citizen.Wait(tkzin)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMEDOWN
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		local ped = PlayerPedId()
		if timedown > 0 and GetEntityHealth(ped) > 101 then
			timedown = timedown - 1
			if timedown <= 1 then
				TriggerServerEvent("vrp_inventory:Cancel")
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------
--[ DESENVOLVIDO POR TKZIN#0001 ]--------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
-----------------------------------------------------------------------------------------------------------------------------------
--[ DESENVOLVIDO POR TKZIN#0001 ]--------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		local TimeDistance = 500
		if timedown > 0 then
			TimeDistance = 4
			DisableControlAction(0,38,true)
		end
		Citizen.Wait(TimeDistance)
	end
end)
-------------------------------------------------------------------------------------------------
--[ FUNÇÃO ]-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.28, 0.28)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.005+ factor, 0.03, 41, 11, 41, 68)
end

function DrawTextEmoji(x,y,z,text)
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)
    SetTextFont(4)
    SetTextScale(0.35,0.35)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end

-----------------------------------------------------------------------------------------------------------------------------------
--[ DESENVOLVIDO POR TKZIN#0001 ]--------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
--- [ ADQUIRA A V2.0 EM PORTAL DEVS TKZIN  https://discord.gg/p77xUVwGEZ  ]
-----------------------------------------------------------------------------------------------------------------------------------
--[ DESENVOLVIDO POR TKZIN#0001 ]--------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------