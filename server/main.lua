local QBCore = exports['qb-core']:GetCoreObject()

local SafeCodes = {}

----------------
--POLICE CHECK--
----------------

local cachedPoliceAmount = {}

QBCore.Functions.CreateCallback('mz-storerobbery:server:getCops', function(source, cb)
    local amount = 0
    for _, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if not Config.UsePoliceName then 
            if v.PlayerData.job.type == Config.PoliceJobType and v.PlayerData.job.onduty then
                amount = amount + 1
            end
        else 
            if v.PlayerData.job.name == Config.PoliceJobName and v.PlayerData.job.onduty then
                amount = amount + 1
            end
        end
    end
    cachedPoliceAmount[source] = amount
    cb(amount)
end)

------------------
--SAFE FUNCTIONS--
------------------

CreateThread(function()
    while true do
        SafeCodes = {
            [1] = math.random(1000, 9999),
            [2] = {math.random(1, 149), math.random(500.0, 600.0), math.random(360.0, 400), math.random(600.0, 900.0)},
            [3] = {math.random(150, 359), math.random(-300.0, -60.0), math.random(0, 100), math.random(-500.0, -160.0)},
            [4] = math.random(1000, 9999),
            [5] = math.random(1000, 9999),
            [6] = {math.random(1, 149), math.random(150.0, 200.0), math.random(100, 140), math.random(150.0, 220.0), math.random(-100, 100), math.random(140, 300)},
            [7] = math.random(1000, 9999),
            [8] = math.random(1000, 9999),
            [9] = math.random(1000, 9999),
            [10] = {math.random(1, 149), math.random(300.0, 500.0), math.random(200, 260), math.random(500.0, 800.0), math.random(300, 440), math.random(650, 900)},
            [11] = math.random(1000, 9999),
            [12] = math.random(1000, 9999),
            [13] = math.random(1000, 9999),
            [14] = {math.random(150, 450), math.random(-360.0, 0.0), math.random(360, 720)},
            [15] = math.random(1000, 9999),
            [16] = math.random(1000, 9999),
            [17] = math.random(1000, 9999),
            [18] = {math.random(150, 450), math.random(1.0, 100.0), math.random(360, 450), math.random(300.0, 340.0), math.random(350, 400), math.random(320.0, 340.0), math.random(350, 600)},
            [19] = math.random(1000, 9999),
        }
        Wait((1000 * 60) * 40)
    end
end)

QBCore.Functions.CreateCallback('mz-storerobbery:server:isCombinationRight', function(_, cb, safe)
    cb(SafeCodes[safe])
end)

-------------------
--SERVER LOCKOUTS--
-------------------

RegisterNetEvent('mz-storerobbery:server:setRegisterStatus', function(k)
    Config.RegistersTarget[k].robbed = true
    Config.RegistersTarget[k].time = Config.resetTime
    TriggerClientEvent('mz-storerobbery:client:setRegisterStatus', -1, k, true)
    SetTimeout(Config.resetTime, function()
        Config.RegistersTarget[k].robbed = false
        TriggerClientEvent('mz-storerobbery:client:setRegisterStatus', -1, k, false)
    end)
end)

RegisterNetEvent('mz-storerobbery:server:setRegisterStatusFailed', function(k)
    Config.RegistersTarget[k].robbed = false
    TriggerClientEvent('mz-storerobbery:client:setRegisterStatus', -1, k, false)
end)

RegisterNetEvent('mz-storerobbery:server:setSafeStatus', function(safe)
    Config.SafesTarget[safe].robbed = true
    TriggerClientEvent('mz-storerobbery:client:setSafeStatus', -1, safe, true)
    SetTimeout(Config.SafeResetTime, function()
        Config.SafesTarget[safe].robbed = false
        TriggerClientEvent('mz-storerobbery:client:setSafeStatus', -1, safe, false)
    end)
end)

RegisterNetEvent('mz-storerobbery:server:setSafeStatusFailed', function(safe)
    Config.SafesTarget[safe].robbed = false
    TriggerClientEvent('mz-storerobbery:client:setSafeStatus', -1, safe, false)
end)

----------------
--LOOT REWARDS--
----------------

-- REGISTERS 

RegisterNetEvent('mz-storerobbery:server:takeMoney', function(register, isDone, registerDone)
    if not registerDone then 
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        if not Player then 
            return 
        end
        local playerPed = GetPlayerPed(src)
        local playerCoords = GetEntityCoords(playerPed)
        if isDone then
            if Config.CashRegisterReturn == "dirtymoney" then 
                local amount = math.random(Config.minRegisterEarn, Config.maxRegisterEarn)
                Player.Functions.AddItem('dirtymoney', amount, false)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['dirtymoney'], "add", amount)
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You stole $" ..amount.. " from the till!", 'success')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "RAIDED THE TILL", "You stole $" ..amount.. " from the till!", 4500, 'success')
                end
                Wait(1500)
                if math.random(1, 100) <= Config.liquorKey then 
                    Player.Functions.AddItem('liquorkey', 1, false)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['liquorkey'], "add", 1)
                end
            elseif Config.CashRegisterReturn == "markedbills" then 
                local info = {
                    worth = math.random(Config.minRegisterEarn, Config.maxRegisterEarn)
                }
                Player.Functions.AddItem('markedbills', 1, false, info)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['markedbills'], "add")
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You stole $" ..info.worth.. " from the till!", 'success')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "RAIDED THE TILL", "You stole $" ..info.worth.. " from the till!", 4500, 'success')
                end
                Wait(1500)
                if math.random(1, 100) <= Config.liquorKey then 
                    Player.Functions.AddItem('liquorkey', 1, false)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['liquorkey'], "add", 1)
                end
            elseif Config.CashRegisterReturn == "cash" then 
                local cleanmoney = math.random(Config.minRegisterEarn, Config.maxRegisterEarn)
                Player.Functions.AddMoney('cash', cleanmoney)
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You stole $" ..cleanmoney.. " from the till!", 'success')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "RAIDED THE TILL", "You stole $" ..cleanmoney.. " from the till!", 4500, 'success')
                end
            else 
                print("You have not properly configured 'Config.CashRegisterReturn', please refer to config.lua")
            end
        end
    else 
        print("Someone is attempting to trigger 'mz-storerobbery:server:takeMoney' externally.")
    end
end)

-- SAFES

RegisterNetEvent('mz-storerobbery:server:SafeReward', function(safe, safeCheck)
    if not safeCheck then 
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        if not Player then 
            return 
        end
        if Config.SafeReturn == "dirtymoney" then 
            local amount = math.random(Config.minSafeEarn, Config.maxSafeEarn)
            Player.Functions.AddItem('dirtymoney', amount, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['dirtymoney'], "add")
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, "You stole $" ..amount.. " from the safe!", 'success', 4500)
            elseif Config.NotifyType == "okok" then
                TriggerClientEvent('okokNotify:Alert', source, "RAIDED THE SAFE", "You stole $" ..amount.. " from the safe!", 4500, 'success')
            end
            if Config.RareItemDrops then 
                Wait(1000)
                if math.random(1, 100) <= Config.RareItem1Chance then 
                    Player.Functions.AddItem(Config.RareItem1, Config.RareItemAmount, false)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RareItem1], "add", Config.RareItemAmount)
                end
                Wait(1000)
                if math.random(1, 100) <= Config.RareItem2Chance then 
                    Player.Functions.AddItem(Config.RareItem2, Config.RareItem2Amount, false)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RareItem2], "add", Config.RareItem2Amount)
                end
                Wait(1000)
                if math.random(1, 100) <= Config.RareItem3Chance then 
                    Player.Functions.AddItem(Config.RareItem3, Config.RareItem3Amount, false)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RareItem3], "add", Config.RareItem3Amount)
                end
            end 
        elseif Config.SafeReturn == "markedbills" then
            local info = {
                worth = math.random(Config.minSafeEarn, Config.maxSafeEarn)
            }
            Player.Functions.AddItem('markedbills', 1, false, info)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['markedbills'], "add")
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, "You stole $" ..info.worth.. " from the safe!", 'success', 4500)
            elseif Config.NotifyType == "okok" then
                TriggerClientEvent('okokNotify:Alert', source, "RAIDED THE SAFE", "You stole $" ..info.worth.. " from the safe!", 4500, 'success')
            end
            if Config.RareItemDrops then
                Wait(1000)
                if math.random(1, 100) <= Config.RareItem1Chance then 
                    Player.Functions.AddItem(Config.RareItem1, Config.RareItemAmount, false)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RareItem1], "add", Config.RareItemAmount)
                end
                Wait(1000)
                if math.random(1, 100) <= Config.RareItem2Chance then 
                    Player.Functions.AddItem(Config.RareItem2, Config.RareItem2Amount, false)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RareItem2], "add", Config.RareItem2Amount)
                end
                Wait(1000)
                if math.random(1, 100) <= Config.RareItem3Chance then 
                    Player.Functions.AddItem(Config.RareItem3, Config.RareItem3Amount, false)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RareItem3], "add", Config.RareItem3Amount)
                end
            end
        elseif Config.SafeReturn == "cash" then
            local cleanmoney = math.random(Config.minSafeEarn, Config.maxSafeEarn)
            Player.Functions.AddMoney('cash', cleanmoney)
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, "You stole $" ..cleanmoney.. " from the safe!", 'success')
            elseif Config.NotifyType == "okok" then
                TriggerClientEvent('okokNotify:Alert', source, "RAIDED THE TILL", "You stole $" ..cleanmoney.. " from the safe!", 4500, 'success')
            end
            if Config.RareItemDrops then
                Wait(1000)
                if math.random(1, 100) <= Config.RareItem1Chance then 
                    Player.Functions.AddItem(Config.RareItem1, Config.RareItemAmount, false)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RareItem1], "add", Config.RareItemAmount)
                end
                Wait(1000)
                if math.random(1, 100) <= Config.RareItem2Chance then 
                    Player.Functions.AddItem(Config.RareItem2, Config.RareItem2Amount, false)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RareItem2], "add", Config.RareItem2Amount)
                end
                Wait(1000)
                if math.random(1, 100) <= Config.RareItem3Chance then 
                    Player.Functions.AddItem(Config.RareItem3, Config.RareItem3Amount, false)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RareItem3], "add", Config.RareItem3Amount)
                end 
            end
        else
            print("You have not properly configured 'Config.SafeReturn', please refer to config.lua")
        end
    else 
        print("Someone is attempting to trigger 'mz-storerobbery:server:SafeReward' externally.")
    end
end)

RegisterNetEvent('mz-storerobbery:server:SafeRewardAlcohol', function(safe, safeCheck)
    if not safeCheck then 
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        if not Player then 
            return 
        end
        if Config.AlcoholReturn == "dirtymoney" then 
            local amount = math.random(Config.AlcoholminSafeEarn, Config.AlcoholmaxSafeEarn)
            Player.Functions.AddItem('dirtymoney', amount, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['dirtymoney'], "add")
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, "You stole $" ..amount.. " from the safe!", 'success', 4500)
            elseif Config.NotifyType == "okok" then
                TriggerClientEvent('okokNotify:Alert', source, "RAIDED THE SAFE", "You stole $" ..amount.. " from the safe!", 4500, 'success')
            end
            if Config.AlcoholRareItemDrops then 
                Wait(1500)
                if math.random(1, 100) <= Config.AlcoholRareItem1Chance then 
                    Player.Functions.AddItem(Config.AlcoholRareItem1, Config.AlcoholRareItemAmount, false)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.AlcoholRareItem1], "add", Config.AlcoholRareItemAmount)
                end
                Wait(1500)
                if math.random(1, 100) <= Config.AlcoholRareItem2Chance then 
                    Player.Functions.AddItem(Config.AlcoholRareItem2, Config.AlcoholRareItem2Amount, false)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.AlcoholRareItem2], "add", Config.AlcoholRareItem2Amount)
                end
                Wait(1500)
                if math.random(1, 100) <= Config.AlcoholRareItem3Chance then 
                    Player.Functions.AddItem(Config.AlcoholRareItem3, Config.AlcoholRareItem3Amount, false)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.AlcoholRareItem3], "add", Config.AlcoholRareItem3Amount)
                end
            end 
        elseif Config.AlcoholReturn == "markedbills" then 
            local info = {
                worth = math.random(Config.AlcoholminSafeEarn, Config.AlcoholmaxSafeEarn)
            }
            Player.Functions.AddItem('markedbills', 1, false, info)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['markedbills'], "add")
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, "You stole $" ..info.worth.. " from the safe!", 'success', 4500)
            elseif Config.NotifyType == "okok" then
                TriggerClientEvent('okokNotify:Alert', source, "RAIDED THE SAFE", "You stole $" ..info.worth.. " from the safe!", 4500, 'success')
            end
            if Config.AlcoholRareItemDrops then
                Wait(1000)
                if math.random(1, 100) <= Config.AlcoholRareItem1Chance then 
                    Player.Functions.AddItem(Config.AlcoholRareItem1, Config.AlcoholRareItemAmount, false)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.AlcoholRareItem1], "add", Config.AlcoholRareItemAmount)
                end
                Wait(1500)
                if math.random(1, 100) <= Config.AlcoholRareItem2Chance then 
                    Player.Functions.AddItem(Config.AlcoholRareItem2, Config.AlcoholRareItem2Amount, false)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.AlcoholRareItem2], "add", Config.AlcoholRareItem2Amount)
                end
                Wait(1500)
                if math.random(1, 100) <= Config.AlcoholRareItem3Chance then 
                    Player.Functions.AddItem(Config.AlcoholRareItem3, Config.AlcoholRareItem3Amount, false)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.AlcoholRareItem3], "add", Config.AlcoholRareItem3Amount)
                end
            end 
        elseif Config.AlcoholReturn == "cash" then 
            local cleanmoney = math.random(Config.AlcoholminSafeEarn, Config.AlcoholmaxSafeEarn)
            Player.Functions.AddMoney('cash', cleanmoney)
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, "You stole $" ..cleanmoney.. " from the safe!", 'success')
            elseif Config.NotifyType == "okok" then
                TriggerClientEvent('okokNotify:Alert', source, "RAIDED THE TILL", "You stole $" ..cleanmoney.. " from the safe!", 4500, 'success')
            end
            if Config.AlcoholRareItemDrops then
                Wait(1000)
                if math.random(1, 100) <= Config.AlcoholRareItem1Chance then 
                    Player.Functions.AddItem(Config.AlcoholRareItem1, Config.AlcoholRareItemAmount, false)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.AlcoholRareItem1], "add", Config.AlcoholRareItemAmount)
                end
                Wait(1500)
                if math.random(1, 100) <= Config.AlcoholRareItem2Chance then 
                    Player.Functions.AddItem(Config.AlcoholRareItem2, Config.AlcoholRareItem2Amount, false)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.AlcoholRareItem2], "add", Config.AlcoholRareItem2Amount)
                end
                Wait(1500)
                if math.random(1, 100) <= Config.AlcoholRareItem3Chance then 
                    Player.Functions.AddItem(Config.AlcoholRareItem3, Config.AlcoholRareItem3Amount, false)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.AlcoholRareItem3], "add", Config.AlcoholRareItem3Amount)
                end
            end
        else
            print("You have not properly configured 'Config.AlcoholReturn', please refer to config.lua")
        end
    else 
        print("Someone is attempting to trigger 'mz-storerobbery:server:SafeRewardAlcohol' externally.")
    end
end)

----------------
--ITEM REMOVAL--
----------------

RegisterServerEvent('mz-storerobbery:server:ItemRemoval', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('usb2', 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['usb2'], "remove", 1)
end)

RegisterServerEvent('mz-storerobbery:server:RemoveLockpick', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('lockpick', 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['lockpick'], "remove", 1)
end)

RegisterServerEvent('mz-storerobbery:server:RemoveAdvanced', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('advancedlockpick', 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['advancedlockpick'], "remove", 1)
end)

RegisterServerEvent('mz-storerobbery:server:SafeFail', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.NotifyType == 'qb' then
        TriggerClientEvent('QBCore:Notify', src, "You failed to infiltrate the safe...", 'error', 3500)
    elseif Config.NotifyType == "okok" then
        TriggerClientEvent('okokNotify:Alert', source, "WASTED USB", "You failed to infiltrate the safe...", 3500, 'error')
    end
end)

RegisterServerEvent('mz-storerobbery:server:KeyRemoval', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('liquorkey', 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['liquorkey'], "remove", 1)
    if Config.NotifyType == 'qb' then
        TriggerClientEvent('QBCore:Notify', src, "You broke the key... Well done...", 'error')
    elseif Config.NotifyType == "okok" then
        TriggerClientEvent('okokNotify:Alert', source, "KEY BROKE", "You broke the key... Well done...", 4500, 'error')
    end
end)

RegisterServerEvent('mz-storerobbery:server:KeyRemovalSuccess', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('liquorkey', 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['liquorkey'], "remove", 1)
end)

-------------
--FUNCTIONS--
-------------

RegisterNetEvent('mz-storerobbery:server:callCops', function(type, safe, streetLabel, coords)
    local cameraId
    if type == "safe" then
        cameraId = Config.SafesTarget[safe].camId
    else
        cameraId = Config.RegistersTarget[safe].camId
    end
    local alertData = {
        title = "10-33 | Shop Robbery",
        coords = {x = coords.x, y = coords.y, z = coords.z},
        description = "Someone Is Trying To Rob A Store At "..streetLabel.." (CAMERA ID: "..cameraId..")"
    }
    TriggerClientEvent("mz-storerobbery:client:robberyCall", -1, type, safe, streetLabel, coords)
    TriggerClientEvent("qb-phone:client:addPoliceAlert", -1, alertData)
end)

CreateThread(function()
    while true do
        local toSend = {}
        for k in ipairs(Config.RegistersTarget) do
            if Config.RegistersTarget[k].time > 0 and (Config.RegistersTarget[k].time - Config.tickInterval) >= 0 then
                Config.RegistersTarget[k].time = Config.RegistersTarget[k].time - Config.tickInterval
            else
                if Config.RegistersTarget[k].robbed then
                    Config.RegistersTarget[k].time = 0
                    Config.RegistersTarget[k].robbed = false
                    toSend[#toSend+1] = Config.RegistersTarget[k]
                end
            end
        end
        if #toSend > 0 then
            TriggerClientEvent('mz-storerobbery:client:setRegisterStatus', -1, toSend, false)
        end
        Wait(Config.tickInterval)
    end
end)

QBCore.Functions.CreateCallback('mz-storerobbery:server:getPadlockCombination', function(_, cb, safe)
    cb(SafeCodes[safe])
end)

QBCore.Functions.CreateCallback('mz-storerobbery:server:getRegisterStatus', function(_, cb)
    cb(Config.RegistersTarget)
end)

QBCore.Functions.CreateCallback('mz-storerobbery:server:getSafeStatus', function(_, cb)
    cb(Config.SafesTarget)
end)