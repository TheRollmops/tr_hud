--------------------------------------
--           [TR HUD]               --
--                                  --
--       Made by TheRollmops        --
--                                  --
--  You do not have permission to   --
--  modify and / or take ownership  --
--          of my work              --
--------------------------------------

-- Create a font
surface.CreateFont( "TRHUDFFont", {
	font = "Bebas Neue", 
	extended = false,
	size = 27.5,
	weight = 750,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})
surface.CreateFont( "TRHUDFFontB", {
	font = "Bebas Neue", 
	extended = false,
	size = 65,
	weight = 750,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})
surface.CreateFont( "TRHUDFFontL", {
	font = "Bebas Neue", 
	extended = false,
	size = 30,
	weight = 375,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})
surface.CreateFont( "TRHUDFFontA", {
	font = "Bebas Neue",
	extended = false,
	size = 21,
	weight = 375,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})
-- Check the Gamemode
function CheckGamemode()
    local namegamemode = gmod.GetGamemode().Name
    if namegamemode != "DarkRP" then
        timer.Simple(3, function()
            Error("[TR HUD] [ERROR]: The Gamemode of your server is not compatible with TR HUD, please take DarkRP Gamemode!\n")
            net.Start("ErrorGamemode")
            net.SendToServer()
        end)
    end
end
hook.Add("Initialize", "CheckGamemodeDrawHUD", CheckGamemode)
        
-- Disable HUD of GMOD
local hideHUD = {
    ["CHudHealth"] = true,
    ["CHudBattery"] = true,
    ["CHudAmmo"] = true,
    ["CHudSecondaryAmmo"] = true,
    ["DarkRP_LocalPlayerHUD"] = true,
    ["DarkRP_Agenda"] = true,
    ["DarkRP_LockdownHUD"] = true,
    ["DarkRP_Hungermod"] = true,
    ["DarkRP_ArrestedHUD"] = true,
    ["DarkRP_Hungermod"] = true,
    ["DarkRP_EntityDisplay"] = true,
    ["DarkRP_LockdownHUD"] = true,
    ["DarkRP_ChatReceivers"] = true,
}
function Hide(name)
    if ( hideHUD[ name ] ) then return false end
end
hook.Add( "HUDShouldDraw", "HideHUD", Hide )

-- Create a New HUD 
function MainHUD()
    local ply = LocalPlayer()
    if not ply:Alive() or not TRHUD.MainHUD then return end
    -- Hunger, Health and Armor
    local health = ply:Health()
    local armor = ply:Armor()
    local hunger = ply:getDarkRPVar("Energy")
    if not DarkRP.disabledDefaults["modules"]["hungermod"] then
        draw.RoundedBox( 0, 137.5, ScrH() - 167.5, 30, 30, TRHUD.HUDBoxColor)
        draw.RoundedBox( 0, 175, ScrH() - 167.5, 147.5, 30, TRHUD.HUDBoxColor)
        surface.SetMaterial(Material("materials/therollmops/hud/32x/hud_health.png"))
        surface.SetDrawColor(255, 255, 255, 255)
        surface.DrawTexturedRect(136.5, ScrH() - 168.5, 32, 32)
        if health <= 100 then
            draw.RoundedBox( 0, 175, ScrH() - 167.5, health * 1.475, 30, TRHUD.HealthColor)
        elseif health > 100 then
            draw.RoundedBox( 0, 175, ScrH() - 167.5, 147.5, 30, TRHUD.HealthColor)
        elseif health < 0 then -- FIXED
            draw.RoundedBox( 0, 175, ScrH() - 167.5, 0, 30, TRHUD.HealthColor)
        end
        draw.RoundedBox( 0, 137.5, ScrH() - 122.5, 30, 30, TRHUD.HUDBoxColor)
        draw.RoundedBox( 0, 175, ScrH() - 122.5, 147.5, 30, TRHUD.HUDBoxColor)
        surface.SetMaterial(Material("materials/therollmops/hud/32x/hud_armor.png"))
        surface.SetDrawColor(255, 255, 255, 255)
        surface.DrawTexturedRect(137.5, ScrH() - 123, 30, 30)
        if armor <= 100 then
            draw.RoundedBox( 0, 175, ScrH() - 122.5, armor * 1.475, 30, TRHUD.ArmorColor)
        elseif armor > 100 then
            draw.RoundedBox( 0, 175, ScrH() - 122.5, 147.5, 30, TRHUD.ArmorColor)
        elseif armor < 0 then -- FIXED
            draw.RoundedBox( 0, 175, ScrH() - 122.5, 0, 30, TRHUD.ArmorColor)
        end
        draw.RoundedBox( 0, 137.5, ScrH() - 77.5, 30, 30, TRHUD.HUDBoxColor)
        draw.RoundedBox( 0, 175, ScrH() - 77.5, 147.5, 30, TRHUD.HUDBoxColor)
        draw.RoundedBox( 0, 175, ScrH() - 77.5, hunger * 1.475, 30, TRHUD.HungerColor)
        surface.SetMaterial(Material("materials/therollmops/hud/32x/hud_hunger.png"))
        surface.SetDrawColor(255, 255, 255, 255)
        surface.DrawTexturedRect(137, ScrH() - 78.5, 30, 30)
    else 
        draw.RoundedBox( 0, 137.5, ScrH() - 77.5, 30, 30, TRHUD.HUDBoxColor)
        draw.RoundedBox( 0, 175, ScrH() - 77.5, 147.5, 30, TRHUD.HUDBoxColor)
        surface.SetMaterial(Material("materials/therollmops/hud/32x/hud_hunger.png"))
        surface.SetDrawColor(TRHUD.IconColorWDis)
        surface.DrawTexturedRect(137, ScrH() - 78.5, 30, 30)
        draw.RoundedBox( 0, 137.5, ScrH() - 167.5, 30, 30, TRHUD.HUDBoxColor)
        draw.RoundedBox( 0, 175, ScrH() - 167.5, 147.5, 30, TRHUD.HUDBoxColor)
        surface.SetMaterial(Material("materials/therollmops/hud/32x/hud_health.png"))
        surface.SetDrawColor(255, 255, 255, 255)
        surface.DrawTexturedRect(136.5, ScrH() - 168.5, 32, 32)
        if health <= 100 then
            draw.RoundedBox( 0, 175, ScrH() - 167.5, health * 1.475, 30, TRHUD.HealthColor)
        elseif health > 100 then
            draw.RoundedBox( 0, 175, ScrH() - 167.5, 147.5, 30, TRHUD.HealthColor)
        end
        draw.RoundedBox( 0, 137.5, ScrH() - 122.5, 30, 30, TRHUD.HUDBoxColor)
        draw.RoundedBox( 0, 175, ScrH() - 122.5, 147.5, 30, TRHUD.HUDBoxColor)
        local armoricon = vgui.Create("DImage")
        surface.SetMaterial(Material("materials/therollmops/hud/32x/hud_armor.png"))
        surface.SetDrawColor(255, 255, 255, 255)
        surface.DrawTexturedRect(137.5, ScrH() - 123, 30, 30)
        if armor <= 100 then
            draw.RoundedBox( 0, 175, ScrH() - 122.5, armor * 1.475, 30, TRHUD.ArmorColor)
        elseif armor > 100 then
            draw.RoundedBox( 0, 175, ScrH() - 122.5, 147.5, 30, TRHUD.ArmorColor)
        end
    end
    -- Wallet
    local money = ply:getDarkRPVar("money")
    local typemoney = TRHUD.Currency
    draw.RoundedBox( 0, 10, ScrH() - 40, 350, 30, TRHUD.HUDBoxColor)
    draw.DrawText( money..typemoney, "TRHUDFFont", 50, ScrH() - 37.5, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT)
    surface.SetMaterial(Material("materials/therollmops/hud/32x/hud_wallet.png"))
    surface.SetDrawColor(255, 255, 255, 255)
    surface.DrawTexturedRect(11, ScrH() - 42.5, 32, 32)
    -- Job and Salary
    local salary = ply:getDarkRPVar("salary")
    local job = ply:getDarkRPVar("job")
    draw.RoundedBox( 0, 10, ScrH() - 205, 350, 30, TRHUD.HUDBoxColor)
    draw.DrawText( job, "TRHUDFFont", 50, ScrH() - 202.5, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT)
    draw.DrawText( salary..typemoney, "TRHUDFFont", 355, ScrH() - 202.5, Color(255, 255, 255, 255), TEXT_ALIGN_RIGHT)
    surface.SetMaterial(Material("materials/therollmops/hud/32x/hud_job.png"))
    surface.SetDrawColor(255, 255, 255, 255)
    surface.DrawTexturedRect(10, ScrH() - 205, 32, 32)
    -- Licence & Wanted
    local wanted = ply:getDarkRPVar("wanted")
    local licence = ply:getDarkRPVar("HasGunlicense")
    draw.RoundedBox( 0, 330, ScrH() - 167.5, 30, 120, TRHUD.HUDBoxColor)
    surface.SetMaterial(Material("materials/therollmops/hud/32x/hud_wanted.png"))
    surface.SetDrawColor(255, 255, 255, 255)
    surface.DrawTexturedRect(330, ScrH() - 155, 32, 32)
    if not wanted then
        surface.SetMaterial(Material("materials/therollmops/hud/32x/hud_wanted.png"))
        surface.SetDrawColor(TRHUD.IconColorWDis)
        surface.DrawTexturedRect(330, ScrH() - 155, 32, 32)
    end
    surface.SetMaterial(Material("materials/therollmops/hud/32x/hud_licence.png"))
    surface.SetDrawColor(255, 255, 255, 255)
    surface.DrawTexturedRect(331, ScrH() - 95, 28, 28)
    if not licence then
        surface.SetMaterial(Material("materials/therollmops/hud/32x/hud_licence.png"))
        surface.SetDrawColor(TRHUD.IconColorWDis)
        surface.DrawTexturedRect(331, ScrH() - 95, 28, 28)
    end  
    --PlayerModel HUD Support
    draw.RoundedBox( 0, 10, ScrH() - 167.5, 120, 120, TRHUD.HUDBoxColor)
end
hook.Add( "HUDPaint", "DisplayMainHUD", MainHUD )

-- Icon HUD
if TRHUD.TypeIcon == "Picture" then
    function PlayerPic()
        if not LocalPlayer():Alive() or not TRHUD.MainHUD then return end
        local avatar = vgui.Create("AvatarImage")
        avatar:SetPos(10, ScrH() - 167.5)
        avatar:SetSize(120, 120)
        avatar:SetPlayer(LocalPlayer(), 128)
        avatar:SetVisible(true)
        avatar:ParentToHUD()
    end
elseif TRHUD.TypeIcon == "Playermodel" then
    function PlayerModel()
        if not LocalPlayer():Alive() or not TRHUD.MainHUD then return end
        local playermodel = LocalPlayer():GetModel()
        local pm = vgui.Create("DModelPanel")
        pm:SetPos(10, ScrH() - 167.5)
        pm:SetSize(120, 120)
        pm:SetModel(playermodel)

        function pm:Think()
            if pm:GetModel() != LocalPlayer():GetModel() then
                pm:SetModel(LocalPlayer():GetModel())
            end
        end

        function pm:LayoutEntity(Entity) return end
        local posofhead = pm.Entity:GetBonePosition(pm.Entity:LookupBone( "ValveBiped.Bip01_Head1" ))
        pm:SetLookAt( posofhead )
        pm:SetCamPos( posofhead -Vector( -15, 3, 0 ))
    end
else
    timer.Simple(3, function()
        if not TRHUD.MainHUD then return end
        Error("[TR HUD] [ERROR]: TRHUD.TypeIcon, which can be found in the config file, is not properly configured!\n")
        net.Start("ErrorTypeIcon")
        net.SendToServer()
        end)
end
hook.Add( "InitPostEntity", "SteamPicture", PlayerPic )
hook.Add( "InitPostEntity", "HUDPM", PlayerModel )

-- Create a new Ammo HUD
function AmmoHUD()
    if not LocalPlayer():Alive() or not TRHUD.AmmoHUD then return end
    local weapon = LocalPlayer():GetActiveWeapon()
    if LocalPlayer():Alive() and (weapon:IsValid()) then
        local ammoc = LocalPlayer():GetAmmoCount(weapon:GetPrimaryAmmoType())
        local clipc = weapon:Clip1()
        local maxammo = weapon:GetMaxClip1()
        local weaponname = weapon:GetPrintName()    
        if clipc == -1 or clipc <= 0 and ammoc <= 0 and not weaponname == "Admin Keypad Checker" then 
            draw.RoundedBox(0, ScrW() - 217.5, ScrH() - 40, 207.5, 30, TRHUD.HUDBoxColor)
            draw.SimpleText(weaponname, "TRHUDFFont", ScrW() - 180, ScrH() - 37.5, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT)
            surface.SetMaterial(Material("materials/therollmops/hud/32x/hud_ammo.png"))
            surface.SetDrawColor(255, 255, 255, 255)
            surface.DrawTexturedRect(ScrW() - 217.5, ScrH() - 41.5, 32, 32)
            return
        elseif weaponname == "Admin Keypad Checker" then
            draw.RoundedBox(0, ScrW() - 217.5, ScrH() - 40, 207.5, 30, TRHUD.HUDBoxColor)
            draw.SimpleText("Keypad Checker", "TRHUDFFont", ScrW() - 180, ScrH() - 37.5, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT)
            surface.SetMaterial(Material("materials/therollmops/hud/32x/hud_ammo.png"))
            surface.SetDrawColor(255, 255, 255, 255)
            surface.DrawTexturedRect(ScrW() - 217.5, ScrH() - 41.5, 32, 32)
            return
        end 
        if weapon then
            if ammoc == 0 then
            draw.RoundedBox(0, ScrW() - 110, ScrH() - 85, 100, 75, TRHUD.HUDBoxColor)
            draw.SimpleText(ammoc, "TRHUDFFontB", ScrW() - 61.5, ScrH() - 77.5, Color(222, 73, 46, 255), TEXT_ALIGN_CENTER)
            else
            draw.RoundedBox(0, ScrW() - 110, ScrH() - 85, 100, 75, TRHUD.HUDBoxColor)
            draw.SimpleText(ammoc, "TRHUDFFontB", ScrW() - 61.5, ScrH() - 77.5, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
            end

            if clipc < maxammo * 0.35 then
            draw.RoundedBox(0, ScrW() - 217.5, ScrH() - 85, 100, 75, TRHUD.HUDBoxColor)
            draw.SimpleText(clipc, "TRHUDFFontB", ScrW() - 168, ScrH() - 77.5, Color(222, 73, 46, 255), TEXT_ALIGN_CENTER)
            else
            draw.RoundedBox(0, ScrW() - 217.5, ScrH() - 85, 100, 75, TRHUD.HUDBoxColor)
            draw.SimpleText(clipc, "TRHUDFFontB", ScrW() - 168, ScrH() - 77.5, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
            end
        draw.RoundedBox(0, ScrW() - 217.5, ScrH() - 122.5, 207.5, 30, TRHUD.HUDBoxColor)
        draw.SimpleText(weaponname, "TRHUDFFont", ScrW() - 180, ScrH() - 120, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT)
        surface.SetMaterial(Material("materials/therollmops/hud/32x/hud_ammo.png"))
        surface.SetDrawColor(255, 255, 255, 255)
        surface.DrawTexturedRect(ScrW() - 217.5, ScrH() - 125, 32, 32)
        end
    end
end
hook.Add( "HUDPaint", "DisplayAmmoHUD", AmmoHUD )

-- Create a new Name HUD
function NameHUD(ply)
    if ply == LocalPlayer() then return end
    if not ply:Alive() or not TRHUD.NameHUD then return end
    local distance = LocalPlayer():GetPos():Distance(ply:GetPos())
    if distance <= 175 then
        local anglesfix = Vector(0, 0, 75)
        local angles = LocalPlayer():EyeAngles()
        local pos = ply:GetPos() + anglesfix + angles:Up()
        angles:RotateAroundAxis(angles:Forward(), 90)
        angles:RotateAroundAxis(angles:Right(), 90)

        local phealth = ply:Health()
        if phealth > 100 then phealth = 100 end
        if phealth < 0 then phealth = 0 end

        local pjob = ply:getDarkRPVar("job")
        local pname = ply:getDarkRPVar("rpname")
        
        local alayer = TRHUD.HUDNameColor.a - 20

        cam.Start3D2D(pos, angles, 0.1)
        draw.RoundedBox(0, -125, -55, 240, 80, TRHUD.HUDNameColor) -- BOX Job & Vie
        surface.SetMaterial(Material("materials/therollmops/hud/32x/hud_health.png")) -- Vie 
        surface.SetDrawColor(255, 255, 255, alayer)
        surface.DrawTexturedRect(-122.5, -17.5, 40, 40)
        draw.RoundedBox(0, -77.5, -10, phealth * 1.825, 25, TRHUD.HealthColor)
        surface.SetMaterial(Material("materials/therollmops/hud/32x/hud_job.png")) -- Job
        surface.SetDrawColor(255, 255, 255, alayer)
        surface.DrawTexturedRect(-122.5, -55, 40, 40)
        draw.SimpleText(pjob, "TRHUDFFontL", -80, -50, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT)
        draw.RoundedBox(1, -125, -102.5, 240, 40, TRHUD.HUDNameColor) -- BOX RPName
        draw.SimpleText(pname, "TRHUDFFontL", -5, -95, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER) -- RPName
        cam.End3D2D()
    end
end
hook.Add("PostPlayerDraw", "DisplayNameHUD", NameHUD)

-- Create a new Agenda HUD
function AgendaHUD()
    if not LocalPlayer():Alive() or not TRHUD.AgendaHUD then return end
    local agenda = LocalPlayer():getAgendaTable()
    agendaText = agendaText or DarkRP.textWrap( ( LocalPlayer():getDarkRPVar( "agenda" ) or"" ):gsub( "//", "\n" ):gsub( "\\n", "\n" ), "TRHUDFFont", 440 )

    if not agenda then return end
 
    draw.RoundedBox(0, 10, 10, 350, 30, TRHUD.HUDBoxColor)
    draw.RoundedBox(0, 10, 47.5, 350, 157.5, TRHUD.HUDBoxColor)
    draw.DrawText(agenda.Title, "TRHUDFFont", 185, 12, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER) -- Title
    surface.SetMaterial(Material("materials/therollmops/hud/32x/hud_agenda.png"))
    surface.SetDrawColor(255, 255, 255, 255)
    surface.DrawTexturedRect(11, 9, 32, 32)
    draw.DrawText(agendaText, "TRHUDFFontA", 20, 30, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT) -- Text
    draw.DrawText("...................................................................", "TRHUDFFont", 17.5, 55, TRHUD.BackgroundAg, TEXT_ALIGN_LEFT)
    draw.DrawText("...................................................................", "TRHUDFFont", 17.5, 77, TRHUD.BackgroundAg, TEXT_ALIGN_LEFT)
    draw.DrawText("...................................................................", "TRHUDFFont", 17.5, 99, TRHUD.BackgroundAg, TEXT_ALIGN_LEFT)
    draw.DrawText("...................................................................", "TRHUDFFont", 17.5, 121, TRHUD.BackgroundAg, TEXT_ALIGN_LEFT)
    draw.DrawText("...................................................................", "TRHUDFFont", 17.5, 143, TRHUD.BackgroundAg, TEXT_ALIGN_LEFT)
    draw.DrawText("...................................................................", "TRHUDFFont", 17.5, 165, TRHUD.BackgroundAg, TEXT_ALIGN_LEFT)
end
hook.Add( "HUDPaint", "DisplayAgendaHUD", AgendaHUD)

-- Code for agenda update by FPtje and modified by TheRollmops
function AgendaUpdate(ply, var, _, new)
    if ply != LocalPlayer() then return end
    if var == "agenda" and new then
        agendaText = DarkRP.textWrap(new:gsub("//", "\n"):gsub("\\n", "\n"), "TRHUDFFontA", 440)
    else
        agendaText = nil
    end
end
hook.Add("DarkRPVarChanged", "DisplayAgendaUPD", AgendaUpdate) 

-- Create a new Lockdown HUD
function LockdownHUD()
    if not LocalPlayer():Alive() or not TRHUD.LockdownHUD then return end
    local lockdown = GetGlobalBool("DarkRP_LockDown")
    if lockdown then
        draw.RoundedBox(0, 10, ScrH() - 337.5, 250, 30, TRHUD.HUDBoxColor)
        surface.SetMaterial(Material("materials/therollmops/hud/32x/hud_info.png"))
        surface.SetDrawColor(255, 255, 255, 255)
        surface.DrawTexturedRect(11, ScrH() - 340, 32, 32)
        draw.SimpleText(TRHUD.Lang[TRHUD.LangSelect]["lockdown"], "TRHUDFFont", 50, ScrH() - 337, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT)
        draw.RoundedBox(0, 10, ScrH() - 300, 250, 70, TRHUD.HUDBoxColor)
        draw.SimpleText(TRHUD.Lang[TRHUD.LangSelect]["lockdown_text1"], "TRHUDFFontA", 135, ScrH() - 285, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
        draw.SimpleText(TRHUD.Lang[TRHUD.LangSelect]["lockdown_text2"], "TRHUDFFontA", 135, ScrH() - 265, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
    end
end
hook.Add("HUDPaint", "DisplayLockdownHUD", LockdownHUD)

-- Create a new Death Screen
function DeathScreen()
    if not TRHUD.DeathScreen then return end
    if not LocalPlayer():Alive() then
        TRHUD.DeathScreenT.a =  255 * math.cos(CurTime() * 3)
        draw.SimpleText(TRHUD.Lang[TRHUD.LangSelect]["death"], "TRHUDFFontB", ScrW() * 0.5, ScrH() * 0.25, TRHUD.DeathScreenT, TEXT_ALIGN_CENTER)
    end
end
hook.Add("HUDPaint", "DisplayDeathScreen", DeathScreen)

-- Create a new Voice chat HUD
function VoiceChatHUD()
    if not TRHUD.VoiceChatHUD then return end
    if LocalPlayer():IsSpeaking() and LocalPlayer():Alive() then
        draw.RoundedBox(0, 10, ScrH() - 450, 250, 30, TRHUD.HUDBoxColor)
        surface.SetMaterial(Material("materials/therollmops/hud/32x/hud_speaking.png"))
        surface.SetDrawColor(255, 255, 255, 255)
        surface.DrawTexturedRect(11, ScrH() - 451.5, 32, 32)
        draw.SimpleText(TRHUD.Lang[TRHUD.LangSelect]["speaking"], "TRHUDFFont", 50, ScrH() - 448, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT)
    end
end
hook.Add("HUDPaint", "DisplayVoiceChatR", VoiceChatHUD)

-- Display Notify
function Notify(msg)
    local txt = msg:ReadString()
    GAMEMODE:AddNotify(txt, msg:ReadShort(), msg:ReadLong())
    surface.PlaySound("buttons/lightswitch2.wav")
    MsgC(Color(237, 33, 33, 255), "["..TRHUD.ServerName.."] ", Color(255, 255, 255, 255), txt, "\n")
end
usermessage.Hook("_Notify", Notify)