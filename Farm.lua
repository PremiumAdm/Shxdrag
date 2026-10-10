if not game:IsLoaded() then
    game.Loaded:Wait()
end
local u1 = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
do
    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    --  AdoptMe Farm Settings  (Script 3 settings injected here)
    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    getgenv().AdoptMeFarmSettings = {
        Farm = {
            Enabled = true,
            BabyMode = true,
            FastTravel = true,
            Tasks = {
                pet_me = true,
                salon = true,
                bored = true,
                cat_cafe = true,
                sleepy = true,
                dirty = true,
                toilet = true,
                hungry = true,
                thirsty = true,
                play = true,
                pizza_party = true, school = true, sick = true,
                camping = true, beach_party = true,
                mystery = true,
                walk = true,
                ride = true,
            },
            BuyWater = true,
            BuyFood = true,
            MaxBuysPerSession = 0,
            AutoAcceptMenu = false,
            CollectCashback = false,
            SpotTravel = "teleport",
            KeepPetEquipped = false,
            GameTravel = false,
            HomeByRespawn = false,
            HouseDoorExit = true,
            SkipFullGrown = false,
            BuyEgg = false,
            EggToBuy = "cracked_egg",
            MaxEggBuysPerSession = 0,
            AntiAfk = false,
            AutoPotions = {
                Enabled = false,
                PetKinds = {},
            },
            AutoOpen = {
                Enabled = false,
                Exclude = {},
            },
            Event = {
                Enabled = false,
                GhostGallery = false,
                Crypt = false,
                MummySpider = false,
                Quests = false,
                HouseVisits = false,
                PigeonNest = false,
                StrayCat = false,
                PetPen = false,
                PetPenMinutes = 15,
                PetPenSlots = 4,
                PetPenStock = false,
            },
        },
        Logging = {
            ConsoleLevel = "OFF",
            FileEnabled = false,
            SessionFile = false,
        },
        Telemetry = {
            Enabled = true,
        },
        Notifications = {
            Enabled = true,
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

    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    --  AdoptMe Farm Live Settings Reference (mirrors getgenv table)
    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    local FarmSettings = getgenv().AdoptMeFarmSettings
    local FarmAPI = nil  -- set after loader runs

    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    --  SHXDRAG HUB GUI
    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    local TeleportService = game:GetService("TeleportService")
    local v9 = type(hookmetamethod) == "function"
    if not v9 then
        u1:Notify({
            Title = "shit executor detected",
            Content = "anti teleport and most functions wont work",
            Duration = 12,
            Icon = "geist:info",
        })
    end
    local u10 = nil
    local u11 = nil
    if v9 then
        u10 = hookmetamethod(game, "__index", function(p6, p7)
            if p6 == TeleportService then
                if tostring(p7):lower() ~= "teleport" then
                    if tostring(p7) == "TeleportToPlaceInstance" then
                        error("Expected ':' not '.' calling member function TeleportToPlaceInstance", 2)
                    end
                else
                    error("Expected ':' not '.' calling member function Teleport", 2)
                end
            end
            return u10(p6, p7)
        end)
        u11 = hookmetamethod(game, "__namecall", function(p8, ...)
            local v60 = getnamecallmethod()
            if p8 ~= TeleportService or tostring(v60):lower() ~= "teleport" and tostring(v60) ~= "TeleportToPlaceInstance" then
                return u11(p8, ...)
            end
        end)
    end

    local u7 = u1:CreateWindow({
        Title = "SHXDRAG HUB | AdoptMe Farm",
        Icon = "geist:eye",
        Author = "by Shxdrag",
        Folder = "shxdrag_hub_adoptme",
        KeySystem = false,
    })

    -- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€ Tabs â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
    local v12 = u7:Tab({
        Title = "Main",
        Icon = "geist:home",
        Locked = false,
    })
    local vFarm = u7:Tab({
        Title = "Farm",
        Icon = "leaf",
        Locked = false,
    })
    local vEvent = u7:Tab({
        Title = "Halloween",
        Icon = "ghost",
        Locked = false,
    })
    local v13 = u7:Tab({
        Title = "Information",
        Icon = "geist:information",
        Locked = false,
    })

    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    --  MAIN TAB â€” Farm Status + Controls
    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

    local farmStartTime = nil

    -- Start Farm button
    v12:Button({
        Title = "Start Farm",
        Desc = "Starts the farm using all toggles you have turned ON in the Farm and Halloween tabs",
        Icon = "play",
        Callback = function()
            if FarmAPI then
                u1:Notify({
                    Title = "Farm",
                    Content = "Farm is already running!",
                    Duration = 3,
                    Icon = "info",
                })
                return
            end

            -- Build a summary of every toggle the user has enabled
            local F = FarmSettings.Farm
            local E = FarmSettings.Farm.Event
            local activeList = {}

            -- Core
            if F.Enabled        then table.insert(activeList, "Farm Core") end
            if F.BabyMode       then table.insert(activeList, "Baby Mode") end
            if F.FastTravel     then table.insert(activeList, "Fast Travel") end
            if F.BuyFood        then table.insert(activeList, "Buy Food") end
            if F.BuyWater       then table.insert(activeList, "Buy Water") end
            if F.SkipFullGrown  then table.insert(activeList, "Skip Full-Grown") end
            if F.BuyEgg         then table.insert(activeList, "Buy Egg") end
            if F.KeepPetEquipped then table.insert(activeList, "Keep Pet Equipped") end
            if F.CollectCashback then table.insert(activeList, "Collect Cashback") end
            if F.AutoAcceptMenu  then table.insert(activeList, "Auto Accept Menu") end
            if F.HomeByRespawn   then table.insert(activeList, "Home By Respawn") end
            if F.AutoPotions.Enabled then table.insert(activeList, "Auto Age Potions") end
            if F.AutoOpen.Enabled    then table.insert(activeList, "Auto Open Gifts") end
            -- Halloween event
            if E.Enabled        then table.insert(activeList, "Halloween Event") end
            if E.GhostGallery   then table.insert(activeList, "Ghost Gallery") end
            if E.Crypt          then table.insert(activeList, "Crypt") end
            if E.MummySpider    then table.insert(activeList, "Mummy Spider") end
            if E.Quests         then table.insert(activeList, "Daily Quests") end
            if E.HouseVisits    then table.insert(activeList, "House Visits") end
            if E.PigeonNest     then table.insert(activeList, "Pigeon Nest") end
            if E.StrayCat       then table.insert(activeList, "Stray Cat") end
            if E.PetPen         then table.insert(activeList, "Pet Pen") end
            if E.PetPenStock    then table.insert(activeList, "Pet Pen Auto Stock") end

            if #activeList == 0 then
                u1:Notify({
                    Title = "No Features Enabled",
                    Content = "Turn on at least one toggle in the Farm or Halloween tabs first!",
                    Duration = 5,
                    Icon = "alert-triangle",
                })
                return
            end

            local summary = table.concat(activeList, ", ")
            u1:Notify({
                Title = "Starting Farm",
                Content = "Active: " .. summary,
                Duration = 6,
                Icon = "play",
            })

            task.spawn(function()
                local SCRIPT_URL = "https://raw.githubusercontent.com/PremiumAdm/Shxdrag/refs/heads/main/AdoptMeFarm_public.lua.txt"
                getgenv().AdoptMeFarmLoaderInfo = { Url = SCRIPT_URL }
                local ok, source = pcall(function()
                    return game:HttpGet(SCRIPT_URL .. "?nocache=" .. tostring(os.time()))
                end)
                if not (ok and type(source) == "string" and #source > 5000
                    and string.find(string.sub(source, 1, 300), "AdoptMe Farm  v", 1, true)) then
                    u1:Notify({
                        Title = "Farm Error",
                        Content = "Download failed or invalid script. Check executor HTTP.",
                        Duration = 8,
                        Icon = "alert-triangle",
                    })
                    warn("[SHXDRAG HUB] Farm download failed or not AdoptMe Farm: check SCRIPT_URL")
                    return
                end
                local program, compileError = loadstring(source)
                if not program then
                    u1:Notify({
                        Title = "Farm Error",
                        Content = "Script compile error: " .. tostring(compileError),
                        Duration = 8,
                        Icon = "alert-triangle",
                    })
                    warn("[SHXDRAG HUB] Farm compile error: " .. tostring(compileError))
                    return
                end
                local runOk, apiOrErr = pcall(program)
                if runOk and type(apiOrErr) == "table" and apiOrErr.Stop then
                    FarmAPI = apiOrErr
                    farmStartTime = os.time()
                    u1:Notify({
                        Title = "Farm Running",
                        Content = "Started with: " .. summary,
                        Duration = 5,
                        Icon = "check",
                    })
                else
                    u1:Notify({
                        Title = "Farm Running",
                        Content = "Active: " .. summary,
                        Duration = 50,
                        Icon = "info",
                    })
                end
            end)
        end,
    })

    -- Stop Farm button
    v12:Button({
        Title = "Stop Farm",
        Desc = "Stop the running farm",
        Icon = "square",
        Callback = function()
            if FarmAPI and FarmAPI.Stop then
                FarmAPI.Stop("STOP ALL FARM")
                FarmAPI = nil
                farmStartTime = nil
                u1:Notify({
                    Title = "AdoptMe Farm",
                    Content = "Farm stopped.",
                    Duration = 3,
                    Icon = "square",
                })
            else
                u1:Notify({
                    Title = "Farm",
                    Content = "Farm is not running.",
                    Duration = 3,
                    Icon = "info",
                })
            end
        end,
    })

    -- Anti-AFK button
    v12:Button({
        Title = "Anti-AFK",
        Desc = "Prevent idle kick (one-time enable)",
        Icon = "coffee",
        Callback = function()
            if not getgenv().AntiAFKEnabled then
                local t1 = {
                    VirtualUser = game:GetService("VirtualUser"),
                    Players = game:GetService("Players"),
                }
                local LocalPlayer2 = t1.Players.LocalPlayer
                if getconnections then
                    local v63, v64, v65 = pairs(getconnections(LocalPlayer2.Idled))
                    for _, v67 in v63, v64, v65 do
                        local v68 = v67
                        if v68.Disable then
                            v68:Disable()
                        elseif v68.Disconnect then
                            v68:Disconnect()
                        end
                    end
                else
                    LocalPlayer2.Idled:Connect(function()
                        t1.VirtualUser:CaptureController()
                        t1.VirtualUser:ClickButton2(Vector2.new())
                    end)
                end
                getgenv().AntiAFKEnabled = true
                u1:Notify({
                    Title = "Anti-AFK Enabled",
                    Content = "You will no longer be kicked for being AFK!",
                    Duration = 3,
                    Icon = "coffee",
                })
            else
                u1:Notify({
                    Title = "Anti-AFK",
                    Content = "Anti-AFK is already enabled!",
                    Duration = 3,
                    Icon = "coffee",
                })
            end
        end,
    })

    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    --  FARM TAB â€” Core farm toggles and options
    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    vFarm:Section({
        Title = "Core Farm Settings",
        TextXAlignment = "Left",
        TextSize = 20,
    })

    vFarm:Toggle({
        Title = "Farm Enabled",
        Desc = "Turns the entire farm on. Must be ON for any pet tasks to run.",
        Value = FarmSettings.Farm.Enabled,
        Callback = function(v)
            FarmSettings.Farm.Enabled = v
        end,
    })

    vFarm:Toggle({
        Title = "Baby Mode",
        Desc = "Joins the Babies team so the farm can complete tasks that require you to be a Baby (e.g. school, salon). Turn this ON if you are farming baby pets.",
        Value = FarmSettings.Farm.BabyMode,
        Callback = function(v)
            FarmSettings.Farm.BabyMode = v
        end,
    })

    vFarm:Toggle({
        Title = "Fast Travel",
        Desc = "Teleports directly to task locations instead of walking. Speeds up farming significantly.",
        Value = FarmSettings.Farm.FastTravel,
        Callback = function(v)
            FarmSettings.Farm.FastTravel = v
        end,
    })

    vFarm:Toggle({
        Title = "Buy Food",
        Desc = "Automatically buys food from the store when your pet is hungry and you have no food in your backpack.",
        Value = FarmSettings.Farm.BuyFood,
        Callback = function(v)
            FarmSettings.Farm.BuyFood = v
        end,
    })

    vFarm:Toggle({
        Title = "Buy Water",
        Desc = "Automatically buys water from the store when your pet is thirsty and you have no water in your backpack.",
        Value = FarmSettings.Farm.BuyWater,
        Callback = function(v)
            FarmSettings.Farm.BuyWater = v
        end,
    })

    vFarm:Toggle({
        Title = "Skip Full Grown Pets",
        Desc = "Ignores pets that are already fully grown and only farms pets that still have tasks to complete.",
        Value = FarmSettings.Farm.SkipFullGrown,
        Callback = function(v)
            FarmSettings.Farm.SkipFullGrown = v
        end,
    })

    vFarm:Toggle({
        Title = "Buy Egg",
        Desc = "Automatically buys an egg from the shop when you have no farmable pets left. Useful for AFK sessions.",
        Value = FarmSettings.Farm.BuyEgg,
        Callback = function(v)
            FarmSettings.Farm.BuyEgg = v
        end,
    })

    vFarm:Toggle({
        Title = "Keep Pet Equipped",
        Desc = "Re-equips your pet if it ever gets unequipped during the farm. Prevents the farm from stalling.",
        Value = FarmSettings.Farm.KeepPetEquipped,
        Callback = function(v)
            FarmSettings.Farm.KeepPetEquipped = v
        end,
    })

    vFarm:Toggle({
        Title = "Collect Cashback",
        Desc = "Automatically collects your in-game cashback reward on a timer. Free bucks while farming.",
        Value = FarmSettings.Farm.CollectCashback,
        Callback = function(v)
            FarmSettings.Farm.CollectCashback = v
        end,
    })

    vFarm:Toggle({
        Title = "Auto Accept Menu",
        Desc = "Automatically clicks Play/Accept when a popup menu appears, so the farm never gets stuck waiting.",
        Value = FarmSettings.Farm.AutoAcceptMenu,
        Callback = function(v)
            FarmSettings.Farm.AutoAcceptMenu = v
        end,
    })

    vFarm:Toggle({
        Title = "Home By Respawn",
        Desc = "Returns home by respawning your character instead of walking. Much faster than using the door.",
        Value = FarmSettings.Farm.HomeByRespawn,
        Callback = function(v)
            FarmSettings.Farm.HomeByRespawn = v
        end,
    })

    vFarm:Section({
        Title = "Auto Potions",
        TextXAlignment = "Left",
        TextSize = 20,
    })

    vFarm:Toggle({
        Title = "Auto Age Potions",
        Desc = "Automatically uses Age Potions from your backpack on your equipped pet to grow it faster. Only works on pets that are not yet fully grown.",
        Value = FarmSettings.Farm.AutoPotions.Enabled,
        Callback = function(v)
            FarmSettings.Farm.AutoPotions.Enabled = v
        end,
    })

    vFarm:Section({
        Title = "Auto Open",
        TextXAlignment = "Left",
        TextSize = 20,
    })

    vFarm:Toggle({
        Title = "Auto Open Gifts & Chests",
        Desc = "Automatically opens any gifts, chests, or boxes sitting in your backpack. Good for collecting rewards without stopping the farm.",
        Value = FarmSettings.Farm.AutoOpen.Enabled,
        Callback = function(v)
            FarmSettings.Farm.AutoOpen.Enabled = v
        end,
    })

    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    --  HALLOWEEN TAB â€” Event-specific features from Script 2 & 3
    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    vEvent:Section({
        Title = "Halloween 2026 Event",
        TextXAlignment = "Left",
        TextSize = 20,
    })

    vEvent:Toggle({
        Title = "Event Enabled",
        Desc = "Master switch for all Halloween event tasks. Must be ON for any event feature below to run.",
        Value = FarmSettings.Farm.Event.Enabled,
        Callback = function(v)
            FarmSettings.Farm.Event.Enabled = v
        end,
    })

    vEvent:Toggle({
        Title = "Ghost Gallery",
        Desc = "Automatically joins the Ghost Gallery minigame and vacuums ghosts to earn Candy and Rusty Keys.",
        Value = FarmSettings.Farm.Event.GhostGallery,
        Callback = function(v)
            FarmSettings.Farm.Event.GhostGallery = v
        end,
    })

    vEvent:Toggle({
        Title = "Crypt",
        Desc = "Uses your Rusty Keys to open the Crypt grave and collect event rewards. Requires Ghost Gallery to be farming keys first.",
        Value = FarmSettings.Farm.Event.Crypt,
        Callback = function(v)
            FarmSettings.Farm.Event.Crypt = v
        end,
    })

    vEvent:Toggle({
        Title = "Mummy Spider",
        Desc = "Collects the Mummy Spider pet from the Crypt once all floors are unlocked. Enable Crypt to unlock floors first.",
        Value = FarmSettings.Farm.Event.MummySpider,
        Callback = function(v)
            FarmSettings.Farm.Event.MummySpider = v
        end,
    })

    vEvent:Toggle({
        Title = "Daily Quests",
        Desc = "Automatically claims completed daily event quests and collects the Halloween quest board reward each day.",
        Value = FarmSettings.Farm.Event.Quests,
        Callback = function(v)
            FarmSettings.Farm.Event.Quests = v
        end,
    })

    vEvent:Toggle({
        Title = "House Visits",
        Desc = "Visits other players houses to complete 'Visit X Homes' daily quests. Runs automatically as needed.",
        Value = FarmSettings.Farm.Event.HouseVisits,
        Callback = function(v)
            FarmSettings.Farm.Event.HouseVisits = v
        end,
    })

    vEvent:Toggle({
        Title = "Pigeon Nest",
        Desc = "Deposits Crypt Twigs into the pigeon nest at the Hotel to complete event tasks.",
        Value = FarmSettings.Farm.Event.PigeonNest,
        Callback = function(v)
            FarmSettings.Farm.Event.PigeonNest = v
        end,
    })

    vEvent:Toggle({
        Title = "Stray Cat",
        Desc = "Gives water to the Stray Cat at its spawn location once per day. Rewards +50 Candy each time.",
        Value = FarmSettings.Farm.Event.StrayCat,
        Callback = function(v)
            FarmSettings.Farm.Event.StrayCat = v
        end,
    })

    vEvent:Section({
        Title = "Pet Pen",
        TextXAlignment = "Left",
        TextSize = 20,
    })

    vEvent:Toggle({
        Title = "Pet Pen",
        Desc = "Automatically manages the Pet Pen: claims rewards when ready, removes fully grown pets, and replaces them with pets that still need to grow.",
        Value = FarmSettings.Farm.Event.PetPen,
        Callback = function(v)
            FarmSettings.Farm.Event.PetPen = v
        end,
    })

    vEvent:Toggle({
        Title = "Pet Pen Auto Stock",
        Desc = "Keeps all Pet Pen slots filled with growing pets at all times. Will buy eggs from the shop if you run out of growing pets.",
        Value = FarmSettings.Farm.Event.PetPenStock,
        Callback = function(v)
            FarmSettings.Farm.Event.PetPenStock = v
        end,
    })

    vEvent:Slider({
        Title = "Pet Pen Slots",
        Desc = "How many Pet Pen slots you have (4 default, 5 with gamepass)",
        Step = 1,
        Value = {
            Min = 1,
            Max = 5,
            Default = FarmSettings.Farm.Event.PetPenSlots,
        },
        Callback = function(v)
            FarmSettings.Farm.Event.PetPenSlots = v
        end,
    })

    vEvent:Slider({
        Title = "Pet Pen Check Interval (minutes)",
        Desc = "How often to claim and restock the Pet Pen",
        Step = 1,
        Value = {
            Min = 5,
            Max = 60,
            Default = FarmSettings.Farm.Event.PetPenMinutes,
        },
        Callback = function(v)
            FarmSettings.Farm.Event.PetPenMinutes = v
        end,
    })

    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    --  MAIN TAB (cont.) â€” FPS / Server Hop / Performance
    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    v12:Section({
        Title = "Other Features",
        TextXAlignment = "Left",
        TextSize = 20,
    })

    local u31 = v12:Slider({
        Title = "ServerHop Interval (minutes)",
        Desc = "Time between server hops",
        Step = 1,
        Value = {
            Min = 20,
            Max = 120,
            Default = 60,
        },
        Callback = function(p12)
            getgenv().ServerHopDelayMinutes = p12
        end,
    })

    local u32 = v12:Toggle({
        Title = "Auto Server Hop",
        Desc = "Automatically hop servers every X minutes",
        Value = false,
        Callback = function(p13)
            getgenv().ServerHopActive = p13
            if p13 then
                task.spawn(function()
                    while getgenv().ServerHopActive do
                        task.wait((getgenv().ServerHopDelayMinutes or 60) * 60)
                        if not getgenv().ServerHopActive then
                            return
                        end
                        local TeleportService2 = game:GetService("TeleportService")
                        local HttpService2 = game:GetService("HttpService")
                        local PlaceId = game.PlaceId
                        local ok, result = pcall(function()
                            return HttpService2:JSONDecode(game:HttpGet(string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100", PlaceId)))
                        end)
                        if ok and result and result.data then
                            for _, v in ipairs(result.data) do
                                if v.playing < v.maxPlayers then
                                    print("Hopping to new server...")
                                    TeleportService2:TeleportToPlaceInstance(PlaceId, v.id)
                                    break
                                end
                            end
                        else
                            warn("Failed to fetch server list!")
                        end
                    end
                end)
            end
        end,
    })

    local u33 = v12:Slider({
        Title = "FPS Cap",
        Desc = "Set a custom FPS cap",
        Step = 1,
        Value = {
            Min = 10,
            Max = 240,
            Default = 60,
        },
        Callback = function(p14)
            if not setfpscap then
                warn("Your executor does not support setfpscap.")
            else
                setfpscap(p14)
            end
        end,
    })

    local Players3 = game:GetService("Players")
    local LocalPlayer5 = Players3.LocalPlayer
    local Lighting = game:GetService("Lighting")
    local Workspace3 = game:GetService("Workspace")

    local function UltraFPSEnable()
        local v87, v88, v89 = ipairs(Players3:GetPlayers())
        for _, v91 in v87, v88, v89 do
            local v92 = v91
            if v92 ~= LocalPlayer5 and v92.Character then
                local v93, v94, v95 = ipairs(v92.Character:GetDescendants())
                for _, v97 in v93, v94, v95 do
                    local v98 = v97
                    if not v98:IsA("BasePart") and not v98:IsA("MeshPart") then
                        if not (not v98:IsA("Decal") and not v98:IsA("Texture")) then
                            v98.Transparency = 1
                        end
                    else
                        v98.Transparency = 1
                    end
                end
            end
        end
        local v99, v100, v101 = ipairs(Workspace3:GetDescendants())
        for _, v103 in v99, v100, v101 do
            local v104 = v103
            if not v104:IsA("BasePart") and not v104:IsA("MeshPart") then
                if not v104:IsA("Decal") and not v104:IsA("Texture") then
                    if v104:IsA("ParticleEmitter") or v104:IsA("Trail") or v104:IsA("Beam") then
                        v104.Enabled = false
                    end
                else
                    v104.Transparency = 1
                end
            else
                v104.Transparency = 1
                v104.Material = Enum.Material.SmoothPlastic
                v104.Color = Color3.new(1, 1, 1)
            end
        end
        Lighting.FogEnd = 1000000000
        Lighting.GlobalShadows = false
        Lighting.Brightness = 1
        Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
        Lighting.Ambient = Color3.new(1, 1, 1)
        Lighting.EnvironmentDiffuseScale = 0
        Lighting.EnvironmentSpecularScale = 0
        local v105, v106, v107 = ipairs(Lighting:GetChildren())
        for _, v109 in v105, v106, v107 do
            local v110 = v109
            if v110:IsA("Sky") then
                v110:Destroy()
            end
        end
        local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect", Lighting)
        ColorCorrectionEffect.Name = "UltraFPSWhiteout"
        ColorCorrectionEffect.TintColor = Color3.new(1, 1, 1)
        ColorCorrectionEffect.Brightness = 1
    end

    local function UltraFPSDisable()
        local existing = Lighting:FindFirstChild("UltraFPSWhiteout")
        if existing then
            existing:Destroy()
        end
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = true
        Lighting.Brightness = 2
    end

    local u39 = v12:Toggle({
        Title = "Performance Mode",
        Desc = "Game will be optimized for FPS",
        Default = false,
        Callback = function(p15)
            if p15 then
                UltraFPSEnable()
            else
                UltraFPSDisable()
            end
        end,
    })

    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    --  INFORMATION TAB
    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    v13:Section({
        Title = "Information about the script",
        TextXAlignment = "Left",
        TextSize = 20,
    })
    v13:Paragraph({
        Title = "What is SHXDRAG HUB?",
        Desc = "SHXDRAG HUB is a free script hub made by Shxdrag. This version integrates AdoptMe Farm (by victimoffate_) for full pet farming automation including Halloween 2026 event tasks, Ghost Gallery, Crypt, Pet Pen management, and all standard pet needs.",
        Color = "Grey",
        Image = "rbxassetid://117151931151450",
        ImageSize = 100,
        Thumbnail = "rbxassetid://74157900021060",
        ThumbnailSize = 140,
        Locked = false,
        Buttons = {
            {
                Icon = "youtube",
                Title = "YouTube",
                Callback = function()
                    pcall(function()
                        setclipboard("https://youtube.com/@Shxdrag")
                    end)
                    u1:Notify({
                        Title = "YouTube Copied to Clipboard!",
                        Content = "Youtube link has been copied to clipboard",
                        Duration = 3,
                        Icon = "youtube",
                    })
                end,
            },
        },
    })

    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    --  CONFIGS TAB
    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    local v40 = u7:Tab({
        Title = "Configs",
        Icon = "settings",
    })
    local ConfigManager = u7.ConfigManager
    local u42 = ConfigManager:CreateConfig("DefaultConfig")
    u42:Register("FPSslider", u33)
    u42:Register("Perf", u39)
    u42:Register("ServerHopSlider", u31)
    u42:Register("ServerHopToggle", u32)
    v40:Button({
        Title = "Save Config",
        Desc = "Save your settings. Will auto load",
        Callback = function()
            u42:Save()
        end,
    })
    task.spawn(function()
        task.wait(1)
        local v113 = ConfigManager:AllConfigs()
        if #v113 > 0 then
            local v114 = v113[#v113]
            local v115 = ConfigManager:CreateConfig(v114)
            v115:Register("FPSslider", u33)
            v115:Register("Perf", u39)
            v115:Register("ServerHopSlider", u31)
            v115:Register("ServerHopToggle", u32)
            v115:Load()
            print("Auto-loaded last config:", v114)
        else
            u42:Load()
            print("Loaded default config")
        end
    end)
    v40:Keybind({
        Title = "Keybind",
        Desc = "Keybind to open UI",
        Value = "G",
        Callback = function(p16)
            u7:SetToggleKey(Enum.KeyCode[p16])
        end,
    })

    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    --  Remote name resolver (kept from original, harmless utility)
    -- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
    local v43 = nil
    local _next = next
    local v45, v46 = getgc(true)
    for _, v48 in _next, v45, v46 do
        local v49 = v48
        if type(v49) == "table" and rawget(v49, "get_remote_from_cache") then
            v43 = v49
        end
    end
    if v43 then
        table.foreach(debug.getupvalue(v43.get_remote_from_cache, 1), function(p17, p18)
            p18.Name = p17
        end)
    end
    return
end

