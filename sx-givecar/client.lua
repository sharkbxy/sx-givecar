CreateThread(function()

    for item,_ in pairs(Config.Vehicles) do

        exports.ox_inventory:registerHook('useItem', function(payload)

            if payload.item.name ~= item then return end

            TriggerServerEvent("vehicleitems:useItem", payload.item)

            return false

        end)

    end

end)

