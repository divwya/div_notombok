local leveltipu = 0 

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() 
    Wait(3000)
    if exports.xperience:GetRank() < 3 then DisableTombok(true) end
end)

lib.onCache('ped', function(value)
    if value and LocalPlayer.state.isLoggedIn then 
        leveltipu = exports.xperience:GetRank() 
    end
end)

local function DisableTombok(monkey)
    leveltipu = exports.xperience:GetRank()
    CreateThread(function() 
        while monkey do
            if leveltipu >= 3 then
                break
            end
            local ped = PlayerPedId()
            if IsPedArmed(ped, 4) then
                TriggerEvent("ox_inventory:disarm", true)
            end
            DisableControlAction(0, 24, true) 
            DisableControlAction(0, 25, true) 
            DisableControlAction(0, 37, true) 
            DisablePlayerFiring(ped, true)
            DisableControlAction(0, 140, true)
            if IsPedPerformingMeleeAction(ped) or IsPedShooting(ped) then
                lib.callback.await('entah:la', false)
            end
            Wait(1) 
        end
    end)
end
