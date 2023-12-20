-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")


src = {}
Tunnel.bindInterface("lotus_natal",src)
vSERVER = Tunnel.getInterface("lotus_natal")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local gifts = {}
local delayGift = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREAD START
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    Citizen.CreateThread(function() ShowLocations(); end)
    for k,v in pairs(Config.Trees) do
		local blip = AddBlipForCoord(v[1]+0.001,v[2]+0.001,v[3]+0.001)
		SetBlipSprite(blip,v[4])
		SetBlipAsShortRange(blip,true)
		SetBlipColour(blip,v[5])
		SetBlipScale(blip,v[7])
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v[6])
		EndTextCommandSetBlipName(blip)

		Wait(150)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GIFTS SYNC
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('lotus_natal:newGift', function(giftsSv)
    local newGift = {
        id = giftsSv[1].id,
        spawning = false,
        items = giftsSv[1].items,
        coords = giftsSv[1].coords,
        take = false
    }

    table.insert(gifts, newGift)

	SpawnObject(#gifts, newGift.coords)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- AIRDROPS REMOVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('lotus_natal:removeObject', function(id)
    RemoveObject(id)
    RemoveGift(id)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESOURCE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        for _, gift in pairs(gifts) do
            if gift.object then
                RemoveObject(gift.id)
            end
        end
        gifts = {}
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOW LOCATIONS
-----------------------------------------------------------------------------------------------------------------------------------------
ShowLocations = function()
    while true do
        local wait = 500
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

        for k, v in pairs(gifts) do
            local distance = GetDistanceBetweenCoords(coords, v.coords, true)

            if distance <= 3.0 then
                wait = 2
                DrawText3D(v.coords.x,v.coords.y,v.coords.z, "Pressione ~r~E ~w~ para pegar o presente")
                if distance <= 0.8 then
                    if IsControlJustPressed(1, 51) and not delayGift and not v.take then
                        if vSERVER.getInvWeight(v.id) then
                            delayGift = true 
                            v.take = true 
                            TriggerServerEvent('lotus_natal:pickupGift', v.id)
                            TriggerEvent('emotes','presente')
                            TriggerEvent("progress",3, 'abrindo')
                            Wait(3500)
                            ExecuteCommand("clear")
                            ClearPedTasks(GetPlayerPed(-1))
                            SendNUIMessage({ action = "open" })
                            Wait(10000) 
                            delayGift = false
                            SendNUIMessage({ action = "close" })           
                        end        
                    end
                end
            end
        end

        Citizen.Wait(wait)
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION SPAWN OBJECT
-----------------------------------------------------------------------------------------------------------------------------------------
function SpawnObject(id, coords)
    gifts[id].spawning = true
    local model = GetHashKey(Config.Gifts.Object)
    RequestModel(model)
    while not HasModelLoaded(model) do Citizen.Wait(10) end

    local obj = CreateObject(model, coords.x, coords.y, coords.z-1, false, false, true)
    FreezeEntityPosition(obj, true)
    gifts[id].object = obj


	if Config.Gifts.UseFlareParticles then
		RequestNamedPtfxAsset('core')
		while not HasNamedPtfxAssetLoaded('core') do Citizen.Wait(10) end

		if Config.Debug then print('Particles Loaded') end

		UseParticleFxAssetNextCall("core")
		SetParticleFxNonLoopedColour(1.0, 0.0, 0.0)
		StartParticleFxLoopedOnEntity('core:env_snow_flakes', obj, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 15.0, 0.0, 0.0, 0.0)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION REMOVE OBJECT
-----------------------------------------------------------------------------------------------------------------------------------------
function RemoveObject(id)
    for k, v in pairs(gifts) do
        if v.id == id then
            DeleteObject(v.object)
            v.object = nil
        end
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVE GIFT
-----------------------------------------------------------------------------------------------------------------------------------------
function RemoveGift(id)
    for k, v in pairs(gifts) do
        if v.id == id then
            gifts[k] = nil
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION DRAWTEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,150)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text)) / 400
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,17, 128, 39,50)
end