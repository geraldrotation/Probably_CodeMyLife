function DataLoader()
	ProbablyEngine.listener.register("UNIT_SPELLCAST_SUCCEEDED", function(...)
		--print(...)
		local SourceUnit 	= select(1,...)
		local SpellID 		= select(5,...)
		if SourceUnit == "player" then
			-- All Spec Queues!
			if _Queues and _Queues[select(5,...)] ~= nil then
				if _Queues[select(5,...)] == true then 
					_Queues[select(5,...)] = GetTime() 
				end
			end

			-- Paladin
			if _MyClass == 2 then
				if macros["HoFreeQueue"] ~= false and SpellID == _HandOfFreedom then macros["HoFreeQueue"] = false end
				if macros["HoProtQueue"] ~= false and SpellID == _HandOfProtection then macros["HoProtQueue"] = false end
				if macros["HoPurQueue"] ~= false and SpellID == _HandOfPurity then macros["HoPurQueue"] = false end
				if macros["HoSacQueue"] ~= false and SpellID == _HandOfSacrifice then macros["HoSacQueue"] = false end
				if macros["HoSalvQueue"] ~= false and SpellID == _HandOfSalvation then macros["HoSalvQueue"] = false end
			end
			-- Hunter
			if _MyClass == 3 then
				-- Serpent Sting
				if SpellID == _SerpentSting then
					LastSerpent = GetTime()
				end
				-- Feign Death Enforcer
			 	if SpellID == _FeignDeath then			
					FeignDeathCast = GetTime()
					StopAttack()
					SpellStopCasting()	
				end
				-- Steady Shot Logic
				if SpellID == _SteadyShot then
					if SteadyCast and SteadyCast >= GetTime() - 2 and SteadyCount == 1 then SteadyCast = GetTime() SteadyCount = 2 else	SteadyCast = GetTime() SteadyCount = 1 end
				end		
			end
			-- Rogue
			if _MyClass == 4 then
				if SpellID == _Vanish or SpellID == _Shadowmeld or SpellID == _ShadowDance then 
					if UnitExists("target") ~= nil then RunMacroText("/startattack") NoVanish = GetTime() + 1 end 
				end
			end
			if CML_Debug and (CML_DebugValue == 1 or CML_DebugValue == 3) and not (CML_LastSpell == select(2,...) and (CML_LastTime and (GetTime() - CML_LastTime  < 1))) then
				CML_LastSpell 	= select(2,...) 
				CML_LastTime 	= GetTime()
				print("|cff0059FFCasted: "..select(5,...).." |cffFFFFFF"..CML_LastSpell.." |cff0059FF"..CML_LastTime)
			end
		end
	end)

	ProbablyEngine.listener.register("UNIT_SPELLCAST_FAILED", function(...)
		local SourceUnit 	= select(1,...)
		if SourceUnit == "player" then
			-- All Spec Queues!
			if _Queues[select(5,...)] ~= true and _Queues[select(5,...)] ~= nil then
				if (_Queues[select(5,...)] == false or _Queues[select(5,...)] < (GetTime() - 10)) and CML.GetSpellCD(select(5,...)) <= 3 then 
					_Queues[select(5,...)] = true 
				end
			end
			if CML_Debug and (CML_DebugValue == 2 or CML_DebugValue == 3) and not (CML_LastFail == select(2,...) and (CML_LastFailTime and (GetTime() - CML_LastFailTime  < 1))) then
				CML_LastFail 	= select(2,...) 
				CML_LastFailTime 	= GetTime()
				print("|cffD90000Failed: "..select(5,...).." |cffFFFFFF"..CML_LastFail.." |cffD90000"..CML_LastFailTime)
			end
		end
	end)

	ProbablyEngine.module.player.notbehind = {}
	ProbablyEngine.module.player.los = {}
	ProbablyEngine.module.player.notinfront = {}
	ProbablyEngine.listener.register("UNIT_SPELLCAST_SENT", function(...)
		ProbablyEngine.module.player.spellcasttarget = select(4,...)
	end)

	ProbablyEngine.listener.register("UI_ERROR_MESSAGE", function(...)
	  	local Events = ...
	  	if Events == SPELL_FAILED_NOT_BEHIND then
			if ProbablyEngine.module.player.spellcasttarget then
				ProbablyEngine.module.player.notbehind[ProbablyEngine.module.player.spellcasttarget] = GetTime()
	  		end
	  	end
		if Events == SPELL_FAILED_LINE_OF_SIGHT then
	  		if ProbablyEngine.module.player.spellcasttarget then
				ProbablyEngine.module.player.los[ProbablyEngine.module.player.spellcasttarget] = GetTime()
	  		end
	  	end
	  	if Events == SPELL_FAILED_UNIT_NOT_INFRONT or ERR_BADATTACKFACING then
	  		if ProbablyEngine.module.player.spellcasttarget then
	    		ProbablyEngine.module.player.notinfront[ProbablyEngine.module.player.spellcasttarget] = GetTime()
			end
		end
	end)

	-----------------------------------------------------------------------------------------------------
	--------------------------------------------PQR Imports----------------------------------------------
	-- These functions come from PQR 2.2. Thanks to Xelper. Thanks also to Crystal_Tech for disasambling it!
	function UnitBuffID(unit, spellID, filter)
		local spellName = GetSpellInfo(spellID)
		if filter == nil then
			return UnitBuff(unit, spellName)
		else
			local exactSearch = strfind(strupper(filter), "EXACT")
			local playerSearch = strfind(strupper(filter), "PLAYER")
			if exactSearch then
				--using the index does not support filter.
				for i=1,40 do
					local _, _, _, _, _, _, _, buffCaster, _, _, buffSpellID = UnitBuff(unit, i)
					if buffSpellID ~= nil then
						if buffSpellID == spellID then
							if (not playerSearch) or (playerSearch and (buffCaster == "player")) then
								return UnitBuff(unit, i)
							end
						end
					else
						return nil
					end
				end
			else
				--just pass the filter to UnitBuff and return.
				return UnitBuff(unit, spellName, nil, filter)
			end
		end
	end

	function UnitDebuffID(unit, spellID, filter)
		local spellName = GetSpellInfo(spellID)
		if filter == nil then
			return UnitDebuff(unit, spellName)
		else
			local exactSearch = strfind(strupper(filter), "EXACT")
			local playerSearch = strfind(strupper(filter), "PLAYER")

			if exactSearch then
				--using the index does not support filter.
				for i=1,40 do
					local _, _, _, _, _, _, _, buffCaster, _, _, buffSpellID = UnitDebuff(unit, i)
					if buffSpellID ~= nil then
						if buffSpellID == spellID then
							if (not playerSearch) or (playerSearch and (buffCaster == "player")) then
								return UnitDebuff(unit, i)
							end
						end
					else
						return nil
					end
				end
			else
				--just pass the filter to UnitDebuff and return.
				return UnitDebuff(unit, spellName, nil, filter)
			end
		end
	end

	function _IsChanneling()
		local _, _, _, _, _, playerChanneling = UnitChannelInfo("player")
		local isPlayerChanneling = false

		if playerChanneling ~= nil then
			local currentTime = GetTime() * 1000
			if (playerChanneling - currentTime) > 100 then
				isPlayerChanneling = true
			end
		end

		return isPlayerChanneling
	end

	function CML_IsCastingSpell(spellID)
		local spellName = GetSpellInfo(spellID)
		local spellCasting = UnitCastingInfo("player")

		if spellCasting == nil then
			spellCasting = UnitChannelInfo("player")
		end
		if spellCasting == spellName then
			return true
		else
			return false
		end
	end

	function _GetSpellID(spellName, target)
		local spellID = 0;
		local i = 1
		if target == nil then
			target = "player"
		end
		while true do
			local sbSpellName, sbSpellSubName = GetSpellBookItemName(i, BOOKTYPE_SPELL)
			if sbSpellName == nil then
				break
			end
			if sbSpellSubName == nil then
				sbSpellSubName = ""
			end
			if spellName == sbSpellName or spellName == sbSpellName..sbSpellSubName or spellName == sbSpellName.." "..sbSpellSubName then
				_, spellID = GetSpellBookItemInfo(i, target)
				break
			end

			i = i + 1
		end
		return spellID
	end

	------------------------------------------------------------------------------------------------------------
	------------------------------------------------------------------------------------------------------------
	-- Nova Notification Frame Thanks to Nova Team for this code!
	function Nova_NotifyFrame_OnUpdate()
		if (Nova_NotifyFrameTime < GetTime() - 0.2) then
			local alpha = Nova_NotifyFrame:GetAlpha()
			if (alpha ~= 0) then Nova_NotifyFrame:SetAlpha(alpha - .5) end
			if (aplha == 0) then Nova_NotifyFrame:Hide() end
		end
	end
	-- Debug messages.
	function Nova_Notify(message)
		Nova_NotifyFrame.text:SetText(message)
		Nova_NotifyFrame:SetAlpha(1)
		Nova_NotifyFrame:Show()
		Nova_NotifyFrameTime = GetTime()
	end
	-- Debug Notification Frame
	Nova_NotifyFrame = CreateFrame('Frame')
	Nova_NotifyFrame:ClearAllPoints()
	Nova_NotifyFrame:SetHeight(300)
	Nova_NotifyFrame:SetWidth(300)
	Nova_NotifyFrame:SetScript('OnUpdate', Nova_NotifyFrame_OnUpdate)
	Nova_NotifyFrame:Hide()
	Nova_NotifyFrame.text = Nova_NotifyFrame:CreateFontString(nil, 'BACKGROUND', 'PVPInfoTextFont')
	Nova_NotifyFrame.text:SetAllPoints()
	Nova_NotifyFrame:SetPoint('CENTER', 0, 0)
	Nova_NotifyFrameTime = 0
	-- Chat Overlay originally made by Sheuron
	local function onUpdate(self,elapsed) 
	  if self.time < GetTime() - 2.8 then
	if self:GetAlpha() == 0 then self:Hide() else self:SetAlpha(self:GetAlpha() - .05) end
	  end
	end
	xrn = CreateFrame("Frame",nil,ChatFrame1) 
	xrn:SetSize(ChatFrame1:GetWidth(),30)
	xrn:Hide()
	xrn:SetScript("OnUpdate",onUpdate)
	xrn:SetPoint("TOP",0,0)
	xrn.text = xrn:CreateFontString(nil,"OVERLAY","MovieSubtitleFont")
	xrn.text:SetAllPoints()
	xrn.texture = xrn:CreateTexture()
	xrn.texture:SetAllPoints()
	xrn.texture:SetTexture(0,0,0,.50) 
	xrn.time = 0
	function xrn:message(message) 
	  self.text:SetText(message)
	  self:SetAlpha(1)
	  self.time = GetTime() 
	  self:Show() 
	end	

	-----------------------------------------------------------------------------------------------------
	--------------------------------------------Spells & Tables------------------------------------------
	-- Racials
	_BloodFury					= 20572
	_Berserking  				= 26297 
	_GiftOfTheNaaru				= 59542

	-- Classes
	_ClassColors = {
		["HUNTER"]		= {R=0.67,	G=0.83,	B=0.45,	Hex="|cffabd473"},
		["WARRIOR"]		= {R=0.78,	G=0.61,	B=0.43,	Hex="|cffc79c6e"},
		["PALADIN"] 	= {R=0.96,	G=0.55,	B=0.73,	Hex="|cfff58cba"},
		["MAGE"]		= {R=0.41,	G=0.8,	B=0.94,	Hex="|cff69ccf0"},
		["PRIEST"]		= {R=1,		G=1,	B=1,	Hex="|cffffffff"},
		["WARLOCK"]		= {R=0.58,	G=0.51,	B=0.79,	Hex="|cff9482c9"},
		["SHAMAN"]		= {R=0,		G=0.44,	B=0.87,	Hex="|cff0070de"},
		["DEATHKNIGHT"]	= {R=0.77,	G=0.12,	B=0.23, Hex="|cffc41f3b"},
		["DRUID"]		= {R=1,		G=0.49,	B=0.04,	Hex="|cffff7d0a"},
		["MONK"]		= {R=0,		G=1,	B=0.59,	Hex="|cff00ff96"},
		["ROGUE"]		= {R=1, 	G=0.96, B=0.41,	Hex="|cfffff569"}
	}

	-- Player Colors
	PlayerHex = _ClassColors[select(2,UnitClass("player"))].Hex
	PlayerR = _ClassColors[select(2,UnitClass("player"))].R 
	PlayerG = _ClassColors[select(2,UnitClass("player"))].G
	PlayerB = _ClassColors[select(2,UnitClass("player"))].B

	SLASH_ACTIVECOOLDOWNS1 = "/activecooldowns"
	SLASH_ACTIVECOOLDOWNS2 = "/activecooldown"
	function SlashCmdList.ACTIVECOOLDOWNS(msg, editbox)
		if not macros["ActiveCooldowns"] then
			xrn:message("\124cFFFFFFFFCooldowns - Active.")
			macros["ActiveCooldowns"] = true
		else			
			xrn:message("\124cFFD93B3BCooldowns - Inactive.")
			macros["ActiveCooldowns"] = false
		end
	end
	SLASH_ACTIVEDISPEL1 = "/activedispel"
	function SlashCmdList.ACTIVEDISPEL(msg, editbox)
		if not macros["ActiveDispel"] then
			xrn:message("\124cFFFFFFFFDispel - Active.") 
			macros["ActiveDispel"] = true
		else
			xrn:message("\124cFFD93B3BDispel - Inactive.") 
			macros["ActiveDispel"] = false
		end
	end
	SLASH_ACTIVEDPS1 = "/activedps"
	function SlashCmdList.ACTIVEDPS(msg, editbox)
		if not macros["ActiveDPS"] then
			xrn:message("\124cFFFFFFFFDPS - Active.") 
			macros["ActiveDPS"] = true
		else
			xrn:message("\124cFFD93B3BDPS - Inactive.") 
			macros["ActiveDPS"] = false
		end
	end
	SLASH_ACTIVEHEALING1 = "/activehealing"
	function SlashCmdList.ACTIVEHEALING(msg, editbox)
		if not macros["ActiveHealing"] then
			xrn:message("\124cFFFFFFFFHealing - Active.") 
			macros["ActiveHealing"] = true
		else
			xrn:message("\124cFFD93B3BHealing - Inactive.")
			macros["ActiveHealing"] = false
		end
	end
	SLASH_AOE1 = "/aoe"
	function SlashCmdList.AOE(msg, editbox)
	    if macros["AoE"] == 1 then 
	        macros["AoE"] = 2 
	        xrn:message("\124cFFD93B3BArea of Effect")
	    elseif macros["AoE"] == 2 and _AoEModes == 3 then 
	        macros["AoE"] = 3
	        xrn:message("\124cFF2436FFMass AoE")
	    else 
	    	macros["AoE"] = 1 
	        xrn:message("\124cFFFFFFFFSingle Target")
	    end
	end 
	SLASH_AOEGEUS1 = "/aoegeus"
	function SlashCmdList.AOEGEUS(msg, editbox)
	    if macros["AoE"] == 1 then 
	        macros["AoE"] = 3
	        xrn:message("\124cFF2436FFMass AoE")
	    else 
	    	macros["AoE"] = 1 
	        xrn:message("\124cFFFFFFFFSingle Target")
	    end
	end 	
	SLASH_PAUSE1 = "/pause"
	function SlashCmdList.PAUSE(msg, editbox)
		if not macros["Pause"] then
			xrn:message("\124cFFD93B3BProfile Paused.")
			macros["Pause"] = true
		else
			xrn:message("\124cFFFFFFFFProfile Resumed.")
			macros["Pause"] = false		
		end
	end
	xrn:message("...CodeMyLife...")
	PQR_RotationChanged("CodeMyLife")
	_DataLoaded = true
end

