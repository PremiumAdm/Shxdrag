if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  SHXDRAG HUB  |  AdoptMe Farm  â€”  Full Edition
--  GUI: WindUI (by Footagesus)  Â·  Farm: AdoptMe Farm (by victimoffate_)
--  All Script1 features exposed through the Shxdrag WindUI interface
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

do
    -- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    --  â˜…  PASTE YOUR DISCORD SETTINGS HERE (before running)  â˜…
    --     Then use the Webhook tab below to toggle what gets sent.
    -- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    local WEBHOOK_URL = ""   -- "https://discord.com/api/webhooks/..."
    local ALERTS_URL  = ""   -- separate URL for errors/kicks (or leave "" to share)
    local DISCORD_UID = ""   -- your Discord user ID (digits only) for @mentions

    -- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    --  Full settings table â€” mirrors Script1's Config.Defaults.
    --  Interface.Enabled = false â†’ suppresses Script1's own Starlight GUI.
    --  The GUI below writes directly into this table before Start Farm.
    -- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    getgenv().AdoptMeFarmSettings = {
        Farm = {
            Enabled         = false,
            BabyMode        = false,
            FastTravel      = true,
            -- Individual task on/off (18 tasks) â€” toggled in the Tasks tab
            Tasks = {
                pet_me      = true,  salon       = true,  bored       = true,
                cat_cafe    = true,  sleepy      = true,  dirty       = true,
                toilet      = true,  hungry      = true,  thirsty     = true,
                play        = true,  pizza_party = true,  school      = true,
                sick        = true,  camping     = true,  beach_party = true,
                mystery     = true,  walk        = true,  ride        = true,
            },
            AutoNeeds       = { Enabled = true,  Skip = {} },
            SmartPriority   = true,
            AutoAcceptMenu  = false,
            AntiAfk         = true,
            CameraGuard     = true,
            CollectCashback = false,
            SpotTravel      = "teleport",
            KeepPetEquipped = false,
            GameTravel      = true,
            HomeByRespawn   = true,
            HouseDoorExit   = false,
            FoodBowlTrip    = false,
            SkipFullGrown   = true,
            PetOrder        = "youngest",
            BuyEgg          = false,
            EggToBuy        = "cracked_egg",
            BuyWater        = true,
            BuyFood         = true,
            PreferNeon      = true,
            FarmPetKinds    = {},
            AutoPotions     = { Enabled = false, Skip = {}, PetKinds = {} },
            AutoNeon        = { Enabled = false, Mega = false, Exclude = {} },
            AutoOpen        = { Enabled = false, Exclude = {} },
            AutoRejoin      = false,
            StuckRejoinSeconds = 180,
            StuckRecovery   = { Enabled = true,  Seconds = 240 },
            DisableMinutes  = 15,
            FailureCooldownSeconds   = 30,
            MaxConsecutiveFailures   = 3,
            Event = {
                Enabled       = false,
                GhostGallery  = false,
                StrayCat      = false,
                Crypt         = false,
                MummySpider   = false,
                CryptOpen     = { "ladder" },
                PigeonNest    = false,
                Quests        = false,
                HouseVisits   = false,
                PetPen        = false,
                PetPenMinutes = 15,
                PetPenSlots   = 4,
                PetPenStock   = false,
                CandyPets     = { Enabled = false, Pick = {} },
            },
        },
        -- Disable Script1's Starlight GUI â€” WindUI is used instead
        Interface    = { Enabled = false },
        Logging      = { ConsoleLevel = "OFF", FileEnabled = false, SessionFile = false },
        Telemetry    = { Enabled = true },
        Notifications = {
            Enabled                = false,
            Webhooks               = { Summary = WEBHOOK_URL, Alerts = ALERTS_URL },
            SummaryIntervalMinutes = 30,
            SendOnTaskComplete     = false,
            SendOnError            = true,
            SendOnKick             = true,
            SendOnStartStop        = true,
            SendTestMessageOnStart = false,
            PingDiscordUserId      = DISCORD_UID,
            PingOn = {
                Kick = true, Error = true, Summary = true,
                TaskCompleted = true, SessionStopped = true, PreviousSession = true,
            },
            IncludeUsername = true,
        },
    }

    -- Convenience aliases into the live settings table
    local S  = getgenv().AdoptMeFarmSettings
    local F  = S.Farm
    local E  = S.Farm.Event
    local N  = S.Notifications
    local FarmAPI = nil

    -- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    --  Anti-teleport hook  (weak executors skip this block)
    -- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    local TeleportService = game:GetService("TeleportService")
    local hasHook = type(hookmetamethod) == "function"
    if not hasHook then
        WindUI:Notify({
            Title = "Weak Executor Detected",
            Content = "Anti-teleport and some features won't work.",
            Duration = 12, Icon = "geist:info",
        })
    end
    local _ih, _nh
    if hasHook then
        _ih = hookmetamethod(game, "__index", function(self, key)
            if self == TeleportService then
                local k = tostring(key):lower()
                if k == "teleport" or tostring(key) == "TeleportToPlaceInstance" then
                    error("Expected ':' not '.' calling member function " .. tostring(key), 2)
                end
            end
            return _ih(self, key)
        end)
        _nh = hookmetamethod(game, "__namecall", function(self, ...)
            local m = tostring(getnamecallmethod()):lower()
            if self == TeleportService and (m == "teleport" or m == "teleporttoplaceinstance") then
                return
            end
            return _nh(self, ...)
        end)
    end

    -- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    --  Farm helpers
    -- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    local FARM_URL = "https://raw.githubusercontent.com/PremiumAdm/Shxdrag/refs/heads/main/AdoptMeFarm_public.lua.txt"

    local function farmStart()
        if FarmAPI then
            WindUI:Notify({ Title = "Farm", Content = "Farm is already running!", Duration = 3, Icon = "info" })
            return
        end
        getgenv().AdoptMeFarmLoaderInfo = { Url = FARM_URL }
        task.spawn(function()
            local ok, src = pcall(game.HttpGet, game, FARM_URL .. "?t=" .. os.time())
            if not (ok and type(src) == "string" and #src > 5000) then
                WindUI:Notify({
                    Title   = "Farm Error",
                    Content = "Download failed. Check your executor's HTTP permissions.",
                    Duration = 8, Icon = "alert-triangle",
                })
                return
            end
            local prog, compErr = loadstring(src)
            if not prog then
                WindUI:Notify({
                    Title   = "Farm Error",
                    Content = "Compile error: " .. tostring(compErr),
                    Duration = 8, Icon = "alert-triangle",
                })
                return
            end
            local runOk, api = pcall(prog)
            if runOk and type(api) == "table" and api.Stop then
                FarmAPI = api
                WindUI:Notify({ Title = "Farm Running", Content = "All systems go!", Duration = 5, Icon = "check" })
            else
                WindUI:Notify({ Title = "Farm Started", Content = "Farm is running.", Duration = 5, Icon = "info" })
            end
        end)
    end

    local function farmStop()
        if FarmAPI and FarmAPI.Stop then
            FarmAPI.Stop("STOP ALL FARM")
            FarmAPI = nil
            WindUI:Notify({ Title = "Farm", Content = "Farm stopped.", Duration = 3, Icon = "square" })
        else
            WindUI:Notify({ Title = "Farm", Content = "Farm is not running.", Duration = 3, Icon = "info" })
        end
    end

    -- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    --  Performance mode helpers
    -- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    local function applyPerf(on)
        local L  = game:GetService("Lighting")
        local W  = game:GetService("Workspace")
        local lp = game:GetService("Players").LocalPlayer
        if on then
            for _, p in ipairs(game:GetService("Players"):GetPlayers()) do
                if p ~= lp and p.Character then
                    for _, d in ipairs(p.Character:GetDescendants()) do
                        if d:IsA("BasePart") or d:IsA("MeshPart") or d:IsA("Decal") or d:IsA("Texture") then
                            d.Transparency = 1
                        end
                    end
                end
            end
            for _, d in ipairs(W:GetDescendants()) do
                if d:IsA("BasePart") or d:IsA("MeshPart") then
                    d.Transparency = 1
                    d.Material = Enum.Material.SmoothPlastic
                    d.Color = Color3.new(1, 1, 1)
                elseif d:IsA("Decal") or d:IsA("Texture") then
                    d.Transparency = 1
                elseif d:IsA("ParticleEmitter") or d:IsA("Trail") or d:IsA("Beam") then
                    d.Enabled = false
                end
            end
            L.FogEnd = 1e9; L.GlobalShadows = false; L.Brightness = 1
            L.OutdoorAmbient = Color3.new(1,1,1); L.Ambient = Color3.new(1,1,1)
            L.EnvironmentDiffuseScale = 0; L.EnvironmentSpecularScale = 0
            for _, c in ipairs(L:GetChildren()) do
                if c:IsA("Sky") then c:Destroy() end
            end
            local cc = Instance.new("ColorCorrectionEffect", L)
            cc.Name = "ShxPerfWhiteout"; cc.TintColor = Color3.new(1,1,1); cc.Brightness = 1
        else
            local cc = L:FindFirstChild("ShxPerfWhiteout")
            if cc then cc:Destroy() end
            L.FogEnd = 100000; L.GlobalShadows = true; L.Brightness = 2
        end
    end

    -- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    --  Create Window
    -- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    local Window = WindUI:CreateWindow({
        Title     = "SHXDRAG HUB | AdoptMe Farm",
        Icon      = "geist:eye",
        Author    = "by Shxdrag",
        Folder    = "shxdrag_hub_adoptme",
        KeySystem = false,
    })

    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    --  TABS
    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    local tMain     = Window:Tab({ Title = "Main",      Icon = "geist:home",        Locked = false })
    local tFarm     = Window:Tab({ Title = "Farm",      Icon = "leaf",              Locked = false })
    local tTasks    = Window:Tab({ Title = "Tasks",     Icon = "badge-check",       Locked = false })
    local tPets     = Window:Tab({ Title = "Pets",      Icon = "paw-print",         Locked = false })
    local tEvent    = Window:Tab({ Title = "Halloween", Icon = "ghost",             Locked = false })
    local tAdvanced = Window:Tab({ Title = "Advanced",  Icon = "wrench",            Locked = false })
    local tWebhook  = Window:Tab({ Title = "Webhook",   Icon = "bell",              Locked = false })
    local tConfigs  = Window:Tab({ Title = "Configs",   Icon = "settings",          Locked = false })
    local tInfo     = Window:Tab({ Title = "Info",      Icon = "geist:information", Locked = false })

    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    --  MAIN TAB
    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    tMain:Button({
        Title = "Start Farm",
        Desc  = "Starts the farm using all settings configured across the tabs.",
        Icon  = "play",
        Callback = farmStart,
    })
    tMain:Button({
        Title = "Stop Farm",
        Desc  = "Stops the running farm.",
        Icon  = "square",
        Callback = farmStop,
    })
    tMain:Button({
        Title = "Anti-AFK",
        Desc  = "Prevents idle kick (one-time enable per session).",
        Icon  = "coffee",
        Callback = function()
            if getgenv().AntiAFKEnabled then
                WindUI:Notify({ Title = "Anti-AFK", Content = "Already enabled!", Duration = 3, Icon = "info" })
                return
            end
            local lp = game:GetService("Players").LocalPlayer
            local vu = game:GetService("VirtualUser")
            if getconnections then
                for _, c in pairs(getconnections(lp.Idled)) do
                    if c.Disable then c:Disable() elseif c.Disconnect then c:Disconnect() end
                end
            else
                lp.Idled:Connect(function()
                    vu:CaptureController(); vu:ClickButton2(Vector2.new())
                end)
            end
            getgenv().AntiAFKEnabled = true
            WindUI:Notify({
                Title   = "Anti-AFK Enabled",
                Content = "You will no longer be kicked for being idle!",
                Duration = 3, Icon = "coffee",
            })
        end,
    })

    tMain:Section({ Title = "Performance", TextXAlignment = "Left", TextSize = 20 })

    local fpsSlider = tMain:Slider({
        Title = "FPS Cap",
        Desc  = "Custom FPS cap (requires setfpscap support in your executor).",
        Step  = 1,
        Value = { Min = 10, Max = 240, Default = 60 },
        Callback = function(v)
            if setfpscap then setfpscap(v) else warn("[SHXDRAG HUB] setfpscap not supported") end
        end,
    })

    local perfToggle = tMain:Toggle({
        Title = "Performance Mode",
        Desc  = "Removes all visuals for maximum FPS during farm sessions.",
        Value = false,
        Callback = applyPerf,
    })

    tMain:Section({ Title = "Auto Server Hop", TextXAlignment = "Left", TextSize = 20 })

    local hopSlider = tMain:Slider({
        Title = "Hop Every (minutes)",
        Desc  = "How long to wait between automatic server hops.",
        Step  = 1,
        Value = { Min = 20, Max = 120, Default = 60 },
        Callback = function(v) getgenv().ShxHopMinutes = v end,
    })

    local hopToggle = tMain:Toggle({
        Title = "Auto Server Hop",
        Desc  = "Automatically hops to a less-populated server every X minutes.",
        Value = false,
        Callback = function(on)
            getgenv().ShxHopActive = on
            if on then
                task.spawn(function()
                    while getgenv().ShxHopActive do
                        task.wait((getgenv().ShxHopMinutes or 60) * 60)
                        if not getgenv().ShxHopActive then return end
                        local pid = game.PlaceId
                        local HS  = game:GetService("HttpService")
                        local TS  = game:GetService("TeleportService")
                        local ok, res = pcall(function()
                            return HS:JSONDecode(game:HttpGet(
                                ("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100"):format(pid)))
                        end)
                        if ok and res and res.data then
                            for _, sv in ipairs(res.data) do
                                if sv.playing < sv.maxPlayers then
                                    print("[SHXDRAG HUB] Hopping serverâ€¦")
                                    TS:TeleportToPlaceInstance(pid, sv.id)
                                    break
                                end
                            end
                        else
                            warn("[SHXDRAG HUB] Could not fetch server list.")
                        end
                    end
                end)
            end
        end,
    })

    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    --  FARM TAB â€” Core farm toggles
    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    tFarm:Section({ Title = "Core Settings", TextXAlignment = "Left", TextSize = 20 })

    tFarm:Toggle({
        Title = "Farm Enabled",
        Desc  = "Master switch â€” must be ON for any pet tasks to run.",
        Value = F.Enabled, Callback = function(v) F.Enabled = v end,
    })
    tFarm:Toggle({
        Title = "Baby Mode",
        Desc  = "Joins the Babies team so the farm can complete baby tasks (school, salon, etc.).",
        Value = F.BabyMode, Callback = function(v) F.BabyMode = v end,
    })
    tFarm:Toggle({
        Title = "Fast Travel",
        Desc  = "Teleports directly to task locations instead of walking.",
        Value = F.FastTravel, Callback = function(v) F.FastTravel = v end,
    })
    tFarm:Toggle({
        Title = "Buy Food",
        Desc  = "Automatically buys food when the pet is hungry and your backpack is empty.",
        Value = F.BuyFood, Callback = function(v) F.BuyFood = v end,
    })
    tFarm:Toggle({
        Title = "Buy Water",
        Desc  = "Automatically buys water when the pet is thirsty and your backpack is empty.",
        Value = F.BuyWater, Callback = function(v) F.BuyWater = v end,
    })
    tFarm:Toggle({
        Title = "Skip Full Grown Pets",
        Desc  = "Ignores pets that are already fully grown; focuses on growing ones only.",
        Value = F.SkipFullGrown, Callback = function(v) F.SkipFullGrown = v end,
    })
    tFarm:Toggle({
        Title = "Buy Egg If None Left",
        Desc  = "Buys an egg from the shop when you have no farmable pets remaining.",
        Value = F.BuyEgg, Callback = function(v) F.BuyEgg = v end,
    })
    tFarm:Toggle({
        Title = "Keep Pet Equipped",
        Desc  = "Re-equips your pet automatically if it ever gets unequipped.",
        Value = F.KeepPetEquipped, Callback = function(v) F.KeepPetEquipped = v end,
    })
    tFarm:Toggle({
        Title = "Collect Cashback",
        Desc  = "Automatically collects your in-game cashback reward on a timer.",
        Value = F.CollectCashback, Callback = function(v) F.CollectCashback = v end,
    })
    tFarm:Toggle({
        Title = "Auto Accept Menu",
        Desc  = "Auto-clicks Play or Accept when any popup menu appears.",
        Value = F.AutoAcceptMenu, Callback = function(v) F.AutoAcceptMenu = v end,
    })
    tFarm:Toggle({
        Title = "Home By Respawn",
        Desc  = "Returns home by respawning the character (much faster than walking home).",
        Value = F.HomeByRespawn, Callback = function(v) F.HomeByRespawn = v end,
    })
    tFarm:Toggle({
        Title = "Game Travel (Doors)",
        Desc  = "Uses in-game teleporters and doors to travel between areas.",
        Value = F.GameTravel, Callback = function(v) F.GameTravel = v end,
    })
    tFarm:Toggle({
        Title = "Food Bowl Trip",
        Desc  = "Goes home for the free food bowl even if you already have food in your backpack.",
        Value = F.FoodBowlTrip, Callback = function(v) F.FoodBowlTrip = v end,
    })

    tFarm:Section({ Title = "Auto Needs", TextXAlignment = "Left", TextSize = 20 })

    tFarm:Toggle({
        Title = "Auto Needs",
        Desc  = "Master toggle for automatically completing all active pet needs.",
        Value = true, Callback = function(v) F.AutoNeeds.Enabled = v end,
    })
    tFarm:Toggle({
        Title = "Smart Priority",
        Desc  = "Completes needs that are doable at your current location before travelling.",
        Value = F.SmartPriority, Callback = function(v) F.SmartPriority = v end,
    })

    tFarm:Section({ Title = "Auto Open", TextXAlignment = "Left", TextSize = 20 })

    tFarm:Toggle({
        Title = "Open Gifts & Chests",
        Desc  = "Automatically opens any gifts, chests, or boxes sitting in your backpack.",
        Value = F.AutoOpen.Enabled, Callback = function(v) F.AutoOpen.Enabled = v end,
    })

    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    --  TASKS TAB â€” Individual task on/off switches
    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    tTasks:Section({ Title = "Pet Task Toggles", TextXAlignment = "Left", TextSize = 20 })

    tTasks:Toggle({ Title = "Pet Me",      Value = F.Tasks.pet_me,      Callback = function(v) F.Tasks.pet_me = v end })
    tTasks:Toggle({ Title = "Salon",       Value = F.Tasks.salon,       Callback = function(v) F.Tasks.salon = v end })
    tTasks:Toggle({ Title = "Bored",       Value = F.Tasks.bored,       Callback = function(v) F.Tasks.bored = v end })
    tTasks:Toggle({ Title = "Cat Cafe",    Value = F.Tasks.cat_cafe,    Callback = function(v) F.Tasks.cat_cafe = v end })
    tTasks:Toggle({ Title = "Sleepy",      Value = F.Tasks.sleepy,      Callback = function(v) F.Tasks.sleepy = v end })
    tTasks:Toggle({ Title = "Dirty",       Value = F.Tasks.dirty,       Callback = function(v) F.Tasks.dirty = v end })
    tTasks:Toggle({ Title = "Toilet",      Value = F.Tasks.toilet,      Callback = function(v) F.Tasks.toilet = v end })
    tTasks:Toggle({ Title = "Hungry",      Value = F.Tasks.hungry,      Callback = function(v) F.Tasks.hungry = v end })
    tTasks:Toggle({ Title = "Thirsty",     Value = F.Tasks.thirsty,     Callback = function(v) F.Tasks.thirsty = v end })
    tTasks:Toggle({ Title = "Play",        Value = F.Tasks.play,        Callback = function(v) F.Tasks.play = v end })
    tTasks:Toggle({ Title = "Pizza Party", Value = F.Tasks.pizza_party, Callback = function(v) F.Tasks.pizza_party = v end })
    tTasks:Toggle({ Title = "School",      Value = F.Tasks.school,      Callback = function(v) F.Tasks.school = v end })
    tTasks:Toggle({ Title = "Sick",        Value = F.Tasks.sick,        Callback = function(v) F.Tasks.sick = v end })
    tTasks:Toggle({ Title = "Camping",     Value = F.Tasks.camping,     Callback = function(v) F.Tasks.camping = v end })
    tTasks:Toggle({ Title = "Beach Party", Value = F.Tasks.beach_party, Callback = function(v) F.Tasks.beach_party = v end })
    tTasks:Toggle({ Title = "Mystery",     Value = F.Tasks.mystery,     Callback = function(v) F.Tasks.mystery = v end })
    tTasks:Toggle({ Title = "Walk",        Value = F.Tasks.walk,        Callback = function(v) F.Tasks.walk = v end })
    tTasks:Toggle({ Title = "Ride",        Value = F.Tasks.ride,        Callback = function(v) F.Tasks.ride = v end })

    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    --  PETS TAB â€” Pet selection, potions, neon fusion
    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    tPets:Section({ Title = "Pet Priority", TextXAlignment = "Left", TextSize = 20 })

    tPets:Toggle({
        Title = "Prefer Neon Pets",
        Desc  = "Farms growing neon pets first, before normal growing pets.",
        Value = F.PreferNeon, Callback = function(v) F.PreferNeon = v end,
    })

    tPets:Section({ Title = "Potions", TextXAlignment = "Left", TextSize = 20 })

    tPets:Toggle({
        Title = "Auto Age Potions",
        Desc  = "Automatically uses age potions from your backpack on the equipped pet.",
        Value = F.AutoPotions.Enabled, Callback = function(v) F.AutoPotions.Enabled = v end,
    })

    tPets:Section({ Title = "Neon Fusion", TextXAlignment = "Left", TextSize = 20 })

    tPets:Toggle({
        Title = "Auto Neon",
        Desc  = "Fuses 4 full-grown pets of the same kind into 1 Neon automatically.",
        Value = F.AutoNeon.Enabled, Callback = function(v) F.AutoNeon.Enabled = v end,
    })
    tPets:Toggle({
        Title = "Auto Mega Neon",
        Desc  = "Fuses 4 Neon pets of the same kind into 1 Mega Neon automatically. Requires Auto Neon ON.",
        Value = F.AutoNeon.Mega, Callback = function(v) F.AutoNeon.Mega = v end,
    })

    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    --  HALLOWEEN EVENT TAB
    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    tEvent:Section({ Title = "Halloween 2026 Event", TextXAlignment = "Left", TextSize = 20 })

    tEvent:Toggle({
        Title = "Event Enabled",
        Desc  = "Master switch for all Halloween event tasks. Must be ON for any event feature to run.",
        Value = E.Enabled, Callback = function(v) E.Enabled = v end,
    })
    tEvent:Toggle({
        Title = "Ghost Gallery",
        Desc  = "Joins the Ghost Gallery minigame and vacuums ghosts to earn Candy and Rusty Keys.",
        Value = E.GhostGallery, Callback = function(v) E.GhostGallery = v end,
    })
    tEvent:Toggle({
        Title = "Stray Cat",
        Desc  = "Gives water to the Stray Cat at its spawn location once per day (+50 Candy).",
        Value = E.StrayCat, Callback = function(v) E.StrayCat = v end,
    })
    tEvent:Toggle({
        Title = "Daily Quests",
        Desc  = "Claims completed daily Halloween event quests and collects the quest board reward.",
        Value = E.Quests, Callback = function(v) E.Quests = v end,
    })
    tEvent:Toggle({
        Title = "House Visits",
        Desc  = "Visits other players' houses to complete 'Visit X Homes' daily quests.",
        Value = E.HouseVisits, Callback = function(v) E.HouseVisits = v end,
    })

    tEvent:Section({ Title = "Crypt", TextXAlignment = "Left", TextSize = 20 })

    tEvent:Toggle({
        Title = "Use Rusty Keys (Crypt)",
        Desc  = "Spends Rusty Keys (earned from Ghost Gallery) to open the Crypt grave.",
        Value = E.Crypt, Callback = function(v) E.Crypt = v end,
    })
    tEvent:Toggle({
        Title = "Mummy Spider",
        Desc  = "Collects the Mummy Spider pet at the bottom of the Crypt once floors are unlocked.",
        Value = E.MummySpider, Callback = function(v) E.MummySpider = v end,
    })
    tEvent:Toggle({
        Title = "Pigeon Nest",
        Desc  = "Deposits Crypt Twigs into the Pigeon Nest at the Hotel to complete event tasks.",
        Value = E.PigeonNest, Callback = function(v) E.PigeonNest = v end,
    })

    tEvent:Section({ Title = "Candy Shop", TextXAlignment = "Left", TextSize = 20 })

    tEvent:Toggle({
        Title = "Auto Buy Candy Pets",
        Desc  = "Automatically spends Candy on Halloween shop pets. Configure picks in the script if needed.",
        Value = E.CandyPets.Enabled, Callback = function(v) E.CandyPets.Enabled = v end,
    })

    tEvent:Section({ Title = "Pet Pen", TextXAlignment = "Left", TextSize = 20 })

    tEvent:Toggle({
        Title = "Auto Pet Pen",
        Desc  = "Claims Pet Pen rewards, removes fully grown pets, and refills slots with growing ones.",
        Value = E.PetPen, Callback = function(v) E.PetPen = v end,
    })
    tEvent:Toggle({
        Title = "Pet Pen Auto Stock",
        Desc  = "Keeps all Pet Pen slots filled; buys eggs from the shop if you run out of growing pets.",
        Value = E.PetPenStock, Callback = function(v) E.PetPenStock = v end,
    })
    tEvent:Slider({
        Title = "Pet Pen Slots",
        Desc  = "How many Pet Pen slots you have (4 by default, 5 with the gamepass).",
        Step  = 1,
        Value = { Min = 1, Max = 5, Default = E.PetPenSlots },
        Callback = function(v) E.PetPenSlots = v end,
    })
    tEvent:Slider({
        Title = "Pet Pen Check Interval (min)",
        Desc  = "How often to claim rewards and restock the Pet Pen.",
        Step  = 1,
        Value = { Min = 5, Max = 60, Default = E.PetPenMinutes },
        Callback = function(v) E.PetPenMinutes = v end,
    })

    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    --  ADVANCED TAB â€” Safety, recovery, failure tuning
    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    tAdvanced:Section({ Title = "Safety", TextXAlignment = "Left", TextSize = 20 })

    tAdvanced:Toggle({
        Title = "Anti-AFK",
        Desc  = "Clicks Roblox's idle warning so you are never kicked for inactivity.",
        Value = F.AntiAfk, Callback = function(v) F.AntiAfk = v end,
    })
    tAdvanced:Toggle({
        Title = "Camera Guard",
        Desc  = "Prevents the camera from drifting or being moved during farm tasks.",
        Value = F.CameraGuard, Callback = function(v) F.CameraGuard = v end,
    })

    tAdvanced:Section({ Title = "Stuck Recovery", TextXAlignment = "Left", TextSize = 20 })

    tAdvanced:Toggle({
        Title = "Stuck Recovery",
        Desc  = "If the bot stops making progress for too long, it respawns home and retries.",
        Value = F.StuckRecovery.Enabled, Callback = function(v) F.StuckRecovery.Enabled = v end,
    })
    tAdvanced:Slider({
        Title = "Stuck After (sec)",
        Desc  = "Seconds of no progress before the bot considers itself stuck.",
        Step  = 10,
        Value = { Min = 30, Max = 600, Default = F.StuckRecovery.Seconds },
        Callback = function(v) F.StuckRecovery.Seconds = v end,
    })
    tAdvanced:Toggle({
        Title = "Auto Rejoin",
        Desc  = "If stuck recovery fails to fix it, the game is rejoined automatically.",
        Value = F.AutoRejoin, Callback = function(v) F.AutoRejoin = v end,
    })
    tAdvanced:Slider({
        Title = "Rejoin After (sec)",
        Desc  = "Seconds elapsed before triggering an auto-rejoin.",
        Step  = 10,
        Value = { Min = 60, Max = 600, Default = F.StuckRejoinSeconds },
        Callback = function(v) F.StuckRejoinSeconds = v end,
    })

    tAdvanced:Section({ Title = "Failure Handling", TextXAlignment = "Left", TextSize = 20 })

    tAdvanced:Slider({
        Title = "Retry Failed Task After (sec)",
        Desc  = "Cooldown before a previously failed task is tried again.",
        Step  = 1,
        Value = { Min = 1, Max = 120, Default = F.FailureCooldownSeconds or 30 },
        Callback = function(v) F.FailureCooldownSeconds = v end,
    })
    tAdvanced:Slider({
        Title = "Fails Before Rest",
        Desc  = "Number of consecutive task failures before the farm takes a break.",
        Step  = 1,
        Value = { Min = 1, Max = 10, Default = F.MaxConsecutiveFailures or 3 },
        Callback = function(v) F.MaxConsecutiveFailures = v end,
    })
    tAdvanced:Slider({
        Title = "Rest Duration (min)",
        Desc  = "How long the farm rests after hitting the failure limit.",
        Step  = 1,
        Value = { Min = 0, Max = 60, Default = F.DisableMinutes or 15 },
        Callback = function(v) F.DisableMinutes = v end,
    })

    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    --  WEBHOOK TAB â€” Discord notification settings
    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    tWebhook:Section({ Title = "How to Set Your Webhook URL", TextXAlignment = "Left", TextSize = 20 })
    tWebhook:Paragraph({
        Title = "Setup Instructions",
        Desc  = "Edit WEBHOOK_URL and DISCORD_UID at the top of this script before running. "
             .. "The toggles below control which events trigger a Discord message.",
        Color  = "Grey",
        Locked = false,
    })

    tWebhook:Section({ Title = "What to Send", TextXAlignment = "Left", TextSize = 20 })
    tWebhook:Toggle({ Title = "Each Finished Task",   Value = N.SendOnTaskComplete, Callback = function(v) N.SendOnTaskComplete = v end })
    tWebhook:Toggle({ Title = "Kick / Disconnect",    Value = N.SendOnKick,         Callback = function(v) N.SendOnKick = v end })
    tWebhook:Toggle({ Title = "Errors",               Value = N.SendOnError,        Callback = function(v) N.SendOnError = v end })
    tWebhook:Toggle({ Title = "Start / Stop",         Value = N.SendOnStartStop,    Callback = function(v) N.SendOnStartStop = v end })
    tWebhook:Toggle({ Title = "Include Roblox Name",  Value = N.IncludeUsername,    Callback = function(v) N.IncludeUsername = v end })

    tWebhook:Section({ Title = "Summary Reports", TextXAlignment = "Left", TextSize = 20 })
    tWebhook:Toggle({
        Title = "Send Summary Reports",
        Desc  = "Sends periodic farm summary messages to your webhook.",
        Value = N.Enabled, Callback = function(v) N.Enabled = v end,
    })
    tWebhook:Slider({
        Title = "Summary Interval (min)",
        Desc  = "How often to send a summary message.",
        Step  = 1,
        Value = { Min = 5, Max = 120, Default = N.SummaryIntervalMinutes },
        Callback = function(v) N.SummaryIntervalMinutes = v end,
    })

    tWebhook:Section({ Title = "Ping Me On (requires Discord UID set)", TextXAlignment = "Left", TextSize = 20 })
    tWebhook:Toggle({ Title = "Ping on Kick",            Value = N.PingOn.Kick,           Callback = function(v) N.PingOn.Kick = v end })
    tWebhook:Toggle({ Title = "Ping on Error",           Value = N.PingOn.Error,          Callback = function(v) N.PingOn.Error = v end })
    tWebhook:Toggle({ Title = "Ping on Summary",         Value = N.PingOn.Summary,        Callback = function(v) N.PingOn.Summary = v end })
    tWebhook:Toggle({ Title = "Ping on Task Complete",   Value = N.PingOn.TaskCompleted,  Callback = function(v) N.PingOn.TaskCompleted = v end })
    tWebhook:Toggle({ Title = "Ping on Session Stopped", Value = N.PingOn.SessionStopped, Callback = function(v) N.PingOn.SessionStopped = v end })

    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    --  CONFIGS TAB â€” Save/load, keybind
    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    local CM  = Window.ConfigManager
    local cfg = CM:CreateConfig("DefaultConfig")
    cfg:Register("fps",    fpsSlider)
    cfg:Register("perf",   perfToggle)
    cfg:Register("hopMin", hopSlider)
    cfg:Register("hopOn",  hopToggle)

    tConfigs:Button({
        Title = "Save Config",
        Desc  = "Saves all current slider and toggle states. Will be auto-loaded on next session.",
        Callback = function() cfg:Save() end,
    })

    tConfigs:Keybind({
        Title = "Toggle UI Keybind",
        Desc  = "The key that hides or shows this window.",
        Value = "G",
        Callback = function(k) Window:SetToggleKey(Enum.KeyCode[k]) end,
    })

    -- Auto-load the last saved config on startup
    task.spawn(function()
        task.wait(1)
        local all = CM:AllConfigs()
        if #all > 0 then
            local last = CM:CreateConfig(all[#all])
            last:Register("fps", fpsSlider); last:Register("perf", perfToggle)
            last:Register("hopMin", hopSlider); last:Register("hopOn", hopToggle)
            last:Load()
            print("[SHXDRAG HUB] Auto-loaded config:", all[#all])
        else
            cfg:Load()
            print("[SHXDRAG HUB] Loaded default config")
        end
    end)

    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    --  INFO TAB
    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    tInfo:Section({ Title = "About SHXDRAG HUB", TextXAlignment = "Left", TextSize = 20 })
    tInfo:Paragraph({
        Title  = "SHXDRAG HUB â€” Full Edition",
        Desc   = "A free script hub by Shxdrag, now exposing every AdoptMe Farm (by victimoffate_) feature: "
              .. "Auto Needs, 18 Task Toggles, Auto Neon & Mega Neon, Candy Shop, Mummy Spider, "
              .. "Pet Pen, Ghost Gallery, Crypt, Pigeon Nest, Stray Cat, Discord Webhooks, "
              .. "Stuck Recovery, Auto Rejoin, Camera Guard, and more.",
        Color  = "Grey",
        Image  = "rbxassetid://117151931151450",
        ImageSize = 100,
        Thumbnail = "rbxassetid://74157900021060",
        ThumbnailSize = 140,
        Locked = false,
        Buttons = {
            {
                Icon  = "youtube",
                Title = "YouTube",
                Callback = function()
                    pcall(function() setclipboard("https://youtube.com/@Shxdrag") end)
                    WindUI:Notify({
                        Title   = "Copied to Clipboard!",
                        Content = "YouTube link has been copied.",
                        Duration = 3, Icon = "youtube",
                    })
                end,
            },
        },
    })

    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    --  Remote name resolver utility (from original Shxdrag â€” harmless)
    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    local _rv = nil
    local _next = next
    local gc1, gc2 = getgc(true)
    for _, v in _next, gc1, gc2 do
        if type(v) == "table" and rawget(v, "get_remote_from_cache") then
            _rv = v; break
        end
    end
    if _rv then
        table.foreach(debug.getupvalue(_rv.get_remote_from_cache, 1), function(k, r)
            r.Name = k
        end)
    end

    return
end
