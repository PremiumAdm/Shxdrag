--[[
    SHXDRAG HUB | AdoptMe Farm
    WindUI Loader
    Credits: Shxdrag
    Farm script: victimoffate_ (Adopt Victims v2)
    UI Library: Footagesus (WindUI)
]]

if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
--  LOAD WIND UI
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
--  FARM SETTINGS (injected into getgenv so the farm script reads them)
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local Settings = {
    Farm = {
        Enabled = false,
        BabyMode = true,
        AutoNeeds = {
            Enabled = true,
            Skip = {},
        },
        KeepPetEquipped = true,
        PreferNeon = true,
        PetOrder = "youngest",
        FarmPetKinds = {},
        BuyEgg = true,
        EggToBuy = "cracked_egg",
        BuyFood = true,
        BuyWater = true,
        AutoPotions = {
            Enabled = true,
            Skip = {},
        },
        AutoNeon = {
            Enabled = false,
            Mega = false,
        },
        CollectCashback = true,
        AutoOpen = {
            Enabled = true,
        },
        AutoAcceptMenu = false,
        AntiAfk = true,
        CameraGuard = true,
        AutoRejoin = false,
        SpotTravel = "teleport",
        GameTravel = true,
        HomeByRespawn = true,
        FoodBowlTrip = false,
        StuckRecovery = {
            Enabled = true,
            Seconds = 240,
        },
        DisableMinutes = 15,
        MaxBuysPerSession = 0,
        MaxEggBuysPerSession = 0,
        Event = {
            GhostGallery = true,
            Hauntlet = false,
            StrayCat = true,
            Crypt = true,
            CryptOpen = { "ladder" },
            PigeonNest = true,
            Quests = true,
            HouseVisits = true,
            PetPen = true,
            PetPenMinutes = 15,
            PetPenSlots = 4,
            PetPenStock = true,
            CandyPets = {
                Enabled = false,
                Pick = {},
            },
        },
    },
    Interface = {
        Enabled = true,
        Keybind = "RightShift",
        Toasts = true,
        RememberSettings = true,
        Theme = "Halloween",
        Descriptions = false,
        StartHidden = false,
        Language = "Auto",
    },
    Logging = {
        ConsoleLevel = "OFF",
        FileEnabled = false,
        SessionFile = false,
    },
    Telemetry = {
        Enabled = false,
        IncludeInventory = false,
    },
    Notifications = {
        Enabled = false,
        Webhooks = {
            Summary = "",
            Alerts = "",
        },
        SummaryIntervalMinutes = 30,
        SendOnTaskComplete = false,
        SendOnError = true,
        SendOnKick = true,
        SendOnStartStop = true,
        SendTestMessageOnStart = false,
        PingDiscordUserId = "",
        PingOn = {
            Kick = true,
            Error = true,
            Summary = true,
            TaskCompleted = true,
            SessionStopped = true,
            PreviousSession = true,
        },
        IncludeUsername = true,
    },
}

getgenv().AdoptMeFarmSettings = Settings

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
--  ANTI-TELEPORT HOOK
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local TeleportService = game:GetService("TeleportService")
local hasHook = type(hookmetamethod) == "function"
local _index, _namecall

if hasHook then
    _index = hookmetamethod(game, "__index", function(obj, key)
        if obj == TeleportService then
            local k = tostring(key):lower()
            if k == "teleport" or tostring(key) == "TeleportToPlaceInstance" then
                error("Expected ':' not '.' calling member function " .. tostring(key), 2)
            end
        end
        return _index(obj, key)
    end)
    _namecall = hookmetamethod(game, "__namecall", function(obj, ...)
        local method = tostring(getnamecallmethod()):lower()
        if obj == TeleportService and (method == "teleport" or getnamecallmethod() == "TeleportToPlaceInstance") then
            return
        end
        return _namecall(obj, ...)
    end)
else
    WindUI:Notify({
        Title = "SHXDRAG HUB",
        Content = "Weak executor detected â€” anti-teleport disabled.",
        Duration = 8,
        Icon = "geist:alert-triangle",
    })
end

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
--  STATE
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local FarmAPI = nil
local farmRunning = false

local FARM_URL = "https://raw.githubusercontent.com/PremiumAdm/Shxdrag/refs/heads/main/AdoptMeFarm_public.lua.txt"

local function startFarm()
    if farmRunning then
        WindUI:Notify({ Title = "SHXDRAG HUB", Content = "Farm is already running!", Duration = 3, Icon = "geist:info" })
        return
    end
    WindUI:Notify({ Title = "SHXDRAG HUB", Content = "Downloading farm script...", Duration = 4, Icon = "geist:loader" })
    task.spawn(function()
        local ok, source = pcall(function()
            return game:HttpGet(FARM_URL .. "?nocache=" .. tostring(os.time()))
        end)
        if not ok or type(source) ~= "string" or #source < 5000 then
            WindUI:Notify({ Title = "Farm Error", Content = "Download failed. Check executor HTTP.", Duration = 8, Icon = "geist:x-circle" })
            return
        end
        local program, err = loadstring(source)
        if not program then
            WindUI:Notify({ Title = "Farm Error", Content = "Compile error: " .. tostring(err), Duration = 8, Icon = "geist:x-circle" })
            return
        end
        local runOk, apiOrErr = pcall(program)
        if runOk and type(apiOrErr) == "table" and apiOrErr.Stop then
            FarmAPI = apiOrErr
        end
        farmRunning = true
        WindUI:Notify({ Title = "SHXDRAG HUB", Content = "Farm started!", Duration = 5, Icon = "geist:check-circle" })
    end)
end

local function stopFarm()
    if not farmRunning then
        WindUI:Notify({ Title = "SHXDRAG HUB", Content = "Farm is not running.", Duration = 3, Icon = "geist:info" })
        return
    end
    if FarmAPI and FarmAPI.Stop then
        FarmAPI.Stop("STOP ALL FARM")
    end
    FarmAPI = nil
    farmRunning = false
    WindUI:Notify({ Title = "SHXDRAG HUB", Content = "Farm stopped.", Duration = 3, Icon = "geist:square" })
end

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
--  CREATE WINDOW
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local Window = WindUI:CreateWindow({
    Title = "SHXDRAG HUB",
    Icon = "geist:paw-print",
    Author = "by Shxdrag",
    Folder = "ShxdragHub",
    KeySystem = false,
    ThemeSystem = false,
})

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
--  TABS
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local TabMain     = Window:Tab({ Title = "Main",      Icon = "geist:home" })
local TabFarm     = Window:Tab({ Title = "Farm",      Icon = "geist:leaf" })
local TabNeeds    = Window:Tab({ Title = "Needs",     Icon = "geist:list-checks" })
local TabEvent    = Window:Tab({ Title = "Halloween", Icon = "geist:ghost" })
local TabPetPen   = Window:Tab({ Title = "Pet Pen",   Icon = "geist:fence" })
local TabWebhook  = Window:Tab({ Title = "Webhook",   Icon = "geist:bell" })
local TabInfo     = Window:Tab({ Title = "Info",      Icon = "geist:info" })

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
--  MAIN TAB
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
TabMain:Section({ Title = "Farm Control" })

TabMain:Button({
    Title = "Start Farm",
    Desc = "Downloads and starts the AdoptMe Farm script",
    Icon = "geist:play",
    Callback = startFarm,
})

TabMain:Button({
    Title = "Stop Farm",
    Desc = "Stops the currently running farm",
    Icon = "geist:square",
    Callback = stopFarm,
})

TabMain:Section({ Title = "Utilities" })

TabMain:Button({
    Title = "Anti-AFK",
    Desc = "Prevents idle kick (one-time enable)",
    Icon = "geist:coffee",
    Callback = function()
        if getgenv().ShxdragAntiAFK then
            WindUI:Notify({ Title = "Anti-AFK", Content = "Already enabled!", Duration = 3, Icon = "geist:info" })
            return
        end
        local VirtualUser = game:GetService("VirtualUser")
        local Players = game:GetService("Players")
        local lp = Players.LocalPlayer
        if getconnections then
            for _, c in pairs(getconnections(lp.Idled)) do
                if c.Disable then c:Disable() elseif c.Disconnect then c:Disconnect() end
            end
        else
            lp.Idled:Connect(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        end
        getgenv().ShxdragAntiAFK = true
        WindUI:Notify({ Title = "Anti-AFK", Content = "Enabled! You won't be kicked for idling.", Duration = 4, Icon = "geist:coffee" })
    end,
})

TabMain:Section({ Title = "Credits" })

TabMain:Toggle({
    Title = "SHXDRAG HUB",
    Desc = "UI by Shxdrag  â€¢  Farm by victimoffate_  â€¢  WindUI by Footagesus",
    Value = false,
    Locked = true,
})

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
--  FARM TAB
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
TabFarm:Section({ Title = "Core" })

TabFarm:Toggle({
    Title = "Farm Enabled",
    Desc = "Master switch â€” turn this on for any pet tasks to run",
    Value = Settings.Farm.Enabled,
    Callback = function(v) Settings.Farm.Enabled = v end,
})

TabFarm:Toggle({
    Title = "Baby Mode",
    Desc = "Joins the Babies team so baby pet needs can be done",
    Value = Settings.Farm.BabyMode,
    Callback = function(v) Settings.Farm.BabyMode = v end,
})

TabFarm:Toggle({
    Title = "Keep Pet Equipped",
    Desc = "Re-equips a growing pet if one gets unequipped",
    Value = Settings.Farm.KeepPetEquipped,
    Callback = function(v) Settings.Farm.KeepPetEquipped = v end,
})

TabFarm:Toggle({
    Title = "Prefer Neon Pets",
    Desc = "Farms neon pets before others",
    Value = Settings.Farm.PreferNeon,
    Callback = function(v) Settings.Farm.PreferNeon = v end,
})

TabFarm:Toggle({
    Title = "Buy Food",
    Desc = "Buys food when hungry with nothing in backpack",
    Value = Settings.Farm.BuyFood,
    Callback = function(v) Settings.Farm.BuyFood = v end,
})

TabFarm:Toggle({
    Title = "Buy Water",
    Desc = "Buys water when thirsty with nothing in backpack",
    Value = Settings.Farm.BuyWater,
    Callback = function(v) Settings.Farm.BuyWater = v end,
})

TabFarm:Toggle({
    Title = "Collect Cashback",
    Desc = "Collects cashback Bucks on a timer while farming",
    Value = Settings.Farm.CollectCashback,
    Callback = function(v) Settings.Farm.CollectCashback = v end,
})

TabFarm:Toggle({
    Title = "Auto Accept Menu",
    Desc = "Clicks Play on the main menu automatically",
    Value = Settings.Farm.AutoAcceptMenu,
    Callback = function(v) Settings.Farm.AutoAcceptMenu = v end,
})

TabFarm:Toggle({
    Title = "Anti-AFK (Farm)",
    Desc = "Prevents idle kick while farm is running",
    Value = Settings.Farm.AntiAfk,
    Callback = function(v) Settings.Farm.AntiAfk = v end,
})

TabFarm:Section({ Title = "Eggs" })

TabFarm:Toggle({
    Title = "Buy Egg",
    Desc = "Buys an egg when no growing pet is left",
    Value = Settings.Farm.BuyEgg,
    Callback = function(v) Settings.Farm.BuyEgg = v end,
})

TabFarm:Dropdown({
    Title = "Egg to Buy",
    Desc = "Which egg to buy when none are left",
    Values = { "cracked_egg", "pet_egg", "fairytale_egg_2026_fairytale_egg" },
    Value = Settings.Farm.EggToBuy,
    Callback = function(v) Settings.Farm.EggToBuy = v end,
})

TabFarm:Slider({
    Title = "Max Egg Buys Per Session",
    Desc = "0 = no limit",
    Value = { Default = Settings.Farm.MaxEggBuysPerSession, Min = 0, Max = 50 },
    Step = 1,
    Callback = function(v) Settings.Farm.MaxEggBuysPerSession = v end,
})

TabFarm:Section({ Title = "Potions & Neon" })

TabFarm:Toggle({
    Title = "Auto Age Potions",
    Desc = "Uses age potions from backpack on the growing pet",
    Value = Settings.Farm.AutoPotions.Enabled,
    Callback = function(v) Settings.Farm.AutoPotions.Enabled = v end,
})

TabFarm:Toggle({
    Title = "Auto Neon",
    Desc = "Fuses 4 full grown pets of one kind into a neon",
    Value = Settings.Farm.AutoNeon.Enabled,
    Callback = function(v) Settings.Farm.AutoNeon.Enabled = v end,
})

TabFarm:Toggle({
    Title = "Auto Mega Neon",
    Desc = "Fuses 4 neon pets into a mega neon",
    Value = Settings.Farm.AutoNeon.Mega,
    Callback = function(v) Settings.Farm.AutoNeon.Mega = v end,
})

TabFarm:Section({ Title = "Auto Open" })

TabFarm:Toggle({
    Title = "Auto Open Gifts & Chests",
    Desc = "Opens gifts and chests sitting in your backpack",
    Value = Settings.Farm.AutoOpen.Enabled,
    Callback = function(v) Settings.Farm.AutoOpen.Enabled = v end,
})

TabFarm:Section({ Title = "Travel & Recovery" })

TabFarm:Toggle({
    Title = "Fast Travel",
    Desc = "Teleports directly to task locations",
    Value = Settings.Farm.GameTravel,
    Callback = function(v) Settings.Farm.GameTravel = v end,
})

TabFarm:Toggle({
    Title = "Home By Respawn",
    Desc = "Goes home by respawning â€” much faster than walking",
    Value = Settings.Farm.HomeByRespawn,
    Callback = function(v) Settings.Farm.HomeByRespawn = v end,
})

TabFarm:Toggle({
    Title = "Stuck Recovery",
    Desc = "Respawns home if stuck and tasks keep failing",
    Value = Settings.Farm.StuckRecovery.Enabled,
    Callback = function(v) Settings.Farm.StuckRecovery.Enabled = v end,
})

TabFarm:Slider({
    Title = "Stuck Recovery Seconds",
    Desc = "How long before it counts as stuck",
    Value = { Default = Settings.Farm.StuckRecovery.Seconds, Min = 60, Max = 600 },
    Step = 10,
    Callback = function(v) Settings.Farm.StuckRecovery.Seconds = v end,
})

TabFarm:Toggle({
    Title = "Auto Rejoin",
    Desc = "Rejoins a public server if no place or character",
    Value = Settings.Farm.AutoRejoin,
    Callback = function(v) Settings.Farm.AutoRejoin = v end,
})

TabFarm:Slider({
    Title = "Disable Minutes After Failures",
    Desc = "Rests this many minutes after 3 fails in a row (0 = whole session)",
    Value = { Default = Settings.Farm.DisableMinutes, Min = 0, Max = 120 },
    Step = 5,
    Callback = function(v) Settings.Farm.DisableMinutes = v end,
})

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
--  NEEDS TAB
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
TabNeeds:Section({ Title = "Auto Needs" })

TabNeeds:Toggle({
    Title = "Auto Needs Enabled",
    Desc = "Does every pet need automatically",
    Value = Settings.Farm.AutoNeeds.Enabled,
    Callback = function(v) Settings.Farm.AutoNeeds.Enabled = v end,
})

TabNeeds:Section({ Title = "Individual Needs" })

local needsList = {
    { key = "pet_me",      label = "Pet Me" },
    { key = "salon",       label = "Salon" },
    { key = "bored",       label = "Bored (Playground)" },
    { key = "cat_cafe",    label = "Cat Cafe" },
    { key = "sleepy",      label = "Sleepy" },
    { key = "dirty",       label = "Dirty (Bath)" },
    { key = "toilet",      label = "Toilet" },
    { key = "hungry",      label = "Hungry" },
    { key = "thirsty",     label = "Thirsty" },
    { key = "play",        label = "Play" },
    { key = "pizza_party", label = "Pizza Party" },
    { key = "school",      label = "School" },
    { key = "sick",        label = "Sick (Doctor)" },
    { key = "camping",     label = "Camping" },
    { key = "beach_party", label = "Beach Party" },
    { key = "mystery",     label = "Mystery" },
    { key = "walk",        label = "Walk" },
    { key = "ride",        label = "Ride (Stroller)" },
}

-- Build skip set from Settings for toggle state
local skipSet = {}
if type(Settings.Farm.AutoNeeds.Skip) == "table" then
    for _, v in ipairs(Settings.Farm.AutoNeeds.Skip) do
        skipSet[v] = true
    end
end

local function updateSkip()
    local skip = {}
    for k, v in pairs(skipSet) do
        if v then table.insert(skip, k) end
    end
    Settings.Farm.AutoNeeds.Skip = skip
end

for _, need in ipairs(needsList) do
    TabNeeds:Toggle({
        Title = need.label,
        Desc = "Enable " .. need.label .. " need",
        Value = not skipSet[need.key],
        Callback = function(v)
            skipSet[need.key] = not v
            updateSkip()
        end,
    })
end

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
--  HALLOWEEN TAB
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
TabEvent:Section({ Title = "Halloween 2026" })

TabEvent:Toggle({
    Title = "Ghost Gallery",
    Desc = "Joins every round and vacuums ghosts (Rusty Keys + candy)",
    Value = Settings.Farm.Event.GhostGallery,
    Callback = function(v) Settings.Farm.Event.GhostGallery = v end,
})

TabEvent:Toggle({
    Title = "Auto Hauntlet",
    Desc = "Joins Hauntlet runs and picks safer doors",
    Value = Settings.Farm.Event.Hauntlet,
    Callback = function(v) Settings.Farm.Event.Hauntlet = v end,
})

TabEvent:Toggle({
    Title = "Crypt (Rusty Keys)",
    Desc = "Uses Rusty Keys on the grave leading down",
    Value = Settings.Farm.Event.Crypt,
    Callback = function(v) Settings.Farm.Event.Crypt = v end,
})

TabEvent:Toggle({
    Title = "Pigeon Nest (Twigs)",
    Desc = "Puts Crypt Twigs into the Hotel nest",
    Value = Settings.Farm.Event.PigeonNest,
    Callback = function(v) Settings.Farm.Event.PigeonNest = v end,
})

TabEvent:Toggle({
    Title = "Stray Cat",
    Desc = "Gives 1 water to the Stray Cat once a day (+50 candy)",
    Value = Settings.Farm.Event.StrayCat,
    Callback = function(v) Settings.Farm.Event.StrayCat = v end,
})

TabEvent:Toggle({
    Title = "Daily Quests",
    Desc = "Claims finished daily quests and Halloween board reward",
    Value = Settings.Farm.Event.Quests,
    Callback = function(v) Settings.Farm.Event.Quests = v end,
})

TabEvent:Toggle({
    Title = "House Visits",
    Desc = "Visits player homes for the Visit Homes quests",
    Value = Settings.Farm.Event.HouseVisits,
    Callback = function(v) Settings.Farm.Event.HouseVisits = v end,
})

TabEvent:Section({ Title = "Candy Pets" })

TabEvent:Toggle({
    Title = "Candy Pets",
    Desc = "Saves candy to buy specific pets from the candy shop",
    Value = Settings.Farm.Event.CandyPets.Enabled,
    Callback = function(v) Settings.Farm.Event.CandyPets.Enabled = v end,
})

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
--  PET PEN TAB
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
TabPetPen:Section({ Title = "Pet Pen" })

TabPetPen:Toggle({
    Title = "Auto Pet Pen",
    Desc = "Claims the Pet Pen and keeps it full of growing pets",
    Value = Settings.Farm.Event.PetPen,
    Callback = function(v) Settings.Farm.Event.PetPen = v end,
})

TabPetPen:Toggle({
    Title = "Auto Stock Pen",
    Desc = "Buys eggs to keep the pen full (needs Buy Egg ON)",
    Value = Settings.Farm.Event.PetPenStock,
    Callback = function(v) Settings.Farm.Event.PetPenStock = v end,
})

TabPetPen:Slider({
    Title = "Claim Every (Minutes)",
    Desc = "How often the Pet Pen is claimed",
    Value = { Default = Settings.Farm.Event.PetPenMinutes, Min = 1, Max = 60 },
    Step = 1,
    Callback = function(v) Settings.Farm.Event.PetPenMinutes = v end,
})

TabPetPen:Slider({
    Title = "Pen Slots",
    Desc = "4 free slots; 5 if you own the extra-slot gamepass",
    Value = { Default = Settings.Farm.Event.PetPenSlots, Min = 1, Max = 5 },
    Step = 1,
    Callback = function(v) Settings.Farm.Event.PetPenSlots = v end,
})

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
--  WEBHOOK TAB
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
TabWebhook:Section({ Title = "Discord Notifications" })

TabWebhook:Toggle({
    Title = "Notifications Enabled",
    Desc = "Sends Discord webhook messages for farm events",
    Value = Settings.Notifications.Enabled,
    Callback = function(v) Settings.Notifications.Enabled = v end,
})

TabWebhook:Input({
    Title = "Summary Webhook URL",
    Desc = "Discord webhook for periodic summaries",
    Value = Settings.Notifications.Webhooks.Summary,
    Placeholder = "https://discord.com/api/webhooks/...",
    Callback = function(v) Settings.Notifications.Webhooks.Summary = v end,
})

TabWebhook:Input({
    Title = "Alerts Webhook URL",
    Desc = "Discord webhook for errors and kicks",
    Value = Settings.Notifications.Webhooks.Alerts,
    Placeholder = "https://discord.com/api/webhooks/...",
    Callback = function(v) Settings.Notifications.Webhooks.Alerts = v end,
})

TabWebhook:Input({
    Title = "Discord User ID (for pings)",
    Desc = "Your Discord user ID (digits only)",
    Value = Settings.Notifications.PingDiscordUserId,
    Placeholder = "123456789012345678",
    Callback = function(v) Settings.Notifications.PingDiscordUserId = v end,
})

TabWebhook:Slider({
    Title = "Summary Interval (Minutes)",
    Desc = "How often a summary is sent (0 = off)",
    Value = { Default = Settings.Notifications.SummaryIntervalMinutes, Min = 0, Max = 120 },
    Step = 5,
    Callback = function(v) Settings.Notifications.SummaryIntervalMinutes = v end,
})

TabWebhook:Section({ Title = "Events to Send" })

TabWebhook:Toggle({
    Title = "Send on Start / Stop",
    Value = Settings.Notifications.SendOnStartStop,
    Callback = function(v) Settings.Notifications.SendOnStartStop = v end,
})

TabWebhook:Toggle({
    Title = "Send on Error",
    Value = Settings.Notifications.SendOnError,
    Callback = function(v) Settings.Notifications.SendOnError = v end,
})

TabWebhook:Toggle({
    Title = "Send on Kick",
    Value = Settings.Notifications.SendOnKick,
    Callback = function(v) Settings.Notifications.SendOnKick = v end,
})

TabWebhook:Toggle({
    Title = "Send on Task Complete",
    Desc = "One message per finished need â€” sends a lot",
    Value = Settings.Notifications.SendOnTaskComplete,
    Callback = function(v) Settings.Notifications.SendOnTaskComplete = v end,
})

TabWebhook:Toggle({
    Title = "Include Username",
    Desc = "Includes your Roblox username in messages",
    Value = Settings.Notifications.IncludeUsername,
    Callback = function(v) Settings.Notifications.IncludeUsername = v end,
})

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
--  INFO TAB
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
TabInfo:Section({ Title = "About" })

TabInfo:Paragraph({
    Title = "SHXDRAG HUB",
    Desc = "AdoptMe Farm loader with WindUI interface.\nCredits: Shxdrag (hub)  â€¢  victimoffate_ (farm)  â€¢  Footagesus (WindUI)",
})

TabInfo:Section({ Title = "How to Use" })

TabInfo:Paragraph({
    Title = "Instructions",
    Desc = "1. Configure your settings in the Farm, Needs, Halloween, and Pet Pen tabs.\n2. Press Start Farm in the Main tab.\n3. The farm script will download and run using your settings.\n4. Press Stop Farm to stop at any time.",
})

TabInfo:Section({ Title = "Safety" })

TabInfo:Paragraph({
    Title = "Telemetry",
    Desc = "Telemetry is DISABLED in this loader. No inventory data is sent to the farm developer.",
})

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
--  READY
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
WindUI:Notify({
    Title = "SHXDRAG HUB",
    Content = "Loaded! Configure settings then press Start Farm.",
    Duration = 6,
    Icon = "geist:check-circle",
})
