--------------------------------------
--           [TR HUD]               --
--                                  --
--       Made by TheRollmops        --
--                                  --
--  You do not have permission to   --
--  modify and / or take ownership  --
--          of my work              --
--------------------------------------

--[          Version 1.2           ]--

TRHUD = {}

-- Config start here:

TRHUD.DGlobal = true -- Enable TR HUD (!Need Restart for Server Side!).

-- Enable 
TRHUD.MainHUD = true -- Enable the Main HUD (Health, Armor, Job, Wallet, PM or Picture,...)(!Need a restart for the Client Side!).
TRHUD.AmmoHUD = true -- Enable the Ammo HUD.    
TRHUD.NameHUD = true -- Enable the Name HUD (This is the HUD above the player).
TRHUD.AgendaHUD = true -- Enable the Agenda HUD.
TRHUD.LockdownHUD = true -- Enable the Lockdown HUD. 
TRHUD.DeathScreen = false -- Enable the Death Screen. By default the deathscreen is disabled, but if you don't have TR DSC, you can set it to true.
TRHUD.VoiceChatHUD = true -- Enable the Voice Chat HUD (This is the hud that appears when you speak).

-- Color 
TRHUD.HealthColor = Color(239, 53, 44, 255) -- Choose a color for the health bar (r, g, b, a). 
TRHUD.ArmorColor = Color(44, 156, 239, 255) -- Choose a color for the armor bar (r, g, b, a).
TRHUD.HungerColor = Color(240, 174, 42, 255) -- Choose a color for the hunger bar (r, g, b, a).
TRHUD.HUDBoxColor = Color(26, 26, 26, 255) -- Choose a color for the HUD (r, g, b, a).
TRHUD.HUDNameColor = Color(26, 26, 26, 240) -- Choose a color for the HUD (r, g, b, a).
TRHUD.IconColorWDis = Color(67, 67, 67, 255) -- Choose a color for the disable icon (This will act as a layer)(r, g, b, a).
TRHUD.BackgroundAg = Color(80, 80, 80, 255) -- Choose a color for the ".........." on the agenda (r, g, b, a).
TRHUD.DeathScreenT = Color(255, 255, 255, 255) --Choose a color for the Text of Death Screen (r, g, b, a).

-- Other
TRHUD.ServerName = "Server Name" -- Your Server Name.
TRHUD.LangSelect = "en" -- Choose between English or French (en or fr). Nevertheless you can create your own language in the Language Category.
TRHUD.Currency = "$" -- Choose your currency (exemple: €, $, £, ...).
TRHUD.TypeIcon = "Avatar" -- Choose between a view your PlayerModel or your Steam Avatar (Avatar or  ̶PlayerModel). 
                        
-- Language
TRHUD.Lang = {
--  You can create a new language like this:
--  ["ex"] = {
--      ["lockdown"] = "Exemple1",
--      ["lockdown"] = "Exemple2",
--      ["lockdown_text1"] = "Exemple3",
--      ["lockdown_text2"] = "Exemple4",
--      ["death"] = "Exemple5",
--      ["speaking"] = "Exemple6"
--  },
--  After replace TRHUD.LangSelect to "ex" or other.
    ["en"] = {
        ["lockdown"] = "Lockdown",
        ["lockdown_text1"] = "The mayor has initiated a Lockdown",
        ["lockdown_text2"] = "please return to your homes!",
        ["death"] = "You are unconscious!",
        ["speaking"] = "You are speaking!"
    },
    ["fr"] = {
        ["lockdown"] = "Couvre-feu",
        ["lockdown_text1"] = "Le maire a démarré un Couvre-feu",
        ["lockdown_text2"] = "veuillez retourner chez vous!",
        ["death"] = "Vous êtes inconscient!",
        ["speaking"] = "Tu es en train de parler!"
    } 
}