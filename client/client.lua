local isWashing = false
local PlayerPed = PlayerPedId()


for k,v in pairs(Config.CarWash.positions) do
    carWash = {['carWash'..k] = lib.zones.box({coords = v.coord, size = v.size, rotation = v.rot, debug = v.debug, inside = inside, onEnter = onEnter, onExit = onExit})}
    for _,i in pairs(carWash) do
        carWashBlip = AddBlipForCoord(v.coord)
        SetBlipSprite(carWashBlip, 100)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.CarWash.blipName)
        EndTextCommandSetBlipName(carWashBlip)
        function i:onEnter()
            if IsPedInAnyVehicle(PlayerPed, false) then
                if Config.useRadial then
                    lib.addRadialItem({
                        id = 'carwash',
                        icon = Config.radialData.icon,
                        label = Config.radialData.label,
                        onSelect = function()
                            TriggerEvent('fusti_carwash:CanWash')
                        end
                    })
                    if Config.radialData.useNotify then
                        lib.notify({
                            title = Config.radialData.NotifyTitle,
                            description = Config.radialData.NotifyDescription,
                            type = Config.radialData.NotifyType,
                            duration = Config.radialData.NotifyDuration,
                        })
                    end
                else
                    lib.notify({
                        title = Config.CarWash.InformNotify.title,
                        description = Config.CarWash.InformNotify.description..Config.CarWash.price..'$',
                        type = Config.CarWash.InformNotify.type,
                        duration = Config.CarWash.InformNotify.duration
                    })
                end
            end
        end
        function i:inside()
            if IsPedInAnyVehicle(PlayerPed, false) then
                if not Config.useRadial then
                    if IsControlJustReleased(0, 38) then
                        TriggerEvent('fusti_carwash:CanWash')
                    end
                end
            end
        end
        function i:onExit()
            lib.removeRadialItem('carwash')
        end
    end
end

RegisterNetEvent('fusti_carwash:CanWash')
AddEventHandler('fusti_carwash:CanWash', function()
    if not isWashing then
        TriggerServerEvent('fusti_carwash:checkWash')
    else
        lib.notify({
            title = Config.CarWash.ErrorNotify.title,
            description = Config.CarWash.ErrorNotify.description,
            type = Config.CarWash.ErrorNotify.type
        })
    end
end)

RegisterNetEvent('fusti_carwash:startWash')
AddEventHandler('fusti_carwash:startWash', function()
    startWash()
end)

RegisterNetEvent('fusti_carwash:notify')
AddEventHandler('fusti_carwash:notify', function(title, description, icon)
    lib.notify({
        title = title,
        description = description,
        type = icon
    })
end)

function startWash()
    isWashing = true
    local vehicle = GetVehiclePedIsIn(PlayerPed)
    local dist = 'cut_family2'
    local fxName = 'cs_fam2_ped_water_splash'
    FreezeEntityPosition(vehicle, true)
    RequestNamedPtfxAsset(dist)
    while not HasNamedPtfxAssetLoaded(dist) do
        Wait(1)
    end
    UseParticleFxAssetNextCall(dist)
    local particle = StartParticleFxLoopedAtCoord(fxName, GetEntityCoords(PlayerPed), 0.0, 0.0, 0.0, 8.0, false, false, false, 0)
    if lib.progressCircle({
        duration = Config.CarWash.progress.duration,
        label = Config.CarWash.progress.label,
        position = Config.CarWash.progress.position,
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
            move = true,
            combat = true,
            mouse = true
        }
    })
    then
        StopParticleFxLooped(particle, false)
        SetVehicleDirtLevel(vehicle, 0.0)
        WashDecalsFromVehicle(vehicle, 1.0)
        FreezeEntityPosition(vehicle, false)
        isWashing = false
        lib.notify({
            title = Config.CarWash.SuccessNotify.title,
            description = Config.CarWash.SuccessNotify.description,
            type = Config.CarWash.SuccessNotify.type
        })
    end
end
