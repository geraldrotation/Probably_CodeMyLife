function CML.DruidStartup()

if _Spec == 1 then PQIprefix = "PQI_FriedChickenMoonkin_" UnitDispel = {'Poison'} Coolprefix = "PQI_FriedChickenCooldownsMoon_" end
if _Spec == 2 then PQIprefix = "PQI_CodeMyLifeFeral_" UnitDispel = {'Poison'} end
if _Spec == 3 then PQIprefix = "PQI_CodeMyLifeGuardian_" Coolprefix = "PQI_CodeMyLifeCooldownsGuard_" UnitDispel = {'Poison'} end
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
			},	},
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
			{	name	= "Hurricane Key",
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

--[[           ]]	--[[         ]]		--[[           ]] 	
--[[           ]]	--[[          ]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]	--[[]]				
--[[]]				--[[]]	   --[[]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]		   	   --[[]]	
--[[   		   ]]	--[[          ]]	--[[           ]] 	
--[[   		   ]]	--[[         ]] 	--[[           ]] 	

if _MyClass == 11 and _Spec == 1 and CML_Cooldowns_Config == nil then
	Coolprefix = "PQI_FriedChickenCooldownsMoon_"

	CML_Cooldowns_Config = {
		name	= "CooldownsMoon",
		author	= "FriedChicken",
		abilities = {
			{ 	name	= "Hurricane",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFHurricane "..PlayerHex.."on cursor.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Keypress","|cff00A8ABAuto","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFSet Strategy to use"..PlayerHex.." Automatic Hurricane |cffFFFFFF on "..PlayerHex.."cursor.",	
				},
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
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Trinkets|cff7EBF37.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Both Active","|cffFFE100Both On CD","|cffD90000Disable"},
					value = 1,
					width = 70,
					tooltip = "|cff7EBF37Choose |cffFFFFFFTrinkets to use|cff7EBF37.",	
				},
			},		
			{ 	name	= "DPS Potion",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Agility Potions|cff7EBF37 when |cffFFFFFFHeroism |cff7EBF37starts.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff7EBF37On Boss","|cffFFFFFFOn Heroism","|cffFFDD00Never"},
					value = 1,
					width = 70,
					tooltip = "|cffFFFFFFSet way to use|cff7EBF37 Potions.",	
				},
			},				
			{ 	name	= "Interrupt",
				tooltip	= "|cff7EBF37Toggle |cffFFFFFFAutomatic Solar Beam |cff7EBF37On target.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Random","|cff00CC0030","|cff00CC000"},
					value = 1,
					width = 70,
					tooltip = "|cffFFFFFFSet Treshold to use|cff7EBF37 Solar Beam |cffFFFFFF on |cff7EBF37Target/Mouseover/Focus.",	
				},
				newSection = true,
			},
		},
	}
	CODEMYLIFE_COOLDOWNS = PQI:AddRotation(CML_Cooldowns_Config)
end

--[[           ]]	--[[           ]]		  --[[]]		--[[           ]]
--[[           ]]	--[[           ]]	     --[[  ]]		--[[           ]]
--[[]]	   --[[]]	--[[]]				    --[[    ]] 		--[[]]	   --[[]]
--[[         ]]		--[[           ]]	   --[[      ]] 	--[[         ]]
--[[]]	   --[[]]	--[[]]				  --[[        ]]	--[[        ]]
--[[           ]]	--[[           ]]	 --[[]]    --[[]]	--[[]]	  --[[]]		
--[[           ]] 	--[[           ]]	--[[]]      --[[]]	--[[]]	   --[[]]

--[[           ]]	--[[         ]]		--[[           ]] 	
--[[           ]]	--[[          ]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]	--[[]]				
--[[]]				--[[]]	   --[[]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]		   	   --[[]]	
--[[   		   ]]	--[[          ]]	--[[           ]] 	
--[[   		   ]]	--[[         ]] 	--[[           ]] 	

if _MyClass == 11 and _Spec == 3 and CML_Cooldowns_Config == nil then
	Coolprefix = "PQI_CodeMyLifeCooldownsGuard_"

	CML_Cooldowns_Config = {
		name	= "CooldownsGuard",
		author	= "CodeMyLife",
		abilities = {
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
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Trinkets|cff7EBF37.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Both Active","|cffFFE100Both On CD","|cffD90000Disable"},
					value = 1,
					width = 70,
					tooltip = "|cff7EBF37Choose |cffFFFFFFTrinkets to use|cff7EBF37.",	
				},
			},		
			{ 	name	= "DPS Potion",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Agility Potions|cff7EBF37 when |cffFFFFFFHeroism |cff7EBF37starts.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff7EBF37On Boss","|cffFFFFFFOn Heroism","|cffFFDD00Never"},
					value = 1,
					width = 70,
					tooltip = "|cffFFFFFFSet way to use|cff7EBF37 Potions.",	
				},
			},				
			{ 	name	= "Interrupt",
				tooltip	= "|cff7EBF37Toggle |cffFFFFFFAutomatic Solar Beam |cff7EBF37On target.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Random","|cff00CC0030","|cff00CC000"},
					value = 1,
					width = 70,
					tooltip = "|cffFFFFFFSet Treshold to use|cff7EBF37 Solar Beam |cffFFFFFF on |cff7EBF37Target/Mouseover/Focus.",	
				},
				newSection = true,
			},
		},
	}
	CODEMYLIFE_COOLDOWNS = PQI:AddRotation(CML_Cooldowns_Config)
end

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
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFBarkskin.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 55,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFBarkskin.",
				},
				newSection = true,
			},
			{ 	name	= "Cenarion Ward",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFCenarion Ward |cffff7d0aon me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 50,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFCenarion Ward |cffff7d0aon me.",
				},
			},
			{ 	name	= "Cenarion Ward For Tank",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFCenarion Ward |cffff7d0aFor Tank.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 60,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFCenarion Ward |cffff7d0aFor Tank.",
				},
			},			
			{ 	name	= "Ironbark",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFIronbark |cffff7d0aon me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 40,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFIronbark |cffff7d0aon Me.",
				},
			},
			{ 	name	= "Ironbark For Tank",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFIronbark |cffff7d0aFor Tank.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 50,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFIronbark |cffff7d0aFor Tank.",
				},
			},
			{ 	name	= "Might of Ursoc",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFMight of Ursoc.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 20,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFMight of Ursoc.",
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
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFRenewal.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFRenewal.",
				},
			},
			{ 	name	= "Rejuvenation",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFRejuvenation.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 85,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFRejuvenation.",
				},
				newSection = true,
			},	
			{ 	name	= "Rejuvenation For Tank",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFRejuvenation |cffff7d0a ForTank.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 99,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFRejuvenation |cffff7d0aFor Tank.",
				},
			},
			{ 	name	= "Regrowth",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFRegrowth.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 55,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFRegrowth.",
				},
			},	
			{ 	name	= "Healing Touch",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFHealing Touch.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 65,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFHealing Touch.",
				},
			},	
			{ 	name	= "Lifebloom For Tank",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFLifebloom |cffff7d0aFor Tank.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 65,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFLifebloom |cffff7d0aFor Tank.",
				},
			},			
			{ 	name	= "Swiftmend",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFSwiftmend.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 75,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFSwiftmend.",
				},
			},	
            { 	name	= "Genesis",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFGenesis.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 65,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFGenesis.",
				},
			},	
            { 	name	= "Wildgrowth",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFWildgrowth.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 70,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFWildgrowth.",
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
				hotkeys	= {'ls'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFPause |cffff7d0aWill |cffFFFFFFStop Rotation, ClearTarget |cffff7d0aand |cffFFFFFFPet Stop Attack.",
			},
			{	name	= "Set Focus",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFMouseover Focus |cffff7d0aSet focus to mouseover.",
			},
			{	name	= "Tranquility",
				enable	= true,
				hotkeys	= {'rc'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFTranquility. |cffff7d0aHold to Cast.",
			},
			{	name	= "Incarnation",
				enable	= true,
				hotkeys	= {'rs'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFIncarnation. |cffff7d0aHold to Cast.",
			},
			{	name	= "Place Schrooms",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFPlace Schrooms. |cffff7d0aHold to Cast.",
			},
			{	name	= "Bloom Schrooms",
				enable	= true,
				hotkeys	= {'ra'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFBloom Schrooms. |cffff7d0aHold to Cast.",
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


	function  CML.LifeBlooms()
		local Blooms = false
		for i=1, #nNova do	
			if UnitBuffID(nNova[i].unit, 33763)
			  and (select(7, UnitBuffID(nNova[i].unit, 33763, "PLAYER")) - GetTime() > 1 
			  or select(4, UnitBuffID(nNova[i].unit, 33763, "PLAYER")) < 3)
			  and UnitThreatSituation(nNova[i].unit) == 3 then
				Blooms = true
			end
			if Blooms and UnitBuffID(nNova[i].unit, 33763) and (select(4, UnitBuffID(nNova[i].unit, 33763, "PLAYER")) < 3 or select(7, UnitBuffID(nNova[i].unit, 33763, "PLAYER")) - GetTime() < 2) then
				ProbablyEngine.dsl.parsedTarget = nNova[i].unit
				return true
			end
		end
		if not Blooms then
			if #nNova > 1 then
				for i=1, #nNova do
					if UnitThreatSituation(nNova[i].unit) == 3
					  and nNova[i].role == "TANK" or nNova[i].role == "NONE" then
					  	ProbablyEngine.dsl.parsedTarget = nNova[i].unit
						return true
					end
				end
			end
		end	
	end	


	function CML.Rejuvenation()
		if _G[PQIprefix.."Rejuvenation_enable"] and macros["ActiveHealing"] then
			local NumberRollingRejuv = 0
			for i = 1, #nNova do
				if nNova[i].hp <= _G[PQIprefix.."Rejuvenation_value"] then
					if not UnitBuffID(nNova[i].unit,774) then
						ProbablyEngine.dsl.parsedTarget = nNova[i].unit
						return true
					else
						NumberRollingRejuv = NumberRollingRejuv + 1
					end
				end
			end
		end
		return false
	end 

	function CML.WildGrowth(members)
		if _G[PQIprefix.."WildGrowth_enable"] and macros["ActiveHealing"] then
			local WildValue = _G[PQIprefix.."WildGrowth_value"]
			local AoEValue = members
			for i = 1, #nNova do
				if nNova[i].hp <= WildValue then
					local inRange = 0 -- I dont have to include myself as i will test me/me anyway..
					for j = 1,#nNova do
						print(nNova[i].unit.." "..nNova[j].unit.." "..CML.GetDistance(nNova[i].unit,nNova[j].unit))
						if nNova[j].hp <= WildValue and CML.GetDistance(nNova[i].unit,nNova[j].unit) <= 30 then
							inRange = inRange + 1
							if inRange >= AoEValue then
								ProbablyEngine.dsl.parsedTarget = nNova[i].unit
								return true
							end
						end
					end
				end
			end
		end
		return false
	end 	

	function CML.IronBark()	
		if _G[PQIprefix.."Ironbark_enable"] and nNova[1].hp < _G[PQIprefix.."Ironbark_value"] then
			if UnitGUID(nNova[1].unit) ~= UnitGUID("player") and nNova[1].range == 1 and UnitThreatSituation(nNova[1].unit) == 3
			  and (nNova[1].role == "TANK" 
			  or nNova[1].role == "NONE") then
			  	ProbablyEngine.dsl.parsedTarget = nNova[1].unit
				return true
			end
		end
	end

	function CML.Rebirth()
		for i = 1, #nNova do
			if nNova[i].role == "TANK" and 
				UnitIsDeadOrGhost(nNova[i].unit) == 1
			  and IsSpellInRange(GetSpellInfo(20484), nNova[i].unit) == 1 then
				ProbablyEngine.dsl.parsedTarget = nNova[i].unit
				CastSpellByName(GetSpellInfo(132158))
				CastSpellByName(GetSpellInfo(20484),nNova[i].unit)
				return true
			end
		end
	end

	function CML.Rez()
		for i = 1, #nNova do
			if UnitIsDeadOrGhost(nNova[i].unit) == 1
			  and IsSpellInRange(GetSpellInfo(50769), nNova[i].unit) == 1 then
				ProbablyEngine.dsl.parsedTarget = nNova[i].unit
				CastSpellByName(GetSpellInfo(50769),nNova[i].unit)
				return true
			end
		end
	end	

	function CML.NotEclipse()
	  	if math.abs(UnitPower("player",8)) < 20 then return true end
	end
end




end