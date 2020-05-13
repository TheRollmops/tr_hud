--------------------------------------
--           [TR HUD]               --
--                                  --
--       Made by TheRollmops        --
--                                  --
--  You do not have permission to   --
--  modify and / or take ownership  --
--          of my work              --
--------------------------------------

--[          Version 1.1           ]--

local version = "1.1"

util.AddNetworkString("ErrorGamemode")
util.AddNetworkString("ErrorTypeIcon")
if not TRHUD.DGlobal then return end -- Disable Global
MsgN("[TR HUD] Loading...")
resource.AddFile("materials/therollmops/hud/32x/hud_wallet.png")
resource.AddFile("materials/therollmops/hud/32x/hud_job.png")
resource.AddFile("materials/therollmops/hud/32x/hud_wanted.png")
resource.AddFile("materials/therollmops/hud/32x/hud_licence.png")
resource.AddFile("materials/therollmops/hud/32x/hud_health.png")
resource.AddFile("materials/therollmops/hud/32x/hud_armor.png")
resource.AddFile("materials/therollmops/hud/32x/hud_hunger.png")
resource.AddFile("materials/therollmops/hud/32x/hud_ammo.png")
resource.AddFile("materials/therollmops/hud/32x/hud_agenda.png")
resource.AddFile("materials/therollmops/hud/32x/hud_info.png")
resource.AddFile("materials/therollmops/hud/32x/hud_speaking.png")
resource.AddFile("resource/fonts/bebasneue.otf")
MsgN("[TR HUD] Loading Succesful.")
MsgN("[TR HUD] Version: "..version)

-- Errors

net.Receive("ErrorGamemode", function(len)
    Error("[TR HUD] [ERROR]: The Gamemode of your server is not compatible with TR HUD, please take DarkRP Gamemode!\n")
end)

net.Receive("ErrorTypeIcon", function(len)    
    Error("[TR HUD] [ERROR]: TRHUD.TypeIcon, which can be found in the config file, is not properly configured!\n")
end)
