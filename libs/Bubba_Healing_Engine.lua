--[[---------------------------------------------------------------------------------------------------
-----------------------------------------Bubba's Healing Engine--------------------------------------]]
if not metaTable1 then
	-- localizing the commonly used functions while inside loops
	local tinsert, tremove, UnitDebuff, UnitHealth, UnitHealthMax, UnitExists, UnitGUID = tinsert, tremove, UnitDebuff, UnitHealth, UnitHealthMax, UnitExists, UnitGUID
	nNova = {} -- This is our main Table that the world will see
	memberSetup = {} -- This is one of our MetaTables that will be the default user/contructor
	memberSetup.cache = { } -- This is for the cache Table to check against
	BlacklistID = {} -- This is for the Dispel Check, all Debuffs we don't want dispelled go here
	metaTable1 = {} -- This will be the MetaTable attached to our Main Table that the world will see
	BadDebuffList= {
		104451, -- Ice Tomb
		76577,-- Smoke Bomb
		121949, -- Parasistic Growth
		122784, -- Reshape Life
		122370, -- Reshape Life 2
		123184, -- Dissonance Field
		123255, -- Dissonance Field 2
		123596, -- Dissonance Field 3
		128353, -- Dissonance Field 4
	} -- This is where we house the Debuffs that are bad for our users, and should not be healed when they have it

	SpecialHealUnitList = {
		6459, -- Boss#3 SoO
		6460, -- Boss#3 SoO
		6464, -- Boss#3 SoO
	}
	SavedSpecialTargets = {
		["target"] = nil,
		["mouseover"] = nil,
		["focus"] = nil,
	}
	
	DebuffToTop = {
		145263, -- Proving Grounds Healer Debuff.
	}
	
	SpecificHPBuffs = { 
		{ buff = 142865 , value = 75 }, -- Strong Ancient Barrier (Green)
		{ buff = 142865 , value = 50 }, -- Ancient Barrier (Yellow)
		{ buff = 142863 , value = 25 }, -- Weak Ancient Barrier (Red)
	}

	SpecificHPDebuffs = { 
		{ debuff = 145263 , value = 45 }, -- Proving Grounds Healer Debuff.
	}

	metaTable1.__call = function(_, ...) -- (_, forceRetable, excludePets, onlyInRange) [Not Implemented]
		local group =  IsInRaid() and "raid" or "party" -- Determining if the UnitID will be raid or party based
		local groupSize = IsInRaid() and GetNumGroupMembers() or GetNumGroupMembers() - 1 -- If in raid, we check the entire raid. If in party, we remove one from max to account for the player.
		if group == "party" then tinsert(nNova, memberSetup:new("player")) end -- We are creating a new User for player if in a Group
		for i=1, groupSize do -- start of the loop to read throught the party/raid
			local groupUnit = group..i
			local groupMember = memberSetup:new(groupUnit)
			if groupMember then tinsert(nNova, groupMember) end -- Inserting a newly created Unit into the Main Frame
		end
	end
	

	metaTable1.__index =  {-- Setting the Metamethod of Index for our Main Table
		name = "Healing Table",
		author = "Bubba",
	}


	-- Creating a default Unit to default to on a check
	memberSetup.__index = {
		name = "noob",
		hp = 100,
		unit = "noob",
		role = "NOOB",
		range = false,
		guid = 0,
		guidsh = 0,
	}
	

	-- If ever somebody enters or leaves the raid, wipe the entire Table
	local updateHealingTable = CreateFrame("frame", nil)
	updateHealingTable:RegisterEvent("GROUP_ROSTER_UPDATE")
	updateHealingTable:SetScript("OnEvent", function()
		table.wipe(nNova);
		table.wipe(memberSetup.cache);
		SetupTables()
	end)

	function GetAbsorbAmountOnUnit(tar)
		return 0
	end

	-- Will be replaced when placed in Data File
	function Nova_GUID(unit)
  		local nShortHand = ""
  		if UnitExists(unit) then
   			if UnitIsPlayer(unit) then
    			targetGUID = UnitGUID(unit)
   			else
    			targetGUID = tonumber((UnitGUID(unit)):sub(-12, -9), 16)
   			end
   
   			nShortHand = string.sub(tostring(UnitGUID(unit)), -5, -1)
   			
  		end
  		return targetGUID, nShortHand
 	end

	-- This is for those NPC units that need healing. Compare them against our list of Unit ID's
	local function SpecialHealUnit(tar)
		for i=1, #SpecialHealUnitList do
			if Nova_GUID(tar) == SpecialHealUnitList[i] then
				return true
			end
		end
	end

	-- We are checking if the user has a Debuff we either can not or don't want to heal them
	local function CheckBadDebuff(tar)
		for i=1, #BadDebuffList do
			if UnitDebuff(tar, GetSpellInfo(BadDebuffList[i])) then
				return false
			end
		end
		return true
	end

	local function CheckCreatureType(tar)
		local CreatureTypeList = {"Critter", "Totem", "Non-combat Pet", "Wild Pet"}
		for i=1, #CreatureTypeList do
			if UnitCreatureType(tar) == CreatureTypeList[i] then
				return false
			end
		end


		if not UnitIsBattlePet(tar) and not UnitIsWildBattlePet(tar) then
			return true
		else
			return false
		end
	end

	-- Verifying the target is a Valid Healing target
	function HealCheck(tar)
		if (( UnitCanCooperate("player",tar) and not UnitIsCharmed(tar) and not UnitIsDeadOrGhost(tar) and UnitIsConnected(tar)) or SpecialHealUnit(tar) or UnitIsUnit("player", tar) )
		 and CheckBadDebuff(tar)
		 and CheckCreatureType(tar)
		 and CML.IsInSight(tar, 3)
		 and not UnitCanAttack("player",tar)
		then return true else return false end
	end

	-- This is the list of all the different magic types that be can Dispelled
	-- I might need to split this up by spec to be even more accurate as well...
	if not UnitDispel then UnitDispel = {''} end

	-- We are checking to verify there's no bad debuff on the target
	local function DebuffBlacklistCheck(tab)
		if type(tab) ~= tab then
			tab = {tab}
		end
		for i=1, #tab do
			for k=1, #BlacklistID do
				if tab[i] == BlacklistID[k].spellid then
					return false
				end
			end
		end
		return true, tab
	end


	function memberSetup:new(unit)
		-- Seeing if we have already cached this unit before
		if memberSetup.cache[select(2, Nova_GUID(unit))] then return false end
		local o = {}
		setmetatable(o, memberSetup)
		if unit and type(unit) == "string" then
			o.unit = unit
		end
		-- This is the function for Dispel checking built into the player itself.
		function o:Dispel()
--			print(#UnitDispel['PALADIN'])
			local nDebuffList = {}
			for i=1, #UnitDispel do
--				print(UnitDispel[i])
--				print(i)	
--				print("Im a Paladin")
				local k=1
				while UnitDebuff(o.unit, k) do
					local nDebuff = {UnitDebuff(o.unit, k)}
					if nDebuff[5] == UnitDispel[i] and UnitIsUnit(o.unit, "player") then
						tinsert(nDebuffList, { spellid = nDebuff[11], groupType = "personal" } )
--						print("Found a dispellable Debuff on Me")
					elseif nDebuff[5] == UnitDispel[i] then
--						print("Found a dispellable Debuff in group")
						tinsert(nDebuffList, { spellid = nDebuff[11], groupType = "group" } )
					end
					k=k+1
				end
			end
			if #nDebuffList > 0 then
				return DebuffBlacklistCheck(nDebuffList)
			end
			return false
		end

		-- We are checking the HP of the person through their own function.
		function o:CalcHP()
--			print("calculating HP")
			local incomingheals = UnitGetIncomingHeals(o.unit) and UnitGetIncomingHeals(o.unit) or 0
			local nAbsorbs = ( 25*UnitGetTotalAbsorbs(o.unit)/100 )
			local PercentWithIncoming = 100 * ( UnitHealth(o.unit) + incomingheals + nAbsorbs ) / UnitHealthMax(o.unit)
			if o.role == "TANK" then PercentWithIncoming = PercentWithIncoming - 5 end -- Using the group role assigned to the Unit
			if UnitIsDeadOrGhost(o.unit) == 1 then PercentWithIncoming = 250 end -- Place Dead players at the end of the list
			if o.dispel then PercentWithIncoming = PercentWithIncoming - 2 end -- Using Dispel Check to see if we should give bonus weight
			if UnitName(o.unit) == "Oto the Protector" then PercentWithIncoming = PercentWithIncoming - 5 end -- Tank in Proving Grounds
			local ActualWithIncoming = ( UnitHealthMax(o.unit) - ( UnitHealth(o.unit) + incomingheals ) )
			for i = 1, #SpecificHPBuffs do
				if UnitDebuffID(o.unit, SpecificHPBuffs[i].buff) then
					if PercentWithIncoming > SpecificHPBuffs[i].value then
						PercentWithIncoming = SpecificHPBuffs[i].value
					end
				end
			end	
			for i = 1, #SpecificHPDebuffs do
				if UnitDebuffID(o.unit, SpecificHPDebuffs[i].debuff) then
					if PercentWithIncoming > SpecificHPDebuffs[i].value then
						PercentWithIncoming = SpecificHPDebuffs[i].value
					end
				end
			end	
			return PercentWithIncoming, ActualWithIncoming, nAbsorbs
		end

		function o:nGUID()
			local nSH = nil
			if UnitExists(o.unit) then
				if UnitIsPlayer(o.unit) then
					targetGUID = UnitGUID(o.unit)
				else
					targetGUID = tonumber((UnitGUID(o.unit)):sub(-12, -9), 16)
				end
			end
			if string.len(tostring(targetGUID)) > 5 then
				nSH = string.sub(tostring(targetGUID), -5, -1)
			else
				nSH = tostring(targetGUID)
			end
			return targetGUID, nSH
		end

		-- Updating the values of the Unit
		function o:UpdateUnit()
			o.name = UnitName(o.unit)
			if UnitName(o.unit) == "Oto the Protector" then o.role = "TANK" else o.role = UnitGroupRolesAssigned(o.unit) end
			o.guid = o:nGUID()
			o.guidsh = select(2, o:nGUID())
			local InRangeNow = 1
			if IsSpellInRange(tostring(GetSpellInfo(_HealingRangeSpell)),o.unit) == 0 or CML.IsInSight(UnitName(o.unit), 2) == false then InRangeNow = 0 end
			o.range = InRangeNow
			if o.unit == "focus" or o.unit == "target" or o.unit == "mouseover" then
				o.group = 0
			elseif IsInRaid() then 
				o.group = select(3,GetRaidRosterInfo(string.sub(tostring(o.unit), 5))) 
			else 
				o.group = 1 
			end
			o.dispel = o:Dispel()
			o.hp = o:CalcHP()
			o.absorb = select(3, o:CalcHP())
			o.threat = UnitThreatSituation(o.unit)
			o.target = tostring(o.unit).."target"
			memberSetup.cache[select(2, Nova_GUID(o.unit))] = o
		end

		-- Adding the user and functions we just created to this cached version in case we need it again
		-- This will also serve as a good check for if the unit is already in the table easily
		--print(UnitName(unit), select(2, Nova_GUID(unit)))
		memberSetup.cache[select(2, o:nGUID())] = o
		return o
	end

	-- Setting up the tables on either Wipe or Initial Setup
	function SetupTables() -- Creating the cache (we use this to check if some1 is already in the table)
		setmetatable(nNova, metaTable1) -- Set the metaTable of Main to Meta)
		function nNova:Update(MO)
			local MouseoverCheck = MO or true


			-- This is for special situations, IE world healing or NPC healing in encounters
			local SpecialTargets = { "focus","mouseover","target" }
			for p=1, #SpecialTargets do
				-- Checking if Unit Exists and it's possible to heal them
				if UnitExists(SpecialTargets[p]) and HealCheck(SpecialTargets[p]) then
					if not memberSetup.cache[select(2, Nova_GUID(SpecialTargets[p]))] then
						local SpecialCase = memberSetup:new(SpecialTargets[p])
						if SpecialCase then
							-- Creating a new user, if not already tabled, will return with the User
							for j=1, #nNova do
								if nNova[j].unit == SpecialTargets[p] then
									-- Now we add the Unit we just created to the Main Table
									for k,v in pairs(memberSetup.cache) do
										if nNova[j].guidsh == k then
											memberSetup.cache[k] = nil
										end
									end
									tremove(nNova, j)
									break
								end
							end
						end
						tinsert(nNova, SpecialCase)
						SavedSpecialTargets[SpecialTargets[p]] = select(2, Nova_GUID(SpecialTargets[p]))
					end
				end
			end


			for i=1, #nNova do
				-- We are updating all of the User Info (Health/Range/Name)
				nNova[i]:UpdateUnit()
			end

			for p=1, #SpecialTargets do
				if not UnitExists(SpecialTargets[p]) then
					for j=1, #nNova do
						-- Trying to find a case of the unit inside the Main Table to remove
						if nNova[j].unit == SpecialTargets[p] then
							tremove(nNova, j)
							break
						end
					end
					for k,v in pairs(memberSetup.cache) do
						-- Now we're trying to find that unit in the Cache table to remove
						if SpecialTargets[p] == v.unit then
							memberSetup.cache[k] = nil
						end
					end
				end
			end
			-- We are sorting by Health first
			table.sort(nNova, function(x,y)
				return x.hp < y.hp
			end)			
			-- Sorting with the ValitTarget
			table.sort(nNova, function(x,y)
				if x.range and y.range then return x.range > y.range
				elseif x.range then return true
				elseif y.range then return false end
			end)
--			if UnitExists("target") and memberSetup.cache[select(2, Nova_GUID("target"))] then
--				table.sort(nNova, function(x)return UnitIsUnit(x.unit, "target") end)
--			end
		end
		-- We are creating the initial Main Table
		nNova()
	end
	-- We are setting up the Tables for the first time
	SetupTables()
end