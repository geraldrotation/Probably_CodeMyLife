CML = {} 

-- /dump ProbablyEngine.dsl.get("nNova")("1")
-- /dump ProbablyEngine.dsl.get("macros")("ActiveHealing")
--[[----------------------------------------------------------------------------------------------
--------------------------------------------- General --------------------------------------------
------------------------------------------------------------------------------------------------]]
function CML.ActiveCooldowns()
	if macros["ActiveCooldowns"] and CML.Melee(true) then
		return true
	end
	return false
end	

function CML.CanHeal(unit)
	if CML.IsInSight(unit, 2) and UnitInRange("unit") ~= nil 
	  and UnitCanCooperate("player",unit) ~= nil			
	  and UnitIsDeadOrGhost(unit) ~= 1
	  and CML.CannotHealDebuffs(unit) == false then
		return true
	end
end

function CML.CannotHealDebuffs(unit)
	local Debuffs = {
	  104451, -- Ice Tomb
	  76577, -- Smoke Bomb
	  121949, -- Parasistic Growth
	  122784, -- Reshape Life
	  122370, -- Reshape Life 2
	  123184, -- Dissonance Field
	  123255, -- Dissonance Field 2
	  123596, -- Dissonance Field 3 
	  128353, -- Dissonance Field 4
	}
	for i = 1, #Debuffs do
		if UnitDebuffID(unit,Debuffs[i]) ~= nil then
			return false
		end
	end
	return true
end

function CML.ChopChop()
	if UnitExists("target") and UnitIsDeadOrGhost("target") and  GetItemCount(90175, false, true) > 0 and select(2,GetItemCooldown(90175)) == 0 then
        return true
    end
end

function CML.CombatCheck()
	if UnitBuffID("player",104934) or UnitBuffID("player",80169) or UnitBuffID("player",87959)
	  or UnitBuffID("player",11392) or UnitBuffID("player",11392) or UnitChannelInfo("player") 
	  or UnitIsDeadOrGhost("player") or UnitIsDeadOrGhost("target") or (not UnitAffectingCombat("player") and CombatCheckCheck) or (macros ~= nil and macros["Pause"] == true) then
	  	if macros and macros["Pause"] then
	  		RunMacroText("/ClearTarget")
	  		RunMacroText("/StopAttack")
	  		PetFollow()
	  	end
	  	return true
	end
	if PQIprefix and (_G[PQIprefix.."Pause_enable"] and PQI:IsHotkeys(_G[PQIprefix.."Pause_key"])) then
		return true
	end
	return false
end

function CML.Dispel()
	if macros and macros["ActiveDispel"] then
		if UnitExists("boss1") then
			if CML.GetUnitID("boss1") == 71734 then
				if not UnitBuffID("player",144359) then 
					return false
				end
			end
		end
		for i=1, #nNova do
			if nNova[i].dispel == true then 
				ProbablyEngine.dsl.parsedTarget = nNova[i].unit
				return true
			end
		end
	end
	return false
end

function CML.DispelThis(unit)
	local ToDispelList = {
		12345,
	}
	for i = 1, #ToDispelList do
		if UnitBuffID(unit,i) then
			return true
		end
	end
end

function CML.DPSPotion(ItemID)
	if select(3,GetItemCooldown(ItemID)) == 0 
	  and GetItemCount(ItemID,false,true) > 0
	  and (UnitBuffID("player", 2825) 
	  or UnitBuffID("player",32182) 
	  or UnitBuffID("player",80353) 
	  or UnitBuffID("player",90355)) then 
		return true
	end
end	

function CML.ForceMouseCast()
	if SpellIsTargeting() then 
		CameraOrSelectOrMoveStart() 
		CameraOrSelectOrMoveStop() 
		return true 
	end
	return true
end

-- /dump CML.GetDistance("player","target")
function CML.GetDistance(T1,T2)
	Zone1, T1X, T1Y = CML.UnitInfo(T1) 
	Zone2, T2X, T2Y = CML.UnitInfo(T2) 
	if T1X == nil or T2X == nil or Zone1 ~= Zone2 then return 0 end
	XDist = math.abs(T1X - T2X)
	YDist = math.abs(T1Y - T2Y)
	Distance = 1975.27205951036*(XDist + YDist)
	return Distance
end	

function CML.GetHP(unit)
	local hp = 100 * UnitHealth(unit) / UnitHealthMax(unit)
	return hp 
end

function CML.GetSpellCD(MySpell)
	if GetSpellCooldown(GetSpellInfo(MySpell)) == nil then
		return 0
	else
		local Start ,CD = GetSpellCooldown(MySpell)
		local MyCD = Start + CD - GetTime()
		return MyCD
	end
end

function CML.GetUnitID(target) 
	if UnitExists(target) ~= 1 then return false end
	local UnitConvert = tonumber(UnitGUID(target):sub(6,10), 16)
	return UnitConvert
end

-- Paladin = CML.GetVengeance(93098) -- UnitAura("player", GetSpellInfo(93098))
function CML.GetVengeance(VengeanceID)
	if UnitBuffID("player",VengeanceID) then
		_, _, _, _, _, _, VengeanceTimer, _, _, _, _, _, _, _, Vengeance = UnitAura("player", GetSpellInfo(VengeanceID))
		VengeanceFade = VengeanceTimer - GetTime()
		return Vengeance, VengeanceFade
	else
		return 0, 0 
	end
	return false
end

function CML.GiftOfTheNaaru()
 	if nNova[1].hp < 30 then
		return true
	end
	return false
end

function CML.HealEngine()
	if NovaEngineUpdate and NovaEngineUpdate <= GetTime() - 0.2 then
		NovaEngineUpdate = GetTime()
		nNova:Update()
	end
end

function CML.HealthStone()
	if not PQIprefix then return false end
    if _G[PQIprefix.."Healthstone_enable"] and GetItemCount(5512, false, true) > 0 and select(2,GetItemCooldown(5512)) == 0 and _HP < _G[PQIprefix.."Healthstone_value"] then
        return true
    end
end

function CML.IsGlyphed(GlyphID,State)
	local Glyphed = false
	for i = 1, 6 do
		_, _, _, glyphSpell, _ = GetGlyphSocketInfo(i, nil)
		if glyphSpell == GlyphID then
			Glyphed = true
			if State == true then
				return true
			end
		end
	end
	if Glyphed == false and State == false then 
		return true 
	end
	return false
end

function CML.IsQueued(ID)
	if _Queues[ID] == true then
		return true
	end
	return false
end

function CML.IsInFront(unit, seconds)
	local RawUnit = unit
	if UnitExists(unit) then unit = UnitName(unit) else return false end
	if seconds == nil then seconds = 3 end
	if ProbablyEngine.module.player.notinfront[unit] and ProbablyEngine.module.player.notinfront[unit] > GetTime() - seconds then
		return false
	end
	ProbablyEngine.dsl.parsedTarget = RawUnit
	return true
end

function CML.IsInSight(unit, seconds)
	local iceTombPlayer = UnitDebuffID("player", 104451)
	local iceTombUnit = UnitDebuffID(unit, 104451)
	if iceTombPlayer or iceTombUnit then return false end
	if UnitExists(unit) then unit = UnitName(unit) else return false end
	if seconds == nil then seconds = 3 end
	if ProbablyEngine.module.player.los[unit] and ProbablyEngine.module.player.los[unit] > GetTime() - seconds then
		return false
	end
	return true
end

function CML.Melee(State)
	if IsSpellInRange(GetSpellInfo(_RangeSpell),target) == 1 then
		if State == true then 
			return true
		end
	elseif State == false then
		return true
	end
	return false
end

function CML.MouseoverIsTarget()
	if UnitIsUnit("target","mouseover") == 1 then 
		return true
	end
end

function CML.SetFocus()
	if _G[PQIprefix.."SetFocus_enable"] then
		if PQI:IsHotkeys(_G[PQIprefix.."SetFocus_key"]) then
			RunMacroText("/focus [target=mouseover]")
		end
	end
end

function CML.PetManager(value)
	if _G[PQIprefix.."ActivePetWhistle_enable"] then
		if not UnitExists("pet") then
			local ActivePetWhistle = _G[PQIprefix.."ActivePetWhistle_value"]
  		  	if not UnitIsDead("pet") then
  				if ( LastWhistle == nil or LastWhistle and LastWhistle <= GetTime() - 15 ) then 
  					if ActivePetWhistle == value then
  						return true
  					end
  				end
  			elseif value == 0 then
  				return true
  			end
  		end
  	end
end
function CML.PetMove()
	if UnitExists("pet") then
		if UnitExists("mouseover") == 1 then
			PetAttack("mouseover") 
			return false
		end
		if not GetCurrentKeyBoardFocus() then
			PetMoveTo()
			CameraOrSelectOrMoveStart() 
			CameraOrSelectOrMoveStop() 
		end
		return false
	end
end

function CML.SnapShot()
	PlayerSpellHaste = UnitSpellHaste("player")
	PlayerMeleeHaste = GetMeleeHaste()
	PlayerAttackPower = UnitAttackPower("player")
	PlayerSpellPower = GetSpellBonusDamage(2)
	PlayerMastery = GetMastery()
end

function CML.UnitInfo(unit)
	local MapName = GetMapInfo(unit)
	local unitX, unitY = GetPlayerMapPosition(unit) 
	if MapName and unitX and unitY then 
		return MapName, unitX, unitY
	end
end

function CML.TierScanner(List,Bool)
	local k = 0
	for i=1,19 do
	  	if GetInventoryItemID("player", i) ~= nil then
	    	for j=1,5 do
	    		if GetItemInfo(GetInventoryItemID("player", i)) == GetItemInfo(List[j]) then
	    			k=k+1
	    		end
	    	end
	  	end
	end
	if Bool then
		if k >= Bool then
			return true
		else
			return false
		end
	else
		return k
	end
end

function CML.ValidDispel(t)
	local HasValidDispel = false
	local i = 1
	local debuff = UnitDebuff(t, i)
	while debuff do
		local debuffType = select(5, UnitDebuff(t, i))
		if (_Spec == 1 and debuffType == "Magic") or debuffType == "Disease" or debuffType == "Poison" then
			HasValidDispel = true
		end
		i = i + 1
		debuff = UnitDebuff(t, i)
	end
	return HasValidDispel
end

--[[----------------------------------------------------------------------------------------------
--------------------------------------------- PQInterface ----------------------------------------
------------------------------------------------------------------------------------------------]]

function CML.PQIConfing()
	if not _Started then
		_Started = true
		PQR_BotLoaded()
	end	_Spec = GetSpecialization()
	if _MyClass == 1 then -- Warrior
		CML.WarriorStartup()
	elseif _MyClass == 2 then -- Paladin
		CML.PaladinStartup()
	elseif _MyClass == 3 then -- Hunter
		CML.HunterStartup()
	elseif _MyClass == 4 then -- Rogue
		CML.RogueStartup()
	elseif _MyClass == 5 then -- Priest
		CML.PriestStartup()
	elseif _MyClass == 6 then -- Deathknight
		CML.DeathknightStartup()
	elseif _MyClass == 7 then -- Shaman
		CML.ShamanStartup()		
	elseif _MyClass == 8 then -- Mage
		CML.MageStartup()		
	elseif _MyClass == 9 then -- Warlock
		CML.WarlockStartup()		
	elseif _MyClass == 10 then -- Monk
		CML.MonkStartup()						
	elseif _MyClass == 11 then -- Druid
		CML.DruidStartup()
	end
	_Spec = GetSpecialization()
	_MyClass = select(3,UnitClass("player"))

	if not _DataLoaded then DataLoader() end
	if PQIprefix == nil then return true end
	PlayerStatus 	= _G[PQIprefix.."PlayerStatus_enable"]
	PauseKeyCheck 	= _G[PQIprefix.."Pause_enable"]
	PauseKey 		= PQI:IsHotkeys(_G[PQIprefix.."Pause_key"])
	CML_Debug 		= _G[PQIprefix.."Debug_enable"]
	CML_DebugValue 	= _G[PQIprefix.."Debug_value"]	
	CML.SetFocus()
	if PlayerStatus == nil then return true end
	return false
end

function CML.Status()
	if PQIprefix == nil then return true end
	-- Bubba's update our users Health and Sort
	if NovaEngineUpdate == nil then NovaEngineUpdate = 0 end
	if NovaEngineUpdate and NovaEngineUpdate <= GetTime() - 0.2 then
		NovaEngineUpdate = GetTime()
		nNova:Update()
	end

	-- Globals
	_HP = ( 100 * UnitHealth("player") / UnitHealthMax("player") )
	if macros["ActiveHealing"] ~= nil then
		_ActiveHealing = macros["ActiveHealing"]
	end
	_Mana = (100 * UnitPower("player") / UnitPowerMax("player"))

	-- Classes/Spec Specific
	if _MyClass == 1 then
		_TasteForBlood = select(4,UnitBuffID("player", 60503))
		_Rage = UnitPower("player")
		_RageMax = UnitPowerMax("player")
	elseif _MyClass == 2 then
		_HolyPower = UnitPower("player", 9)
		if _Spec == 2 then 
			ProtT16Equipped = CML.TierScanner(ProtPalT16,4) 
			_Vengeance = select(15,UnitAura("player", GetSpellInfo(93099)))
		end
	elseif _MyClass == 3 then
		if not _HunterButton then
			_HunterButton = true
			ProbablyEngine.toggle.create('pack', 'Interface\\Icons\\ability_mount_whitetiger', 'Enable Pack', 'Enabling this will make your Aspect swap to pack rather than cheetah when out of combat.')
		end
		_Focus = UnitPower("player")
		_FocusMax = UnitPowerMax("player")	
	elseif _MyClass == 5 then
		_Evangelism = select(4,UnitBuffID("player", 81661))
	elseif _MyClass == 6 then		
		_Runic = UnitPower("player")
		_RunicMax = UnitPowerMax("player")
		_Vengeance = select(15,UnitAura("player", GetSpellInfo(93098)))	
	elseif _MyClass == 10 then	
		_Chi = UnitPower("player",12) 
	elseif _MyClass == 11 then
		if _Spec == 3 then
			_Rage = UnitPower("player")
			_RageMax = UnitPowerMax("player")
		end
	end
	-- LastTarget Holder
	if UnitExists("target") and UnitName("target") ~= CML_Target then 
		LastTarget = GetTime() 
		CML_LastTarget = CML_Target
		CML_Target = UnitName("target")
	end

	-- Show/Hide
	if _G[PQIprefix.."PlayerStatus_enable"] then
		CML_VengeanceFrame:Show()
	else
		CML_VengeanceFrame:Hide()
	end
	local StatusX,StatusY = tonumber(_G[PQIprefix.."PlayerStatusX_value"]),tonumber(_G[PQIprefix.."PlayerStatusY_value"])
	CML_VengeanceFrame:ClearAllPoints();
	CML_VengeanceFrame:SetPoint("BOTTOMLEFT", "UIParent", "BOTTOMLEFT",StatusX,StatusY)
	

	UiBar_ActiveCooldowns()
	UiBar_Borders()
	UiBar_SetHealth()
	UiBar_SetPower()

	if _MyClass == 1 then -- Warrior
		UiBar_ActiveHealing()
		UiBar_AoE()
		UiBar_SetRage()
		UiBar_SetStance()
		if _Spec == 3 then
			UiBar_SetMitigation()
			UiBar_SetVengeance(93098)
		else
			UiBar_SetDebuff(86346)
		end
	elseif _MyClass == 2 then -- Paladin
		if _Spec == 1 then
			UiBar_ActiveDispel()
			UiBar_ActiveDPS()
			UiBar_SetMana()
			UiBar_ActiveHealing() 
			UiBar_SetBeacon()
		elseif _Spec == 2 then
			UiBar_ActiveHealing()
			UiBar_AoE()
			UiBar_SetVengeance(84839)
			UiBar_SotR()
		else
			UiBar_ActiveHealing()
			UiBar_AoE()
			UiBar_SetBuff(84963)
			UiBar_SetMana()
		end
	elseif _MyClass == 3 then -- Hunter
		UiBar_ActiveHealing()
		UiBar_AoE()
		UiBar_SetFocus()
		UiBar_SetPet()
	elseif _MyClass == 4 then -- Rogue
		UiBar_AoE()
		UiBar_SetEnergy()
		UiBar_ActiveHealing()
		UiBar_Combo()
		UiBar_SetDebuff(1943)
	elseif _MyClass == 5 then -- Priest
		if _Spec == 1 then
			UiBar_ActiveDispel()
			UiBar_ActiveDPS()
			UiBar_Nova1()
			UiBar_ActiveHealing()
			UiBar_SetMana()
		end		
	elseif _MyClass == 6 then -- DeathKnight
		UiBar_AoE()
		UiBar_ActiveHealing()
		UiBar_SetRunic()
		UiBar_SetRunes()
		UiBar_SetDebuff(55078)
		if _Spec == 1 then
			UiBar_SetVengeance(93099)
		end
	elseif _MyClass == 7 then -- Shaman
		UiBar_ActiveHealing()
		UiBar_AoE()
		UiBar_SetMana()
		UiBar_SetDebuff(8050)
	elseif _MyClass == 8 then -- Mage
		UiBar_ActiveHealing()
		UiBar_AoE()
		UiBar_SetMana()
		if _Spec == 3 then
			UiBar_SetPet()
		else
			UiBar_SetDebuff(44457)
		end
	elseif _MyClass == 9 then -- Warlock
		UiBar_ActiveHealing()
		UiBar_AoE()
		UiBar_SetMana()
		if _Spec == 2 then
			UiBar_SetFury()
		else
			UiBar_SetPet()
		end
	elseif _MyClass == 10 then -- Monk
		UiBar_AoE()
		UiBar_SetEnergy()
		UiBar_ActiveHealing()
		UiBar_SetPower()
		UiBar_SetDebuff(1943)
	elseif _MyClass == 11 then -- Druid
		if _Spec == 1 then
			UiBar_ActiveHealing()
			UiBar_AoE()
			UiBar_SetEclipse()
			UiBar_SetMana()
		end
		if _Spec == 3 then
			UiBar_ActiveHealing()
			UiBar_AoE()
			UiBar_SetVengeance(84840)
			UiBar_SetRage()
		end	
		if _Spec == 4 then
			UiBar_ActiveHealing()
			UiBar_AoE()
			UiBar_SetMana()
		end			
	end
	return false
end

ProbablyEngine.library.register("CML", CML)

--[[









]]



local UnitBuff = function(target, spell, owner)
  local buff, count, caster, expires, spellID
  if tonumber(spell) then
    local i = 0; local go = true
    while i <= 40 and go do
      i = i + 1
      buff,_,_,count,_,_,expires,caster,_,_,spellID = _G['UnitBuff'](target, i)
      if not owner then
        if spellID == tonumber(spell) and caster == "player" then go = false end
      elseif owner == "any" then
        if spellID == tonumber(spell) then go = false end
      end
    end
  else
    buff,_,_,count,_,_,expires,caster = _G['UnitBuff'](target, spell)
  end
  return buff, count, expires, caster
end

local UnitDebuff = function(target, spell, owner)
  local debuff, count, caster, expires, spellID
  if tonumber(spell) then
    local i = 0; local go = true
    while i <= 40 and go do
      i = i + 1
      debuff,_,_,count,_,_,expires,caster,_,_,spellID = _G['UnitDebuff'](target, i)
      if not owner then
        if spellID == tonumber(spell) and caster == "player" then go = false end
      elseif owner == "any" then
        if spellID == tonumber(spell) then go = false end
      end
    end
  else
    debuff,_,_,count,_,_,expires,caster = _G['UnitDebuff'](target, spell)
  end
  return debuff, count, expires, caster
end






-- activestance == returns macros["Stance"] can be compared	   	"player.activestance = 1"
-- aoe 			== returns macros["AoE"] can be compared	   	"player.aoe = 1"
-- macros		== made to read my macros table 				"macros(ActiveCooldowns)"
-- novaBuff 	== true if a specific target have BuffID 		"1.novaBuff(12345)"
-- novaHealing 	== true if specific member hp under pqi value 	"SelfFlame.pqivalue(0)"    <<-- 0 is player others are nNova[#].unit 69 is pet
-- petinmelee	== hunter check if growl spell in range 		"petinmelee"
-- pqicheck 	== true if pqi is checked 						"SelfFlame.pqicheck"
-- pqikeybind 	== true if associated keybind pressed 			"Traps.pqikeybind"
-- pqivalue 	== return PQI value (number) can be compared	"BestialWrath.pqivalue = 1"
-- queuecast 	== will cast the queued ability (spell ID) 		"queuecast(82692)"
-- sotr 		== shield of the righteous check  				"player.sotr"
-- spell.casttime == return spell cast time to be compared 		"spell.casttime < 1.6"
-- talent 		== talent index learned returns true 			"Talent(1)"
-- validtarget	== regular checks(facing los isimmune)			"target.validtarget"
-- value 		== returns value to be compared 				"_Spec.value = 1"

ProbablyEngine.condition.register("activestance", function()
	if not macros then return false end
	return macros["Stance"]
end)

ProbablyEngine.condition.register("activeseal", function()
	if not macros then return false end
	return macros["ActiveSeal"]
end)

ProbablyEngine.condition.register("aoe", function()
	if not macros then return false end
	return macros["AoE"]
end)

ProbablyEngine.condition.register("mitigation", function()
	if not macros then return false end
	return macros["ActiveMitigation"]
end)

ProbablyEngine.condition.register("debuff.damage", function(target, spell)
	local debuff,_,_,_,_,_,expires,caster,_,_,_,_,_,_,damage = UnitDebuff(target, spell)
	
	if debuff ~= nil and (caster == 'player' or caster == 'pet') then
		return damage
	end
	return 0
end)

ProbablyEngine.condition.register("hasaura", function(unit, spell)
	local spell = GetRaidBuffTrayAuraInfo(spell)
	return (spell ~= nil)
end)

ProbablyEngine.condition.register("hashero", function(unit, spell)
	local Hero1 = UnitBuffID(unit, 2825) 
	local Hero2 = UnitBuffID(unit, 32182)
	local Hero3 = UnitBuffID(unit, 80353)
	local Hero4 = UnitBuffID(unit, 90355)
	if Hero1 or Hero2 or Hero3 or Hero4 then
		return true
	end
end)

ProbablyEngine.condition.register("hasSpell", function(target, spell)
	if IsSpellKnown(spell) then
		return true
	end
	return false
end)

ProbablyEngine.condition.register("HasSpell", function(target, spell)
  return ProbablyEngine.condition["hasSpell"](target, spell)
end)

ProbablyEngine.condition.register("isinfront", function(target, time)
	local time = 1
	if ProbablyEngine.module.player.notinfront[UnitName(tostring(target))] == nil then return true end
  	return (ProbablyEngine.module.player.notinfront[UnitName(tostring(target))] < GetTime() - time)
end)

ProbablyEngine.condition.register("iamtarget", function()
	return (UnitIsUnit("player","targettarget") ~= nil)
end)

ProbablyEngine.condition.register("canattack", function(target)
  	if UnitExists(target) and UnitHealth(target) > 0 then
  		target = tostring(target)
    	return (UnitCanAttack("player", target) == 1)
  	end
  	return false
end)

ProbablyEngine.condition.register("macros", function(name)
	if macros then
		local name = tostring(name)
		return macros[name]
	end
end)

ProbablyEngine.condition.register("nova.dispel", CML.Dispel())


ProbablyEngine.condition.register("novaBuff", function(target, value)
	local Spell = value
	if target == "0" then 
		rawunit = "player" 
	elseif target == "69" then 
		rawunit = "pet" 
	else
		rawunit = tostring(nNova[tonumber(target)].unit) 
	end
	if UnitExists(rawunit) == 1 then
  		if UnitBuffID(rawunit, Spell) then
        	return true
        end
  	else
  		return false
  	end
end)

ProbablyEngine.condition.register("novaBuffCount", function(target, value)
	local Spell = value
	if target == "0" then 
		rawunit = "player" 
	elseif target == "69" then 
		rawunit = "pet" 
	else
		rawunit = tostring(nNova[tonumber(target)].unit) 
	end
	if UnitExists(rawunit) == 1 then
  		if UnitBuffID(rawunit, Spell) then
        	return select(4,UnitBuffID(rawunit, Spell))
        end
  	end
end)

ProbablyEngine.condition.register("novaTankBuffCount", function(target, value)
	local Spell = value
	if target == "0" then 
		rawunit = "player" 
	elseif target == "69" then 
		rawunit = "pet" 
	else
		rawunit = tostring(nNova[tonumber(target)].unit) 
	end
	if UnitExists(rawunit) == 1 then
  		if UnitBuffID(rawunit, Spell) and nNova[tonumber(value)].role == "TANK" then
        	return select(4,UnitBuffID(rawunit, Spell))
        end
  	end
end)

ProbablyEngine.condition.register("novaDebuff", function(target, value)
	local Spell = value
	if target == "0" then 
		rawunit = "player" 
	elseif target == "69" then 
		rawunit = "pet" 
	else
		rawunit = tostring(nNova[tonumber(target)].unit) 
	end
	if UnitExists(rawunit) == 1 then
  		if UnitDebuffID(rawunit, Spell) then
        	return true
        end
  	else
  		return false
  	end
end)

ProbablyEngine.condition.register("novaTank", function(name,value)
	if PQIprefix == nil then return false end
	local PQICheck = _G[PQIprefix..name.."_enable"]
	if value == "0" then 
		rawunit = "player" 
	elseif value == "69" then 
		rawunit = "pet" 
	elseif value and #nNova >= tonumber(value) and nNova[tonumber(value)].unit ~= nil then
		rawunit = tostring(nNova[tonumber(value)].unit) 
	end
	if value ~= "0" and value ~= "69" then
		if nNova[tonumber(value)].range == 0 then return false end
	end
  	local PQIValue = _G[PQIprefix..name.."_value"]
  	if PQICheck and UnitExists(rawunit) == 1 and CML.GetHP(rawunit) ~= nil and tonumber(PQIValue) ~= nil then
  		if (CML.GetHP(rawunit) <= tonumber(PQIValue)) and nNova[tonumber(value)].role == "TANK" then
        	ProbablyEngine.dsl.parsedTarget = rawunit
        	return true
        end
  	else
  		return false
  	end
end)

ProbablyEngine.condition.register("novaHealing", function(name,value)
	if PQIprefix == nil then return false end
	local PQICheck = _G[PQIprefix..name.."_enable"]
	if value == "0" then 
		rawunit = "player" 
	elseif value == "69" then 
		rawunit = "pet" 
	elseif value and #nNova >= tonumber(value) and nNova[tonumber(value)].unit ~= nil then
		rawunit = tostring(nNova[tonumber(value)].unit) 
	end
	if value ~= "0" and value ~= "69" then
		if nNova[tonumber(value)].range == 0 then return false end
	end
  	local PQIValue = _G[PQIprefix..name.."_value"]
  	if PQICheck and UnitExists(rawunit) == 1 and CML.GetHP(rawunit) ~= nil and tonumber(PQIValue) ~= nil then
  		if (CML.GetHP(rawunit) <= tonumber(PQIValue)) then
        	ProbablyEngine.dsl.parsedTarget = rawunit
        	return true
        end
  	else
  		return false
  	end
end)

ProbablyEngine.condition.register("novaAoEHealing10", function(name,value)
	if PQIprefix == nil then return false end
	local PQICheck = _G[PQIprefix..name.."_enable"]
	if value == "0" then 
		rawunit = "player" 
	elseif value == "69" then 
		rawunit = "pet" 
	elseif value and #nNova >= tonumber(value) and nNova[tonumber(value)].unit ~= nil then
		rawunit = tostring(nNova[tonumber(value)].unit) 
	end
	if value ~= "0" and value ~= "69" then
		if nNova[tonumber(value)].range == 0 then return false end
	end
  	local PQIValue = _G[PQIprefix..name.."_value"]
  	if PQICheck and UnitExists(rawunit) == 1 and CML.GetHP(rawunit) ~= nil and tonumber(PQIValue) ~= nil then
  		if (CML.GetHP(rawunit) <= tonumber(PQIValue)) then
  			local inRange = 0
  			for i = 1,#nNova do
  				if CML.GetHP(nNova[i].unit) <= tonumber(PQIValue) and CML.GetDistance(rawunit, nNova[i].unit) < 10 then
  					inRange = inRange + 1
  				end
  			end
        	ProbablyEngine.dsl.parsedTarget = rawunit
        	inRange = tonumber(inRange)
        	return (inRange >= _G[PQIprefix.."AoEHealTargets_value"])
        end
  	else
  		return 0
  	end
end)

ProbablyEngine.condition.register("novaAoEHealing30", function(name,value)
	if PQIprefix == nil then return false end
	local PQICheck = _G[PQIprefix..name.."_enable"]
	if value == "0" then 
		rawunit = "player" 
	elseif value == "69" then 
		rawunit = "pet" 
	elseif value and #nNova >= tonumber(value) and nNova[tonumber(value)].unit ~= nil then
		rawunit = tostring(nNova[tonumber(value)].unit) 
	end
	if value ~= "0" and value ~= "69" then
		if nNova[tonumber(value)].range == 0 then return false end
	end
  	local PQIValue = _G[PQIprefix..name.."_value"]
  	if PQICheck and UnitExists(rawunit) == 1 and CML.GetHP(rawunit) ~= nil and tonumber(PQIValue) ~= nil then
  		if (CML.GetHP(rawunit) <= tonumber(PQIValue)) then
  			local inRange = 0
  			for i = 1,#nNova do
  				if CML.GetHP(nNova[i].unit) <= tonumber(PQIValue) and CML.GetDistance(rawunit, nNova[i].unit) < 30 then
  					inRange = inRange + 1
  				end
  			end
        	ProbablyEngine.dsl.parsedTarget = rawunit
        	inRange = tonumber(inRange)
        	return (inRange >= _G[PQIprefix.."AoEHealTargets_value"])
        end
  	else
  		return 0
  	end
end)

ProbablyEngine.condition.register("pqiMana", function(name,value)
	local PQICheck = _G[PQIprefix..name.."_enable"]
	if value == "0" then 
		rawunit = "player" 
	elseif value == "69" then 
		rawunit = "pet" 
	end
  	local PQIValue = _G[PQIprefix..name.."_value"]
  	if PQICheck and UnitExists(rawunit) == 1 and _Mana ~= nil and tonumber(PQIValue) ~= nil then
  		if (_Mana <= tonumber(PQIValue)) then
        	return true
        end
  	else
  		return false
  	end
end)


ProbablyEngine.condition.register("petinmelee", function(target)
  	return (IsSpellInRange(GetSpellInfo(2649), target) == 1)
end)

ProbablyEngine.condition.register("pqicheck", function(name,value)
	if PQIprefix ~= nil then
		local PQICheck = _G[PQIprefix..name.."_enable"]
		return PQICheck
	else
		return false
	end
end)

ProbablyEngine.condition.register("pqikeybind", function(name,value)
	if not PQIprefix then return false end
	local PQICheck = _G[PQIprefix..name.."_enable"]
  	local PQIValue = PQI:IsHotkeys(_G[PQIprefix..name.."_key"])
  	if PQICheck and PQIValue then
        return true
  	end
end)

ProbablyEngine.condition.register("pqivalue", function(name,value)
	if not PQIprefix then return false end
	local PQICheck = _G[PQIprefix..name.."_enable"]
  	local PQIValue = _G[PQIprefix..name.."_value"] 
  	if PQICheck and PQIValue then
  		return PQIValue
  	end
end)

ProbablyEngine.condition.register("settarget", function(target)
	ProbablyEngine.dsl.parsedTarget = tostring(target) 
	return true 
end)

ProbablyEngine.condition.register("queuecast", function(spell)
	if _Queues and _Queues[tonumber(spell)] == true then 
		return true 
	else 
		return false 
	end
end)

ProbablyEngine.condition.register("sotr", function()
	local SotRPowValue = _G[PQIprefix.."ShieldoftheRighteous_value"]
    if SotRPowValue == 1 then return false end
    if UnitBuffID("player",90174) then return true end
    if (SotRPowValue == 2 and _HolyPower >= 3)
      or (SotRPowValue == 3 and _HolyPower >= 4)
      or (SotRPowValue == 4 and _HolyPower >= 5)
      or (SotRPowValue == 5 and _HolyPower >= 5 and (CML.GetSpellCD(35395) < 1 or CML.GetSpellCD(20271) < 1 or UnitDebuffID("player", 85416))) then return true end
    return false
end)


ProbablyEngine.condition.register("spellpowerboost", function(target)
	if PlayerSpellPower then
  		return (PlayerSpellPower <= (GetSpellBonusDamage(2)*90)/100)
  	end
end)

ProbablyEngine.condition.register("spell.quickcast", function(target, spell)
	local Starfiretime = (select(7,GetSpellInfo(spell))/1000)
  	local debuff,_,expires,caster = UnitBuff("player", 112071)
  	local Bufftime = (expires - (GetTime()-(ProbablyEngine.lag/1000)))
 	return (Bufftime > Starfiretime)
end)

ProbablyEngine.condition.register("spell.shock", function(target, spell)
	local Spelltime = (select(7,GetSpellInfo(spell))/1000)
  	local debuff,_,expires,caster = UnitDebuff("target", 8050)
 	if debuff then
 		Bufftime = (expires - (GetTime()-(ProbablyEngine.lag/1000)))
 		return (Bufftime > Spelltime)
 	end
end)

ProbablyEngine.condition.register("spell.casttime", function(target, spell)
  	return (select(7,GetSpellInfo(spell))/1000)
end)

ProbablyEngine.condition.register("talent", function(target,index)
	return select(5, GetTalentInfo(index)) or false
end)

ProbablyEngine.condition.register("totem.exists", function(target, totem)
   	local Exists = GetTotemInfo(totem)
    return Exists
end)


ProbablyEngine.condition.register("validtarget", function()
	local TargetName = UnitName("target") or "No Target"
	if CanAttackReport ~= nil and CanAttackReport <= time() - 1 then CanAttackReport = nil end
  	if UnitCanAttack("player", "target") == 1 then 
  		if ProbablyEngine.module.player.los[TargetName] == nil or (ProbablyEngine.module.player.los[TargetName] ~= nil and ProbablyEngine.module.player.los[TargetName] < time() - 1) then
  			return true
  		else
  			return false
  		end
  	end
end)

ProbablyEngine.condition.register("value", function(name,value)
  	local Value = _G[name]
  	return Value
end)

ProbablyEngine.condition.register("vengeance", function(name,value)
	local VengeanceID = 0
	if select(3,UnitClass("player")) == 1 then VengeanceID = 93098 -- Warrior
	elseif select(3,UnitClass("player")) == 2 then VengeanceID = 84839 -- Paladin
	elseif select(3,UnitClass("player")) == 6 then VengeanceID = 93099 -- DK
	elseif select(3,UnitClass("player")) == 10 then VengeanceID = 120267 -- Monk
	elseif select(3,UnitClass("player")) == 11 then VengeanceID = 84840 -- Druid
	end		
	if UnitBuff("player",VengeanceID) then
		Vengeance = select(15,UnitAura("player", GetSpellInfo(VengeanceID)))
		return Vengeance
	else
		return 0
	end
	return false
end)