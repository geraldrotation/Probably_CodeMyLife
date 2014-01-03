-----------------------------------------------------------------------------------------------------
--------------------------------------------Player Frame---------------------------------------------
if not CML_VengeanceFrameSetup then
CML_VengeanceFrameSetup = true
CML_SotRFrame = CreateFrame("StatusBar", nil, UIParent)
CML_SotRFrame:SetBackdrop({ bgFile = [[Interface\DialogFrame\UI-DialogBox-Background-Dark]], tile = true, tileSize = 16, })
CML_SotRFrame:SetStatusBarTexture([[Interface\\AddOns\\DBM-DefaultSkins\\textures\\default.tga]],"OVERLAY")
CML_SotRFrame:SetOrientation("HORIZONTAL")
CML_SotRFrame:SetStatusBarColor(1,1,1,1)
CML_SotRFrame:SetBackdropColor(1,1,1,1)
CML_SotRFrame:GetStatusBarTexture():SetTexture(217/255, 0/255, 255/255,0.75,"OVERLAY")
CML_SotRFrame:SetMinMaxValues(0, 10)
CML_SotRFrame:SetValue(0)
CML_SotRFrame:SetWidth(30)
CML_SotRFrame:SetHeight(22)
CML_SotRFrame.texture = CML_SotRFrame:CreateTexture()
CML_SotRFrame.texture:SetAllPoints()
CML_SotRFrame.texture:SetTexture(25/255,25/255,25/255,1)
CML_SotRFrame:SetPoint("CENTER",150,-140)
CML_SotRFrame:SetClampedToScreen(true)
CML_SotRFrame:EnableMouse(true)
CML_SotRFrame:SetMovable(true)
CML_SotRFrame:RegisterForDrag("LeftButton")
CML_SotRFrame:SetScript("OnDragStart", CML_SotRFrame.StartMoving)
CML_SotRFrame:SetScript("OnDragStop", CML_SotRFrame.StopMovingOrSizing)
CML_SotRFrame:SetValue(4)
border = CML_SotRFrame:CreateTexture(nil, "BACKGROUND")
CML_SotRFrame.Border = border
CML_SotRFrame.Border:SetPoint("LEFT",-4,0)
CML_SotRFrame.Border:SetWidth(38)
CML_SotRFrame.Border:SetHeight(30)
CML_SotRFrame.Border:SetTexture(232/255, 172/255, 200/255,0.35)
bartext = CML_SotRFrame:CreateFontString(nil, "OVERLAY")
CML_SotRFrame.Text = bartext
CML_SotRFrame.Text:SetFontObject("MovieSubtitleFont")
CML_SotRFrame.Text:SetTextHeight(15)
CML_SotRFrame.Text:SetPoint("CENTER",0,-1)
CML_SotRFrame.Text:SetTextColor(255/255, 255/255, 255/255,1)
CML_VengeanceFrame = CreateFrame("StatusBar", nil, UIParent)
CML_VengeanceFrame:SetBackdrop({ bgFile = [[Interface\DialogFrame\UI-DialogBox-Background-Dark]], tile = true, tileSize = 16, })
CML_VengeanceFrame:SetStatusBarTexture([[Interface\\AddOns\\DBM-DefaultSkins\\textures\\default.tga]],"OVERLAY")
CML_VengeanceFrame:SetOrientation("HORIZONTAL")
CML_VengeanceFrame:SetStatusBarColor(1,1,1,1)
CML_VengeanceFrame:SetBackdropColor(1,1,1,1)
CML_VengeanceFrame:GetStatusBarTexture():SetTexture(212/255, 0/255, 0/255,0.85,"OVERLAY")
CML_VengeanceFrame:SetMinMaxValues(0, 100)
CML_VengeanceFrame:SetValue(50)
CML_VengeanceFrame:SetWidth(89)
CML_VengeanceFrame:SetHeight(22)
CML_VengeanceFrame.texture = CML_VengeanceFrame:CreateTexture()
CML_VengeanceFrame.texture:SetAllPoints()
CML_VengeanceFrame.texture:SetTexture(25/255,25/255,25/255,1)
CML_VengeanceFrame:SetPoint("LEFT",700,400)
CML_VengeanceFrame:SetClampedToScreen(true)
CML_VengeanceFrame:EnableMouse(true)
CML_VengeanceFrame:SetMovable(true)
CML_VengeanceFrame:RegisterForDrag("LeftButton")
CML_VengeanceFrame:SetScript("OnDragStart", CML_VengeanceFrame.StartMoving)
CML_VengeanceFrame:SetScript("OnDragStop", CML_VengeanceFrame.StopMovingOrSizing)
CML_VengeanceFrame:SetValue(100)
border = CML_VengeanceFrame:CreateTexture(nil, "BACKGROUND", CML_VengeanceFrame)
CML_VengeanceFrame.Border = border
CML_VengeanceFrame.Border:SetPoint("LEFT",-8,14)
CML_VengeanceFrame.Border:SetWidth(310)
CML_VengeanceFrame.Border:SetHeight(62)
CML_VengeanceFrame.Border:SetTexture(232/255, 172/255, 200/255,0.35)
bartext = CML_VengeanceFrame:CreateFontString(nil, "OVERLAY")
CML_VengeanceFrame.Text = bartext
CML_VengeanceFrame.Text:SetFontObject("MovieSubtitleFont")
CML_VengeanceFrame.Text:SetTextHeight(17)
CML_VengeanceFrame.Text:SetPoint("CENTER",0,-1)
CML_VengeanceFrame.Text:SetTextColor(255/255, 255/255, 255/255,1)
aoebar = CML_VengeanceFrame:CreateTexture(nil, "LOW")
CML_VengeanceFrame.aoebar = aoebar
CML_VengeanceFrame.aoebar:SetPoint("LEFT",187,0)
CML_VengeanceFrame.aoebar:SetWidth(64)
CML_VengeanceFrame.aoebar:SetHeight(22)
CML_VengeanceFrame.aoebar:SetTexture(25/255,25/255,25/255,1)
aoebartext = CML_VengeanceFrame:CreateFontString(nil, "MEDIUM", aoebar)
CML_VengeanceFrame.aoebartext = aoebartext
CML_VengeanceFrame.aoebartext:SetFontObject("MovieSubtitleFont")
CML_VengeanceFrame.aoebartext:SetTextHeight(17)
CML_VengeanceFrame.aoebartext:SetPoint("CENTER",175,1)
CML_VengeanceFrame.aoebartext:SetTextColor(255/255, 255/255, 255/255,1)
rangebar = CML_VengeanceFrame:CreateTexture(nil, "LOW")
CML_VengeanceFrame.rangebar = rangebar
CML_VengeanceFrame.rangebar:SetPoint("LEFT",257,27)
CML_VengeanceFrame.rangebar:SetWidth(38)
CML_VengeanceFrame.rangebar:SetHeight(22)
CML_VengeanceFrame.rangebar:SetTexture(25/255,25/255,25/255,1)
rangebartext = CML_VengeanceFrame:CreateFontString(nil, "MEDIUM", rangebar)
CML_VengeanceFrame.rangebartext = rangebartext
CML_VengeanceFrame.rangebartext:SetFontObject("MovieSubtitleFont")
CML_VengeanceFrame.rangebartext:SetTextHeight(17)
CML_VengeanceFrame.rangebartext:SetPoint("CENTER",231,26)
CML_VengeanceFrame.rangebartext:SetTextColor(255/255, 255/255, 255/255,1)
healingmodebar = CML_VengeanceFrame:CreateTexture(nil, "OVERLAY")
CML_VengeanceFrame.healingmodebar = healingmodebar
CML_VengeanceFrame.healingmodebar:SetPoint("LEFT",257,0)
CML_VengeanceFrame.healingmodebar:SetWidth(38)
CML_VengeanceFrame.healingmodebar:SetHeight(22)
CML_VengeanceFrame.healingmodebar:SetTexture(25/255,25/255,25/255,1)
healingmodebartext = CML_VengeanceFrame:CreateFontString(nil, "OVERLAY", healingmodebar)
CML_VengeanceFrame.healingmodebartext = healingmodebartext
CML_VengeanceFrame.healingmodebartext:SetFontObject("MovieSubtitleFont")
CML_VengeanceFrame.healingmodebartext:SetTextHeight(17)
CML_VengeanceFrame.healingmodebartext:SetPoint("CENTER",231,0)
CML_HealthFrame = CreateFrame("StatusBar", nil, CML_VengeanceFrame)
CML_HealthFrame:SetBackdrop({ bgFile = [[Interface\DialogFrame\UI-DialogBox-Background-Dark]], tile = true, tileSize = 16, })
CML_HealthFrame:SetStatusBarTexture([[Interface\TARGETINGFRAME\UI-StatusBar]],"OVERLAY")
CML_HealthFrame:SetOrientation("HORIZONTAL")
CML_HealthFrame:SetStatusBarColor(1,1,1,1)
CML_HealthFrame:SetBackdropColor(1, 1, 1,1)
CML_HealthFrame:GetStatusBarTexture():SetTexture(23/255, 191/255, 4/255,1,"OVERLAY")
CML_HealthFrame:SetMinMaxValues(0, 100)
CML_HealthFrame:SetWidth(251)
CML_HealthFrame:SetHeight(22)
CML_HealthFrame:SetValue(100)
CML_HealthFrame.texture = CML_HealthFrame:CreateTexture()
CML_HealthFrame.texture:SetAllPoints()
CML_HealthFrame.texture:SetTexture(25/255,25/255,25/255,1)
CML_HealthFrame:SetPoint("LEFT",0,27)
CML_HealthFrame:SetClampedToScreen(true)
CML_HealthFrame:SetScript("OnUpdate", CML_HealthFrame_OnUpdate)
healthbartext = CML_HealthFrame:CreateFontString(nil, "OVERLAY")
CML_HealthFrame.healthbartext = healthbartext
CML_HealthFrame.healthbartext:SetFontObject("MovieSubtitleFont")
CML_HealthFrame.healthbartext:SetTextHeight(17)
CML_HealthFrame.healthbartext:SetPoint("LEFT",3,-1)
CML_HealthFrame.healthbartext:SetTextColor(1,1,1,1)
healthbarnumbers = CML_HealthFrame:CreateFontString(nil, "OVERLAY")
CML_HealthFrame.healthbarnumbers = healthbarnumbers
CML_HealthFrame.healthbarnumbers:SetFontObject("MovieSubtitleFont")
CML_HealthFrame.healthbarnumbers:SetTextHeight(15)
CML_HealthFrame.healthbarnumbers:SetPoint("RIGHT",-3,-1)
CML_HealthFrame.healthbarnumbers:SetTextColor(1,1,1,1)
HP1Bar = CML_VengeanceFrame:CreateTexture(nil, "OVERLAY")
CML_VengeanceFrame.HP1Bar = HP1Bar
CML_VengeanceFrame.HP1Bar:SetPoint("LEFT",0,49)
CML_VengeanceFrame.HP1Bar:SetWidth(53)
CML_VengeanceFrame.HP1Bar:SetHeight(9)
CML_VengeanceFrame.HP1Bar:SetTexture(196/255,31/255,59/255,0.85)
HP2Bar = CML_VengeanceFrame:CreateTexture(nil, "OVERLAY")
CML_VengeanceFrame.HP2Bar = HP2Bar
CML_VengeanceFrame.HP2Bar:SetPoint("LEFT",59,49)
CML_VengeanceFrame.HP2Bar:SetWidth(53)
CML_VengeanceFrame.HP2Bar:SetHeight(9)
CML_VengeanceFrame.HP2Bar:SetTexture(196/255,31/255,59/255,0.85)
HP3Bar = CML_VengeanceFrame:CreateTexture(nil, "OVERLAY")
CML_VengeanceFrame.HP3Bar = HP3Bar
CML_VengeanceFrame.HP3Bar:SetPoint("LEFT",118,49)
CML_VengeanceFrame.HP3Bar:SetWidth(53)
CML_VengeanceFrame.HP3Bar:SetHeight(9)
CML_VengeanceFrame.HP3Bar:SetTexture(196/255,31/255,59/255,0.85)
HP4Bar = CML_VengeanceFrame:CreateTexture(nil, "OVERLAY")
CML_VengeanceFrame.HP4Bar = HP4Bar
CML_VengeanceFrame.HP4Bar:SetPoint("LEFT",177,49)
CML_VengeanceFrame.HP4Bar:SetWidth(53)
CML_VengeanceFrame.HP4Bar:SetHeight(9)
CML_VengeanceFrame.HP4Bar:SetTexture(196/255,31/255,59/255,0.85)
HP5Bar = CML_VengeanceFrame:CreateTexture(nil, "OVERLAY")
CML_VengeanceFrame.HP5Bar = HP5Bar
CML_VengeanceFrame.HP5Bar:SetPoint("LEFT",236,49)
CML_VengeanceFrame.HP5Bar:SetWidth(53)
CML_VengeanceFrame.HP5Bar:SetHeight(9)
CML_VengeanceFrame.HP5Bar:SetTexture(196/255,31/255,59/255,0.85)
A1Bar = CML_VengeanceFrame:CreateTexture(nil, "OVERLAY")
CML_VengeanceFrame.A1Bar = A1Bar
CML_VengeanceFrame.A1Bar:SetPoint("LEFT",0,57)
CML_VengeanceFrame.A1Bar:SetWidth(53)
CML_VengeanceFrame.A1Bar:SetHeight(9)
CML_VengeanceFrame.A1Bar:SetTexture(196/255,31/255,59/255,0.85)
A2Bar = CML_VengeanceFrame:CreateTexture(nil, "OVERLAY")
CML_VengeanceFrame.A2Bar = A2Bar
CML_VengeanceFrame.A2Bar:SetPoint("LEFT",59,57)
CML_VengeanceFrame.A2Bar:SetWidth(53)
CML_VengeanceFrame.A2Bar:SetHeight(9)
CML_VengeanceFrame.A2Bar:SetTexture(196/255,31/255,59/255,0.85)
A3Bar = CML_VengeanceFrame:CreateTexture(nil, "OVERLAY")
CML_VengeanceFrame.A3Bar = A3Bar
CML_VengeanceFrame.A3Bar:SetPoint("LEFT",118,57)
CML_VengeanceFrame.A3Bar:SetWidth(53)
CML_VengeanceFrame.A3Bar:SetHeight(9)
CML_VengeanceFrame.A3Bar:SetTexture(196/255,31/255,59/255,0.85)
A4Bar = CML_VengeanceFrame:CreateTexture(nil, "OVERLAY")
CML_VengeanceFrame.A4Bar = A4Bar
CML_VengeanceFrame.A4Bar:SetPoint("LEFT",177,57)
CML_VengeanceFrame.A4Bar:SetWidth(53)
CML_VengeanceFrame.A4Bar:SetHeight(9)
CML_VengeanceFrame.A4Bar:SetTexture(196/255,31/255,59/255,0.85)
A5Bar = CML_VengeanceFrame:CreateTexture(nil, "OVERLAY")
CML_VengeanceFrame.A5Bar = A5Bar
CML_VengeanceFrame.A5Bar:SetPoint("LEFT",236,57)
CML_VengeanceFrame.A5Bar:SetWidth(53)
CML_VengeanceFrame.A5Bar:SetHeight(9)
CML_VengeanceFrame.A5Bar:SetTexture(196/255,31/255,59/255,0.85)
CML_RessourcesFrame = CreateFrame("StatusBar", nil, CML_VengeanceFrame)
CML_RessourcesFrame:SetBackdrop({ bgFile = [[Interface\DialogFrame\UI-DialogBox-Background-Dark]], tile = true, tileSize = 16, })
CML_RessourcesFrame:SetStatusBarTexture([[Interface\\AddOns\\DBM-DefaultSkins\\textures\\default.tga]],"OVERLAY")
CML_RessourcesFrame:SetOrientation("HORIZONTAL")
CML_RessourcesFrame:SetStatusBarColor(1,1,1,1)
CML_RessourcesFrame:SetBackdropColor(1,1,1,1)
CML_RessourcesFrame:GetStatusBarTexture():SetTexture(196/255,31/255,59/255,"OVERLAY")
CML_RessourcesFrame:SetMinMaxValues(0, 100)
CML_RessourcesFrame:SetValue(0)
CML_RessourcesFrame:SetWidth(89)
CML_RessourcesFrame:SetHeight(22)
CML_RessourcesFrame.texture = CML_RessourcesFrame:CreateTexture()
CML_RessourcesFrame.texture:SetAllPoints()
CML_RessourcesFrame.texture:SetTexture(25/255,25/255,25/255,1)
CML_RessourcesFrame:SetPoint("LEFT",93,0)
ressourcestext = CML_RessourcesFrame:CreateFontString(nil, "OVERLAY",CML_RessourcesFrame)
CML_RessourcesFrame.Text = ressourcestext
CML_RessourcesFrame.Text:SetFontObject("MovieSubtitleFont")
CML_RessourcesFrame.Text:SetTextHeight(17)
CML_RessourcesFrame.Text:SetPoint("CENTER",0,-1)
CML_RessourcesFrame.Text:SetTextColor(255/255, 255/255, 255/255,1)
CML_SotRFrame:Hide()
CML_VengeanceFrame:Hide() 
CML_VengeanceFrame.HP1Bar:Hide()
CML_VengeanceFrame.HP2Bar:Hide()
CML_VengeanceFrame.HP3Bar:Hide()
CML_VengeanceFrame.HP4Bar:Hide()
CML_VengeanceFrame.HP5Bar:Hide()
CML_VengeanceFrame.A1Bar:Hide()
CML_VengeanceFrame.A2Bar:Hide()
CML_VengeanceFrame.A3Bar:Hide()
CML_VengeanceFrame.A4Bar:Hide()
CML_VengeanceFrame.A5Bar:Hide()
CML_VengeanceFrame:SetScript("OnUpdate", CML_Status)
A1Bar = CML_VengeanceFrame:CreateTexture(nil, "OVERLAY")
CML_VengeanceFrame.A1Bar = A1Bar
CML_VengeanceFrame.A1Bar:SetPoint("LEFT",0,59)
CML_VengeanceFrame.A1Bar:SetWidth(53)
CML_VengeanceFrame.A1Bar:SetHeight(9)
CML_VengeanceFrame.A1Bar:SetTexture(191/255,0/255,0/255,0.85)
A2Bar = CML_VengeanceFrame:CreateTexture(nil, "OVERLAY")
CML_VengeanceFrame.A2Bar = A2Bar
CML_VengeanceFrame.A2Bar:SetPoint("LEFT",59,59)
CML_VengeanceFrame.A2Bar:SetWidth(53)
CML_VengeanceFrame.A2Bar:SetHeight(9)
CML_VengeanceFrame.A2Bar:SetTexture(191/255,0/255,0/255,0.85)
A3Bar = CML_VengeanceFrame:CreateTexture(nil, "OVERLAY")
CML_VengeanceFrame.A3Bar = A3Bar
CML_VengeanceFrame.A3Bar:SetPoint("LEFT",118,59)
CML_VengeanceFrame.A3Bar:SetWidth(53)
CML_VengeanceFrame.A3Bar:SetHeight(9)
CML_VengeanceFrame.A3Bar:SetTexture(191/255,0/255,0/255,0.85)
A4Bar = CML_VengeanceFrame:CreateTexture(nil, "OVERLAY")
CML_VengeanceFrame.A4Bar = A4Bar
CML_VengeanceFrame.A4Bar:SetPoint("LEFT",177,59)
CML_VengeanceFrame.A4Bar:SetWidth(53)
CML_VengeanceFrame.A4Bar:SetHeight(9)
CML_VengeanceFrame.A4Bar:SetTexture(191/255,0/255,0/255,0.85)
A5Bar = CML_VengeanceFrame:CreateTexture(nil, "OVERLAY")
CML_VengeanceFrame.A5Bar = A5Bar
CML_VengeanceFrame.A5Bar:SetPoint("LEFT",236,59)
CML_VengeanceFrame.A5Bar:SetWidth(53)
CML_VengeanceFrame.A5Bar:SetHeight(9)
CML_VengeanceFrame.A5Bar:SetTexture(191/255,0/255,0/255,0.85)
CML_VengeanceFrame.A1Bar:Hide()
CML_VengeanceFrame.A2Bar:Hide()
CML_VengeanceFrame.A3Bar:Hide()
CML_VengeanceFrame.A4Bar:Hide()
CML_VengeanceFrame.A5Bar:Hide()
function UiBar_ActiveCooldowns()
	if macros["ActiveCooldowns"] then
		CML_VengeanceFrame.rangebar:SetTexture(1,1,1,0.85)
		CML_VengeanceFrame.rangebartext:SetTextColor(200/255,200/255,200/255)
		CML_VengeanceFrame.rangebartext:SetText("ON", 0, 1, 0, 0.7)
	else
		CML_VengeanceFrame.rangebar:SetTexture(196/255,31/255,59/255,0.85)
		CML_VengeanceFrame.rangebartext:SetTextColor(255/255, 255/255, 255/255)
		CML_VengeanceFrame.rangebartext:SetText("OFF", 0, 1, 0, 0.7)
	end	
end

function UiBar_ActiveDispel()
	if macros["ActiveDispel"] then
		CML_VengeanceFrame.aoebartext:SetText("Dispel",255/255,255/255,255/255)
		CML_VengeanceFrame.aoebartext:SetTextColor(200/255, 200/255, 200/255)
		CML_VengeanceFrame.aoebar:SetTexture(255/255,255/255,255/255,0.85)
	else
		CML_VengeanceFrame.aoebartext:SetText("OFF", 255/255,255/255,0/255)
		CML_VengeanceFrame.aoebartext:SetTextColor(255/255, 255/255, 255/255)
		CML_VengeanceFrame.aoebar:SetTexture(196/255,31/255,59/255,0.85)	
	end
end

function UiBar_ActiveDPS()
	if macros["ActiveDPS"] then
		CML_VengeanceFrame.rangebar:SetTexture(1,1,1,0.85)
		CML_VengeanceFrame.rangebartext:SetTextColor(200/255,200/255,200/255)
		CML_VengeanceFrame.rangebartext:SetText("ON", 0, 1, 0, 0.7)
	else
		CML_VengeanceFrame.rangebar:SetTexture(196/255,31/255,59/255,0.85)
		CML_VengeanceFrame.rangebartext:SetTextColor(255/255, 255/255, 255/255)
		CML_VengeanceFrame.rangebartext:SetText("OFF", 0, 1, 0, 0.7)
	end	
end

function UiBar_ActiveHealing()
	if macros["ActiveHealing"] then
		CML_VengeanceFrame.healingmodebartext:SetText("ON", 1, 1, 1, 0.7)
		CML_VengeanceFrame.healingmodebar:SetTexture(PlayerR, PlayerG, PlayerB,1)
		CML_VengeanceFrame.healingmodebartext:SetTextColor(255/255, 255/255, 255/255,1)
	else
		CML_VengeanceFrame.healingmodebartext:SetText("OFF", 1, 1, 1, 0.7)
		CML_VengeanceFrame.healingmodebar:SetTexture(196/255,31/255,59/255,1)
		CML_VengeanceFrame.healingmodebartext:SetTextColor(255/255, 255/255, 255/255,1)
	end
end

function UiBar_AoE()
	if macros["AoE"] == 2 then
		CML_VengeanceFrame.aoebartext:SetText("AoE", 255/255,255/255,0/255)
		CML_VengeanceFrame.aoebartext:SetTextColor(255/255, 255/255, 255/255)
		CML_VengeanceFrame.aoebar:SetTexture(196/255,31/255,59/255,0.85)
	elseif macros["AoE"] == 3 then
		CML_VengeanceFrame.aoebartext:SetText("Mass", 255/255,255/255,255/255)
		CML_VengeanceFrame.aoebartext:SetTextColor(255/255, 255/255, 255/255)
		CML_VengeanceFrame.aoebar:SetTexture(36/255, 54/255, 255/255,0.90)
	else
		CML_VengeanceFrame.aoebartext:SetText("Single",200/255,200/255,200/255)
		CML_VengeanceFrame.aoebartext:SetTextColor(200/255,200/255,200/255)
		CML_VengeanceFrame.aoebar:SetTexture(255/255, 255/255, 255/255,0.85)
	end
end

function UiBar_Borders()
	if macros["Pause"] == true or (PauseKeyCheck and PauseKey) then
		CML_VengeanceFrame.Border:SetTexture(0/255, 0/255, 0/255,0.35)
		if _Spec == 2 then CML_SotRFrame.Border:SetTexture(0/255, 0/255, 0/255,0.35) end
	elseif not UnitAffectingCombat("player") then
		CML_VengeanceFrame.Border:SetTexture(PlayerR, PlayerG, PlayerB,0.35)
		if _Spec == 2 then CML_SotRFrame.Border:SetTexture(PlayerR, PlayerG, PlayerB,0.35) end
	elseif IsSpellInRange(GetSpellInfo(_RangeSpell),"target") ~= 1 then
		CML_VengeanceFrame.Border:SetTexture(1,0,0,0.35)
		if _Spec == 2 then CML_SotRFrame.Border:SetTexture(1,0,0,0.35) end
	else
		if not CML.IsInFront("target",1) then
			CML_VengeanceFrame.Border:SetTexture(217/255, 0/255, 0/255,0.35)
			if _Spec == 2 then CML_SotRFrame.Border:SetTexture(217/255, 0/255, 0/255,0.35) end
		else
			CML_VengeanceFrame.Border:SetTexture(1,1,1,0.35)
		end
	end
end

function UiBar_SetBuff(BuffID)
	CML_VengeanceFrame:GetStatusBarTexture():SetTexture(196/255,31/255,59/255,"OVERLAY")
	local UiBarMaxValue = 100
	local Buff, _, _, _, _, BuffMax, BuffEndTime = UnitBuffID("player", BuffID)
	if Buff ~= nil then
		BuffTime = math.floor(10*(BuffEndTime - GetTime()))/10
		UiBarMaxValue = BuffMax
	end
	if BuffTime == nil then BuffTime = 0 end
	CML_VengeanceFrame:SetMinMaxValues(0, UiBarMaxValue)
	CML_VengeanceFrame:SetValue(BuffTime)
	CML_VengeanceFrame.Text:SetText(BuffTime.."s", 1, 1, 1, 0.7)
end

function UiBar_SetDebuff(DebuffID)
	CML_VengeanceFrame:GetStatusBarTexture():SetTexture(196/255,31/255,59/255,"OVERLAY")
	local UiBarMaxValue = 100
	local Debuff, _, _, _, _, DebuffMax, DebuffEndTime = UnitDebuffID("target", DebuffID)
	if Debuff ~= nil then
		DebuffTime = math.floor(10*(DebuffEndTime - GetTime()))/10
		UiBarMaxValue = DebuffMax
	end
	if Debuff == nil then DebuffTime = 0 end
	CML_VengeanceFrame:SetMinMaxValues(0, UiBarMaxValue)
	CML_VengeanceFrame:SetValue(DebuffTime)
	CML_VengeanceFrame.Text:SetText(DebuffTime.."s", 1, 1, 1, 0.7)
end

function UiBar_SetEclipse()
	if not CML_EclipseFrame then
		CML_EclipseFrame = CreateFrame("StatusBar", nil, CML_VengeanceFrame)
		CML_EclipseFrame:SetBackdrop({
			bgFile = [[Interface\DialogFrame\UI-DialogBox-Background-Dark]],
			tile = true,
			tileSize = 16,
		})
		CML_EclipseFrame:SetStatusBarTexture([[Interface\\AddOns\\DBM-DefaultSkins\\textures\\default.tga]],"OVERLAY")
		CML_EclipseFrame:SetOrientation("HORIZONTAL")
		CML_EclipseFrame:SetStatusBarColor(1,1,1,1)
		CML_EclipseFrame:SetBackdropColor(1,1,1,1)
		CML_EclipseFrame:GetStatusBarTexture():SetTexture(255/255, 217/255, 0/255,0.90,"OVERLAY")
		CML_EclipseFrame:SetMinMaxValues(0, 100)
		CML_EclipseFrame:SetValue(50)
		CML_EclipseFrame:SetWidth(45)
		CML_EclipseFrame:SetHeight(22)
		CML_EclipseFrame.texture = CML_EclipseFrame:CreateTexture()
		CML_EclipseFrame.texture:ClearAllPoints()
		CML_EclipseFrame.texture:SetTexture(25/255,25/255,25/255,1)
		CML_EclipseFrame:SetPoint("LEFT",44,0)
		CML_EclipseFrame:SetValue(100)

		bartext = CML_EclipseFrame:CreateFontString(nil, "OVERLAY", CML_EclipseFrame)
		CML_EclipseFrame.Text = bartext
		CML_EclipseFrame.Text:SetFontObject("MovieSubtitleFont")
		CML_EclipseFrame.Text:SetTextHeight(17)
		CML_EclipseFrame.Text:SetPoint("CENTER",-22,0)
		CML_EclipseFrame.Text:SetTextColor(255/255, 255/255, 255/255,1)
	end
	CML_VengeanceFrame:SetMinMaxValues(0, 200)
	local CML_MyEclipse = UnitPower("player",8)
	local CML_MyEclipseValue = CML_MyEclipse + 100
	local CML_EclipseDisplay = math.abs(CML_MyEclipse)
	CML_EclipseFrame:SetValue(CML_MyEclipse)
	CML_VengeanceFrame:GetStatusBarTexture():SetTexture(25/255, 25/255, 25/255,0.90,"OVERLAY")	
	CML_VengeanceFrame.texture:SetTexture(0/255, 153/255, 255/255,0.90)
	--CML_VengeanceFrame:StatusBar:SetReverseFill() 
	CML_VengeanceFrame:SetValue(CML_MyEclipseValue)
	CML_EclipseFrame.Text:SetText(CML_EclipseDisplay, 1, 1, 1, 0.7)
end

function UiBar_SetFocus()
	CML_RessourcesFrame:GetStatusBarTexture():SetTexture(255/255, 122/255, 61/255,0.90,"OVERLAY")
	CML_RessourcesFrame:SetValue(_Focus)
	CML_RessourcesFrame.Text:SetText(_Focus.."/".._FocusMax, 1, 1, 1, 0.7)
	CML_RessourcesFrame:SetMinMaxValues(0, _FocusMax)
end

function UiBar_SetFury()
	_Fury,_FuryMax = UnitPower("player",15),UnitPowerMax("player",15)
	CML_VengeanceFrame:GetStatusBarTexture():SetTexture(161/255, 0/255, 200/255,0.90,"OVERLAY")
	CML_VengeanceFrame:SetValue(_Fury)
	CML_VengeanceFrame.Text:SetText(_Fury.."/".._FuryMax, 1, 1, 1, 0.7)
	CML_VengeanceFrame:SetMinMaxValues(0, _FuryMax)
end

function UiBar_SetHealth()
	CML_HealthFrame:SetValue(_HP)
	CML_HealthFrame.healthbartext:SetText(math.floor(_HP).."%", 1, 1, 1, 1)
	CML_HealthFrame.healthbarnumbers:SetText(UnitHealth("player").." / "..UnitHealthMax("player"), 1, 1, 1, 1)
	CML_HealthFrame:GetStatusBarTexture():SetTexture(PlayerR, PlayerG, PlayerB,1,"OVERLAY") 
end

function UiBar_SetMana()
	local _Mana = UnitPower("player")
	CML_RessourcesFrame:GetStatusBarTexture():SetTexture(36/255, 54/255, 255/255,0.90,"OVERLAY")
	CML_RessourcesFrame:SetMinMaxValues(0, 100)
	local ManaPercent = (_Mana/UnitPowerMax("player")*100)
	CML_RessourcesFrame:SetValue(ManaPercent)
	CML_RessourcesFrame.Text:SetText(math.floor(ManaPercent).."%", 1, 1, 1, 0.7)
end

function UiBar_SetPet()
	if UnitExists("pet") == nil then
		CML_VengeanceFrame.Text:SetText("No Pet", 1, 1, 1, 0.7)
		CML_VengeanceFrame:GetStatusBarTexture():SetTexture(196/255,31/255,59/255,"OVERLAY")
	else
		local PetHealth = (UnitHealth("pet")/UnitHealthMax("pet"))*100
		CML_VengeanceFrame:GetStatusBarTexture():SetTexture(255/255, 255/255, 255/255,0.90,"OVERLAY")
		CML_VengeanceFrame:SetValue(PetHealth)
		CML_VengeanceFrame.Text:SetText(PetHealth.."%", 1, 1, 1, 0.7)
		CML_VengeanceFrame:SetMinMaxValues(0, 100)
	end
end

function UiBar_SetPower()
	local _Power = nil
	if _MyClass == 1 then _Power = _TasteForBlood end
	if _MyClass == 2 then _Power = _HolyPower end
	if _MyClass == 5 then _Power = _Evangelism end
	if _Power then
		if _Power >= 1 then CML_VengeanceFrame.HP1Bar:Show() else CML_VengeanceFrame.HP1Bar:Hide() end
		if _Power >= 2 then CML_VengeanceFrame.HP2Bar:Show() else CML_VengeanceFrame.HP2Bar:Hide() end
		if _Power >= 3 then CML_VengeanceFrame.HP3Bar:Show() else CML_VengeanceFrame.HP3Bar:Hide() end
		if _Power >= 4 then CML_VengeanceFrame.HP4Bar:Show() else CML_VengeanceFrame.HP4Bar:Hide() end
		if _Power >= 5 then CML_VengeanceFrame.HP5Bar:Show() else CML_VengeanceFrame.HP5Bar:Hide() end
	end
end

function UiBar_SetRunes()
	-- 1 Blood
	-- 2 Blood
	-- 3 Unholy
	-- 4 Unholy
	-- 5 Frost
	-- 6 Frost
	local _Blood1,_Blood2,_Unholy1,_Unholy2,_Frost1,_Frost2 = _Blood1,_Blood2,_Unholy1,_Unholy2,_Frost1,_Frost2
	if GetRuneCount(1) == 1 then _Blood1 = GetRuneType(1) end
	if GetRuneCount(2) == 1 then _Blood2 = GetRuneType(2) end
	if GetRuneCount(3) == 1 then _Unholy1 = GetRuneType(3) end
	if GetRuneCount(4) == 1 then _Unholy2 = GetRuneType(4) end
	if GetRuneCount(5) == 1 then _Frost1 = GetRuneType(5) end
	if GetRuneCount(6) == 1 then _Frost2 = GetRuneType(6) end

	if _Blood1 == 1 then 
		CML_VengeanceFrame.A2Bar:Show() 
		CML_VengeanceFrame.A2Bar:SetTexture(196/255,31/255,59/255,1)
	elseif _Blood1 == 4 then
		CML_VengeanceFrame.A2Bar:Show() 
		CML_VengeanceFrame.A2Bar:SetTexture(182/255,0/255,207/255,1)
	else 
		CML_VengeanceFrame.A2Bar:Hide() 
	end
	if _Blood2 == 1 then 
		CML_VengeanceFrame.HP2Bar:Show() 
		CML_VengeanceFrame.HP2Bar:SetTexture(196/255,31/255,59/255,1)
	elseif _Blood2 == 4 then
		CML_VengeanceFrame.HP2Bar:Show() 
		CML_VengeanceFrame.HP2Bar:SetTexture(182/255,0/255,207/255,1)
	else 
		CML_VengeanceFrame.HP2Bar:Hide() 
	end	
	if _Unholy1 == 2 then 
		CML_VengeanceFrame.A3Bar:Show() 
		CML_VengeanceFrame.A3Bar:SetTexture(40/255,235/255,19/255,1)
	elseif _Unholy1 == 4 then
		CML_VengeanceFrame.A3Bar:Show() 
		CML_VengeanceFrame.A3Bar:SetTexture(182/255,0/255,207/255,1)
	else 
		CML_VengeanceFrame.A3Bar:Hide() 
	end
	if _Unholy2 == 2 then 
		CML_VengeanceFrame.HP3Bar:Show() 
		CML_VengeanceFrame.HP3Bar:SetTexture(40/255,235/255,19/255,1)
	elseif _Unholy2 == 4 then
		CML_VengeanceFrame.HP3Bar:Show() 
		CML_VengeanceFrame.HP3Bar:SetTexture(182/255,0/255,207/255,1)
	else 
		CML_VengeanceFrame.HP3Bar:Hide() 
	end	
	if _Frost1 == 3 then 
		CML_VengeanceFrame.A4Bar:Show() 
		CML_VengeanceFrame.A4Bar:SetTexture(10/255,173/255,255/255,1)
	elseif _Frost1 == 4 then
		CML_VengeanceFrame.A4Bar:Show() 
		CML_VengeanceFrame.A4Bar:SetTexture(182/255,0/255,207/255,1)
	else 
		CML_VengeanceFrame.A4Bar:Hide() 
	end
	if _Frost2 == 3 then 
		CML_VengeanceFrame.HP4Bar:Show() 
		CML_VengeanceFrame.HP4Bar:SetTexture(10/255,173/255,255/255,1)
	elseif _Frost2 == 4 then
		CML_VengeanceFrame.HP4Bar:Show() 
		CML_VengeanceFrame.HP4Bar:SetTexture(182/255,0/255,207/255,1)
	else 
		CML_VengeanceFrame.HP4Bar:Hide() 
	end		
end

function UiBar_SetRage()
	CML_RessourcesFrame:GetStatusBarTexture():SetTexture(196/255,31/255,59/255,0.90,"OVERLAY")
	CML_RessourcesFrame:SetValue(_Rage)
	CML_RessourcesFrame.Text:SetText(_Rage.."/".._RageMax, 1, 1, 1, 0.7)
	CML_RessourcesFrame:SetMinMaxValues(0, _RageMax)
end

function UiBar_SetRunic()
	CML_RessourcesFrame:GetStatusBarTexture():SetTexture(31/255, 255/255, 225/255,0.90,"OVERLAY")
	CML_RessourcesFrame:SetValue(_Runic)
	CML_RessourcesFrame.Text:SetText(_Runic.."/".._RunicMax, 1, 1, 1, 0.7)
	CML_RessourcesFrame:SetMinMaxValues(0, _RunicMax)
end

function UiBar_SetStance()
	if GetShapeshiftForm() == 1 then
		CML_VengeanceFrame.healingmodebartext:SetText("Bat", 1, 1, 1, 0.7)
		CML_VengeanceFrame.healingmodebar:SetTexture(196/255,31/255,59/255,1)
		CML_VengeanceFrame.healingmodebartext:SetTextColor(255/255, 255/255, 255/255,1)
	elseif GetShapeshiftForm() == 2 then
		CML_VengeanceFrame.healingmodebartext:SetText("Def", 1, 1, 1, 0.7)
		CML_VengeanceFrame.healingmodebar:SetTexture(0/255, 78/255, 222/255,1)
		CML_VengeanceFrame.healingmodebartext:SetTextColor(255/255, 255/255, 255/255,1)
	else
		CML_VengeanceFrame.healingmodebartext:SetText("Ber", 1, 1, 1, 0.7)
		CML_VengeanceFrame.healingmodebar:SetTexture(0/255, 222/255, 211/255,1)
		CML_VengeanceFrame.healingmodebartext:SetTextColor(255/255, 255/255, 255/255,1)
	end
end

function UiBar_SetVengeance(VengeanceID)
	CML_VengeanceFrame:GetStatusBarTexture():SetTexture(196/255,31/255,59/255,0.90,"OVERLAY")
	if UnitAura("player", GetSpellInfo(VengeanceID)) ~= nil then
		CML_MyVengeance = math.floor(select(15,UnitAura("player", GetSpellInfo(VengeanceID)))/1000)
	else
		CML_MyVengeance = 0
	end
	CML_MyMaxVengeance = math.floor(UnitHealthMax("player")/2000)
	CML_MyVengeancePercent = math.floor((CML_MyVengeance/CML_MyMaxVengeance)*100)
	CML_VengeanceFrame:SetValue(CML_MyVengeancePercent)
	CML_VengeanceFrame.Text:SetText((CML_MyVengeance).."k ("..CML_MyVengeancePercent.."%)", 1, 1, 1, 0.7)
end

function UiBar_SetBeacon()
	CML_VengeanceFrame:GetStatusBarTexture():SetTexture(196/255,31/255,59/255,0.90,"OVERLAY")
	if BeaconTarget == nil or not UnitExists(BeaconTarget) then
		CML_VengeanceFrame:SetValue(0)
		CML_VengeanceFrame.Text:SetText("No Target", 1, 1, 1, 0.7)
	else
		CML_VengeanceFrame:SetValue(CML.GetHP(BeaconTarget))
		BeaconName = UnitName(BeaconTarget)
		if string.len(tostring(BeaconName)) > 9 then
			ShortBeaconName = string.sub(tostring(BeaconName), 1, 9)
		else
			ShortBeaconName = tostring(BeaconName)
		end
		CML_VengeanceFrame.Text:SetText("|cffFFFFFF"..ShortBeaconName, 1, 1, 1, 0.7)
	end
end


function UiBar_SotR()
	local SotRFound = false
	local i = 1
	while UnitBuff("player", i) do
		if UnitBuff("player",i) == GetSpellInfo(53600) then 
		  	SotRTimer = select(7, UnitBuff("player", i)) - GetTime() 
		  	SotRFound = true
		end
		i = i + 1
	end
	if SotRFound ~= true then
		SotRTimer = 0 
	end
	CML_RessourcesFrame:SetValue(SotRTimer)
	SotRTimer = math.floor(SotRTimer*10)/10
	CML_RessourcesFrame.Text:SetText(SotRTimer, 1, 1, 1, 0.7)
	CML_RessourcesFrame:GetStatusBarTexture():SetTexture(149/255, 36/255, 255/255,0.90,"OVERLAY")
	CML_RessourcesFrame:SetMinMaxValues(0, 10)
end

end