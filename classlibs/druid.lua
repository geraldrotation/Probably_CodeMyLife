function CML.DruidStartup()

if _Spec == 1 then PQIprefix = "PQI_CodeMyLifeMoonkin_" UnitDispel = {'Poison'} end
if _Spec == 2 then PQIprefix = "PQI_CodeMyLifeFeral_" UnitDispel = {'Poison'} end
if _Spec == 3 then PQIprefix = "PQI_CodeMyLifeGuardian_" UnitDispel = {'Poison'} end
if _Spec == 4 then PQIprefix = "PQI_RepairedRestoration_" UnitDispel = {'Poison','Magic'} end

_HealingRangeSpell = 5185 -- Healing Touch

--[[]]     --[[]] 	--[[           ]]	--[[           ]] 	--[[]]	   --[[]]	
--[[ ]]   --[[ ]] 	--[[           ]]	--[[           ]]	--[[  ]]   --[[]]	
--[[           ]] 	--[[]]	   --[[]]	--[[]]	   --[[]]	--[[    ]] --[[]]		
--[[           ]]	--[[]]	   --[[]]	--[[]]	   --[[]]	--[[           ]]	
--[[]] 	   --[[]]	--[[]]	   --[[]]	--[[]]	   --[[]]	--[[   		   ]]	
--[[]]	   --[[]]	--[[           ]]	--[[           ]]	--[[]]	 --[[  ]]	
--[[]]	   --[[]]	--[[           ]]	--[[           ]]	--[[]]	   --[[]]	

--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Moonkin Druid -----PQI_CodeMyLifeMoonkin_Name_value-----------------------------------------------------------------------]]
if _Spec == 1 and CML_Moon_config == nil then
	PQR_RotationChanged("FriedChicken")
	PQIprefix = "PQI_FriedChickenMoonkin_"
	_AoEModes = 2
	_RangeSpell = 8921
	CML_Moon_config = {
		name	= "Moonkin",
		author	= "FriedChicken",
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
				widget = { type = 'select',
					values 	= {PlayerHex.."Success","|cffD90000Failed","|cffFFFFFFBoth"},
					value	= 1,
					width	= 70,
					tooltip	= PlayerHex.."Select what spells you want to be shown in chat.",
				},
			},			
			{ 	name	= "Barkskin",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFBarkskin |cffff7d0aon me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 40,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFBarkskin |cffff7d0aon me.",
				},
				newSection = true,
			},
			{ 	name	= "Cenarion Ward",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFCenarion Ward |cffff7d0aon me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 75,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFCenarion Ward |cffff7d0aon me.",
				},
			},					
			{ 	name	= "Healing Touch",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFHealing Touch |cffff7d0aon me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFHealing Touch |cffff7d0aon me.",
				},
			},	
			{ 	name	= "Healthstone",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFF|cff33FF33Healthstone.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFF|cff33FF33Healthstone.",
				},
			},	
			{ 	name	= "Renewal",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFRenewal |cffff7d0aon me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFRenewal |cffff7d0aon me.",
				},
			},
			{ 	name	= "Rejuvenation",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFRejuvenation |cffff7d0aon me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 65,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFRejuvenation |cffff7d0aon me.",
				},
				newSection = true,
			},	
			--[[ Cooldowns ]]
			{ 	name	= "Celestial Alignment",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Celestial Alignment.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
				newSection = true,
			},
			{ 	name	= "Incarnation",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Incarnation.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},					
			{ 	name	= "Racials",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Racials.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},	
			{ 	name	= "Professions CDs",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Professions CDs.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},					
			{ 	name	= "Trinkets",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Trinkets|cffff7d0a.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Both Active","|cffFFE100Both On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose |cffFFFFFFTrinkets to use|cffff7d0a.",	
				},
			},		
			{ 	name	= "DPS Potion on Heroism",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic DPS Potions|cffff7d0a when |cffFFFFFFHeroism |cffff7d0astarts.",
				enable	= true,
			},			
		},
		--[[ Keybinds ]]
		hotkeys = {
			{	name	= "Pause",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFPause |cffff7d0aWill |cffFFFFFFStop Rotation, ClearTarget |cffff7d0aand |cffFFFFFFPet Stop Attack.",
			},
			{	name	= "Set Focus",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFMouseover Focus |cffff7d0aSet focus to mouseover.",
			},
			{	name	= "Tranquility",
				enable	= true,
				hotkeys	= {'ra'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFTranquility. |cffff7d0aHold to Cast.",
			},
			{	name	= "Hurricane",
				enable	= true,
				hotkeys	= {'ls'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFHurricane. |cffff7d0aHold to Cast.",
			},
			{	name	= "Place Schrooms",
				enable	= true,
				hotkeys	= {'rs'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFPlace Schrooms. |cffff7d0aHold to Cast.",
			},
			{	name	= "Detonate Schrooms",
				enable	= true,
				hotkeys	= {'rc'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFDetonate Schrooms. |cffff7d0aHold to Cast.",
			},						
		},
	}
	CODEMYLIFE_MOONKIN = PQI:AddRotation(CML_Moon_config)
end

--[[           ]]	--[[           ]]		  --[[]]		--[[           ]]
--[[           ]]	--[[           ]]	     --[[  ]]		--[[           ]]
--[[]]	   --[[]]	--[[]]				    --[[    ]] 		--[[]]	   --[[]]
--[[         ]]		--[[           ]]	   --[[      ]] 	--[[         ]]
--[[]]	   --[[]]	--[[]]				  --[[        ]]	--[[        ]]
--[[           ]]	--[[           ]]	 --[[]]    --[[]]	--[[]]	  --[[]]		
--[[           ]] 	--[[           ]]	--[[]]      --[[]]	--[[]]	   --[[]]

--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Guardian Druid -----PQI_CodeMyLifeGuardian_Name_value-----------------------------------------------------------------------]]
if _Spec == 3 and CML_Guardian_config == nil then
	PQR_RotationChanged("CodeMyLife")
	PQIprefix = "PQI_CodeMyLifeGuardian_"
	_AoEModes = 2
	_RangeSpell = 33878
	CML_Guardian_config = {
		name	= "Guardian",
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
				widget = { type = 'select',
					values 	= {PlayerHex.."Success","|cffD90000Failed","|cffFFFFFFBoth"},
					value	= 1,
					width	= 70,
					tooltip	= PlayerHex.."Select what spells you want to be shown in chat.",
				},
			},
			{ 	name	= "Frenzied Regen",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFFrenzied Regen on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 40,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFFrenzied Regen on me.",
				},
				newSection = true,
			},			
			{ 	name	= "Savage Defense",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast Savage Defense Regen on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 40,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast Savage Defense Regen on me.",
				},
			},
			{ 	name	= "Tooth And Claw",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFTooth And Claw.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 40,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFTooth And Claw.",
				},
			},
			{ 	name	= "Barkskin",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFBarkskin on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 40,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFBarkskin on me.",
				},
				newSection = true,
			},
			{ 	name	= "Cenarion Ward",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFCenarion Ward on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 75,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFCenarion Ward on me.",
				},
			},
			{ 	name	= "Healthstone",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFHealthstone.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFHealthstone.",
				},
			},	
			{ 	name	= "Renewal",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFRenewal on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFRenewal on me.",
				},
			},
			--[[ Cooldowns ]]
			{ 	name	= "Incarnation",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Incarnation.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},					
			{ 	name	= "Racials",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Racials.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},	
			{ 	name	= "Professions CDs",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Professions CDs.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},					
			{ 	name	= "Trinkets",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Trinkets|cffff7d0a.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Both Active","|cffFFE100Both On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose |cffFFFFFFTrinkets to use|cffff7d0a.",	
				},
			},		
			{ 	name	= "DPS Potion on Heroism",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic DPS Potions|cffff7d0a when |cffFFFFFFHeroism |cffff7d0astarts.",
				enable	= true,
			},			
		},
		--[[ Keybinds ]]
		hotkeys = {
			{	name	= "Pause",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFPause |cffff7d0aWill |cffFFFFFFStop Rotation, ClearTarget |cffff7d0aand |cffFFFFFFPet Stop Attack.",
			},
			{	name	= "Set Focus",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFMouseover Focus |cffff7d0aSet focus to mouseover.",
			},
			{	name	= "Tranquility",
				enable	= true,
				hotkeys	= {'ra'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFTranquility. |cffff7d0aHold to Cast.",
			},
			{	name	= "Hurricane",
				enable	= true,
				hotkeys	= {'ls'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFHurricane. |cffff7d0aHold to Cast.",
			},
			{	name	= "Place Schrooms",
				enable	= true,
				hotkeys	= {'rs'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFPlace Schrooms. |cffff7d0aHold to Cast.",
			},
			{	name	= "Detonate Schrooms",
				enable	= true,
				hotkeys	= {'rc'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFDetonate Schrooms. |cffff7d0aHold to Cast.",
			},						
		},
	}
	CODEMYLIFE_GUARDIAN = PQI:AddRotation(CML_Guardian_config)
end


--[[           ]]	--[[           ]]	--[[           ]]	--[[           ]]	--[[           ]]
--[[           ]]	--[[           ]]	--[[           ]]	--[[           ]]	--[[           ]]
--[[]]	   --[[]]	--[[]]				--[[]]					 --[[ ]]		--[[]]	   --[[]]
--[[           ]]	--[[           ]]	--[[           ]]		 --[[ ]]		--[[]]	   --[[]]
--[[        ]]		--[[]]						   --[[]]		 --[[ ]]		--[[]]	   --[[]]
--[[]]	  --[[]]	--[[           ]]	--[[           ]]		 --[[ ]]		--[[           ]]
--[[]]	   --[[]]	--[[           ]] 	--[[           ]]		 --[[ ]]		--[[           ]]

--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Restoration Druid -----PQI_RepairedRestoration_Name_value-----------------------------------------------------------------------]]
if _Spec == 4 and CML_Resto_config == nil then
	PQR_RotationChanged("Repaired")
	PQIprefix = "PQI_RepairedRestoration_"
	_AoEModes = 2
	_RangeSpell = 8921
	CML_Resto_config = {
		name	= "Restoration",
		author	= "Repaired",
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
				widget = { type = 'select',
					values 	= {PlayerHex.."Success","|cffD90000Failed","|cffFFFFFFBoth"},
					value	= 1,
					width	= 70,
					tooltip	= PlayerHex.."Select what spells you want to be shown in chat.",
				},
			},			
			{ 	name	= "Barkskin",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFBarkskin |cffff7d0aon me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 40,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFBarkskin |cffff7d0aon me.",
				},
				newSection = true,
			},
			{ 	name	= "Healthstone",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFF|cff33FF33Healthstone.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFF|cff33FF33Healthstone.",
				},
			},	
			{ 	name	= "Renewal",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFRenewal |cffff7d0aon me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFRenewal |cffff7d0aon me.",
				},
			},
			{ 	name	= "Rejuvenation",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFRejuvenation |cffff7d0aon me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 65,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFRejuvenation |cffff7d0aon me.",
				},
				newSection = true,
			},	
			--[[ Cooldowns ]]
			{ 	name	= "Incarnation",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Incarnation.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},					
			{ 	name	= "Racials",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Racials.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},	
			{ 	name	= "Professions CDs",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Professions CDs.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},					
			{ 	name	= "Trinkets",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Trinkets|cffff7d0a.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Both Active","|cffFFE100Both On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose |cffFFFFFFTrinkets to use|cffff7d0a.",	
				},
			},		
			{ 	name	= "DPS Potion on Heroism",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic DPS Potions|cffff7d0a when |cffFFFFFFHeroism |cffff7d0astarts.",
				enable	= true,
			},			
		},
		--[[ Keybinds ]]
		hotkeys = {
			{	name	= "Pause",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFPause |cffff7d0aWill |cffFFFFFFStop Rotation, ClearTarget |cffff7d0aand |cffFFFFFFPet Stop Attack.",
			},
			{	name	= "Set Focus",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFMouseover Focus |cffff7d0aSet focus to mouseover.",
			},
			{	name	= "Tranquility",
				enable	= true,
				hotkeys	= {'ra'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFTranquility. |cffff7d0aHold to Cast.",
			},
			{	name	= "Place Schrooms",
				enable	= true,
				hotkeys	= {'rs'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFPlace Schrooms. |cffff7d0aHold to Cast.",
			},
			{	name	= "Detonate Schrooms",
				enable	= true,
				hotkeys	= {'rc'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFDetonate Schrooms. |cffff7d0aHold to Cast.",
			},						
		},
	}
	CODEMYLIFE_RESTORATION = PQI:AddRotation(CML_Resto_config)
end


--[[           ]]	--[[]]	   --[[]]	--[[]]	   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[  ]]   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[  ]]   --[[]]
--[[]]				--[[]]	   --[[]]	--[[    ]] --[[]]   --[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[    ]] --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[           ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[           ]]
--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[   		   ]]
--[[]]	   			--[[           ]]	--[[]]	 --[[  ]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	 --[[  ]]
--[[]]	   			--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]
if not DruidFunction then
	DruidFunction = true
	macros = { 
	    ["ActiveCooldowns"]   		= false,
	    ["ActiveDispel"]			= true, 
	   	["ActiveDPS"]   			= false,
	    ["ActiveHealing"]   		= false, 
	    ["AoE"]    					= 1,  
	    ["Pause"]					= false,
	} 
	_Queues = {	
		[11]					= false,
	}

	function CML.Rebirth()
		for i = 1, #nNova do
			if nNova[i].role == "TANK"
			  and UnitIsDeadOrGhost(nNova[i].unit) == 1
			  and IsSpellInRange(GetSpellInfo(20484), nNova[i].unit) == 1 then
				ProbablyEngine.dsl.parsedTarget = nNova[i].unit
				return true
			end
		end
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

	function CML.StopCasting()
		if UnitBuffID("player", 31821) then return true end
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
		    	return false
		    end
		end
		return true
	end

	function CML.NotEclipse()
	  	if math.abs(UnitPower("player",8)) < 20 then return true end
	end
end




end