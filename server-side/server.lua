-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("lotus_natal",src)
Proxy.addInterface("lotus_natal",src)

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
----------------------------------------------------------------------------------------------------------------------------------------- 
local gifts = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- START SCRIPT
----------------------------------------------------------------------------------------------------------------------------------------- 
Citizen.CreateThread(function()
    local randomMinutes = math.random(25, 45)
    StartScript(randomMinutes)
end)

function StartScript(minutesWait)
    Wait(minutesWait * 60000)

    local randomTree = math.random(1,#Config.Gifts.Locations)
    SpawnGifts(randomTree)
    TriggerClientEvent('Notify',-1,'natal','<b>Hou Hou Hou!</b><br>O papai noel acabou de deixar alguns presentes na árvore de natal '..randomTree..'. Corra para pegá-los!',30)
    TriggerClientEvent("vrp_sound:source",-1,'sinonatal',0.1)
    local randomMinutes = math.random(45, 60)
    StartScript(randomMinutes * 60000)
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- GIFT PICKUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('lotus_natal:pickupGift', function(id)
    local source = source
    local user_id = vRP.getUserId(source)
    local gift = GetGift(id)

    if gift and user_id then
        RemoveGift(id)
        TriggerClientEvent('lotus_natal:removeObject', -1, id)
        Wait(3500)
        TriggerClientEvent("vrp_sound:source", source, 'efeitonatal', 0.1)
        vRPclient.DeletarObjeto()
        vRP.giveInventoryItem(user_id, gift.items[1].name, parseInt(gift.items[1].count), true)
        TriggerClientEvent("Notify", source, "sucesso", "Você recebeu " .. parseInt(gift.items[1].count) .. "x <b>" .. vRP.getItemName(gift.items[1].name) .. "</b>.", 5)
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- GETINV WEIGHT
-----------------------------------------------------------------------------------------------------------------------------------------
function src.getInvWeight(id)
    local source = source 
    local user_id = vRP.getUserId(source)
    local gift = GetGift(id)

    if gift and user_id then
        local itemWeight = vRP.getItemWeight(tostring(gift.items[1].name)) * parseInt(gift.items[1].count)
        if vRP.computeInvWeight(user_id) + itemWeight <= vRP.getInventoryMaxWeight(user_id) then
            return true
        else
            TriggerClientEvent("Notify", source, "negado", "Mochila cheia.", 5)
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWN GIFT
-----------------------------------------------------------------------------------------------------------------------------------------
SpawnGifts = function(treeId)
    local randomGifts
    local chanceForThreeGifts = 30 

    if math.random(1, 100) <= chanceForThreeGifts then
        randomGifts = 3
    else
        randomGifts = math.random(1, 2)
    end

    for i = 1, randomGifts do
        local giftId = math.random(10000, 99999)
        local giftItems = SelectLoottable(lootTable)

        local randomLocation = Config.Gifts.Locations[treeId][math.random(1, i)]
        local coords = vector3(randomLocation.x, randomLocation.y, randomLocation.z)

        local newGift = {
            id = giftId,
            items = giftItems,
            spawning = false,
            coords = coords
        }

        table.insert(gifts, newGift)

        if Config.Gifts.Debug then
            print('Gift Spawned')
        end

        TriggerClientEvent('lotus_natal:newGift', -1, { newGift })
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVE GIFT
-----------------------------------------------------------------------------------------------------------------------------------------
function RemoveGift(id)
	for k, v in pairs(gifts) do
        if v.id == id then
            gifts[k] = nil
            break
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GET GIFT
-----------------------------------------------------------------------------------------------------------------------------------------
GetGift = function(id)
    for k, v in pairs(gifts) do
        if v.id == id then
            return v
        end
    end

    return nil
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SELECT LOOTTABLE
-----------------------------------------------------------------------------------------------------------------------------------------
SelectLoottable = function(lootTable)
    if lootTable ~= nil then
        return Config.LootTables[lootTable].Items
    else
        local randomLootTable = Config.LootTables[math.random(1, #Config.LootTables)]
        local chance = math.random(1, 100)

        while randomLootTable.Chance < chance do
            Citizen.Wait(10)
            
            randomLootTable = Config.LootTables[math.random(1, #Config.LootTables)]
            chance = math.random(1, 100)

            if Config.Debug then print('searching ' .. randomLootTable.Chance < chance) end
        end

        return randomLootTable.Items
    end
end