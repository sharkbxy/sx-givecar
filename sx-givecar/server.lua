local QBCore = exports['qb-core']:GetCoreObject()

local function GeneratePlate()
    local plate = "P"..math.random(1000,9999)..math.random(10,99)
    return plate
end

exports('redeemVehicle', function(event, item, inventory, slot, data)

    -- Only run when item is actually used
    if event ~= 'usingItem' then return end

    local src = inventory.id
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    local config = Config.Vehicles[item.name]
    if not config then
        print("Vehicle item not configured:", item.name)
        return
    end

    local vehicle = config.vehicle
    local plate = GeneratePlate()

    -- Legion Square garage
    local garage = "legion"

    MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
        Player.PlayerData.license,
        Player.PlayerData.citizenid,
        vehicle,
        GetHashKey(vehicle),
        '{}',
        plate,
        garage,
        1
    })

    exports.ox_inventory:RemoveItem(src, item.name, 1)

    TriggerClientEvent('ox_lib:notify', src, {
        title = "Vehicle Received",
        description = vehicle .. " stored in Legion Square garage",
        type = "success",
        position = "top"
    })

end)