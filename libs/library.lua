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
	--if  then CameraOrSelectOrMoveStart() CameraOrSelectOrMoveStop() return true end
	if UnitBuffID("player",104934) or UnitBuffID("player",80169) or UnitBuffID("player",87959)
	  or UnitBuffID("player",11392) or UnitBuffID("player",11392) --or UnitChannelInfo("player") 
	  or UnitIsDeadOrGhost("player") or UnitIsDeadOrGhost("target") or (not UnitAffectingCombat("player") and CombatCheckCheck) or (macros ~= nil and macros["Pause"] == true) then
	  	if macros and macros["Pause"] and not SpellIsTargeting() then
	  		if UnitExists("target") and UnitCanAttack("player","target") then
	  			RunMacroText("/ClearTarget")
	  		end
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

function CML.Cooldowns()
	if _MyClass == 2 and _Spec == 3 and UnitBuffID("player",84963) == nil then return false end
	-- DPS Potions
	if _G[Coolprefix.."DPSPotion_enable"] 
	  and not UnitBuffID("player",CML.DPSPotionsSet[CML.DPSPotionSelect()].Buff) 
	  and ProbablyEngine.module.player.potionused ~= true -- and CML.HasHero() 
	  and GetItemCooldown(CML.DPSPotionsSet[CML.DPSPotionSelect()].Item) == 0 
	  and GetItemCount(CML.DPSPotionsSet[CML.DPSPotionSelect()].Item,false,true) > 0 then 
		if _G[Coolprefix.."DPSPotion_value"] == 1 and UnitExists("boss1") then
		  	if CML_Debug then print("Using Potion(Opening Boss)") end
			UseItemByName(CML.DPSPotionsSet[CML.DPSPotionSelect()].Item)
		elseif _G[Coolprefix.."DPSPotion_value"] == 2 and CML.HasHero() then
		  	if CML_Debug then print("Using Potion(Heroism)") end
			UseItemByName(CML.DPSPotionsSet[CML.DPSPotionSelect()].Item)
		end
	end
	-- Professions CDs
	if _G[Coolprefix.."ProfessionsCDs_enable"] then
		if (_G[Coolprefix.."ProfessionsCDs_value"] == 1 and macros["ActiveCooldowns"]) or _G[Coolprefix.."ProfessionsCDs_value"] == 2 then
	  		if IsPlayerSpell(126731) ~= false and (not ProbablyEngine.module.player.synapseused or ProbablyEngine.module.player.synapseused <= GetTime() - 60) then
				RunMacroText("/use 10")
				ProbablyEngine.module.player.synapseused = GetTime()
			end
			if IsPlayerSpell(121279) ~= false and (not ProbablyEngine.module.player.lifebloodused or ProbablyEngine.module.player.lifebloodused <= GetTime() - 120) then
				local LifeBlood = GetSpellInfo(121279)
				RunMacroText("/cast "..LifeBlood)
			end
		end
	end
    -- Racials
  	if _G[Coolprefix.."Racials_enable"] then
		if (_G[Coolprefix.."Racials_value"] == 1 and macros["ActiveCooldowns"]) or _G[Coolprefix.."Racials_value"] == 2 then
			if not _Racial then
				if IsPlayerSpell(20572) == true and CML.GetSpellCD(20572) == 0 then
					_Racial = select(1,GetSpellInfo(20572))
					_RacialNum = 20572
				elseif IsPlayerSpell(26297) == true and CML.GetSpellCD(26297) == 0 then
					_Racial = select(1,GetSpellInfo(26297))
					_RacialNum = 26297
				else
					_Racial = ""
					_RacialNum = nil
				end	
			end
			if not macrosracials and CML_Debug then print("/cast ".._Racial) macrosracials = true end
			if _RacialNum and CML.GetSpellCD(_Racial) <= 2 then
				RunMacroText("/cast ".._Racial) 
			end
        end
    end  
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

function CML.DPSPotionSelect()
	if _Spec == 1 then
		return CML.DPSPotionsList[select(2,UnitClass("player"))].A
	elseif _Spec == 2 then
		return CML.DPSPotionsList[select(2,UnitClass("player"))].B
	elseif _Spec == 3 then
		return CML.DPSPotionsList[select(2,UnitClass("player"))].C
	elseif _Spec == 4 then
		return CML.DPSPotionsList[select(2,UnitClass("player"))].D
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
	Distance = 500*(XDist + YDist) -- World 1975.27205951036  Soo 500 
	return Distance
end	

function CML.GetHP(unit)
	local hp = 100 * UnitHealth(unit) / UnitHealthMax(unit)
	return hp 
end

function CML.GetSpellCD(MySpell)
	if GetSpellCooldown(MySpell) == 0 then
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

function CML.HasHero()
	if UnitBuffID("player", 2825) 
	  or UnitBuffID("player",32182) 
	  or UnitBuffID("player",80353) 
	  or UnitBuffID("player",90355) then
	  	return true
	end
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
    	UseItemByName(GetItemInfo(5512))
        return true
    end
end

function CML.Interrupts()
	if not Coolprefix or not _G[Coolprefix.."Interrupt_enable"] then return false end
	if Coolprefix then _MyInterruptValue = _G[Coolprefix.."Interrupt_value"] else _MyInterruptValue = 1 end
	-- Credit goes to Xelper for his interupt code. Thank you very much Xelper!!
	if _MyInterruptValue == 1 and RandomInterrupt == nil then RandomInterrupt = math.random(0,50) end
	if _MyInterruptValue == 2 then RandomInterrupt = 30 end
	if _MyInterruptValue == 3 then RandomInterrupt = 0 end
	function CML.InterruptSpell()
		--Warrior
		if _MyClass == 1 and GetSpellInfo(6552) ~= nil and CML.GetSpellCD(6552) == 0 then return 6552	
		-- Paladin		
		elseif _MyClass == 2 and GetSpellInfo(96231) ~= nil and CML.GetSpellCD(96231) == 0 then return 96231
		-- Hunter
		elseif _MyClass == 3 and GetSpellInfo(147362) ~= nil and CML.GetSpellCD(147362) == 0 then return 147362			
		-- Rogue
		elseif _MyClass == 4 and GetSpellInfo(1766) ~= nil and CML.GetSpellCD(1766) == 0 then return 1766
		-- Priest
		elseif _MyClass == 5 and GetSpellInfo(15487) ~= nil and CML.GetSpellCD(15487) == 0 then return 15487
		-- DeathKnight	
		elseif _MyClass == 6 and GetSpellInfo(80965) ~= nil and CML.GetSpellCD(80965) == 0 then return 47528
		-- Shaman 
		elseif _MyClass == 7 and GetSpellInfo(57994) ~= nil and CML.GetSpellCD(57994) == 0 then return 57994
		-- Mage
		elseif _MyClass == 8 and GetSpellInfo(2139) ~= nil and CML.GetSpellCD(2139) == 0 then return 2139
		-- Warlock
		elseif _MyClass == 9 and GetSpellInfo(19647) ~= nil and CML.GetSpellCD(19647) == 0 then if _Spec == 3 then return 19647 end
		-- Monk 
		elseif _MyClass == 10 and GetSpellInfo(116705) ~= nil and CML.GetSpellCD(116705) == 0 then return 116705	
		-- Druid
		elseif _MyClass == 11 then if UnitBuffID("player", 768) ~= nil and GetSpellInfo(80965) ~= nil and CML.GetSpellCD(80965) == 0 then return 80965 elseif GetSpellInfo(80964) ~= nil and CML.GetSpellCD(80964) == 0 then return 80964 elseif _Spec == 1 then return 78675 end
		else return 0 end   
	end   
	local interruptSpell = CML.InterruptSpell()
	local interruptName = GetSpellInfo(interruptSpell)
	InterruptTargetsList = { "target", "focus", "mouseover" }
	-- Interrupt Casts and Channels on Target and Focus.
	if interruptSpell ~= 0 then
		for i = 1, #InterruptTargetsList do
			if UnitExists(InterruptTargetsList[i]) == 1 then
				local customTarget = InterruptTargetsList[i]
				local castName, _, _, _, castStartTime, castEndTime, _, _, castInterruptable = UnitCastingInfo(customTarget)
				local channelName, _, _, _, channelStartTime, channelEndTime, _, channelInterruptable = UnitChannelInfo(customTarget)
				if channelName ~= nil then
					--target is channeling a spell that is interruptable
					--load the channel variables into the cast variables to make logic a little easier.
					castName = channelName
					castStartTime = channelStartTime
					castEndTime = channelEndTime
					castInterruptable = channelInterruptable
					PQR_InterruptPercent = 0
					IsChannel = true
				end
				if castInterruptable == false then castInterruptable = true else castInterruptable = false end	
				if castInterruptable then
				  	local timeSinceStart = (GetTime() * 1000 - castStartTime) / 1000
					local timeLeft = ((GetTime() * 1000 - castEndTime) * -1) / 1000
					local castTime = castEndTime - castStartTime
					local currentPercent = timeSinceStart / castTime * 100000
				  	if IsSpellInRange(GetSpellInfo(interruptSpell), customTarget) ~= nil
				  	  and UnitCanAttack("player", customTarget) ~= nil then
						if currentPercent and RandomInterrupt and currentPercent < RandomInterrupt and not IsChannel then return false end
						CastSpellByName(GetSpellInfo(interruptSpell), customTarget)
						InteruptTimer = GetTime()
						RandomInterrupt = nil
					end
				end
			end
		end
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
	return true
end

function CML.IsInRange(unit)
	if IsSpellInRange(_RangeSpell,unit) == 1 then
		return false
	end
	return true
end

function CML.IsInSight(unit, seconds)
	if not UnitExists(unit) then return false end
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

function CML.PetManager(value)
	if PQIprefix then
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

function CML.SetFocus()
	if _G[PQIprefix.."SetFocus_enable"] then
		if PQI:IsHotkeys(_G[PQIprefix.."SetFocus_key"]) then
			RunMacroText("/focus [target=mouseover]")
		end
	end
end

function CML.SnapShot()
	-- Make sure we find lowest stats
	if not PlayerSpellHaste or (PlayerSpellHaste and UnitSpellHaste("player") > PlayerSpellHaste) then PlayerSpellHaste = UnitSpellHaste("player") end
	if not PlayerMeleeHaste or (PlayerMeleeHaste and GetMeleeHaste() > PlayerMeleeHaste) then PlayerMeleeHaste = GetMeleeHaste() end
	if not PlayerAttackPower or (PlayerAttackPower and UnitAttackPower("player") > PlayerAttackPower) then PlayerAttackPower = UnitAttackPower("player") end
	if not PlayerSpellPower or (PlayerSpellPower and GetSpellBonusDamage(2) > PlayerSpellPower) then PlayerSpellPower = GetSpellBonusDamage(2) end
	if not PlayerMastery or (PlayerMastery and GetMastery() > PlayerMastery) then PlayerMastery = GetMastery() end
end

function CML.StopCasting(var)
	if UnitBuffID("player", 31821) then return true end
	if UnitBuffID("player", 122291) then return true end
	if UnitBuffID("player", 1022) then return true end
	local Boss1Cast,Boss1CastEnd,StopCasting,PlayerCastEnd
	local ShouldStop = {
		137457,
		138763,
		143343,
	}
	local Boss1Cast,_,_,_,_,Boss1CastEnd = UnitCastingInfo("boss1")
	local StopCasting = false
	for i = 1, #ShouldStop do
		if Boss1Cast == GetSpellInfo(ShouldStop[i]) then StopCasting = true end
	end
	if not StopCasting then return true end
	if UnitCastingInfo("player") then
		PlayerCastEnd = select(6,UnitCastingInfo("player"))
	elseif UnitChannelInfo("player") then
		PlayerCastEnd = select(6,UnitChannelInfo("player"))
	end
	if PlayerCastEnd ~= nil then
		if Boss1CastEnd < PlayerCastEnd then
	    	RunMacroText("/stopcasting")
	    	return (false == var)
	    end
	end
	return (true == var)
end

function CML.StopDotsCheck(unit)
	local NoDotsBuffs = {
		145065,
		145071,
		145171,
		145832,
	}
	for i = 1, #NoDotsBuffs do
		if UnitDebuff(unit,GetSpellInfo(NoDotsBuffs[i])) then
			return false
		end
	end
	return true
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

function CML.UnitInfo(unit)
	local MapName = GetMapInfo(unit)
	local unitX, unitY = GetPlayerMapPosition(unit) 
	if MapName and unitX and unitY then 
		return MapName, unitX, unitY
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
--------------------------------------------------------------------------------------------------
----------------------------------------------PQInterface & Status -------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------                                                                                     ]]

function CML.PQIConfing()
	if not _Started then
		_Started = true
		PQR_BotLoaded()
	end	
	_Spec = GetSpecialization()
	_MyClass = select(3,UnitClass("player"))
	if not _DataLoaded then DataLoader() end
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
	if UnitExists("target") then CML.Interrupts() end
	CML.HealthStone() 
	if UnitAffectingCombat("player") then CML.Cooldowns() end
	if PQIprefix == nil then return true end
	PlayerStatus 	= _G[PQIprefix.."PlayerStatus_enable"]
	PauseKeyCheck 	= _G[PQIprefix.."Pause_enable"]
	PauseKey 		= PQI:IsHotkeys(_G[PQIprefix.."Pause_key"])
	CML_Debug 		= _G[PQIprefix.."Debug_enable"]
	CML_DebugValue 	= _G[PQIprefix.."Debug_value"]	
	CML.SetFocus()
	if (C_PetBattles.IsInBattle() or PokeEngineStarted) and PokeEngine ~= nil then PokeEngine() end
	if not UnitAffectingCombat("player") and ProbablyEngine.module.player.potionused and not SchedulePotion then SchedulePotion = GetTime() end
	if SchedulePotion and SchedulePotion <= GetTime() - 60 then ProbablyEngine.module.player.potionused = false SchedulePotion = false end
	if PlayerStatus == nil then return true end
	if not UnitAffectingCombat("player") then CML.SnapShot() ProbablyEngine.module.player.battlerezfail = false end
	--if CML.PokeEngine ~= nil then CML.PokeEngine() end
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
	elseif _MyClass == 7 then
		_Malstroms = select(4,UnitBuffID("player", 53817))
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
		if _Spec == 2 then
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
		if _Spec == 2 then
			UiBar_SetPower()
		end
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
		elseif _Spec == 3 then
			UiBar_SetEmbers()
		end
	elseif _MyClass == 10 then -- Monk
		UiBar_AoE()
		UiBar_SetEnergy()
		UiBar_ActiveHealing()
		UiBar_SetPower()
		UiBar_SetDebuff(1943)
	elseif _MyClass == 11 then -- Druid
		if UnitBuffID("player",5487) then
			UiBar_SetRage()
		else
			UiBar_SetMana()
		end
		if _Spec == 1 then
			UiBar_ActiveHealing()
			UiBar_AoE()
			UiBar_SetEclipse()
		end
		if _Spec == 3 then
			UiBar_ActiveHealing()
			UiBar_AoE()
			UiBar_SetVengeance(84840)
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

--[[--------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------ Conditions ------------------------------------------
------------------------------------------------------------------------------------------------------]]



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

ProbablyEngine.condition.register("automouse", function(spell,pqiname)
	if not Coolprefix or not PQIprefix then return false end
	local PQICheck = _G[PQIprefix..pqiname.."Key_enable"]
	local CoolCheck = _G[Coolprefix..pqiname.."_enable"]
  	local PQIValue = PQI:IsHotkeys(_G[PQIprefix..pqiname.."Key_key"])
  	local CoolValue = _G[Coolprefix..pqiname.."_value"] == 2
  	if PQICheck and CoolCheck and (PQIValue or (CoolValue and UnitIsUnit("target","mouseover") == 1)) then
  		_Queues[tonumber(spell)] = true
  		if SpellIsTargeting() then CameraOrSelectOrMoveStart() CameraOrSelectOrMoveStop() end
        return true
  	end	
end)

ProbablyEngine.condition.register("canattack", function(target)
  	return (UnitExists(target) and UnitHealth(target) > 0 and UnitCanAttack("player", target) == 1)
end)

ProbablyEngine.condition.register("coolHealing", function(name,value)
	if Coolprefix == nil then return false end
	if nNova[tonumber(value)] ~= nil and _G[Coolprefix..name.."_enable"] then
		local PQICheck = _G[Coolprefix..name.."_enable"]
		if value == "0" then rawunit = "player" elseif value == "69" then rawunit = "pet" 
		elseif value and #nNova >= tonumber(value) and nNova[tonumber(value)].unit ~= nil then rawunit = tostring(nNova[tonumber(value)].unit) end
		if value and value ~= "0" and value ~= "69" and #nNova >= tonumber(value) then
			if nNova[tonumber(value)].range == 0 then return false end
		end
	  	local PQIValue = _G[Coolprefix..name.."_value"]
	  	if PQICheck and UnitExists(rawunit) == 1 and CML.GetHP(rawunit) ~= nil and tonumber(PQIValue) ~= nil then
	  		if (CML.GetHP(rawunit) <= tonumber(PQIValue)) then
	        	ProbablyEngine.dsl.parsedTarget = rawunit
	        	return true
	        end
	  	else
	  		return false
	  	end
	end
end)

ProbablyEngine.condition.register("coolvalue", function(name,value)
	if not Coolprefix then return false end
	local PQICheck = _G[Coolprefix..name.."_enable"]
  	local PQIValue = _G[Coolprefix..name.."_value"] 
  	if PQICheck and PQIValue then
  		return PQIValue
  	end
end)

ProbablyEngine.condition.register("debuff.damage", function(target, spell)
	local debuff,_,_,_,_,_,expires,caster,_,_,_,_,_,_,damage = UnitDebuff(target, spell)
	if debuff ~= nil and (caster == 'player' or caster == 'pet') then
		return damage
	end
	return 0
end)

ProbablyEngine.condition.register("fourpieces", function()
    return CML.TierScanner(Tier16,4)
end)

ProbablyEngine.condition.register("twopieces", function()
    return CML.TierScanner(Tier16,2)
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

ProbablyEngine.condition.register("hasspell", function(target, spell)
  	return IsSpellKnown(spell)
end)
ProbablyEngine.condition.register("hasSpell", function(target, spell)
	return IsSpellKnown(spell)
end)
ProbablyEngine.condition.register("HasSpell", function(target, spell)
	return IsSpellKnown(spell) 	
end)

ProbablyEngine.condition.register("isinfront", function(target, time)
	local time = time 
	if time == nil then time = 1 end
  	return (ProbablyEngine.module.player.notinfront[UnitName(tostring(target))] == nil or ProbablyEngine.module.player.notinfront[UnitName(tostring(target))] < GetTime() - time)
end)

ProbablyEngine.condition.register("iamtarget", function()
	return (UnitExists("targettarget") and UnitIsUnit("player","targettarget"))
end)

ProbablyEngine.condition.register("macros", function(name)
	if macros then
		local name = tostring(name)
		return macros[name]
	end
end)

ProbablyEngine.condition.register("mitigation", function()
	if not macros then return false end
	return macros["ActiveMitigation"]
end)

ProbablyEngine.condition.register("modifier.same", function(target, spell)
  return (ProbablyEngine.parser.lastCast == GetSpellName(spell) and ProbablyEngine.module.player.spellcasttarget == target)
end)

ProbablyEngine.condition.register("multidot", function(spell,time)
	local AllTargets = {"target","focus","mouseover","boss1","boss2","boss3","boss4","boss5"}
	local Spell = tonumber(spell)
	local Time = tonumber(time)
	for i = 1, #AllTargets do
		local Target = AllTargets[i]
		if UnitExists(Target) == 1 and CML.IsInSight(Target, 1) and CML.IsInRange(Target) and CML.IsInFront(Target)  then
			if not UnitDebuffID(Target,Spell) or (UnitDebuffID(Target,Spell) and select(7,UnitDebuffID(Target,Spell)) - GetTime() <= tonumber(Time)) then
				if CML.StopDotsCheck(Target) == true then
					ProbablyEngine.dsl.parsedTarget = Target
					return true
				end
			end
		end
	end
	for i = 1, #nNova do
		local Target = nNova[i].target
		if UnitIsUnit(Target,nNova[i].target) ~= 1 and UnitExists(Target) == 1 and CML.IsInSight(Target, 1) and CML.IsInRange(Target) and CML.IsInFront(Target) then
			if not UnitDebuffID(Target,Spell) or (UnitDebuffID(Target,Spell) and select(7,UnitDebuffID(Target,Spell)) - GetTime() <= tonumber(Time)) then
				if CML.StopDotsCheck(Target) == true then
					ProbablyEngine.dsl.parsedTarget = Target
					print(Target)
					return true
				end
			end
		end
	end
end)

ProbablyEngine.condition.register("multidot360", function(spell,time)
	local AllTargets = {"target","focus","mouseover","boss1","boss2","boss3","boss4","boss5"}
	local Spell = tonumber(spell)
	local Time = tonumber(time)
	for i = 1, #AllTargets do
		local Target = AllTargets[i]
		if UnitExists(Target) == 1 and CML.IsInSight(Target, 1) and CML.IsInRange(Target) and CML.IsInRange(Target)  then
			if not UnitDebuffID(Target,Spell) or (UnitDebuffID(Target,Spell) and select(7,UnitDebuffID(Target,Spell)) - GetTime() <= tonumber(Time)) then
				if CML.StopDotsCheck(Target) == true then
					ProbablyEngine.dsl.parsedTarget = Target
					return true
				end
			end
		end
	end
	for i = 1, #nNova do
		local Target = nNova[i].target
		if UnitIsUnit(Target,nNova[i].target) ~= 1 and UnitExists(Target) == 1 and CML.IsInSight(Target, 1) and CML.IsInRange(Target)  then
			if not UnitDebuffID(Target,Spell) or (UnitDebuffID(Target,Spell) and select(7,UnitDebuffID(Target,Spell)) - GetTime() <= tonumber(Time)) then
				if CML.StopDotsCheck(Target) == true then
					ProbablyEngine.dsl.parsedTarget = Target
					print(Target)
					return true
				end
			end
		end
	end
end)

ProbablyEngine.condition.register("multirefresh", function(spell,time)
	local AllTargets = {"target","focus","mouseover","boss1","boss2","boss3","boss4","boss5"}
	local Spell = tonumber(spell)
	local Time = tonumber(time)
	for i = 1, #AllTargets do
		local Target = AllTargets[i]
		if UnitExists(Target) == 1 and CML.IsInSight(Target, 1) and CML.IsInRange(Target) and CML.IsInRange(Target)  then
			if UnitDebuffID(Target,Spell) == true and select(7,UnitDebuffID(Target,Spell)) - GetTime() <= tonumber(Time) and select(7,UnitDebuffID(Target,Spell)) - GetTime() >= 1 then
				if CML.StopDotsCheck(Target) == true then
					ProbablyEngine.dsl.parsedTarget = Target
					return true
				end
			end
		end
	end
	for i = 1, #nNova do
		local Target = nNova[i].target
		if UnitIsUnit(Target,nNova[i].target) ~= 1 and UnitExists(Target) == 1 and CML.IsInSight(Target, 1) and CML.IsInRange(Target)  then
			if UnitDebuffID(Target,Spell) and select(7,UnitDebuffID(Target,Spell)) - GetTime() <= tonumber(Time) and select(7,UnitDebuffID(Target,Spell)) - GetTime() >= 1 then
				if CML.StopDotsCheck(Target) == true then
					ProbablyEngine.dsl.parsedTarget = Target
					print(Target)
					return true
				end
			end
		end
	end
end)

ProbablyEngine.condition.register("needaura", function(spell,category)
	if not UnitInRaid("player") then 
		if not UnitBuffID("player",spell) then 
			return true 
		end
	else 
		local RaidBuff = GetRaidBuffTrayAuraInfo(category)
		if not RaidBuff then return true end
		if RaidBuff then
			for i = 1, #nNova do
				if UnitBuff(nNova[i].unit,RaidBuff) == nil and nNova[i].range == 1 then
					return true
				end
			end
		end
		return false
	end
end)

ProbablyEngine.condition.register("notontarget", function(Spell)
	if UnitExists("target") then
		if not UnitIsUnit("target","mouseover") then
			if not UnitDebuffID("mouseover", Spell) and CML.IsInRange("mouseover") then
				ProbablyEngine.dsl.parsedTarget = "mouseover"
				return true
			end
		elseif UnitExists("focus") and not UnitIsUnit("target","focus") then
			if not UnitDebuffID("focus", Spell) and CML.IsInRange("focus") then
				ProbablyEngine.dsl.parsedTarget = "focus"
				return true
			end
		else
			for i = 1, #nNova do
				if not UnitIsUnit("target",nNova[i].target) then
					if not UnitDebuffID(nNova[i].target, Spell) and CML.IsInRange(nNova[i].target) then
						ProbablyEngine.dsl.parsedTarget = nNova[i].target
						return true
					end
				end
			end
		end
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


ProbablyEngine.condition.register("novaBuff.duration", function(target, value)
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
        	return (select(7,UnitBuffID(rawunit, Spell)) - GetTime())
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

ProbablyEngine.condition.register("novaTankBuff.duration", function(target, value)
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
        	return (select(7,UnitBuffID(rawunit, Spell)) - GetTime())
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
	if _G[PQIprefix..name.."_enable"] then
		local PQICheck = _G[PQIprefix..name.."_enable"]
		
		if tonumber(value) == 0 then 
			rawunit = "player" 
		elseif tonumber(value) == 69 then 
			rawunit = "pet" 
		elseif tonumber(value) and #nNova >= tonumber(value) and nNova[tonumber(value)].unit ~= nil then
			rawunit = tostring(nNova[tonumber(value)].unit) 
		end
		if not nNova and (tonumber(value) == 0 or tonumber(value) == 69 or nNova[tonumber(value)].range == 1) then print(value) return false end
	  	local PQIValue = _G[PQIprefix..name.."_value"]
	  	if PQICheck and UnitExists(rawunit) == 1 and CML.GetHP(rawunit) ~= nil and tonumber(PQIValue) ~= nil then
	  		if (CML.GetHP(rawunit) <= tonumber(PQIValue)) and nNova[tonumber(value)].role == "TANK" then
	        	ProbablyEngine.dsl.parsedTarget = rawunit
	        	return true
	        end
	  	else
	  		return false
	  	end
	end
end)

ProbablyEngine.condition.register("novaHealing", function(name,value)
	if PQIprefix == nil then return false end
	if _G[PQIprefix..name.."_enable"] then
		local PQICheck = _G[PQIprefix..name.."_enable"]
		
		if tonumber(value) == 0 then 
			rawunit = "player" 
		elseif tonumber(value) == 69 then 
			rawunit = "pet" 
		elseif tonumber(value) and #nNova >= tonumber(value) and nNova[tonumber(value)].unit ~= nil then
			rawunit = tostring(nNova[tonumber(value)].unit) 
		end
		if not (nNova and (tonumber(value) == 0 or tonumber(value) == 69 or nNova[tonumber(value)].range == 1)) then print(value) return false end
	  	local PQIValue = _G[PQIprefix..name.."_value"]
	  	if PQICheck and UnitExists(rawunit) == 1 and CML.GetHP(rawunit) ~= nil and tonumber(PQIValue) ~= nil then
	  		if (CML.GetHP(rawunit) <= tonumber(PQIValue)) then
	        	ProbablyEngine.dsl.parsedTarget = rawunit
	        	return true
	        end
	  	else
	  		return false
	  	end
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
  	return 0
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

ProbablyEngine.condition.register("snapboost", function(element)
	if element == nil then element = "all" end
	if (element == "spellhaste" or element == "all") and PlayerSpellHaste then return (UnitSpellHaste("player") - PlayerSpellHaste)  end
	if (element == "meleehaste" or element == "all") and PlayerMeleeHaste then return (GetMeleeHaste() - PlayerMeleeHaste) end	
	if (element == "attackpower" or element == "all") and PlayerAttackPower then return (UnitAttackPower("player") - PlayerAttackPower) end	
	if (element == "spellpower" or element == "all") and PlayerSpellPower then return (GetSpellBonusDamage(2) - PlayerSpellPower) end	
	if (element == "mastery" or element == "all") and PlayerMastery then return (GetMastery() - PlayerMastery) end	
    return false
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
	if UnitBuff("player",VengeanceID) then return select(15,UnitAura("player", GetSpellInfo(VengeanceID))) end
	return 0
end)






























































































