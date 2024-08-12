local function DisableTombok(monkey)
    CreateThread(function() 
        while monkey do
            if exports.xperience:GetRank() >= 3 then
                break -- Break Bila Dah Reach Level 3 tak perlu relog untuk bypass tombok
            end
            if IsPedArmed(PlayerPedId(), 4) then
                TriggerEvent("ox_inventory:disarm", true)
            end
            DisableControlAction(0, 24, true) 
            DisableControlAction(0, 25, true) 
            DisableControlAction(0, 37, true) 
            DisablePlayerFiring(PlayerPedId(), true)
            DisableControlAction(0, 140, true)
            if IsPedPerformingMeleeAction(PlayerPedId()) or IsPedShooting(PlayerPedId()) then
                local tendang = lib.callback.await('entah:la', false)
            end
            Wait(1) 
        end
    end)
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() 
    Wait(3000)
    if exports.xperience:GetRank() < 3 then
        DisableTombok(true)
    end
end)
