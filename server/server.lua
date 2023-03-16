ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent('fusti_carwash:checkWash')
AddEventHandler('fusti_carwash:checkWash', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local money = xPlayer.getMoney()
    local price = Config.CarWash.price
    if money >= price then
        xPlayer.removeMoney(price)
        TriggerClientEvent('fusti_carwash:startWash', source)
    else
        TriggerClientEvent('fusti_carwash:notify', source, 'Hiba', 'Nincs elég pénzed!', 'error')
    end
end)