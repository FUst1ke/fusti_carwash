Config = {}

Config.useRadial = false
Config.radialData = {
    icon = 'soap',
    label = 'Carwash',
    useNotify = true,
    NotifyTitle = 'Carwash',
    NotifyDescription = 'Use the radial menu to start washing your car!',
    NotifyType = 'inform',
    NotifyDuration = 5000
}

Config.CarWash = {
    price = 200,
    blipName = 'Carwash',
    progress = { -- Progressbar
        label = 'Washing car..',
        duration = 5000,
        position = 'bottom'
    },
    InformNotify = {  -- Notify when entering the carwash
        title = 'Carwash',
        description = 'Press [E] to start the carwash. \n Price: ',
        type = 'inform',
        duration = 5000
    },
    ErrorNotify = {  -- Notify when you trying to use the carwash while already washing the car
        title = 'Error',
        description = 'You cant do this right now!',
        type = 'error'
    },
    SuccessNotify = { -- Notify when washing was successful
        title = 'Success',
        description = 'You have successfully washed your car!',
        type = 'success'
    },
    MoneyNotify = { -- Notify when player doesn't have enough money
        title = 'Error',
        description = 'You dont have enough money!',
        type = 'error'
    },
    positions = {
        {coord = vector3(24.4675, -1391.8799, 29.3333), rot = 270.0, size = vec3(5, 7, 3), debug = false},
        {coord = vector3(-700.0496, -933.8840, 19.0139), rot = 360.0, size = vec3(5, 11, 6), debug = false}
    }
}



-- Additional hungarian language

-- Config.useRadial = true
-- Config.radialData = {
--     icon = 'soap',
--     label = 'Carwash',
--     useNotify = true,
--     NotifyTitle = 'Autómosó',
--     NotifyDescription = 'Használd a radiál menüt a mosáshoz!',
--     NotifyType = 'inform',
--     NotifyDuration = 5000
-- }

-- Config.CarWash = {
--     price = 200,
--     blipName = 'Autómosó',
--     progress = {
--         label = 'Autómosás',
--         duration = 5000,
--         position = 'bottom'
--     },
--     InformNotify = { -- Notify amikor belépsz az autómosóba
--         title = 'Autómosó',
--         description = 'Nyomj [E] gombot a jármű mosásához. \n Mosás ára: ',
--         type = 'inform',
--         duration = 5000
--     },
--     ErrorNotify = { -- Notify amikor mosás közben próbálsz újra mosni
--         title = 'Hiba',
--         description = 'Ezt most nem tudod megtenni!',
--         type = 'error'
--     },
--     SuccessNotify = { -- Notify amikor lemostad a kocsid, duh
--         title = 'Siker',
--         description = 'Sikeresen lemostad a járművedet!',
--         type = 'success'
--     },
--     MoneyNotify = { -- Notify amikor nincs elég pénzed
--         title = 'Hiba',
--         description = 'Nincs elég pénzed!',
--         type = 'error'
--     },
--     positions = {
--         {coord = vector3(24.4675, -1391.8799, 29.3333), rot = 270.0, size = vec3(5, 7, 3), debug = false},
--         {coord = vector3(-700.0496, -933.8840, 19.0139), rot = 360.0, size = vec3(5, 11, 6), debug = false}
--     }
-- }
