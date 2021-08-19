QBCore = nil

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterNetEvent("stopsign:server:additem")
AddEventHandler("stopsign:server:additem", function()
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(tonumber(src))

	xPlayer.Functions.AddItem("stopsign", 1, false)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['stopsign'], "add")
end)