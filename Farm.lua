--[[
    SHXDRAG HUB | AdoptMe Farm
    WindUI Loader â€” run this file ONLY
    Credits: Shxdrag (hub) | victimoffate_ (farm) | Footagesus (WindUI)

    HOW TO USE:
    1. Execute this file in your executor
    2. Configure all settings in the WindUI window
    3. Press "Start Farm" â€” the farm runs headlessly
    4. WindUI stays open so you can change settings live
]]

if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
--  LOAD WIND UI
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local WindUI = loadstring(game:HttpGet(
    "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"
))()

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
--  SETTINGS  (injected into getgenv so the farm reads them)
--  Interface.Enabled = false  â†’  farm runs headlessly, no Starlight window
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
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
        AutoAcceptMenu = true,
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
        Enabled = false,  -- IMPORTANT: keeps the Starlight window closed
        Toasts = false,
        RememberSettings = false,
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
            Alerts  = "",
        },
        SummaryIntervalMinutes  = 30,
        SendOnTaskComplete      = false,
        SendOnError             = true,
        SendOnKick              = true,
        SendOnStartStop         = true,
        SendTestMessageOnStart  = false,
        PingDiscordUserId       = "",
        PingOn = {
            Kick            = true,
            Error           = true,
            Summary         = true,
            TaskCompleted   = true,
            SessionStopped  = true,
            PreviousSession = true,
        },
        IncludeUsername = true,
    },
}

getgenv().AdoptMeFarmSettings = Settings
getgenv().AdoptMeFarmLoaderInfo = {
    Url = "https://raw.githubusercontent.com/PremiumAdm/Shxdrag/refs/heads/main/AdoptMeFarm_public.lua.txt"
}

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
--  ANTI-TELEPORT HOOK
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local TeleportService = game:GetService("TeleportService")
local _idx, _nc

if type(hookmetamethod) == "function" then
    _idx = hookmetamethod(game, "__index", function(obj, key)
        if obj == TeleportService then
            local k = tostring(key):lower()
            if k == "teleport" or tostring(key) == "TeleportToPlaceInstance" then
                error("Expected ':' not '.' calling member function " .. tostring(key), 2)
            end
        end
        return _idx(obj, key)
    end)
    _nc = hookmetamethod(game, "__namecall", function(obj, ...)
        local m = tostring(getnamecallmethod()):lower()
        if obj == TeleportService and (m == "teleport" or getnamecallmethod() == "TeleportToPlaceInstance") then
            return
        end
        return _nc(obj, ...)
    end)
else
    WindUI:Notify({
        Title   = "SHXDRAG HUB",
        Content = "Weak executor â€” anti-teleport disabled.",
        Duration = 6,
        Icon    = "geist:alert-triangle",
    })
end

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
--  STATE
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local FarmAPI     = nil
local farmRunning = false

local FARM_URL = "https://raw.githubusercontent.com/PremiumAdm/Shxdrag/refs/heads/main/AdoptMeFarm_public.lua.txt"

local function notify(title, content, icon)
    WindUI:Notify({ Title = title, Content = content, Duration = 5, Icon = "geist:" .. icon })
end

local function startFarm()
    if farmRunning then
        notify("SHXDRAG HUB", "Farm is already running!", "info")
        return
    end
    notify("SHXDRAG HUB", "Starting farm...", "loader")
    task.spawn(function()
        -- Sync latest settings into getgenv before farm reads them
        getgenv().AdoptMeFarmSettings = Settings

        local ok, source = pcall(function()
            return game:HttpGet(FARM_URL .. "?nocache=" .. tostring(os.time()))
        end)
        if not ok or type(source) ~= "string" or #source < 5000 then
            notify("Farm Error", "Download failed. Check executor HTTP.", "x-circle")
            return
        end
        local prog, err = loadstring(source)
        if not prog then
            notify("Farm Error", "Compile error: " .. tostring(err), "x-circle")
            return
        end
        local runOk, result = pcall(prog)
        if runOk and type(result) == "table" and result.Stop then
            FarmAPI = result
        end
        farmRunning = true
        notify("SHXDRAG HUB", "Farm is running!", "check-circle")
    end)
end

local function stopFarm()
    if not farmRunning then
        notify("SHXDRAG HUB", "Farm is not running.", "info")
        return
    end
    if FarmAPI and FarmAPI.Stop then
        pcall(FarmAPI.Stop, "STOP ALL FARM")
    end
    FarmAPI     = nil
    farmRunning = false
    notify("SHXDRAG HUB", "Farm stopped.", "square")
end

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
--  WINDOW
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local Window = WindUI:CreateWindow({
    Title    = "SHXDRAG HUB",
    Icon     = "geist:paw-print",
    Author   = "by Shxdrag",
    Folder   = "ShxdragHub",
    KeySystem = false,
    ThemeSystem = false,
})

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
--  TABS
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local TabMain    = Window:Tab({ Title = "Main",      Icon = "geist:home" })
local TabFarm    = Window:Tab({ Title = "Farm",      Icon = "geist:leaf" })
local TabNeeds   = Window:Tab({ Title = "Needs",     Icon = "geist:list-checks" })
local TabEvent   = Window:Tab({ Title = "Halloween", Icon = "geist:ghost" })
local TabPetPen  = Window:Tab({ Title = "Pet Pen",   Icon = "geist:fence" })
local TabWebhook = Window:Tab({ Title = "Webhook",   Icon = "geist:bell" })
local TabInfo    = Window:Tab({ Title = "Info",      Icon = "geist:info" })

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  MAIN TAB
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
TabMain:Section({ Title = "Farm Control" })

TabMain:Button({
    Title    = "â–¶  Start Farm",
    Desc     = "Downloads and starts the AdoptMe Farm script with your settings",
    Icon     = "geist:play",
    Callback = startFarm,
})

TabMain:Button({
    Title    = "â–   Stop Farm",
    Desc     = "Stops the currently running farm",
    Icon     = "geist:square",
    Callback = stopFarm,
})

TabMain:Section({ Title = "Utilities" })

TabMain:Button({
    Title    = "Anti-AFK",
    Desc     = "Prevents idle kick (one-time, permanent for this session)",
    Icon     = "geist:coffee",
    Callback = function()
        if getgenv().ShxdragAntiAFK then
            notify("Anti-AFK", "Already enabled!", "info")
            return
        end
        local VU = game:GetService("VirtualUser")
        local LP = game:GetService("Players").LocalPlayer
        if type(getconnections) == "function" then
            for _, c in pairs(getconnections(LP.Idled)) do
                if c.Disable then c:Disable() elseif c.Disconnect then c:Disconnect() end
            end
        else
            LP.Idled:Connect(function()
                VU:CaptureController()
                VU:ClickButton2(Vector2.new())
            end)
        end
        getgenv().ShxdragAntiAFK = true
        notify("Anti-AFK", "Enabled! You won't be kicked for idling.", "coffee")
    end,
})

TabMain:Section({ Title = "Credits" })

TabMain:Paragraph({
    Title = "SHXDRAG HUB",
    Desc  = "Hub by Shxdrag\nFarm by victimoffate_\nUI Library by Footagesus (WindUI)",
})

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  FARM TAB
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
TabFarm:Section({ Title = "Core" })

TabFarm:Toggle({
    Title    = "Farm Enabled",
    Desc     = "Master switch â€” must be ON for any pet tasks to run",
    Value    = Settings.Farm.Enabled,
    Callback = function(v) Settings.Farm.Enabled = v end,
})

TabFarm:Toggle({
    Title    = "Baby Mode",
    Desc     = "Joins the Babies team so baby pet needs can be done",
    Value    = Settings.Farm.BabyMode,
    Callback = function(v) Settings.Farm.BabyMode = v end,
})

TabFarm:Toggle({
    Title    = "Keep Pet Equipped",
    Desc     = "Re-equips a growing pet if it gets unequipped",
    Value    = Settings.Farm.KeepPetEquipped,
    Callback = function(v) Settings.Farm.KeepPetEquipped = v end,
})

TabFarm:Toggle({
    Title    = "Prefer Neon Pets",
    Desc     = "Farms neon pets before regular ones",
    Value    = Settings.Farm.PreferNeon,
    Callback = function(v) Settings.Farm.PreferNeon = v end,
})

TabFarm:Toggle({
    Title    = "Buy Food",
    Desc     = "Buys food when hungry with nothing in backpack",
    Value    = Settings.Farm.BuyFood,
    Callback = function(v) Settings.Farm.BuyFood = v end,
})

TabFarm:Toggle({
    Title    = "Buy Water",
    Desc     = "Buys water when thirsty with nothing in backpack",
    Value    = Settings.Farm.BuyWater,
    Callback = function(v) Settings.Farm.BuyWater = v end,
})

TabFarm:Toggle({
    Title    = "Collect Cashback",
    Desc     = "Collects cashback Bucks on a timer while farming",
    Value    = Settings.Farm.CollectCashback,
    Callback = function(v) Settings.Farm.CollectCashback = v end,
})

TabFarm:Toggle({
    Title    = "Auto Accept Menu",
    Desc     = "Clicks Play on the main menu automatically",
    Value    = Settings.Farm.AutoAcceptMenu,
    Callback = function(v) Settings.Farm.AutoAcceptMenu = v end,
})

TabFarm:Toggle({
    Title    = "Anti-AFK (Farm)",
    Desc     = "Prevents idle kick while the farm is running",
    Value    = Settings.Farm.AntiAfk,
    Callback = function(v) Settings.Farm.AntiAfk = v end,
})

TabFarm:Toggle({
    Title    = "Camera Guard",
    Desc     = "Prevents the camera from rotating during farming",
    Value    = Settings.Farm.CameraGuard,
    Callback = function(v) Settings.Farm.CameraGuard = v end,
})

TabFarm:Section({ Title = "Eggs" })

TabFarm:Toggle({
    Title    = "Buy Egg",
    Desc     = "Buys an egg when no growing pet is left",
    Value    = Settings.Farm.BuyEgg,
    Callback = function(v) Settings.Farm.BuyEgg = v end,
})

TabFarm:Dropdown({
    Title    = "Egg to Buy",
    Desc     = "Which egg to buy when you have no growing pets",
    Values   = { "cracked_egg", "pet_egg", "fairytale_egg_2026_fairytale_egg" },
    Value    = Settings.Farm.EggToBuy,
    Callback = function(v) Settings.Farm.EggToBuy = v end,
})

TabFarm:Slider({
    Title    = "Max Egg Buys Per Session",
    Desc     = "0 = unlimited",
    Value    = { Default = Settings.Farm.MaxEggBuysPerSession, Min = 0, Max = 50 },
    Step     = 1,
    Callback = function(v) Settings.Farm.MaxEggBuysPerSession = v end,
})

TabFarm:Slider({
    Title    = "Max Food/Water Buys Per Session",
    Desc     = "0 = unlimited",
    Value    = { Default = Settings.Farm.MaxBuysPerSession, Min = 0, Max = 50 },
    Step     = 1,
    Callback = function(v) Settings.Farm.MaxBuysPerSession = v end,
})

TabFarm:Section({ Title = "Potions & Neon" })

TabFarm:Toggle({
    Title    = "Auto Age Potions",
    Desc     = "Uses age potions from backpack on the growing pet",
    Value    = Settings.Farm.AutoPotions.Enabled,
    Callback = function(v) Settings.Farm.AutoPotions.Enabled = v end,
})

TabFarm:Toggle({
    Title    = "Auto Neon",
    Desc     = "Fuses 4 full grown pets of one kind into a neon",
    Value    = Settings.Farm.AutoNeon.Enabled,
    Callback = function(v) Settings.Farm.AutoNeon.Enabled = v end,
})

TabFarm:Toggle({
    Title    = "Auto Mega Neon",
    Desc     = "Fuses 4 neons of one kind into a mega neon",
    Value    = Settings.Farm.AutoNeon.Mega,
    Callback = function(v) Settings.Farm.AutoNeon.Mega = v end,
})

TabFarm:Section({ Title = "Auto Open" })

TabFarm:Toggle({
    Title    = "Auto Open Gifts & Chests",
    Desc     = "Opens gifts and chests sitting in your backpack",
    Value    = Settings.Farm.AutoOpen.Enabled,
    Callback = function(v) Settings.Farm.AutoOpen.Enabled = v end,
})

TabFarm:Section({ Title = "Travel & Recovery" })

TabFarm:Toggle({
    Title    = "Game Travel",
    Desc     = "Uses the game's own travel system to reach locations",
    Value    = Settings.Farm.GameTravel,
    Callback = function(v) Settings.Farm.GameTravel = v end,
})

TabFarm:Toggle({
    Title    = "Home By Respawn",
    Desc     = "Goes home by respawning â€” much faster than walking",
    Value    = Settings.Farm.HomeByRespawn,
    Callback = function(v) Settings.Farm.HomeByRespawn = v end,
})

TabFarm:Toggle({
    Title    = "Food Bowl Trip",
    Desc     = "Goes home for the free food bowl even if you have food",
    Value    = Settings.Farm.FoodBowlTrip,
    Callback = function(v) Settings.Farm.FoodBowlTrip = v end,
})

TabFarm:Toggle({
    Title    = "Stuck Recovery",
    Desc     = "Respawns home if stuck and tasks keep failing",
    Value    = Settings.Farm.StuckRecovery.Enabled,
    Callback = function(v) Settings.Farm.StuckRecovery.Enabled = v end,
})

TabFarm:Slider({
    Title    = "Stuck Recovery Seconds",
    Desc     = "How long before the farm counts as stuck",
    Value    = { Default = Settings.Farm.StuckRecovery.Seconds, Min = 60, Max = 600 },
    Step     = 10,
    Callback = function(v) Settings.Farm.StuckRecovery.Seconds = v end,
})

TabFarm:Toggle({
    Title    = "Auto Rejoin",
    Desc     = "Rejoins a public server if no place or character is found",
    Value    = Settings.Farm.AutoRejoin,
    Callback = function(v) Settings.Farm.AutoRejoin = v end,
})

TabFarm:Slider({
    Title    = "Disable Minutes After Failures",
    Desc     = "Rests this many minutes after 3 fails in a row (0 = whole session)",
    Value    = { Default = Settings.Farm.DisableMinutes, Min = 0, Max = 120 },
    Step     = 5,
    Callback = function(v) Settings.Farm.DisableMinutes = v end,
})

TabFarm:Dropdown({
    Title    = "Spot Travel Method",
    Desc     = "How to reach camping / beach / playground",
    Values   = { "teleport", "door" },
    Value    = Settings.Farm.SpotTravel,
    Callback = function(v) Settings.Farm.SpotTravel = v end,
})

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  NEEDS TAB
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
TabNeeds:Section({ Title = "Auto Needs" })

TabNeeds:Toggle({
    Title    = "Auto Needs Enabled",
    Desc     = "Automatically does every pet need",
    Value    = Settings.Farm.AutoNeeds.Enabled,
    Callback = function(v) Settings.Farm.AutoNeeds.Enabled = v end,
})

TabNeeds:Section({ Title = "Skip Individual Needs" })

TabNeeds:Paragraph({
    Title = "Info",
    Desc  = "Toggle OFF any need you want the farm to SKIP.",
})

local NEEDS = {
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

local skipSet = {}
if type(Settings.Farm.AutoNeeds.Skip) == "table" then
    for _, v in ipairs(Settings.Farm.AutoNeeds.Skip) do
        skipSet[v] = true
    end
end

local function syncSkip()
    local skip = {}
    for k, v in pairs(skipSet) do
        if v then table.insert(skip, k) end
    end
    Settings.Farm.AutoNeeds.Skip = skip
end

for _, need in ipairs(NEEDS) do
    TabNeeds:Toggle({
        Title    = need.label,
        Value    = not skipSet[need.key],
        Callback = function(v)
            skipSet[need.key] = not v
            syncSkip()
        end,
    })
end

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  HALLOWEEN TAB
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
TabEvent:Section({ Title = "Halloween 2026" })

TabEvent:Toggle({
    Title    = "Ghost Gallery",
    Desc     = "Joins every round and vacuums ghosts for Rusty Keys and candy",
    Value    = Settings.Farm.Event.GhostGallery,
    Callback = function(v) Settings.Farm.Event.GhostGallery = v end,
})

TabEvent:Toggle({
    Title    = "Auto Hauntlet",
    Desc     = "Joins Hauntlet runs and picks safer doors",
    Value    = Settings.Farm.Event.Hauntlet,
    Callback = function(v) Settings.Farm.Event.Hauntlet = v end,
})

TabEvent:Toggle({
    Title    = "Crypt (Rusty Keys)",
    Desc     = "Uses Rusty Keys on the grave leading down into the Crypt",
    Value    = Settings.Farm.Event.Crypt,
    Callback = function(v) Settings.Farm.Event.Crypt = v end,
})

TabEvent:Toggle({
    Title    = "Pigeon Nest (Twigs)",
    Desc     = "Puts Crypt Twigs into the Hotel pigeon nest",
    Value    = Settings.Farm.Event.PigeonNest,
    Callback = function(v) Settings.Farm.Event.PigeonNest = v end,
})

TabEvent:Toggle({
    Title    = "Stray Cat",
    Desc     = "Gives 1 water to the Stray Cat once a day for +50 candy",
    Value    = Settings.Farm.Event.StrayCat,
    Callback = function(v) Settings.Farm.Event.StrayCat = v end,
})

TabEvent:Toggle({
    Title    = "Daily Quests",
    Desc     = "Claims finished daily quests and the Halloween board reward",
    Value    = Settings.Farm.Event.Quests,
    Callback = function(v) Settings.Farm.Event.Quests = v end,
})

TabEvent:Toggle({
    Title    = "House Visits",
    Desc     = "Visits player homes for the Visit Homes quests",
    Value    = Settings.Farm.Event.HouseVisits,
    Callback = function(v) Settings.Farm.Event.HouseVisits = v end,
})

TabEvent:Section({ Title = "Candy Pets" })

TabEvent:Toggle({
    Title    = "Candy Pets",
    Desc     = "Saves candy to spend on specific pets from the candy shop",
    Value    = Settings.Farm.Event.CandyPets.Enabled,
    Callback = function(v) Settings.Farm.Event.CandyPets.Enabled = v end,
})

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  PET PEN TAB
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
TabPetPen:Section({ Title = "Pet Pen" })

TabPetPen:Toggle({
    Title    = "Auto Pet Pen",
    Desc     = "Claims the Pet Pen and keeps it stocked with growing pets",
    Value    = Settings.Farm.Event.PetPen,
    Callback = function(v) Settings.Farm.Event.PetPen = v end,
})

TabPetPen:Toggle({
    Title    = "Auto Stock Pen",
    Desc     = "Buys eggs to keep the pen full â€” needs Buy Egg turned ON",
    Value    = Settings.Farm.Event.PetPenStock,
    Callback = function(v) Settings.Farm.Event.PetPenStock = v end,
})

TabPetPen:Slider({
    Title    = "Claim Every (Minutes)",
    Desc     = "How often the Pet Pen is claimed",
    Value    = { Default = Settings.Farm.Event.PetPenMinutes, Min = 1, Max = 60 },
    Step     = 1,
    Callback = function(v) Settings.Farm.Event.PetPenMinutes = v end,
})

TabPetPen:Slider({
    Title    = "Pen Slots",
    Desc     = "4 = free slots, 5 = if you own the extra-slot gamepass",
    Value    = { Default = Settings.Farm.Event.PetPenSlots, Min = 1, Max = 5 },
    Step     = 1,
    Callback = function(v) Settings.Farm.Event.PetPenSlots = v end,
})

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  WEBHOOK TAB
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
TabWebhook:Section({ Title = "Discord Notifications" })

TabWebhook:Toggle({
    Title    = "Notifications Enabled",
    Desc     = "Sends Discord webhook messages for farm events",
    Value    = Settings.Notifications.Enabled,
    Callback = function(v) Settings.Notifications.Enabled = v end,
})

TabWebhook:Input({
    Title       = "Summary Webhook URL",
    Desc        = "Discord webhook for periodic farm summaries",
    Value       = Settings.Notifications.Webhooks.Summary,
    Placeholder = "https://discord.com/api/webhooks/...",
    Callback    = function(v) Settings.Notifications.Webhooks.Summary = v end,
})

TabWebhook:Input({
    Title       = "Alerts Webhook URL",
    Desc        = "Discord webhook for errors and kicks",
    Value       = Settings.Notifications.Webhooks.Alerts,
    Placeholder = "https://discord.com/api/webhooks/...",
    Callback    = function(v) Settings.Notifications.Webhooks.Alerts = v end,
})

TabWebhook:Input({
    Title       = "Discord User ID",
    Desc        = "Your Discord user ID for pings (digits only)",
    Value       = Settings.Notifications.PingDiscordUserId,
    Placeholder = "123456789012345678",
    Callback    = function(v) Settings.Notifications.PingDiscordUserId = v end,
})

TabWebhook:Slider({
    Title    = "Summary Interval (Minutes)",
    Desc     = "How often a summary is sent â€” 0 = disabled",
    Value    = { Default = Settings.Notifications.SummaryIntervalMinutes, Min = 0, Max = 120 },
    Step     = 5,
    Callback = function(v) Settings.Notifications.SummaryIntervalMinutes = v end,
})

TabWebhook:Section({ Title = "Events to Send" })

TabWebhook:Toggle({
    Title    = "Send on Start / Stop",
    Value    = Settings.Notifications.SendOnStartStop,
    Callback = function(v) Settings.Notifications.SendOnStartStop = v end,
})

TabWebhook:Toggle({
    Title    = "Send on Error",
    Value    = Settings.Notifications.SendOnError,
    Callback = function(v) Settings.Notifications.SendOnError = v end,
})

TabWebhook:Toggle({
    Title    = "Send on Kick",
    Value    = Settings.Notifications.SendOnKick,
    Callback = function(v) Settings.Notifications.SendOnKick = v end,
})

TabWebhook:Toggle({
    Title    = "Send on Task Complete",
    Desc     = "One message per finished need â€” sends a lot of messages",
    Value    = Settings.Notifications.SendOnTaskComplete,
    Callback = function(v) Settings.Notifications.SendOnTaskComplete = v end,
})

TabWebhook:Toggle({
    Title    = "Include Username",
    Desc     = "Includes your Roblox username in webhook messages",
    Value    = Settings.Notifications.IncludeUsername,
    Callback = function(v) Settings.Notifications.IncludeUsername = v end,
})

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  INFO TAB
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
TabInfo:Section({ Title = "About" })

TabInfo:Paragraph({
    Title = "SHXDRAG HUB",
    Desc  = "WindUI-based loader for AdoptMe Farm.\n\nHub: Shxdrag\nFarm engine: victimoffate_\nUI Library: Footagesus (WindUI)",
})

TabInfo:Section({ Title = "How to Use" })

TabInfo:Paragraph({
    Title = "Instructions",
    Desc  = "1. Set up your toggles in Farm, Needs, Halloween and Pet Pen tabs.\n"
         .. "2. Go to Main tab and press Start Farm.\n"
         .. "3. The farm runs in the background â€” this window controls it.\n"
         .. "4. Press Stop Farm at any time to stop.",
})

TabInfo:Section({ Title = "Safety" })

TabInfo:Paragraph({
    Title = "Telemetry Disabled",
    Desc  = "Telemetry is OFF. No inventory or username data is sent to the farm developer.",
})

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
--  READY
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
notify("SHXDRAG HUB", "Loaded! Configure settings then press Start Farm.", "check-circle")
