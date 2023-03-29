Config = {}

-------------------
--MZ-STOREROBBERY--
-------------------

Config.NotifyType = 'okok'                      -- Notification type (set to 'qbcore' to use qb-core standard notifications.)

Config.Drawtext = false                         -- Change to true to re-engage range check drawtext (Consumes more server resources with while loops)

Config.StressEnabled = true                     -- Change to false to disable accumulation of stress.

Config.PrintChanceRegister = 25                 -- Chance (in percentage) to leave fingerprints if not wearing gloves when robbing a register.

Config.PrintChanceSafe = 65                     -- Chance (in percentage) to leave fingerprints if not wearing gloves when robbing a safe.

Config.psdispatch = true                        -- set to "false" if you are not using ps-dispatch alerts (if "false", base qb-core alerts will trigger).

Config.DispatchRegisterDelay = 60               -- Time (in seconds) between dispatch pings being sent when lockpicking registers

Config.resetTime = (60 * 1000) * 30             -- Changing the last number will change the number of minutes for the robbery to reset (for each register)

Config.tickInterval = 1000                      -- No need to change this. 

-------------
--MZ-SKILLS--
-------------

Config.mzskills = true                          -- Set to 'false' if you do not wish to use this resource with mz-skills
--if "Config.mzskills = true", then the following parameters apply: 
-- "HACKING"
Config.HackXPSkill = "Hacking"                  -- Rename as you wish but make sure you rename it to a skill at mz-skills/config.lua
-- XP Requirements
Config.HackXPlvl8 = 12800
Config.HackXPlvl7 = 6400
Config.HackXPlvl6 = 3200
Config.HackXPlvl5 = 1600
Config.HackXPlvl4 = 800
Config.HackXPlvl3 = 400
Config.HackXPlvl2 = 200
Config.HackXPlvl1 = 100
-- XP Modifiers
Config.HackingXPLow = 8                         -- Lowest amount of "Hacking" XP added upon successful hack.
Config.HackingXPMid = 11                        -- Mid level "Hacking" XP added upon successful hack.
Config.HackingXPHigh = 14                       -- Highest amount of "Hacking" XP added upon successful hack.
Config.HackingXPLoss = 10                       -- "Hacking" XP lost for failing any hack.

-- "HEIST REPUTATION"
Config.CriminalXPSkill = "Heist Reputation"
-- XP Modifiers (Registers)
Config.HeistXPlow2 = 2                           -- Lowest amount of "Heist Reputation" XP added upon successful hack.
Config.HeistXPmid2 = 3                           -- Mid level "Heist Reputation" XP added upon successful hack.
Config.HeistXPhigh2 = 4                          -- Highest amount of "Heist Reputation" XP added upon successful hack.
-- XP Modifiers (SAFES)
Config.HeistXPlow = 4                           -- Lowest amount of "Heist Reputation" XP added upon successful hack.
Config.HeistXPmid = 6                           -- Mid level "Heist Reputation" XP added upon successful hack.
Config.HeistXPhigh = 8                          -- Highest amount of "Heist Reputation" XP added upon successful hack.

--------------------
--POLICE VARIABLES--
--------------------

Config.UsePoliceName = false                    -- If this is set to "false", server will check for jobname: "police", otherwise it will check for job type for newer qb-core builds
Config.PoliceJobType = "leo"                    -- Name of job type used by your server - used if "Config.UsePoliceName = true"
Config.PoliceJobName = "police"                 -- Name of police role in your server - used if "Config.UsePoliceName = false"

Config.MinimumStoreRobberyPolice = 0            -- Minimum police that need to be on duty before a store can be robbed.

Config.PoliceMinutesCooldown = 5                -- Change minutes to change alert time for police 

------------------
--CASH REGISTERS--
------------------

Config.LockpickBreakChance = 40                 -- Percentage chance of lockpick breaking upon player failing to lockpick cash register.
Config.AdvancedBreakChance = 20                 -- Percentage chance of advanced lockpick breaking upon player failing to lockpick cash register.

-- Mini-game to steal from till
Config.BreakRegister = "circle"                 -- "standard" uses the qb-lockpick, "circle" uses the ps-ui minigame.
-- if "Config.BreakRegister" = "circle", then the following parameters apply: 
Config.circleparses = 7                         -- number of circle parses a player will need to complete
Config.circletime = 13                          -- time for player to complete one parse of the circle

-- Reward type:
Config.CashRegisterReturn = "dirtymoney"        -- Set to "dirtymoney", "markedbills" or "cash" to alter the reward given.
Config.minRegisterEarn = 2000                   -- Minimum amount earnt from stealing from a cash register
Config.maxRegisterEarn = 5000                   -- Maximum amount earnt from stealing from a cash register

Config.RegisterTime = 25                        -- Time it takes for player to rob cash register after lockpicking (in seconds)

--Chance to drop liquor key
Config.liquorKey = 35                           -- Percentage chance to find a key to the liquor storeroom

Config.RegistersTarget = {
    [1] = {
        ["coords"] = vector3(-47.24, -1757.65, 29.53), 
        robbed = false, 
        time = 0, 
        safeKey = 1,
        camId = 4,
    },
    [2] = {
        ["coords"] = vector3(-48.58, -1759.21, 29.59), 
        robbed = false, 
        time = 0, 
        safeKey = 1,
        camId = 4,
    },
    [3] = {
        ["coords"] = vector3(-1486.26, -378.0, 40.16), 
        robbed = false, 
        time = 0, 
        safeKey = 2,
        camId = 5,
    },
    [4] = {
        ["coords"] = vector3(-1222.03, -908.32, 12.32), 
        robbed = false, 
        time = 0, 
        safeKey = 3,
        camId = 6,
    },
    [5] = {
        ["coords"] = vector3(-706.08, -915.42, 19.21), 
        robbed = false, 
        time = 0, 
        safeKey = 4,
        camId = 7,
    },
    [6] = {
        ["coords"] = vector3(-706.16, -913.5, 19.21), 
        robbed = false, 
        time = 0, 
        safeKey = 4,
        camId = 7,
    },
    [7] = {
        ["coords"] = vector3(24.47, -1344.99, 29.49), 
        robbed = false, 
        time = 0, 
        safeKey = 5,
        camId = 8,
    },
    [8] = {
        ["coords"] = vector3(24.45, -1347.37, 29.49), 
        robbed = false, 
        time = 0, 
        safeKey = 5,
        camId = 8,
    },
    [9] = {
        ["coords"] = vector3(1134.15, -982.53, 46.41), 
        robbed = false, 
        time = 0, 
        safeKey = 6,
        camId = 9,
    },
    [10] = {
        ["coords"] = vector3(1165.05, -324.49, 69.2), 
        robbed = false, 
        time = 0, 
        safeKey = 7,
        camId = 10,
    },
    [11] = {
        ["coords"] = vector3(1164.7, -322.58, 69.2), 
        robbed = false, 
        time = 0, 
        safeKey = 7,
        camId = 10,
    },
    [12] = {
        ["coords"] = vector3(373.14, 328.62, 103.56), 
        robbed = false, 
        time = 0, 
        safeKey = 8,
        camId = 11,
    },
    [13] = {
        ["coords"] = vector3(372.57, 326.42, 103.56), 
        robbed = false, 
        time = 0, 
        safeKey = 8,
        camId = 11,
    },
    [14] = {
        ["coords"] = vector3(-1818.9, 792.9, 138.08), 
        robbed = false, 
        time = 0, 
        safeKey = 9,
        camId = 12,
    },
    [15] = {
        ["coords"] = vector3(-1820.17, 794.28, 138.08), 
        robbed = false, 
        time = 0, 
        safeKey = 9,
        camId = 12,
    },
    [16] = {
        ["coords"] = vector3(-2966.46, 390.89, 15.04), 
        robbed = false, 
        time = 0, 
        safeKey = 10,
        camId = 13,
    },
    [17] = {
        ["coords"] = vector3(-3041.14, 583.87, 7.9), 
        robbed = false, 
        time = 0, 
        safeKey = 11,
        camId = 14,
    },
    [18] = {
        ["coords"] = vector3(-3038.92, 584.5, 7.9), 
        robbed = false, 
        time = 0, 
        safeKey = 11,
        camId = 14,
    },
    [19] = {
        ["coords"] = vector3(-3244.56, 1000.14, 12.83), 
        robbed = false, 
        time = 0, 
        safeKey = 12,
        camId = 15,
    },
    [20] = {
        ["coords"] = vector3(-3242.24, 999.98, 12.83), 
        robbed = false, 
        time = 0, 
        safeKey = 12,
        camId = 15,
    },
    [21] = {
        ["coords"] = vector3(549.42, 2669.06, 42.15), 
        robbed = false, 
        time = 0, 
        safeKey = 13,
        camId = 16,
    },
    [22] = {
        ["coords"] = vector3(549.05, 2671.39, 42.15), 
        robbed = false, 
        time = 0, 
        safeKey = 13,
        camId = 16,
    },
    [23] = {
        ["coords"] = vector3(1165.9, 2710.81, 38.15), 
        robbed = false, 
        time = 0, 
        safeKey = 14,
        camId = 17,
    },
    [24] = {
        ["coords"] = vector3(2676.02, 3280.52, 55.24), 
        robbed = false, 
        time = 0, 
        safeKey = 15,
        camId = 18,
    },
    [25] = {
        ["coords"] = vector3(2678.07, 3279.39, 55.24), 
        robbed = false, 
        time = 0, 
        safeKey = 15,
        camId = 18,
    },
    [26] = {
        ["coords"] = vector3(1958.96, 3741.98, 32.34), 
        robbed = false, 
        time = 0, 
        safeKey = 16,
        camId = 19,
    },
    [27] = {
        ["coords"] = vector3(1960.13, 3740.0, 32.34), 
        robbed = false, 
        time = 0, 
        safeKey = 16,
        camId = 19,
    },
    [28] = {
        ["coords"] = vector3(1728.86, 6417.26, 35.03), 
        robbed = false, 
        time = 0, 
        safeKey = 17,
        camId = 20,
    },
    [29] = {
        ["coords"] = vector3(1727.85, 6415.14, 35.03), 
        robbed = false, 
        time = 0, 
        safeKey = 17,
        camId = 20,
    },
    [30] = {
        ["coords"] = vector3(-161.07, 6321.23, 31.5), 
        robbed = false, 
        time = 0, 
        safeKey = 18,
        camId = 27,
    },
    [31] = {
        ["coords"] = vector3(160.52, 6641.74, 31.6), 
        robbed = false, 
        time = 0, 
        safeKey = 19,
        camId = 28,
    },
    [32] = {
        ["coords"] = vector3(162.16, 6643.22, 31.6), 
        robbed = false, 
        time = 0, 
        safeKey = 19,
        camId = 29,
    },
}

----------------------------
--SAFE (CONVENIENCE STORE)--
----------------------------

Config.SafeReqItem = "usb2"                     -- Change to any item you want (needs to be in qb-core/shared/items.lua)

Config.SafeReturn = "dirtymoney"                -- Set to "dirtymoney", "markedbills" or "cash" to alter the reward given.

Config.minSafeEarn = 7000                       -- Minimum amount earnt from stealing from a safe (in dirtymoney)
Config.maxSafeEarn = 22000                      -- Maximum amount earnt from stealing from a safe (in dirtymoney)

Config.SafeTimelow = 45                         -- Lowest time (in seconds) that it will take a player to raid the safe.
Config.SafeTimehigh = 75                        -- Highest time (in seconds) that it will take a player to raid the safe.

Config.SafeResetTime = 60 * 1000 * 60           -- The first number is the time, in minutes, for a safe to cooldown automatically. 

Config.StressForFailing = 10                    -- Amount of stress a player incurs for failing to breach a safe

------------------
--SAFE HACK TYPE-- 
------------------
-- (Choose the type of hack for convenience store safes from: 'varHack', 'maze', 'mHacking', 'numberMaze', 'scrambler' (all configured to work with or without mz-skills))
-- Please note, all hacks except "mHacking" depend on ps-ui. "mHacking" depends on mhacking. Ensure those resourecs are up to date. 
Config.Hacktype = 'mHacking'

-- mHacking PARAMETERS
-- If "Config.mzskills = true", then the following apply:
-- Level 8
Config.mhacklvl8high = 6
Config.mhacklvl8low = 5
Config.mhacklvl8time = 18
-- Level 7
Config.mhacklvl7high = 5
Config.mhacklvl7low = 5
Config.mhacklvl7time = 17
-- Level 6
Config.mhacklvl6high = 5
Config.mhacklvl6low = 4
Config.mhacklvl6time = 16
-- Level 5
Config.mhacklvl5high = 4
Config.mhacklvl5low = 4
Config.mhacklvl5time = 16
-- Level 4
Config.mhacklvl4high = 4
Config.mhacklvl4low = 3
Config.mhacklvl4time = 15
-- Level 3
Config.mhacklvl3high = 3
Config.mhacklvl3low = 3
Config.mhacklvl3time = 15
-- Level 2
Config.mhacklvl2high = 3
Config.mhacklvl2low = 2
Config.mhacklvl2time = 15
-- Level 1
Config.mhacklvl1high = 3
Config.mhacklvl1low = 2
Config.mhacklvl1time = 14
-- Level 0
Config.mhacklvl0high = 3
Config.mhacklvl0low = 2
Config.mhacklvl0time = 13
-- If "Config.mzskills = false", then the following apply:
Config.mhacklvlNOXPhigh = 4
Config.mhacklvlNOXPlow = 3
Config.mhacklvlNOXPtime = 16

-- VarHack PARAMETERS
-- If "Config.mzskills = true", then the following apply:
-- Level 8 
Config.varhacklvl8blocks = 2
Config.varhacklvl8time = 12
-- Level 7
Config.varhacklvl7blocks = 3
Config.varhacklvl7time = 12
-- Level 6 
Config.varhacklvl6blocks = 3
Config.varhacklvl6time = 10
-- Level 5
Config.varhacklvl5blocks = 4
Config.varhacklvl5time = 12
-- Level 4 
Config.varhacklvl4blocks = 4
Config.varhacklvl4time = 10
-- Level 3
Config.varhacklvl3blocks = 5
Config.varhacklvl3time = 14
-- Level 2 
Config.varhacklvl2blocks = 5
Config.varhacklvl2time = 12
-- Level 1
Config.varhacklvl1blocks = 5
Config.varhacklvl1time = 10
-- Level 0
Config.varhacklvl0blocks = 6
Config.varhacklvl0time = 12
-- If "Config.mzskills = false", then the following apply:
Config.varhacklvlNOXPblocks = 5
Config.varhacklvlNOXPtime = 12

--RARE DROPS (In addition to dirtymoney)

Config.RareItemDrops = true                     -- Change to false if you do not want to have the following rare item drops
-- if "Config.RareItemDrops = true", then the following parameters apply: 
--Rare item 1
Config.RareItem1 = "rolex"                      -- Name of the rare item that will drop
Config.RareItem1Chance = 20                     -- Percentage chance to obtain the rare item drop from robbing a safe.
Config.RareItemAmount = 2                       -- Amount of the rare item player will receive if chance is triggered
--Rare item 2 (Note: chance for drop is independent for each rare item listed)
Config.RareItem2 = "goldbar"                    -- Name of the rare item that will drop
Config.RareItem2Chance = 10                     -- Percentage chance to obtain the rare item drop from robbing a safe.
Config.RareItem2Amount = 1                      -- Amount of the rare item player will receive if chance is triggered
--Rare item 3 (Note: chance for drop is independent for each rare item listed)
Config.RareItem3 = "weapon_pistol"              -- Name of the rare item that will drop
Config.RareItem3Chance = 2                      -- Percentage chance to obtain the rare item drop from robbing a safe.
Config.RareItem3Amount = 1                      -- Amount of the rare item player will receive if chance is triggered

------------------------
--SAFE (ALCOHOL STORE)--
------------------------
Config.AlcoholReturn = "dirtymoney"             -- Set to "dirtymoney", "markedbills" or "cash" to alter the reward given.

Config.AlcoholminSafeEarn = 9000                -- Minimum amount earnt from stealing from a safe (in dirtymoney)
Config.AlcoholmaxSafeEarn = 27000               -- Maximum amount earnt from stealing from a safe (in dirtymoney)
Config.AlcoholSafeTime = 25                     -- Time it takes for player to rob safe (in seconds)
Config.AlcoholStressForFailing = 10             -- Amount of stress a player incurs for failing to breach a safe

--RARE DROPS (In addition to dirtymoney)

Config.AlcoholRareItemDrops = true              -- Change to false if you do not want to have the following rare item drops
-- if "Config.AlcoholRareItemDrops = true", then the following parameters apply: 
--Rare item 1
Config.AlcoholRareItem1 = "rolex"               -- Name of the rare item that will drop
Config.AlcoholRareItem1Chance = 20              -- Percentage chance to obtain the rare item drop from robbing a safe.
Config.AlcoholRareItemAmount = 2                -- Amount of the rare item player will receive if chance is triggered
--Rare item 2 (Note: chance for drop is independent for each rare item listed)
Config.AlcoholRareItem2 = "goldbar"             -- Name of the rare item that will drop
Config.AlcoholRareItem2Chance = 10              -- Percentage chance to obtain the rare item drop from robbing a safe.
Config.AlcoholRareItem2Amount = 1               -- Amount of the rare item player will receive if chance is triggered
--Rare item 3 (Note: chance for drop is independent for each rare item listed)
Config.AlcoholRareItem3 = "weapon_pistol"       -- Name of the rare item that will drop
Config.AlcoholRareItem3Chance = 2               -- Percentage chance to obtain the rare item drop from robbing a safe.
Config.AlcoholRareItem3Amount = 1               -- Amount of the rare item player will receive if chance is triggered

Config.SafesTarget = {
    [1] = {
        ["coords"] = vector3(-43.43, -1748.3, 29.42), 
        type = "keypad",
        robbed = false, 
        camId = 4
    },
    [2] = {
        ["coords"] = vector3(-1478.94, -375.5, 39.16), 
        type = "padlock",
        robbed = false, 
        camId = 5
    },
    [3] = {
        ["coords"] = vector3(-1220.85, -916.05, 11.32), 
        type = "padlock",
        robbed = false, 
        camId = 6
    },
    [4] = {
        ["coords"] = vector3(-709.74, -904.15, 19.21), 
        type = "keypad",
        robbed = false, 
        camId = 7
    },
    [5] = {
        ["coords"] = vector3(28.21, -1339.14, 29.49), 
        type = "keypad",
        robbed = false, 
        camId = 8
    },
    [6] = {
        ["coords"] = vector3(1126.77, -980.1, 45.41), 
        type = "padlock",
        robbed = false, 
        camId = 9
    },
    [7] = {
        ["coords"] = vector3(1159.46, -314.05, 69.2), 
        type = "keypad",
        robbed = false, 
        camId = 10
    },
    [8] = {
        ["coords"] = vector3(378.17, 333.44, 103.56), 
        type = "keypad",
        robbed = false, 
        camId = 11
    },
    [9] = {
        ["coords"] = vector3(-1829.27, 798.76, 138.19), 
        type = "keypad",
        robbed = false, 
        camId = 12
    },
    [10] = {
        ["coords"] = vector3(-2959.64, 387.08, 14.04), 
        type = "padlock",
        robbed = false, 
        camId = 13
    },
    [11] = {
        ["coords"] = vector3(-3047.88, 585.61, 7.9), 
        type = "keypad",
        robbed = false, 
        camId = 14
    },
    [12] = {
        ["coords"] = vector3(-3250.02, 1004.43, 12.83), 
        type = "keypad",
        robbed = false, 
        camId = 15
    },
    [13] = {
        ["coords"] = vector3(546.41, 2662.8, 42.15), 
        type = "keypad",
        robbed = false, 
        camId = 16
    },
    [14] = {
        ["coords"] = vector3(1169.31, 2717.79, 37.15), 
        type = "padlock",
        robbed = false, 
        camId = 17
    },
    [15] = {
        ["coords"] = vector3(2672.69, 3286.63, 55.24), 
        type = "keypad",
        robbed = false, 
        camId = 18
    },
    [16] = {
        ["coords"] = vector3(1959.26, 3748.92, 32.34), 
        type = "keypad",
        robbed = false, 
        camId = 19
    },
    [17] = {
        ["coords"] = vector3(1734.78, 6420.84, 35.03), 
        type = "keypad",
        robbed = false, 
        camId = 20
    },
    [18] = {
        ["coords"] = vector3(-168.40, 6318.80, 30.58), 
        type = "padlock",
        robbed = false, 
        camId = 27
    },
    [19] = {
        ["coords"] = vector3(168.95, 6644.74, 31.70), 
        type = "keypad",
        robbed = false, 
        camId = 30
    },
}

Config.MaleNoHandshoes = {
    [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [18] = true, [26] = true, [52] = true, [53] = true, [54] = true, [55] = true, [56] = true, [57] = true, [58] = true, [59] = true, [60] = true, [61] = true, [62] = true, [112] = true, [113] = true, [114] = true, [118] = true, [125] = true, [132] = true,
}
Config.FemaleNoHandshoes = {
    [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [19] = true, [59] = true, [60] = true, [61] = true, [62] = true, [63] = true, [64] = true, [65] = true, [66] = true, [67] = true, [68] = true, [69] = true, [70] = true, [71] = true, [129] = true, [130] = true, [131] = true, [135] = true, [142] = true, [149] = true, [153] = true, [157] = true, [161] = true, [165] = true,
}

--Doors
Config.UnlockParses = 1                             -- Number of parses of qb-lock when unlocking a liquor store door
Config.UnlockParseTime = 11                         -- Time given per pass, the lower, the more difficult (below 10 is crazy)
Config.BreakChance = 50                             -- Percentage chance to break liquorkey upon failing skill check
Config.TripLocks = math.random(4, 8)                -- Number of seconds to trip locks at the end of the robbery

-- No need to change these door names, 
-- Please make sure you add the "Liquorstore" doorlock config to your doorlock resource or these doors will be open by default and the functions to open the doors will be meaningless.
Config.LiquorOuter1 = 'Liquorstore-door1-outer'
Config.LiquorInner1 = 'Liquorstore-door1-inner'
Config.LiquorOuter2 = 'Liquorstore-door2-outer'
Config.LiquorInner2 = 'Liquorstore-door2-inner'
Config.LiquorOuter3 = 'Liquorstore-door3-outer'
Config.LiquorInner3 = 'Liquorstore-door3-inner'
Config.LiquorOuter4 = 'Liquorstore-door4-outer'
Config.LiquorInner4 = 'Liquorstore-door4-inner'
Config.LiquorOuter5 = 'Liquorstore-door5-outer'
Config.LiquorInner5 = 'Liquorstore-door5-inner'


-- Draw text base configurations

-- Config.Safes = {                                -- There is no need to change these
--     [1] = {vector4(-43.43, -1748.3, 29.42, 52.5), type = "keypad", robbed = false, camId = 4},
--     [2] = {vector4(-1478.94, -375.5, 39.16, 229.5), type = "padlock", robbed = false, camId = 5},
--     [3] = {vector4(-1220.85, -916.05, 11.32, 229.5), type = "padlock", robbed = false, camId = 6},
--     [4] = {vector4(-709.74, -904.15, 19.21, 229.5), type = "keypad", robbed = false, camId = 7},
--     [5] = {vector3(28.21, -1339.14, 29.49), type = "keypad", robbed = false, camId = 8},
--     [6] = {vector3(1126.77, -980.1, 45.41), type = "padlock", robbed = false, camId = 9},
--     [7] = {vector3(1159.46, -314.05, 69.2), type = "keypad", robbed = false, camId = 10},
--     [8] = {vector3(378.17, 333.44, 103.56), type = "keypad", robbed = false, camId = 11},
--     [9] = {vector3(-1829.27, 798.76, 138.19), type = "keypad", robbed = false, camId = 12},
--     [10] = {vector3(-2959.64, 387.08, 14.04), type = "padlock", robbed = false, camId = 13},
--     [11] = {vector3(-3047.88, 585.61, 7.9), type = "keypad", robbed = false, camId = 14},
--     [12] = {vector3(-3250.02, 1004.43, 12.83), type = "keypad", robbed = false, camId = 15},
--     [13] = {vector3(546.41, 2662.8, 42.15), type = "keypad", robbed = false, camId = 16},
--     [14] = {vector3(1169.31, 2717.79, 37.15), type = "padlock", robbed = false, camId = 17},
--     [15] = {vector3(2672.69, 3286.63, 55.24), type = "keypad", robbed = false, camId = 18},
--     [16] = {vector3(1959.26, 3748.92, 32.34), type = "keypad", robbed = false, camId = 19},
--     [17] = {vector3(1734.78, 6420.84, 35.03), type = "keypad", robbed = false, camId = 20},
--     [18] = {vector3(-168.40, 6318.80, 30.58), type = "padlock", robbed = false, camId = 27},
--     [19] = {vector3(168.95, 6644.74, 31.70), type = "keypad", robbed = false, camId = 30},
-- }

-- Config.Registers = {                            -- There is no need to change these
--     [1] = {vector3(-47.24,-1757.65, 29.53), robbed = false, time = 0, safeKey = 1, camId = 4},
--     [2] = {vector3(-48.58,-1759.21, 29.59), robbed = false, time = 0, safeKey = 1, camId = 4},
--     [3] = {vector3(-1486.26,-378.0,  40.16), robbed = false, time = 0, safeKey = 2, camId = 5},
--     [4] = {vector3(-1222.03,-908.32, 12.32), robbed = false, time = 0, safeKey = 3, camId = 6},
--     [5] = {vector3(-706.08, -915.42, 19.21), robbed = false, time = 0, safeKey = 4, camId = 7},
--     [6] = {vector3(-706.16, -913.5, 19.21), robbed = false, time = 0, safeKey = 4, camId = 7},
--     [7] = {vector3( 24.47, -1344.99, 29.49), robbed = false, time = 0, safeKey = 5, camId = 8},
--     [8] = {vector3(24.45, -1347.37, 29.49), robbed = false, time = 0, safeKey = 5, camId = 8},
--     [9] = {vector3(1134.15, -982.53, 46.41), robbed = false, time = 0, safeKey = 6, camId = 9},
--     [10] = {vector3(1165.05, -324.49, 69.2), robbed = false, time = 0, safeKey = 7, camId = 10},
--     [11] = {vector3(1164.7, -322.58, 69.2), robbed = false, time = 0, safeKey = 7, camId = 10},
--     [12] = {vector3(373.14, 328.62, 103.56), robbed = false, time = 0, safeKey = 8, camId = 11},
--     [13] = {vector3(372.57, 326.42, 103.56), robbed = false, time = 0, safeKey = 8, camId = 11},
--     [14] = {vector3(-1818.9, 792.9, 138.08), robbed = false, time = 0, safeKey = 9, camId = 12},
--     [15] = {vector3(-1820.17, 794.28, 138.08), robbed = false, time = 0, safeKey = 9, camId = 12},
--     [16] = {vector3(-2966.46, 390.89, 15.04), robbed = false, time = 0, safeKey = 10, camId = 13},
--     [17] = {vector3(-3041.14, 583.87, 7.9), robbed = false, time = 0, safeKey = 11, camId = 14},
--     [18] = {vector3(-3038.92, 584.5, 7.9), robbed = false, time = 0, safeKey = 11, camId = 14},
--     [19] = {vector3(-3244.56, 1000.14, 12.83), robbed = false, time = 0, safeKey = 12, camId = 15},
--     [20] = {vector3(-3242.24, 999.98, 12.83), robbed = false, time = 0, safeKey = 12, camId = 15},
--     [21] = {vector3(549.42, 2669.06, 42.15), robbed = false, time = 0, safeKey = 13, camId = 16},
--     [22] = {vector3(549.05, 2671.39, 42.15), robbed = false, time = 0, safeKey = 13, camId = 16},
--     [23] = {vector3(1165.9, 2710.81, 38.15), robbed = false, time = 0, safeKey = 14, camId = 17},
--     [24] = {vector3(2676.02, 3280.52, 55.24), robbed = false, time = 0, safeKey = 15, camId = 18},
--     [25] = {vector3(2678.07, 3279.39, 55.24), robbed = false, time = 0, safeKey = 15, camId = 18},
--     [26] = {vector3(1958.96, 3741.98, 32.34), robbed = false, time = 0, safeKey = 16, camId = 19},
--     [27] = {vector3(1960.13, 3740.0, 32.34), robbed = false, time = 0, safeKey = 16, camId = 19},
--     [28] = {vector3(1728.86, 6417.26, 35.03), robbed = false, time = 0, safeKey = 17, camId = 20},
--     [29] = {vector3(1727.85, 6415.14, 35.03), robbed = false, time = 0, safeKey = 17, camId = 20},
--     [30] = {vector3(-161.07, 6321.23, 31.5), robbed = false, time = 0, safeKey = 18, camId = 27},
--     [31] = {vector3(160.52, 6641.74, 31.6), robbed = false, time = 0, safeKey = 19, camId = 28},
--     [32] = {vector3(162.16, 6643.22, 31.6), robbed = false, time = 0, safeKey = 19, camId = 29},
-- }