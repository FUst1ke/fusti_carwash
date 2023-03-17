RegisterServerEvent('fusti_carwash:checkWash')
AddEventHandler('fusti_carwash:checkWash', function()
    local price = Config.CarWash.price
    local money = exports.ox_inventory:GetItem(source, 'money', nil, true)
    if money >= price then
        exports.ox_inventory:RemoveItem(source, 'money', price)
        TriggerClientEvent('fusti_carwash:startWash', source)
    else
        TriggerClientEvent('fusti_carwash:notify', source, Config.CarWash.MoneyNotify.title, Config.CarWash.MoneyNotify.description, Config.CarWash.MoneyNotify.type)
    end
end)
