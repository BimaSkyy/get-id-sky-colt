local MenuList = {
    {
        Name = "INFINITY YIELD",
        Desc = "this infinity yield script better combine with my script thanks infinity yield 🎭",
        Url  = "https://raw.githubusercontent.com/BimaSkyy/all-in-one-SC-rubox/refs/heads/main/code/8262662SinfYield.lua",
        Category = "INFINITY YIELD😈",
    },
    {
        Name = "DEBUG hand item",
        Desc = "This is a DEBUG to find item info in hand, hold any item in your player's hand then click the button to start finding out what item info is in hand, the results will be automatically copied to the clipboard",
        Url  = "https://raw.githubusercontent.com/BimaSkyy/all-in-one-SC-rubox/refs/heads/main/code/info%20on%20items%20held%20by%20the%20player.lua",
        Category = "DEBUG",
    },
    {
        Name = "SavePosToFile",
        Desc = "this for save pos and save to file delta for make another script only if you know",
        Url  = "https://raw.githubusercontent.com/BimaSkyy/all-in-one-SC-rubox/refs/heads/main/code/726257ManagePosFile.lua",
        Category = "DEBUG",
    },
    {
        Name = "DEBUG underfoot objects",
        Desc = "This DEBUG is for finding object info under your feet, just place your player on any object and click the button then the results will be copied to the clipboard",
        Url  = "https://raw.githubusercontent.com/BimaSkyy/all-in-one-SC-rubox/refs/heads/main/code/underfoot%20object%20info.lua",
        Category = "DEBUG",
    },
    {
        Name = "Test Anim Id",
        Desc = "This DEBUG for test Anim id",
        Url  = "https://raw.githubusercontent.com/BimaSkyy/all-in-one-SC-rubox/refs/heads/main/code/6665627TestAnim.lua",
        Category = "DEBUG",
    },
 --- ===== ALL GAME CATEGORY =====
    {
        Name = "ESP PLAYER",
        Desc = "tools for esp all player at server use button for active it",
        Url  = "https://raw.githubusercontent.com/BimaSkyy/all-in-one-SC-rubox/refs/heads/main/code/817171287%20ESP-P.lua",
        Category = "TOOLS GAME",
    },
    {
        Name = "SPEED HACK",
        Desc = "TOOLS FOR SPEED HACK CLICK NAVIGASION FOR SET",
        Url  = "https://raw.githubusercontent.com/BimaSkyy/all-in-one-SC-rubox/refs/heads/main/code/8262662SPedH.lua",
        Category = "TOOLS GAME",
    },
    {
        Name = "SPECTATOR",
        Desc = "tools for become a spectator",
        Url  = "https://raw.githubusercontent.com/BimaSkyy/all-in-one-SC-rubox/refs/heads/main/code/817172spectator.lua",
        Category = "TOOLS GAME",
    },
    {
        Name = "DUPE ITEM",
        Desc = "tools for duplicate the item you are holding, remember this is only visual will be visible if the server is down",
        Url  = "https://raw.githubusercontent.com/BimaSkyy/all-in-one-SC-rubox/refs/heads/main/code/191829292%20DUPE.lua",
        Category = "TOOLS GAME",
    },

-- ==== EAT PIZZA TO GROW =====
    {
        Name = "AUTO EAT",
        Desc = "this for game Eat Pizza To Grow for do auto eat pizza",
        Url  = "https://raw.githubusercontent.com/BimaSkyy/all-in-one-SC-rubox/refs/heads/main/code/81187Eat-pizza-to-Geow.lua",
        Category = "EatPizzaToGrow",
    },
-- ==== CAR CRASH GAME =====
    {
        Name = "Troling",
        Desc = "this for game car crash for do troll with another player for funn",
        Url  = "https://raw.githubusercontent.com/BimaSkyy/all-in-one-SC-rubox/refs/heads/main/code/1192927282%20car-crash.lua",
        Category = "CarCrash",
    },
    {
        Name = "Auto Farm And More ",
        Desc = "for 99 night i tried Made this scrip if game update and script not work i never fix it couse not my favorite game lol",
        Url  = "https://raw.githubusercontent.com/BimaSkyy/all-in-one-SC-rubox/refs/heads/main/code/82727299night.lua",
        Category = "99 Night",
    },
-- ==== TROLL ALL =====
    {
        Name = "Best if you know",
        Desc = "BEST TROLL SCRIPT🔥 combine with spectator for better use",
        Url  = "https://raw.githubusercontent.com/BimaSkyy/all-in-one-SC-rubox/refs/heads/main/code/72625272TAllG.lua",
        Category = "TROLL ALL GAME",
    },
    {
        Name = "TP TO ALL",
        Desc = "BEST TROLL SCRIPT🔥",
        Url  = "https://raw.githubusercontent.com/BimaSkyy/all-in-one-SC-rubox/refs/heads/main/code/8262638TpAllP.lua",
        Category = "TROLL ALL GAME",
    },
    {
        Name = "RING PART💀",
        Desc = "BEST TROL USE IF AT MAP HAVE PART WITH ANCHORED FALSE 🎭",
        Url  = "https://raw.githubusercontent.com/BimaSkyy/all-in-one-SC-rubox/refs/heads/main/code/2962628397RP.lua",
        Category = "TROLL ALL GAME",
    },
}
--== STATE ==--
local Loaded = {}          -- [menuName] = true | returnedValue
local Visible = {}         -- [menuName] = bool
local TrackedUI = {}       -- [menuName] = {Instance, ...}
local WatchConn = {}       -- [menuName] = { RBXScriptConnection, ... }

--== SERVICES & ROOTS ==--
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")

local function safeGetCoreGui()
    local ok, cg = pcall(function() return game:GetService("CoreGui") end)
    if ok then return cg end
end
local function safeGetHUI()
    local ok, hui = pcall(function() return gethui and gethui() end)
    if ok and hui then return hui end
end

local GuiRoots = {}
do
    table.insert(GuiRoots, PlayerGui)
    local cg = safeGetCoreGui()
    if cg then table.insert(GuiRoots, cg) end
    local hui = safeGetHUI()
    if hui then table.insert(GuiRoots, hui) end
end

--== ROOT UI ==--
local Root = Instance.new("ScreenGui")
Root.Name = "MenuLoader_UI"
Root.IgnoreGuiInset = true
Root.ResetOnSpawn = false
Root.Parent = PlayerGui
Root:SetAttribute("MenuLoaderInternal", true)

--== HELPERS ==--
local function isGui(inst)
    return inst and (
        inst:IsA("ScreenGui") or
        inst:IsA("BillboardGui") or
        inst:IsA("SurfaceGui") or
        inst:IsA("GuiBase2d")
    )
end

local function truncateWords(text, maxWords)
    local words, count = {}, 0
    for w in string.gmatch(text, "%S+") do
        count = count + 1
        if #words < maxWords then table.insert(words, w) end
    end
    local out = table.concat(words, " ")
    if count > maxWords then out = out .. " …" end
    return out
end

local function addUICorner(p, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r or 999)
    c.Parent = p
    return c
end

local function addUIStroke(p, t, tr)
    local s = Instance.new("UIStroke")
    s.Thickness = t or 1
    s.Transparency = tr or 0.25
    s.Parent = p
    return s
end

local function pushTracked(menuName, inst)
    if not TrackedUI[menuName] then TrackedUI[menuName] = {} end
    table.insert(TrackedUI[menuName], inst)
    pcall(function() inst:SetAttribute("MenuOwner", menuName) end)
end

local function startWatching(menuName)
    if WatchConn[menuName] then return end
    WatchConn[menuName] = {}
    for _,root in ipairs(GuiRoots) do
        local conn = root.DescendantAdded:Connect(function(inst)
            if isGui(inst) and not inst:IsDescendantOf(Root) then
                pushTracked(menuName, inst)
            end
        end)
        table.insert(WatchConn[menuName], conn)
    end
end

local function stopWatching(menuName)
    local arr = WatchConn[menuName]
    if not arr then return end
    for _,c in ipairs(arr) do pcall(function() c:Disconnect() end) end
    WatchConn[menuName] = nil
end

local function reCollectTagged(menuName)
    for _,root in ipairs(GuiRoots) do
        for _, inst in ipairs(root:GetDescendants()) do
            if isGui(inst) and inst:GetAttribute("MenuOwner") == menuName then
                pushTracked(menuName, inst)
            end
        end
    end
end

local function makeVisible(inst, on)
    if not (inst and inst.Parent) then return end
    if inst:IsA("ScreenGui") or inst:IsA("BillboardGui") or inst:IsA("SurfaceGui") then
        pcall(function() inst.Enabled = on end)
        -- Fallback for weird cases: toggle all GuiObjects children
        if inst.Enabled == nil then
            for _,child in ipairs(inst:GetDescendants()) do
                if child:IsA("GuiObject") then pcall(function() child.Visible = on end) end
            end
        end
    elseif inst:IsA("GuiObject") then
        pcall(function() inst.Visible = on end)
    end
end

local function setMenuUIs(menuName, on)
    reCollectTagged(menuName)
    local list = TrackedUI[menuName]
    if not list then return end
    for i = #list, 1, -1 do
        local inst = list[i]
        if not (inst and inst.Parent) then
            table.remove(list, i)
        else
            if inst:GetAttribute("MenuLoaderInternal") ~= true then
                makeVisible(inst, on)
            end
        end
    end
end

local function snapshotRoots()
    local set = {}
    for _,root in ipairs(GuiRoots) do
        for _,d in ipairs(root:GetDescendants()) do set[d] = true end
    end
    return set
end

local function diffNew(afterSet, beforeSet)
    local arr = {}
    for inst,_ in pairs(afterSet) do
        if not beforeSet[inst] and isGui(inst) and not inst:IsDescendantOf(Root) then
            table.insert(arr, inst)
        end
    end
    return arr
end

local function firstLoad(menu)
    if Loaded[menu.Name] ~= nil then return true end

    -- snapshot before
    local before = snapshotRoots()

    -- temp watchers to catch transient creations
    local tempAdded = {}
    local tempConns = {}
    for _,root in ipairs(GuiRoots) do
        local c = root.DescendantAdded:Connect(function(inst)
            if isGui(inst) and not inst:IsDescendantOf(Root) then
                table.insert(tempAdded, inst)
            end
        end)
        table.insert(tempConns, c)
    end

    local ok, ret = pcall(function()
        return loadstring(game:HttpGet(menu.Url))()
    end)

    task.wait(0.35)
    for _,c in ipairs(tempConns) do pcall(function() c:Disconnect() end) end

    if not ok then
        warn("[MenuLoader] Load error:", menu.Name, ret)
        return false
    end
    Loaded[menu.Name] = ret or true

    -- find new across all roots
    local after = {}
    for _,root in ipairs(GuiRoots) do
        for _,d in ipairs(root:GetDescendants()) do after[d] = true end
    end
    local newOnes = diffNew(after, before)

    local seen = {}
    for _,inst in ipairs(newOnes) do
        if not seen[inst] then pushTracked(menu.Name, inst); seen[inst] = true end
    end
    for _,inst in ipairs(tempAdded) do
        if isGui(inst) and not inst:IsDescendantOf(Root) and not seen[inst] then
            pushTracked(menu.Name, inst); seen[inst] = true
        end
    end

    if typeof(Loaded[menu.Name]) == "Instance" and isGui(Loaded[menu.Name]) then
        pushTracked(menu.Name, Loaded[menu.Name])
    end

    return true
end

--== EYE BUTTON (round) ==--
local Eye = Instance.new("TextButton")
Eye.Name = "Eye"
Eye.Size = UDim2.new(0, 30, 0, 30)
Eye.Position = UDim2.new(0, 20, 0, 120)
Eye.Text = "👁️"
Eye.TextSize = 18
Eye.BackgroundColor3 = Color3.fromRGB(26,26,26)
Eye.TextColor3 = Color3.new(1,1,1)
Eye.AutoButtonColor = true
Eye.ZIndex = 100
Eye.Parent = Root
Eye:SetAttribute("MenuLoaderInternal", true)
addUICorner(Eye, 999)
addUIStroke(Eye, 1, 0.25)

--== LIST FRAME ==--
local List = Instance.new("Frame")
List.Name = "List"
List.Size = UDim2.new(0, 210, 0, 0)
List.Position = Eye.Position + UDim2.new(0, 0, 0, 34)
List.BackgroundColor3 = Color3.fromRGB(18,18,18)
List.Visible = false
List.BorderSizePixel = 0
List.ClipsDescendants = true
List.ZIndex = 50
List.Parent = Root
List:SetAttribute("MenuLoaderInternal", true)
addUICorner(List, 12)
addUIStroke(List, 1, 0.35)

local Scroll = Instance.new("ScrollingFrame")
Scroll.Name = "Scroll"
Scroll.Size = UDim2.new(1, -8, 1, -8)
Scroll.Position = UDim2.new(0, 4, 0, 4)
Scroll.CanvasSize = UDim2.new(0,0,0,0)
Scroll.BackgroundTransparency = 1
Scroll.ScrollBarThickness = 4
Scroll.ZIndex = 50
Scroll.Parent = List
Scroll:SetAttribute("MenuLoaderInternal", true)

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 6)
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Parent = Scroll
Layout:SetAttribute("MenuLoaderInternal", true)

local function resizeList()
    task.defer(function()
        local h = math.clamp(Layout.AbsoluteContentSize.Y + 8, 0, 260)
        List:TweenSize(UDim2.new(0, 210, 0, h), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15, true)
        Scroll.CanvasSize = UDim2.new(0,0,0, Layout.AbsoluteContentSize.Y + 8)
    end)
end
Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(resizeList)

--== GROUP BY CATEGORY (All Game first) ==--
local Categories = {}
for _,m in ipairs(MenuList) do
    Categories[m.Category] = Categories[m.Category] or {}
    table.insert(Categories[m.Category], m)
end
local orderedCats = {}
do
    for cat,_ in pairs(Categories) do table.insert(orderedCats, cat) end
    table.sort(orderedCats, function(a,b)
        if a == "All Game" then return true end
        if b == "All Game" then return false end
        return tostring(a) < tostring(b)
    end)
end

--== INFO MODAL (center screen, compact) ==
local InfoOverlay = Instance.new("Frame")
InfoOverlay.Name = "InfoOverlay"
InfoOverlay.Size = UDim2.new(1,0,1,0)
InfoOverlay.Position = UDim2.new(0,0,0,0)
InfoOverlay.BackgroundTransparency = 1
InfoOverlay.Visible = false
InfoOverlay.ZIndex = 999
InfoOverlay.Parent = Root
InfoOverlay:SetAttribute("MenuLoaderInternal", true)

local dim = Instance.new("Frame")
dim.Name = "Dim"
dim.Size = UDim2.new(1,0,1,0)
dim.Position = UDim2.new(0,0,0,0)
dim.BackgroundColor3 = Color3.fromRGB(0,0,0)
dim.BackgroundTransparency = 1 -- start transparent
dim.ZIndex = 999
dim.Parent = InfoOverlay

local modal = Instance.new("Frame")
modal.Name = "Modal"
-- compact default size (we animate from smaller -> target)
modal.Size = UDim2.new(0, 320, 0, 140)
modal.AnchorPoint = Vector2.new(0.5, 0.5)
modal.Position = UDim2.new(0.5, 0.5, 0.5, 0)
modal.BackgroundColor3 = Color3.fromRGB(28,28,28)
modal.ZIndex = 1000
modal.Parent = InfoOverlay
addUICorner(modal, 12)
addUIStroke(modal, 1, 0.25)

-- Header: BmSkyMods + close (close is clearer "X")
local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, 32)
header.Position = UDim2.new(0,0,0,0)
header.BackgroundTransparency = 1
header.ZIndex = 1001
header.Parent = modal

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, -48, 1, 0)
title.Position = UDim2.new(0, 12, 0, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextColor3 = Color3.fromRGB(235,235,235)
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextYAlignment = Enum.TextYAlignment.Center
title.Text = "BmSkyMods"
title.ZIndex = 1002
title.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Name = "Close"
closeBtn.Size = UDim2.new(0, 34, 0, 34)
closeBtn.Position = UDim2.new(1, -44, 0, -1) -- slightly overlap to be visually prominent
closeBtn.AnchorPoint = Vector2.new(0,0)
closeBtn.Text = "X" -- clear X
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.BackgroundColor3 = Color3.fromRGB(205,70,70)
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.ZIndex = 1003
closeBtn.Parent = header
addUICorner(closeBtn, 8)
addUIStroke(closeBtn, 1, 0.2)

-- Body: script name + description (compact)
local body = Instance.new("Frame")
body.Name = "Body"
body.Size = UDim2.new(1, -24, 1, -48)
body.Position = UDim2.new(0, 12, 0, 36)
body.BackgroundTransparency = 1
body.ZIndex = 1001
body.Parent = modal

local scriptNameLabel = Instance.new("TextLabel")
scriptNameLabel.Name = "ScriptName"
scriptNameLabel.Size = UDim2.new(1, 0, 0, 22)
scriptNameLabel.Position = UDim2.new(0,0,0,0)
scriptNameLabel.BackgroundTransparency = 1
scriptNameLabel.Font = Enum.Font.GothamBold
scriptNameLabel.TextSize = 15
scriptNameLabel.TextColor3 = Color3.fromRGB(245,245,245)
scriptNameLabel.TextXAlignment = Enum.TextXAlignment.Left
scriptNameLabel.TextYAlignment = Enum.TextYAlignment.Center
scriptNameLabel.Text = ""
scriptNameLabel.ZIndex = 1002
scriptNameLabel.Parent = body

local descLabel = Instance.new("TextLabel")
descLabel.Name = "Desc"
descLabel.Size = UDim2.new(1, 0, 1, -26)
descLabel.Position = UDim2.new(0,0,0,26)
descLabel.BackgroundTransparency = 1
descLabel.Font = Enum.Font.Gotham
descLabel.TextSize = 13
descLabel.TextColor3 = Color3.fromRGB(210,210,210)
descLabel.TextXAlignment = Enum.TextXAlignment.Left
descLabel.TextYAlignment = Enum.TextYAlignment.Top
descLabel.TextWrapped = true
descLabel.Text = ""
descLabel.ZIndex = 1002
descLabel.Parent = body

-- helper show/hide modal with tween (compact)
local function showInfoModal(menu)
    if not menu then return end
    scriptNameLabel.Text = menu.Name or ""
    descLabel.Text = menu.Desc or ""
    InfoOverlay.Visible = true

    -- initial visual states
    dim.BackgroundTransparency = 1
    modal.Size = UDim2.new(0, 280, 0, 120)
    modal.Position = UDim2.new(0.5, 0, 0.5, 12)
    modal.Rotation = -6
    modal.BackgroundTransparency = 1

    -- tween dim
    local t1 = TweenService:Create(dim, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.55})
    t1:Play()
    -- tween modal to compact target (centered)
    local tprops = {
        BackgroundTransparency = 0,
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Rotation = 0,
        Size = UDim2.new(0, 360, 0, 160),
    }
    local t2 = TweenService:Create(modal, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out), tprops)
    t2:Play()
end

local function hideInfoModal()
    if not InfoOverlay.Visible then return end
    local t1 = TweenService:Create(dim, TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 1})
    t1:Play()
    local t2 = TweenService:Create(modal, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        BackgroundTransparency = 1,
        Position = UDim2.new(0.5, 0, 0.5, 10),
        Rotation = 6,
        Size = UDim2.new(0, 300, 0, 120),
    })
    t2:Play()
    t2.Completed:Connect(function()
        InfoOverlay.Visible = false
    end)
end

closeBtn.MouseButton1Click:Connect(hideInfoModal)
dim.InputBegan:Connect(function(ix)
    if ix.UserInputType == Enum.UserInputType.MouseButton1 or ix.UserInputType == Enum.UserInputType.Touch then
        hideInfoModal()
    end
end)

--== UI BUILDERS ==--

-- detail card inside category: minimal display + buttons under title
local function createMenuItem(menu, parent, categoryExpandFrame, catLayout)
    local card = Instance.new("Frame")
    card.Name = "Item_"..menu.Name
    card.Size = UDim2.new(1, -10, 0, 76) -- make room for title + button row
    card.BackgroundColor3 = Color3.fromRGB(32,32,32)
    card.BorderSizePixel = 0
    card.ZIndex = 51
    card.Parent = parent
    addUICorner(card, 10)
    addUIStroke(card, 1, 0.2)
    card:SetAttribute("MenuLoaderInternal", true)

    -- Title label (top)
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(1, -24, 0, 28)
    title.Position = UDim2.new(0, 12, 0, 8)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 14
    title.TextColor3 = Color3.fromRGB(235,235,235)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextYAlignment = Enum.TextYAlignment.Center
    title.Text = truncateWords(menu.Name or "", 6)
    title.Parent = card
    title.ZIndex = 52

    -- Footer/Buttons row (under title)
    local footer = Instance.new("Frame")
    footer.Name = "Footer"
    footer.Size = UDim2.new(1, -24, 0, 30)
    footer.Position = UDim2.new(0, 12, 0, 40)
    footer.BackgroundTransparency = 1
    footer.BorderSizePixel = 0
    footer.ZIndex = 53
    footer.Parent = card

    local footerLayout = Instance.new("UIListLayout")
    footerLayout.FillDirection = Enum.FillDirection.Horizontal
    footerLayout.SortOrder = Enum.SortOrder.LayoutOrder
    footerLayout.Padding = UDim.new(0, 8)
    footerLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    footerLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    footerLayout.Parent = footer

    -- Show/Hide toggle (left)
    local toggle = Instance.new("TextButton")
    toggle.Name = "Toggle"
    toggle.Size = UDim2.new(0, 68, 0, 28)
    toggle.BackgroundColor3 = Color3.fromRGB(65, 180, 95)
    toggle.Font = Enum.Font.GothamBold
    toggle.TextSize = 12
    toggle.Text = "Show"
    toggle.TextColor3 = Color3.new(1,1,1)
    toggle.ZIndex = 54
    toggle.Parent = footer
    addUICorner(toggle, 8)
    addUIStroke(toggle, 1, 0.18)

    -- Info button (to the right of Show) - use "¡" per request
    local infoBtn = Instance.new("TextButton")
    infoBtn.Name = "Info"
    infoBtn.Size = UDim2.new(0, 28, 0, 28)
    infoBtn.BackgroundColor3 = Color3.fromRGB(90,90,90) -- circular grey
    infoBtn.Font = Enum.Font.GothamBold
    infoBtn.TextSize = 16
    infoBtn.Text = "¡" -- per your example
    infoBtn.TextColor3 = Color3.fromRGB(255,255,255)
    infoBtn.ZIndex = 54
    infoBtn.Parent = footer
    addUICorner(infoBtn, 999)
    addUIStroke(infoBtn, 1, 0.18)

    Visible[menu.Name] = false

    -- Info click => show compact center modal
    infoBtn.MouseButton1Click:Connect(function()
        showInfoModal(menu)
    end)

    -- Show/Hide logic (unchanged behavior)
    toggle.MouseButton1Click:Connect(function()
        if Loaded[menu.Name] == nil then
            if not firstLoad(menu) then return end
        end

        Visible[menu.Name] = not Visible[menu.Name]
        local on = Visible[menu.Name]

        if on then
            toggle.Text = "Hide"
            toggle.BackgroundColor3 = Color3.fromRGB(205, 70, 70) -- red
            setMenuUIs(menu.Name, true)     -- show all tracked UIs
            startWatching(menu.Name)        -- track any new UI created while visible
        else
            toggle.Text = "Show"
            toggle.BackgroundColor3 = Color3.fromRGB(65, 180, 95) -- green
            stopWatching(menu.Name)         -- stop live tracking
            setMenuUIs(menu.Name, false)    -- hide everything belonging to this menu
        end
    end)
end

-- Category pill (title truncated to 5 words + …). Clicking expands to reveal items.
local function createCategory(catName, menus)
    local pill = Instance.new("TextButton")
    pill.Size = UDim2.new(1, -10, 0, 28)
    pill.Text = "  " .. truncateWords(catName, 5)
    pill.Font = Enum.Font.GothamBold
    pill.TextSize = 14
    pill.TextColor3 = Color3.new(1,1,1)
    pill.BackgroundColor3 = Color3.fromRGB(34,34,34)
    pill.ZIndex = 51
    pill.Parent = Scroll
    addUICorner(pill, 999)
    addUIStroke(pill, 1, 0.2)

    local expand = Instance.new("Frame")
    expand.Size = UDim2.new(1, -10, 0, 0)
    expand.BackgroundColor3 = Color3.fromRGB(24,24,24)
    expand.BorderSizePixel = 0
    expand.ClipsDescendants = true
    expand.Visible = false
    expand.ZIndex = 50
    expand.Parent = Scroll
    addUICorner(expand, 12)
    addUIStroke(expand, 1, 0.15)

    local vLayout = Instance.new("UIListLayout")
    vLayout.Padding = UDim.new(0, 6)
    vLayout.SortOrder = Enum.SortOrder.LayoutOrder
    vLayout.Parent = expand

    -- Build items
    for _,m in ipairs(menus) do
        createMenuItem(m, expand, expand, vLayout)
    end

    -- Auto-resize expanded height to content
    local function updateExpandHeight()
        if expand.Visible then
            local target = vLayout.AbsoluteContentSize.Y + 8
            expand:TweenSize(UDim2.new(1, -10, 0, target), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.16, true)
            -- update parent list size too
            resizeList()
        end
    end
    vLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateExpandHeight)

    pill.MouseButton1Click:Connect(function()
        local opening = not expand.Visible or expand.Size.Y.Offset == 0
        if opening then
            expand.Visible = true
            task.wait() -- let layout compute
            local target = vLayout.AbsoluteContentSize.Y + 8
            expand:TweenSize(UDim2.new(1, -10, 0, target), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.18, true)
            -- ensure outer list resizes after expand
            task.delay(0.20, resizeList)
        else
            expand:TweenSize(UDim2.new(1, -10, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.18, true, function()
                expand.Visible = false
                resizeList()
            end)
        end
    end)
end

-- Build UI in category order
for _,cat in ipairs(orderedCats) do
    createCategory(cat, Categories[cat])
end
-- ensure list sized initially after build
task.defer(resizeList)

--== Toggle list with Eye ==--
Eye.MouseButton1Click:Connect(function()
    List.Visible = not List.Visible
    if List.Visible then
        resizeList()
    end
end)

--== Drag Eye (mobile/pc) + follow list ==--
do
    local dragging, dragStartPos, startPos
    local function begin(input)
        dragging = true
        dragStartPos = input.Position
        startPos = Eye.Position
    end
    local function ended() dragging = false end

    Eye.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            begin(input)
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if not dragging then return end
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStartPos
            local newPos = UDim2.new(0, startPos.X.Offset + delta.X, 0, startPos.Y.Offset + delta.Y)
            Eye.Position = newPos
            List.Position = newPos + UDim2.new(0, 0, 0, 34)
        end
    end)

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            ended()
        end
    end)
end
