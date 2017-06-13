local cJ = false
local eJE = false
 
RegisterNetEvent("JP")
AddEventHandler("JP", function(jT)
    if cJ == true then
        return
    end
    local pP = GetPlayerPed(-1)
    if DoesEntityExist(pP) then
       
        Citizen.CreateThread(function()
            local playerOldLoc = GetEntityCoords(pP, true)
            SetEntityCoords(pP, 1677.233, 2658.618, 45.216)
            cJ = true
            eJE = false
            while jT > 0 and not eJE do
                pP = GetPlayerPed(-1)
                RemoveAllPedWeapons(pP, true)
                SetEntityInvincible(pP, true)
                if IsPedInAnyVehicle(pP, false) then
                    ClearPedTasksImmediately(pP)
                end
                if jT % 30 == 0 then
                    TriggerEvent('chatMessage', 'BlackMarket', { 255, 0, 0 }, jT .." Autres Secondes Avant La Libération.")
                end
                Citizen.Wait(500)
                local pL = GetEntityCoords(pP, true)
                local D = Vdist(1677.233, 2658.618, 45.216, pL['x'], pL['y'], pL['z'])
                if D > 90 then
                    SetEntityCoords(pP, 1677.233, 2658.618, 45.216)
                    if D > 100 then
                        jT = jT + 60
                        if jT > 1500 then
                            jT = 1500
                        end
                        TriggerEvent('chatMessage', 'JUGE', { 255, 0, 0 }, "Votre Temps Demprisonnement A Ete Augmenter Suite A Votre Tentative Dévasion.")
                    end
                end
                jT = jT - 0.5
            end
            TriggerServerEvent('chatMessageEntered', "BlackMarket", { 0, 0, 0 }, GetPlayerName(PlayerId()) .." A Ete Libéré De Prison.")
            SetEntityCoords(pP, 1855.807, 2601.949, 45.323)
            cJ = false
            SetEntityInvincible(pP, false)
        end)
    end
end)
 
RegisterNetEvent("UnJP")
AddEventHandler("UnJP", function()
    eJE = true
end)