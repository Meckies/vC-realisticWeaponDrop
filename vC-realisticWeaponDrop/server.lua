local QBCore = exports['qb-core']:GetCoreObject()

takeds = {}

RegisterServerEvent('vC-realisticWeaponDrop:server:syncforEveryone', function(name, info, hash, pos)
    TriggerClientEvent('vC-realtisticWeaponDrop:dropweapon', -1, name,info,hash, pos)
end)


RegisterServerEvent('vC-realsticWeaponDrop:server:removeforEveryone', function(item,info,serie)
    local Player = QBCore.Functions.GetPlayer(source)
        if takeds[serie] == nil then
            if Player.Functions.AddItem(item, 1,false,info) then
                takeds[serie] = 'taked'
                local label = QBCore.Shared.Items[item].label
                TriggerClientEvent('QBCore:Notify', Player.PlayerData.source, 'Zvedl jsi '..label..' se sériovým číslem ' ..serie..' !')
                TriggerClientEvent('vC-realsticWeaponDrop:client:removeforEveryone',-1, serie)
                Citizen.Wait(5000)
                takeds[serie] = nil
                return
            else
                        takeds[serie] = nil
                TriggerClientEvent('QBCore:Notify', Player.PlayerData.source, 'Jsi příliš plný, abys sebral tuto zbraň!', 'error')
            end
    end
end)
