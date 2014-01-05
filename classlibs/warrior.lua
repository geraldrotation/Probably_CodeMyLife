function CML.WarriorStartup()

if _Spec == 1 then PQIprefix = "PQI_CodeMyLifeArms_" end
if _Spec == 2 then PQIprefix = "PQI_CodeMyLifeFury_" end
if _Spec == 3 then PQIprefix = "PQI_CodeMyLifeProtection_" end

_HealingRangeSpell = 102694 -- First Aid

	  --[[]]		--[[           ]]	--[[]]     --[[]] 	--[[           ]]
     --[[  ]]		--[[           ]]	--[[ ]]   --[[ ]]	--[[           ]]
    --[[    ]] 		--[[]]	   --[[]]	--[[           ]]	--[[]]
   --[[      ]] 	--[[         ]]		--[[           ]] 	--[[           ]]
  --[[        ]]	--[[        ]]		--[[]] 	   --[[]]			   --[[]]
 --[[]]    --[[]]	--[[]]	  --[[]]	--[[]] 	   --[[]]	--[[           ]]	
--[[]]      --[[]]	--[[]]	   --[[]]	--[[]] 	   --[[]]	--[[           ]]

--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Arms Warrior -----PQI_CodeMyLifeArms_Name_value-----------------------------------------------------------------------]]
if _Spec == 1 and CML_Arms_config == nil then
	PQIprefix = "PQI_CodeMyLifeArms_"
	_AoEModes = 2
	_RangeSpell = 78
	CML_Arms_config = {
		name	= "Arms",
		author	= "CodeMyLife",
		abilities = {
			{ 	name	= "Player Status", 
				tooltip	= PlayerHex.."Enables |cffFFFFFFPlayer Bar.",
				enable	= true,
			},
			{ 	name	= "Player Status X", 
				enable	= true,
				widget	= { type = "numBox",
					min 	= 0,
					max 	= 2000,
					value	= 800,
					width 	= 70,
					step	= 5,
					tooltip	= PlayerHex.."Set Player Status Horizontal Value.",
				},
			},				
			{ 	name	= "Player Status Y", 
				enable	= true,
				widget	= { type = "numBox",
					min 	= 0,
					max 	= 2000,
					value	= 200,
					width 	= 70,
					step	= 5,
					tooltip	= PlayerHex.."Set Player Status Vertical Value.",
				},
			},		
			{ 	name	= "Debug",
				tooltip	= PlayerHex.."Displays Rotation locally in chat.",
				enable	= false,
				widget = { type = "select",
					values 	= {PlayerHex.."Success","|cffD90000Failed","|cffFFFFFFBoth"},
					value	= 1,
					width	= 70,
					tooltip	= PlayerHex.."Select what spells you want to be shown in chat.",
				},
			},	
			--[[ Healing // Defensives ]]
			{ 	name	= "Active Stance",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Stance.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cffF50000Batlle Stance","|cff2990FFDefensive Stance","|cff00CCCCBerserker Stance", PlayerHex.."Dual Stance", PlayerHex.."Triple Stance"},
					value = 1,
					width = 70,
					tooltip = PlayerHex.."Choose Stance Mode.",	
				},
				newSection = true,
			},
			{ 	name	= "Active Shouts",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Shouts.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cffF50000Batlle","|cff2990FFCommanding"},
					value = 1,
					width = 70,
					tooltip = PlayerHex.."Choose Shout.",	
				},
			},
			{ 	name	= "Die By The Sword",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFDie By The Sword "..PlayerHex.."on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 75,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFDie By The Sword "..PlayerHex.."on me.",
				},
			},			
			{ 	name	= "ImpendingVictoryRush",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFImpending/VictoryRush "..PlayerHex.."on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 75,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFImpending/VictoryRush "..PlayerHex.."on me.",
				},
			},
			{ 	name	= "Last Stand",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFLast Stand "..PlayerHex.."on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 75,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFLast Stand "..PlayerHex.."on me.",
				},
			},
			{ 	name	= "Shield Barrier",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFShield Barrier "..PlayerHex.."on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 75,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFShield Barrier "..PlayerHex.."on me.",
				},
			},
			{ 	name	= "Shield Block",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFShield Block "..PlayerHex.."on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 75,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFShield Block "..PlayerHex.."on me.",
				},
			},
			{ 	name	= "Shield Wall",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFShield Wall "..PlayerHex.."on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 40,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFShield Wall "..PlayerHex.."on me.",
				},
			},

			--[[ Cooldowns ]]
			{ 	name	= "Avatar",
				tooltip	= PlayerHex.."Toggle Automatic |cffFFFFFFAvatar.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
				newSection = true,
			},
			{ 	name	= "Recklessness",
				tooltip	= PlayerHex.."Toggle Automatic |cffFFFFFFRecklessness.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},
			{ 	name	= "Racials",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Racials.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},	
			{ 	name	= "SkullBanner",
				tooltip	= PlayerHex.."Toggle Automatic |cffFFFFFFSkullBanner.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},
			{ 	name	= "StormBolt",
				tooltip	= PlayerHex.."Toggle Automatic |cffFFFFFFStormBolt.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},
			{ 	name	= "Professions CDs",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Professions CDs.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},					
			{ 	name	= "Trinkets",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Trinkets.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Both Active","|cffFFE100Both On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose |cffFFFFFFTrinkets to use|cffff7d0a.",	
				},
			},		
			{ 	name	= "DPS Potion on Heroism",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic DPS Potions"..PlayerHex.." during |cffFFFFFFBlood Lust // Heroism.",
				enable	= true,
			},			
		},
		--[[ Keybinds ]]
		hotkeys = {
			{	name	= "SafeGuard",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFSafeGuard."..PlayerHex.."This will SafeGuard your Mousevoer Target.",
			},		
			{	name	= "Leap",
				enable	= true,
				hotkeys	= {'ls'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFLeap."..PlayerHex.."Hold to Leap.",
			},
			{	name	= "Pause",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFPause."..PlayerHex.."Will |cffFFFFFFStop Rotation while hold.",
			},
			{	name	= "Set Focus",
				enable	= true,
				hotkeys	= {'rc'},
				tooltip	= PlayerHex.."Assign |cffFFFFFF Focus Mouseover.",
			},					
		},
	}
	CODEMYLIFE_ARMS = PQI:AddRotation(CML_Arms_config)
end

--[[           ]]	--[[]]	   --[[]]	--[[           ]]	--[[]]	  --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[           ]]	--[[]]	  --[[]]
--[[]] 				--[[]]	   --[[]]	--[[]]	   --[[]]	   --[[    ]]	
--[[           ]]	--[[]]	   --[[]]	--[[         ]]		   --[[    ]]	
--[[           ]]	--[[]]	   --[[]]	--[[        ]]			 --[[]]
--[[]] 				--[[           ]]	--[[]]	  --[[]]		 --[[]]	
--[[]]      		--[[           ]]	--[[]]		--[[]]		 --[[]]

--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Fury Warrior -----PQI_CodeMyLifeFury_Name_value-----------------------------------------------------------------------]]
if _Spec == 2 and CML_Fury_config == nil then
	PQIprefix = "PQI_CodeMyLifeFury_"
	_AoEModes = 3
	_RangeSpell = 78
	CML_Fury_config = {
		name	= "Fury",
		author	= "CodeMyLife",
		abilities = {
			{ 	name	= "Player Status", 
				tooltip	= PlayerHex.."Enables |cffFFFFFFPlayer Bar.",
				enable	= true,
			},
			{ 	name	= "Player Status X", 
				enable	= true,
				widget	= { type = "numBox",
					min 	= 0,
					max 	= 2000,
					value	= 800,
					width 	= 70,
					step	= 5,
					tooltip	= PlayerHex.."Set Player Status Horizontal Value.",
				},
			},				
			{ 	name	= "Player Status Y", 
				enable	= true,
				widget	= { type = "numBox",
					min 	= 0,
					max 	= 2000,
					value	= 200,
					width 	= 70,
					step	= 5,
					tooltip	= PlayerHex.."Set Player Status Vertical Value.",
				},
			},		
			{ 	name	= "Debug",
				tooltip	= PlayerHex.."Displays Rotation locally in chat.",
				enable	= false,
				widget = { type = "select",
					values 	= {PlayerHex.."Success","|cffD90000Failed","|cffFFFFFFBoth"},
					value	= 1,
					width	= 70,
					tooltip	= PlayerHex.."Select what spells you want to be shown in chat.",
				},
			},	
			--[[ Healing // Defensives ]]
			{ 	name	= "Active Stance",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Stance.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cffF50000Batlle Stance","|cff2990FFDefensive Stance","|cff00CCCCBerserker Stance", PlayerHex.."Dual Stance", PlayerHex.."Triple Stance"},
					value = 1,
					width = 70,
					tooltip = PlayerHex.."Choose Stance Mode.",	
				},
				newSection = true,
			},
			{ 	name	= "Active Shouts",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Shouts.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cffF50000Batlle","|cff2990FFCommanding"},
					value = 1,
					width = 70,
					tooltip = PlayerHex.."Choose Shout.",	
				},
			},
			{ 	name	= "Die By The Sword",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFDie By The Sword "..PlayerHex.."on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 75,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFDie By The Sword "..PlayerHex.."on me.",
				},
			},	
			{ 	name	= "ImpendingVictoryRush",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFImpending/VictoryRush "..PlayerHex.."on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 75,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFImpending/VictoryRush "..PlayerHex.."on me.",
				},
			},
			{ 	name	= "Last Stand",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFLast Stand "..PlayerHex.."on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 75,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFLast Stand "..PlayerHex.."on me.",
				},
			},
			{ 	name	= "Shield Barrier",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFShield Barrier "..PlayerHex.."on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 75,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFShield Barrier "..PlayerHex.."on me.",
				},
			},
			{ 	name	= "Shield Block",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFShield Block "..PlayerHex.."on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 75,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFShield Block "..PlayerHex.."on me.",
				},
			},
			{ 	name	= "Shield Wall",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFShield Wall "..PlayerHex.."on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 40,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFShield Wall "..PlayerHex.."on me.",
				},
			},

			--[[ Cooldowns ]]
			{ 	name	= "Avatar",
				tooltip	= PlayerHex.."Toggle Automatic |cffFFFFFFAvatar.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
				newSection = true,
			},
			{ 	name	= "Recklessness",
				tooltip	= PlayerHex.."Toggle Automatic |cffFFFFFFRecklessness.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},
			{ 	name	= "Racials",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Racials.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},	
			{ 	name	= "SkullBanner",
				tooltip	= PlayerHex.."Toggle Automatic |cffFFFFFFSkullBanner.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},
			{ 	name	= "StormBolt",
				tooltip	= PlayerHex.."Toggle Automatic |cffFFFFFFStormBolt.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},
			{ 	name	= "Professions CDs",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Professions CDs.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},					
			{ 	name	= "Trinkets",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Trinkets.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Both Active","|cffFFE100Both On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose |cffFFFFFFTrinkets to use|cffff7d0a.",	
				},
			},		
			{ 	name	= "DPS Potion on Heroism",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic DPS Potions"..PlayerHex.." during |cffFFFFFFBlood Lust // Heroism.",
				enable	= true,
			},			
		},
		--[[ Keybinds ]]
		hotkeys = {
			{	name	= "SafeGuard",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFSafeGuard."..PlayerHex.."This will SafeGuard your Mousevoer Target.",
			},		
			{	name	= "Leap",
				enable	= true,
				hotkeys	= {'ls'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFLeap."..PlayerHex.."Hold to Leap.",
			},
			{	name	= "Pause",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFPause."..PlayerHex.."Will |cffFFFFFFStop Rotation while hold.",
			},
			{	name	= "Set Focus",
				enable	= true,
				hotkeys	= {'rc'},
				tooltip	= PlayerHex.."Assign |cffFFFFFF Focus Mouseover.",
			},					
		},
	}
	CODEMYLIFE_FURY = PQI:AddRotation(CML_Fury_config)
end

--[[           ]]	--[[           ]]	--[[           ]] 	--[[           ]]
--[[           ]]	--[[           ]]	--[[           ]] 	--[[           ]]
--[[]]	   --[[]]	--[[]]	   --[[]]	--[[]]	   --[[]]		 --[[ ]]
--[[         ]]		--[[         ]]	    --[[]]	   --[[]]		 --[[ ]]
--[[       ]]		--[[        ]]		--[[]]	   --[[]]		 --[[ ]]
--[[]]				--[[]]	  --[[]]	--[[           ]]	 	 --[[ ]]		
--[[]] 				--[[]]	   --[[]]	--[[           ]]		 --[[ ]]	

--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Protection Warrior -----PQI_CodeMyLifeProtection_Name_value-----------------------------------------------------------------------]]
if _Spec == 3 and CML_Prot_config == nil then
	PQIprefix = "PQI_CodeMyLifeProtection_"
	_AoEModes = 2
	_RangeSpell = 78
	CML_Prot_config = {
		name	= "Protection",
		author	= "CodeMyLife",
		abilities = {
			{ 	name	= "Player Status", 
				tooltip	= PlayerHex.."Enables |cffFFFFFFPlayer Bar.",
				enable	= true,
			},
			{ 	name	= "Player Status X", 
				enable	= true,
				widget	= { type = "numBox",
					min 	= 0,
					max 	= 2000,
					value	= 800,
					width 	= 70,
					step	= 5,
					tooltip	= PlayerHex.."Set Player Status Horizontal Value.",
				},
			},				
			{ 	name	= "Player Status Y", 
				enable	= true,
				widget	= { type = "numBox",
					min 	= 0,
					max 	= 2000,
					value	= 200,
					width 	= 70,
					step	= 5,
					tooltip	= PlayerHex.."Set Player Status Vertical Value.",
				},
			},		
			{ 	name	= "Debug",
				tooltip	= PlayerHex.."Displays Rotation locally in chat.",
				enable	= false,
				widget = { type = "select",
					values 	= {PlayerHex.."Success","|cffD90000Failed","|cffFFFFFFBoth"},
					value	= 1,
					width	= 70,
					tooltip	= PlayerHex.."Select what spells you want to be shown in chat.",
				},
			},	
			--[[ Healing // Defensives ]]
			{ 	name	= "Active Stance",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Stance.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cffF50000Batlle Stance","|cff2990FFDefensive Stance","|cff00CCCCBerserker Stance", PlayerHex.."Dual Stance", PlayerHex.."Triple Stance"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose Stance Mode.",	
				},
				newSection = true,
			},
			{ 	name	= "Active Shouts",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Shouts.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cffF50000Batlle","|cff2990FFCommanding"},
					value = 1,
					width = 70,
					tooltip = PlayerHex.."Choose Shout.",	
				},
			},
			{ 	name	= "ImpendingVictoryRush",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFImpending/VictoryRush "..PlayerHex.."on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 75,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFImpending/VictoryRush "..PlayerHex.."on me.",
				},
			},
			{ 	name	= "Last Stand",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFLast Stand "..PlayerHex.."on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 75,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFLast Stand "..PlayerHex.."on me.",
				},
			},
			{ 	name	= "Active Mitigation Selector",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFActive Mitigation Selector.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Both","|cffF50000Barrier","|cff2990FFBlock"},
					value = 1,
					width = 70,
					tooltip = PlayerHex.."Choose Active Mitigation method.",	
				},
			},			
			{ 	name	= "Shield Barrier",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFShield Barrier "..PlayerHex.."on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 75,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFShield Barrier "..PlayerHex.."on me.",
				},
			},
			{ 	name	= "Shield Block",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFShield Block "..PlayerHex.."on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 75,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFShield Block "..PlayerHex.."on me.",
				},
			},
			{ 	name	= "Shield Wall",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFShield Wall "..PlayerHex.."on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 40,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFShield Wall "..PlayerHex.."on me.",
				},
			},

			--[[ Cooldowns ]]
			{ 	name	= "Avatar",
				tooltip	= PlayerHex.."Toggle Automatic |cffFFFFFFAvatar.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
				newSection = true,
			},
			{ 	name	= "Recklessness",
				tooltip	= PlayerHex.."Toggle Automatic |cffFFFFFFRecklessness.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},
			{ 	name	= "Racials",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Racials.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},	
			{ 	name	= "SkullBanner",
				tooltip	= PlayerHex.."Toggle Automatic |cffFFFFFFSkullBanner.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},
			{ 	name	= "StormBolt",
				tooltip	= PlayerHex.."Toggle Automatic |cffFFFFFFStormBolt.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},
			{ 	name	= "Professions CDs",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Professions CDs.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},					
			{ 	name	= "Trinkets",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Trinkets.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Both Active","|cffFFE100Both On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose |cffFFFFFFTrinkets to use|cffff7d0a.",	
				},
			},		
			{ 	name	= "DPS Potion on Heroism",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic DPS Potions"..PlayerHex.." during |cffFFFFFFBlood Lust // Heroism.",
				enable	= true,
			},			
		},
		--[[ Keybinds ]]
		hotkeys = {
			{	name	= "SafeGuard",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFSafeGuard."..PlayerHex.."This will SafeGuard your Mousevoer Target.",
			},		
			{	name	= "Leap",
				enable	= true,
				hotkeys	= {'ls'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFLeap."..PlayerHex.."Hold to Leap.",
			},
			{	name	= "Pause",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFPause."..PlayerHex.."Will |cffFFFFFFStop Rotation while hold.",
			},
			{	name	= "Set Focus",
				enable	= true,
				hotkeys	= {'rc'},
				tooltip	= PlayerHex.."Assign |cffFFFFFF Focus Mouseover.",
			},					
		},
	}
	CODEMYLIFE_PROTECTION = PQI:AddRotation(CML_Prot_config)
end

--[[           ]]	--[[]]	   --[[]]	--[[]]	   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[  ]]   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[  ]]   --[[]]
--[[]]				--[[]]	   --[[]]	--[[    ]] --[[]]   --[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[    ]] --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[           ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[           ]]
--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[   		   ]]
--[[]]	   			--[[           ]]	--[[]]	 --[[  ]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	 --[[  ]]
--[[]]	   			--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]
if not WarriorFunctions then
	WarriorFunctions = true

	_Avatar						= 107574
	_BattleShout				= 6673
	_BerserkerRage				= 18499
	_Bladestorm					= 46924
	_Bloodbath					= 12292
	_Bloodthirst				= 23881
	_Charge						= 100
	_Cleave						= 845
	_ColossusSmash				= 86346
	_CommandingShout			= 469
	_DemoralizingBanner			= 114203
	_DemoralizingShout			= 1160
	_Devastate					= 20243
	_DieByTheSword				= 118038
	_Disarm						= 676
	_DisruptingShout			= 102060
	_DragonRoar					= 118000
	_EnragedRegeneration		= 55694
	_Execute					= 5308
	_Hamstring					= 1715
	_HeroicLeap					= 6544
	_HeroicStrike				= 78
	_HeroicThrow				= 57755
	_ImpendingVictory			= 103840
	_Intervene					= 3411
	_IntimidatingShout			= 5246
	_LastStand					= 12975
	_MassSpellReflection		= 114028
	_MockingBanner				= 114192
	_MortalStrike 				= 12294
	_Overpower					= 7384
	_PiercingHowl				= 12323
	_Pummel						= 6552
	_RagingBlow					= 85288
	_RallyingCry				= 97462
	_Recklessness				= 1719
	_Revenge					= 6572
	_Safeguard					= 114029
	_ShatteringThrow			= 64382
	_ShieldBarrier				= 112048
	_ShieldBlock				= 2565
	_ShieldSlam					= 23922
	_ShieldWall					= 871
	_Shockwave					= 46968
	_SkullBanner				= 114207
	_Slam						= 1464
	_SpellReflection			= 23920
	_StaggeringShout			= 107566
	_StormBolt					= 107570
	_SweepingStrikes			= 12328
	_SwordandBoard				= 46953
	_Taunt						= 355
	_ThunderClap				= 6343
	_Ultimatum					= 122509
	_VictoryRush				= 34428
	_Vigilance					= 114030
	_Vrushed					= 32216
	_WeakBlows					= 115798
	_Whirlwind					= 1680
	_WildStrike					= 100130

	macros = {  
	    ["ActiveCooldowns"]   		= false,
	    ["ActiveMitigation"]		= 3,
	    ["AoE"]    					= 1, 
	    ["Pause"]					= false,
	    ["Stance"]					= 1,
	} 
	_Queues = {
		[1]						= false,
		[_IntimidatingShout] 	= false,
		[_ShatteringThrow] 		= false,
		[_StormBolt] 			= false,
		[_Disarm]				= false,
		[_PiercingHowl]			= false,
	}

	SLASH_MITIGATION1 = "/mitigation"
	function SlashCmdList.MITIGATION(msg, editbox)
		if PQIprefix and not _G[PQIprefix.."ActiveMitigationSelector_enable"] or _G[PQIprefix.."ActiveMitigationSelector_value"] ~= 1 then xrn:message("\124cFFED0000Active Mitigation inactive.") return false end		
		if macros["ActiveMitigation"] == 1 then
			xrn:message("\124cFFC800FFBarrier Active.")
			macros["ActiveMitigation"] = 2
		elseif macros["ActiveMitigation"] == 2 then
			xrn:message("\124cFF0095FFBarrier and Block Active.")
			macros["ActiveMitigation"] = 3
		else
			xrn:message("\124cFF00FBFFBlock Active.")
			macros["ActiveMitigation"] = 1
		end
	end	

	SLASH_STANCEDANCE1 = "/stancedance"
	SLASH_STANCEDANCE2 = "/stance"
	function SlashCmdList.STANCEDANCE(msg, editbox)
		if PQIprefix and _G[PQIprefix.."ActiveStance_value"] ~= 4 and _G[PQIprefix.."ActiveStance_value"] ~= 5 then xrn:message("\124cFFED0000Stances not Actives.") return false end
		if macros["Stance"] == 1 then
			xrn:message("\124cFF004EDEDefensive Stance.")
			macros["Stance"] = 2
		elseif macros["Stance"] == 2 and _G[PQIprefix.."ActiveStance_value"] == 5 then
			xrn:message("\124cFF00CCCCBerserker Stance.")
			macros["Stance"] = 3
		else	
			xrn:message("\124cFFED0000Battle Stance.")
			macros["Stance"] = 1	
		end
	end
end

end