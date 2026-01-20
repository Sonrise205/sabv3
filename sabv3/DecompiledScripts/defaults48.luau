local v0 = game and Enum or require("test/mock").Enum;
local v1 = game and Color3 or require("test/mock").Color3;
local v2 = game and Vector3 or require("test/mock").Vector3;
return {
    Part = {
        Material = v0.Material.SmoothPlastic, 
        Size = v2.new(1, 1, 1), 
        Anchored = true
    }, 
    BillboardGui = {
        ResetOnSpawn = false, 
        ZIndexBehavior = v0.ZIndexBehavior.Sibling
    }, 
    CanvasGroup = nil, 
    Frame = {
        BackgroundColor3 = v1.new(1, 1, 1), 
        BorderColor3 = v1.new(0, 0, 0), 
        BorderSizePixel = 0
    }, 
    ImageButton = {
        BackgroundColor3 = v1.new(1, 1, 1), 
        BorderColor3 = v1.new(0, 0, 0), 
        BorderSizePixel = 0, 
        AutoButtonColor = false
    }, 
    ImageLabel = {
        BackgroundColor3 = v1.new(1, 1, 1), 
        BorderColor3 = v1.new(0, 0, 0), 
        BorderSizePixel = 0
    }, 
    ScreenGui = {
        ResetOnSpawn = false, 
        ZIndexBehavior = v0.ZIndexBehavior.Sibling
    }, 
    ScrollingFrame = {
        BackgroundColor3 = v1.new(1, 1, 1), 
        BorderColor3 = v1.new(0, 0, 0), 
        BorderSizePixel = 0, 
        ScrollBarImageColor3 = v1.new(0, 0, 0)
    }, 
    SurfaceGui = {
        ResetOnSpawn = false, 
        ZIndexBehavior = v0.ZIndexBehavior.Sibling, 
        PixelsPerStud = 50, 
        SizingMode = v0.SurfaceGuiSizingMode.PixelsPerStud
    }, 
    TextBox = {
        BackgroundColor3 = v1.new(1, 1, 1), 
        BorderColor3 = v1.new(0, 0, 0), 
        BorderSizePixel = 0, 
        ClearTextOnFocus = false, 
        Font = v0.Font.SourceSans, 
        Text = "", 
        TextColor3 = v1.new(0, 0, 0)
    }, 
    TextButton = {
        BackgroundColor3 = v1.new(1, 1, 1), 
        BorderColor3 = v1.new(0, 0, 0), 
        BorderSizePixel = 0, 
        AutoButtonColor = false, 
        Font = v0.Font.SourceSans, 
        Text = "", 
        TextColor3 = v1.new(0, 0, 0)
    }, 
    TextLabel = {
        BackgroundColor3 = v1.new(1, 1, 1), 
        BorderColor3 = v1.new(0, 0, 0), 
        BorderSizePixel = 0, 
        Font = v0.Font.SourceSans, 
        Text = "", 
        TextColor3 = v1.new(0, 0, 0)
    }, 
    UIListLayout = {
        SortOrder = v0.SortOrder.LayoutOrder
    }, 
    UIGridLayout = {
        SortOrder = v0.SortOrder.LayoutOrder
    }, 
    UITableLayout = {
        SortOrder = v0.SortOrder.LayoutOrder
    }, 
    UIPageLayout = {
        SortOrder = v0.SortOrder.LayoutOrder
    }, 
    VideoFrame = {
        BackgroundColor3 = v1.new(1, 1, 1), 
        BorderColor3 = v1.new(0, 0, 0), 
        BorderSizePixel = 0
    }, 
    ViewportFrame = {
        BackgroundColor3 = v1.new(1, 1, 1), 
        BorderColor3 = v1.new(0, 0, 0), 
        BorderSizePixel = 0
    }
};