RegisterServerEvent('fusti_carwash:checkWash')
AddEventHandler('fusti_carwash:checkWash', function()
    local player <const> = source
    local price <const> = Config.CarWash.price

    local money = exports.ox_inventory:GetItem(player, 'money', nil, true)
    if money < price then
        return TriggerClientEvent('fusti_carwash:notify', player, Config.CarWash.MoneyNotify.title, Config.CarWash.MoneyNotify.description, Config.CarWash.MoneyNotify.type)
    end
    exports.ox_inventory:RemoveItem(player, 'money', price)

    TriggerClientEvent('fusti_carwash:startWash', player)
end)
