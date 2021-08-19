QBCore = nil

Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(200)
    end
end)

RegisterNetEvent("stopsign:client:Target")
AddEventHandler("stopsign:client:Target", function()
    local coords = GetEntityCoords(PlayerPedId())
    local obj = GetClosestObjectOfType(coords.x, coords.y, coords.z, 10.0, -949234773, false, false, false)
    SetEntityAsMissionEntity(obj, true, true)
    loadAnimDict("amb@prop_human_bum_bin@base")
    TaskPlayAnim(PlayerPedId(), "amb@prop_human_bum_bin@base", "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    QBCore.Functions.Progressbar("robbing_sign", "Stealing Stop Sign..", math.random(5000, 7000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, function()
    end, function()
        StopAnimTask(PlayerPedId(), "amb@prop_human_bum_bin@base", "base", 1.0)
        TriggerServerEvent("stopsign:server:additem")
        DeleteEntity(obj)
    end)
end)

function loadAnimDict(dict)
    while(not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(1)
    end
end