local jailPassword = "bmjail" --change this password to your liking and don't share it with the criminals ;-)
 
-----------------------------
 
RegisterServerEvent("chatCommandEntered")
AddEventHandler('chatCommandEntered', function(fullcm)
    cm = stringsplit(fullcm, " ")
 
    if(cm[1] == "*jailme") then
        local jT = 180
        if tablelength(cm) > 1 then
            if cm[2] ~= nil then
                jT = tonumber(cm[2])               
            end
        end
        if jT > 1000 then
            jT = 1000
        end
       
        print("Emprisonnement ".. GetPlayerName(source) .. " Pour ".. jT .." Secondes")
        TriggerClientEvent("JP", source, jT)
        TriggerClientEvent('chatMessage', -1, 'JUGE', { 0, 0, 0 }, GetPlayerName(source) ..' Emprisonné Pour '.. jT ..' Secondes')
    elseif cm[1] == "*unjail" then
        if tablelength(cm) > 2 then
            if cm[2] == jailPassword then
                local tPID = tonumber(cm[3])
                print("Libération ".. GetPlayerName(tPID).. " - Commande Entré Par ".. GetPlayerName(source))
                TriggerClientEvent("UnJP", tPID)
            else
                print("Mauvais Mot De Passe Entré Par ".. GetPlayerName(source))
            end
        end
    elseif cm[1] == "*jail" then
        if tablelength(cm) > 2 then
            if cm[2] == jailPassword then
                local tPID = tonumber(cm[3])
                local jT = 180
                if tablelength(cm) > 3 then
                    if cm[4] ~= nil then
                        jT = tonumber(cm[4])               
                    end
                end
                if jT > 1000 then
                    jT = 1000
                end
                print("Emprisonnement ".. GetPlayerName(tPID).. " Pour ".. jT .." Secondes - Commande Entré Par ".. GetPlayerName(source))
                TriggerClientEvent("JP", tPID, jT)
                TriggerClientEvent('chatMessage', -1, 'JUGE', { 0, 0, 0 }, GetPlayerName(tPID) ..' Emprisonné Pour '.. jT ..' Secondes')
            else
                print("Mauvais Mot De Passe Entré Par ".. GetPlayerName(source))
            end
        end
    end
end)
 
print('Jailer Par b4b4s666 (LUA). Commandes A Ecrire En Chat (T):')
print('*jailme SECS - Vous Emprisonne Pour La Duré Inscrite Si Aucune Par Défaut 180.')
print('*unjail PSWD PLAYERID - Libere La Personne Selon Le ID Inscrit Si Le Bon Mot De Passe Est Inscrit.')
print('*jail PSWD PLAYERID SECS - Emprisonne La Personne Avec Le ID Inscrit Et Le Temps Inscrit Sur Le Password Est Le Bon.')
function stringsplit(self, delimiter)
  local a = self:Split(delimiter)
  local t = {}
 
  for i = 0, #a - 1 do
     table.insert(t, a[i])
  end
 
  return t
end
 
function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end