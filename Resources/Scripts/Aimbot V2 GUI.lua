--// Cache

local loadstring, game, getgenv, setclipboard = loadstring, game, getgenv, setclipboard

--// Loaded check

if getgenv().Aimbot then return end

--// Load Aimbot V2 (Raw)

loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V2/main/Resources/Scripts/Raw%20Main.lua"))()

--// Variables

local Aimbot = getgenv().Aimbot
local Settings, FOVSettings, Functions = Aimbot.Settings, Aimbot.FOVSettings, Aimbot.Functions

local Library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)() -- Pepsi's UI Library

local Parts = {"Head", "HumanoidRootPart", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm", "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg", "UpperTorso", "LeftUpperLeg", "RightFoot", "RightLowerLeg", "LowerTorso", "RightUpperLeg"}

--// Frame

Library.UnloadCallback = Functions.Exit

local MainFrame = Library:CreateWindow({
	Name = "Universal Hacks",
	Themeable = {
		Image = "7059346386",
		Info = "Made by Jbito1234 and Exunys\nPowered by Pepsi's UI Library",
		Credit = false
	},
	Background = "",
	Theme = [[{"__Designer.Colors.section":"ADC7FF","__Designer.Colors.topGradient":"1B242F","__Designer.Settings.ShowHideKey":"Enum.KeyCode.RightShift","__Designer.Colors.otherElementText":"54637D","__Designer.Colors.hoveredOptionBottom":"38667D","__Designer.Background.ImageAssetID":"","__Designer.Colors.unhoveredOptionTop":"407495","__Designer.Colors.innerBorder":"2C4168","__Designer.Colors.unselectedOption":"4E6EA0","__Designer.Background.UseBackgroundImage":true,"__Designer.Files.WorkspaceFile":"Aimbot V2","__Designer.Colors.main":"23A0FF","__Designer.Colors.outerBorder":"162943","__Designer.Background.ImageColor":"FFFFFF","__Designer.Colors.tabText":"C9DFF1","__Designer.Colors.elementBorder":"111D26","__Designer.Colors.sectionBackground":"0E141C","__Designer.Colors.selectedOption":"558AC2","__Designer.Colors.background":"11182A","__Designer.Colors.bottomGradient":"202B42","__Designer.Background.ImageTransparency":95,"__Designer.Colors.hoveredOptionTop":"4885A0","__Designer.Colors.elementText":"7692B8","__Designer.Colors.unhoveredOptionBottom":"5471C4"}]]
})

--// Tabs

local SettingsTab = MainFrame:CreateTab({
	Name = "FPS Hacks"
})

local AllHacksTab = MainFrame:CreateTab({
	Name = "All Hacks"
})

local RoleplayHacksTab = MainFrame:CreateTab({
	Name = "Roleplay Hacks"
})

local FunctionsTab = MainFrame:CreateTab({
	Name = "Functions"
})

--// Settings - Sections

local Values = SettingsTab:CreateSection({
	Name = "Values"
})

local Checks = SettingsTab:CreateSection({
	Name = "Checks"
})

local ThirdPerson = SettingsTab:CreateSection({
	Name = "Third Person"
})

--// FOV Settings - Sections

local FOV_Values = SettingsTab:CreateSection({
	Name = "Values"
})

local FOV_Appearance = SettingsTab:CreateSection({
	Name = "Appearance"
})

--// Functions - Sections

local FunctionsSection = FunctionsTab:CreateSection({
	Name = "Functions"
})

--// Settings / Values

Values:AddToggle({
	Name = "Enabled",
	Value = Settings.Enabled,
	Callback = function(New, Old)
		Settings.Enabled = New
	end
}).Default = Settings.Enabled

Values:AddToggle({
	Name = "Toggle",
	Value = Settings.Toggle,
	Callback = function(New, Old)
		Settings.Toggle = New
	end
}).Default = Settings.Toggle

Settings.LockPart = Parts[1]; Values:AddDropdown({
	Name = "Lock Part",
	Value = Parts[1],
	Callback = function(New, Old)
		Settings.LockPart = New
	end,
	List = Parts,
	Nothing = "Head"
}).Default = Parts[1]

Values:AddTextbox({ -- Using a Textbox instead of a Keybind because the UI Library doesn't support Mouse inputs like Left Click / Right Click...
	Name = "Hotkey",
	Value = Settings.TriggerKey,
	Callback = function(New, Old)
		Settings.TriggerKey = New
	end
}).Default = Settings.TriggerKey

--[[
Values:AddKeybind({
	Name = "Hotkey",
	Value = Settings.TriggerKey,
	Callback = function(New, Old)
		Settings.TriggerKey = stringmatch(tostring(New), "Enum%.[UserInputType]*[KeyCode]*%.(.+)")
	end,
}).Default = Settings.TriggerKey
]]

Values:AddSlider({
	Name = "Sensitivity",
	Value = Settings.Sensitivity,
	Callback = function(New, Old)
		Settings.Sensitivity = New
	end,
	Min = 0,
	Max = 1,
	Decimals = 2
}).Default = Settings.Sensitivity

--// Settings / Checks

Checks:AddToggle({
	Name = "Team Check",
	Value = Settings.TeamCheck,
	Callback = function(New, Old)
		Settings.TeamCheck = New
	end
}).Default = Settings.TeamCheck

Checks:AddToggle({
	Name = "Wall Check",
	Value = Settings.WallCheck,
	Callback = function(New, Old)
		Settings.WallCheck = New
	end
}).Default = Settings.WallCheck

Checks:AddToggle({
	Name = "Alive Check",
	Value = Settings.AliveCheck,
	Callback = function(New, Old)
		Settings.AliveCheck = New
	end
}).Default = Settings.AliveCheck

--// Settings / ThirdPerson

ThirdPerson:AddToggle({
	Name = "Enable Third Person",
	Value = Settings.ThirdPerson,
	Callback = function(New, Old)
		Settings.ThirdPerson = New
	end
}).Default = Settings.ThirdPerson

ThirdPerson:AddSlider({
	Name = "Sensitivity",
	Value = Settings.ThirdPersonSensitivity,
	Callback = function(New, Old)
		Settings.ThirdPersonSensitivity = New
	end,
	Min = 0.1,
	Max = 5,
	Decimals = 1
}).Default = Settings.ThirdPersonSensitivity

--// FOV Settings / Values

FOV_Values:AddToggle({
	Name = "Enabled",
	Value = FOVSettings.Enabled,
	Callback = function(New, Old)
		FOVSettings.Enabled = New
	end
}).Default = FOVSettings.Enabled

FOV_Values:AddToggle({
	Name = "Visible",
	Value = FOVSettings.Visible,
	Callback = function(New, Old)
		FOVSettings.Visible = New
	end
}).Default = FOVSettings.Visible

FOV_Values:AddSlider({
	Name = "Amount",
	Value = FOVSettings.Amount,
	Callback = function(New, Old)
		FOVSettings.Amount = New
	end,
	Min = 10,
	Max = 300
}).Default = FOVSettings.Amount

--// FOV Settings / Appearance

FOV_Appearance:AddToggle({
	Name = "Filled",
	Value = FOVSettings.Filled,
	Callback = function(New, Old)
		FOVSettings.Filled = New
	end
}).Default = FOVSettings.Filled

FOV_Appearance:AddSlider({
	Name = "Transparency",
	Value = FOVSettings.Transparency,
	Callback = function(New, Old)
		FOVSettings.Transparency = New
	end,
	Min = 0,
	Max = 1,
	Decimal = 1
}).Default = FOVSettings.Transparency

FOV_Appearance:AddSlider({
	Name = "Sides",
	Value = FOVSettings.Sides,
	Callback = function(New, Old)
		FOVSettings.Sides = New
	end,
	Min = 3,
	Max = 60
}).Default = FOVSettings.Sides

FOV_Appearance:AddSlider({
	Name = "Thickness",
	Value = FOVSettings.Thickness,
	Callback = function(New, Old)
		FOVSettings.Thickness = New
	end,
	Min = 1,
	Max = 50
}).Default = FOVSettings.Thickness

FOV_Appearance:AddColorpicker({
	Name = "Color",
	Value = FOVSettings.Color,
	Callback = function(New, Old)
		FOVSettings.Color = New
	end
}).Default = FOVSettings.Color

FOV_Appearance:AddColorpicker({
	Name = "Locked Color",
	Value = FOVSettings.LockedColor,
	Callback = function(New, Old)
		FOVSettings.LockedColor = New
	end
}).Default = FOVSettings.LockedColor

--// Functions / Functions

FunctionsSection:AddButton({
	Name = "Reset Settings",
	Callback = function()
		Functions.ResetSettings()
		Library.ResetAll()
	end
})

FunctionsSection:AddButton({
	Name = "Restart",
	Callback = Functions.Restart
})

FunctionsSection:AddButton({
	Name = "Exit",
	Callback = function()
		Functions:Exit()
		Library.Unload()
	end
})

FunctionsSection:AddButton({
	Name = "Copy Script Page",
	Callback = function()
		setclipboard("https://github.com/Exunys/Aimbot-V2")
	end
})

local function ResetWallhackSettings()
  Settings.WallhackOutlineColor = Color3.fromRGB(255,0,0)
  Settings.WallhackFillColor = Color3.fromRGB(255,0,0)
  Settings.WallhackOutlineTransparency = 0
  Settings.WallhackFillTransparency = 0.9
end

local WallhackSection = SettingsTab:CreateSection({
	Name = "Wallhack"
})

WallhackSection:AddToggle({
	Name = "Wallhack",
	Value = Settings.WallhackEnabled,
	Callback = function(New, Old)
		Settings.WallhackEnabled = New
	end
}).Default = Settings.WallhackEnabled

WallhackSection:AddColorpicker({
	Name = "OutlineColor",
	Value = Settings.WallhackOutlineColor,
	Callback = function(New, Old)
		Settings.WallhackOutlineColor = New
	end
}).Default = Settings.WallhackOutlineColor

WallhackSection:AddColorpicker({
	Name = "FillColor",
	Value = Settings.WallhackFillColor,
	Callback = function(New, Old)
		Settings.WallhackFillColor = New
	end
}).Default = Settings.WallhackFillColor

WallhackSection:AddSlider({
	Name = "OutlineTransparency",
	Value = Settings.OutlineTransparency,
	Callback = function(New, Old)
		Settings.OutlineTransparency = New
	end,
	Min = 0,
	Max = 1,
    Decimals = 2
}).Default = Settings.OutlineTransparency

WallhackSection:AddSlider({
	Name = "FillTransparency",
	Value = Settings.WallhackFillTransparency,
	Callback = function(New, Old)
		Settings.WallhackFillTransparency = New
	end,
	Min = 0,
	Max = 1,
    Decimals = 2
}).Default = Settings.WallhackFillTransparency

WallhackSection:AddButton({
	Name = "Reset Wallhack Settings",
	Callback = function()
		ResetWallhackSettings()
	end
})

while task.wait(0.1) do
    for _, WallhackPlayer in ipairs(Players:GetPlayers()) do
        if WallhackPlayer ~= LocalPlayer then
            local WallhackCharacter = WallhackPlayer.Character or WallhackPlayer.CharacterAdded:Wait()

            if WallhackCharacter then
                for _, WallhackHighlight in ipairs(WallhackCharacter:GetChildren()) do
                    if WallhackHighlight:IsA("Highlight") and WallhackHighlight.Name ~= "WallhackHighlight777" then
                        WallhackHighlight:Destroy()
                    elseif WallhackHighlight:IsA("Highlight") and WallhackHighlight.Name == "WallhackHighlight777" and not WallhackCharacter:FindFirstChild("WallhackHighlight777") then
                        local NewWallhackHighlight = Instance.new("Highlight")
                        NewWallhackHighlight.Name = "WallhackHighlight777"
                        NewWallhackHighlight.Parent = WallhackCharacter
                        NewWallhackHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        NewWallhackHighlight.Adornee = WallhackCharacter
                        NewWallhackHighlight.FillColor = Settings.WallhackFillColor
                        NewWallhackHighlight.OutlineColor = Settings.WallhackOutlineColor
                        NewWallhackHighlight.OutlineTransparency = Settings.WallhackOutlineTransparency
                        NewWallhackHighlight.FillTransparency = Settings.WallhackFillTransparency
                    elseif WallhackHighlight:IsA("Highlight") and WallhackHighlight.Name == "WallhackHighlight777" then
                        local NewWallhackHighlight = WallhackCharacter:FindFirstChild("WallhackHighlight777")
                        NewWallhackHighlight.FillColor = Color3.fromRGB(Settings.WallhackFillColor)
                        NewWallhackHighlight.OutlineColor = Color3.fromRGB(Settings.WallhackOutlineColor)
                        NewWallhackHighlight.OutlineTransparency = Settings.WallhackOutlineTransparency
                        NewWallhackHighlight.FillTransparency = Settings.WallhackFillTransparency
                    end
                end
            end
        end
    end
end

-- All Hacks/Roleplay Hacks
local PlayerProperties = SettingsTab:CreateSection({
	Name = "Player Properties"
})

local Float = SettingsTab:CreateSection({
	Name = "Float"
})

local Noclip = SettingsTab:CreateSection({
	Name = "Noclip"
})

local PlayAnimation = RoleplayHacksTab:CreateSection({
	Name = "Play Animation"
})

local PlaySound = RoleplayHacksTab:CreateSection({
	Name = "Play Sound"
})

PlayerProperties:AddSlider({
	Name = "FOV",
	Value = Settings.FOV,
	Callback = function(New, Old)
		Settings.FOV = New
	end,
	Min = 1,
	Max = 120,
    Decimals = 0
}).Default = Settings.FOV

PlayerProperties:AddTextbox({
	Name = "Walk Speed",
	Value = Settings.WalkSpeed,
	Callback = function(New, Old)
		Settings.WalkSpeed = New
	end
}).Default = Settings.WalkSpeed

PlayerProperties:AddTextbox({
	Name = "Jump Height",
	Value = Settings.JumpHeight,
	Callback = function(New, Old)
		Settings.JumpHeight = New
	end
}).Default = Settings.JumpHeight

Float:AddToggle({
	Name = "Float Enabled",
	Value = Settings.FloatEnabled,
	Callback = function(New, Old)
		Settings.FloatEnabled = New
	end
}).Default = Settings.FloatEnabled

Float:AddTextbox({
	Name = "Float Speed",
	Value = Settings.FloatSpeed,
	Callback = function(New, Old)
		Settings.FloatSpeed = New
	end
}).Default = Settings.FloatSpeed

Float:AddToggle({
	Name = "Auto Activate Noclip",
	Value = Settings.AutoActivateNoclip,
	Callback = function(New, Old)
		Settings.AutoActivateNoclip = New
	end
}).Default = Settings.AutoActivateNoclip

Noclip:AddToggle({
	Name = "Noclip Enabled",
	Value = Settings.NoclipEnabled,
	Callback = function(New, Old)
		Settings.NoclipEnabled = New
	end
}).Default = Settings.NoclipEnabled

PlayAnimation:AddTextbox({
	Name = "Animation Id",
	Value = Settings.AnimationId,
	Callback = function(New, Old)
		Settings.AnimationId = New
	end
}).Default = Settings.AnimationId

PlayAnimation:AddSlider({
	Name = "Animation Time Position",
	Value = Settings.AnimationTimePosition,
	Callback = function(New, Old)
		Settings.AnimationTimePosition = New
	end,
	Min = 0,
	Max = 1,
    Decimals = 3
}).Default = Settings.AnimationTimePosition

PlayAnimation:AddSlider({
	Name = "Animation Weight",
	Value = Settings.AnimationWeight,
	Callback = function(New, Old)
		Settings.AnimationWeight = New
	end,
	Min = 0,
	Max = 1,
    Decimals = 2
}).Default = Settings.AnimationWeight

PlayAnimation:AddTextbox({
	Name = "Animation Speed",
	Value = Settings.AnimationSpeed,
	Callback = function(New, Old)
        if New < 0 then
            Settings.AnimationSpeed = Old
        else
            Settings.AnimationSpeed = New
        end
	end
}).Default = Settings.AnimationSpeed

-- Sound
PlayAnimation:AddTextbox({
	Name = "Sound Id",
	Value = Settings.SoundId,
	Callback = function(New, Old)
		Settings.SoundId = New
	end
}).Default = Settings.SoundId

PlayAnimation:AddSlider({
	Name = "Sound Time Position",
	Value = Settings.SoundTimePosition,
	Callback = function(New, Old)
		Settings.SoundTimePosition = New
	end,
	Min = 0,
	Max = 1,
    Decimals = 3
}).Default = Settings.SoundTimePosition

PlayAnimation:AddSlider({
	Name = "Sound Volume",
	Value = Settings.SoundVolume,
	Callback = function(New, Old)
		Settings.SoundVolume = New
	end,
	Min = 0,
	Max = 10,
    Decimals = 1
}).Default = Settings.SoundVolume

PlayAnimation:AddTextbox({
	Name = "Sound Speed",
	Value = Settings.SoundSpeed,
	Callback = function(New, Old)
        if New < 0 then
            Settings.SoundSpeed = Old
        else
            Settings.SoundSpeed = New
        end
	end
}).Default = Settings.SoundSpeed