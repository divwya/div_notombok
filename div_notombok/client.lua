local function cekLevel()
    local lvl = exports.xperience:GetRank()
    if lvl < 3 then
        LocalPlayer.state.canUseWeapons = false
        NetworkSetFriendlyFireOption(false)
        CreateThread(function()
            while true do
                if lvl >= 3 then
                    LocalPlayer.state.canUseWeapons = true 
                    NetworkSetFriendlyFireOption(true)
                    break
                end
                Wait(7000)
            end
        end)
    end
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() 
    Wait(3000)
    cekLevel()
end)
