function CML.RogueStartup()

if _Spec == 1 then PQIprefix = "PQI_CodeMyLifeAssassination_" end
if _Spec == 2 then PQIprefix = "PQI_CodeMyLifeCombat_" end
if _Spec == 3 then PQIprefix = "PQI_CodeMyLifeSubtlety_" end

_HealingRangeSpell = 102694 -- First Aid

	  --[[]]		--[[           ]]	--[[           ]]		  --[[]]		--[[           ]]	--[[           ]]
     --[[  ]]		--[[           ]]	--[[           ]]	     --[[  ]]		--[[           ]]	--[[           ]]
    --[[    ]] 		--[[]]				--[[]]				    --[[    ]] 		--[[]]				--[[]]
   --[[      ]] 	--[[           ]]	--[[           ]]	   --[[      ]] 	--[[           ]]	--[[           ]]
  --[[        ]]			   --[[]]		 	   --[[]]	  --[[        ]]			   --[[]]		 	   --[[]]
 --[[]]    --[[]]	--[[           ]]	--[[           ]]	 --[[]]    --[[]]	--[[           ]]	--[[           ]]	
--[[]]      --[[]]	--[[           ]]	--[[           ]] 	--[[]]      --[[]]	--[[           ]]	--[[           ]]
	
--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Rogue Assassination -----PQI_CodeMyLifeAssassination_Name_value-----------------------------------------------------------------------]]

if _Spec == 1 and CML_Assass_config == nil then
	PQIprefix = "PQI_CodeMyLifeAssassination_"
	_AoEModes = 2
	_RangeSpell = 1752
	CML_Assass_config = {
		name	= "Assassination",
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
			{ 	name	= "Combat Check", 
				tooltip	= PlayerHex.."Check to activate Combat Check.",
				enable	= true,
			},
			{ 	name	= "Racials",
				tooltip	= PlayerHex.."toggle Automatic Racials.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
				newSection = true,
			},	
			{ 	name	= "Professions CDs",
				tooltip	= PlayerHex.."toggle Automatic Professions CDs.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},					
			{ 	name	= "Trinkets",
				tooltip	= PlayerHex.."toggle Automatic Trinkets.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Both Active","|cffFFE100Both On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose Trinkets to use.",	
				},
			},		
			{ 	name	= "DPS Potion on Heroism",
				tooltip	= PlayerHex.."toggle Automatic DPS Potions when Heroism starts.",
				enable	= true,
			},			
		},
		--[[ Keybinds ]]
		hotkeys = {
			{	name	= "Pause",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= PlayerHex.."Assign Pause Will Stop Rotation.",
			},
			{	name	= "Set Focus",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign Mouseover Focus Set focus to mouseover.",
			},	
		},
	}
	CODEMYLIFE_ASSASSINATION = PQI:AddRotation(CML_Assass_config)
end
	
--[[           ]] 	--[[           ]]	--[[]]     --[[]]	--[[           ]] 		  --[[]]		--[[           ]]
--[[           ]] 	--[[           ]]	--[[ ]]   --[[ ]]	--[[           ]] 	  	 --[[  ]] 		--[[           ]]
--[[]]				--[[]]	   --[[]]	--[[           ]]	--[[]]	   --[[]]	    --[[    ]]			 --[[ ]]
--[[]] 				--[[]]	   --[[]]	--[[           ]]	--[[         ]]	 	   --[[      ]] 		 --[[ ]]
--[[]]				--[[]]	   --[[]]	--[[]] 	   --[[]]	--[[]]	   --[[]]	  --[[        ]]		 --[[ ]]
--[[           ]] 	--[[           ]] 	--[[]] 	   --[[]]	--[[           ]] 	 --[[]]    --[[]]		 --[[ ]]
--[[           ]] 	--[[           ]] 	--[[]] 	   --[[]]	--[[           ]]	--[[]]      --[[]]		 --[[ ]]
	
--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Rogue Combat -----PQI_CodeMyLifeCombat_Name_value-----------------------------------------------------------------------]]

if _Spec == 2 and CML_Combat_config == nil then
	PQIprefix = "PQI_CodeMyLifeCombat_"
	_AoEModes = 2
	_RangeSpell = 1752
	CML_Combat_config = {
		name	= "Combat",
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
			{ 	name	= "Combat Check", 
				tooltip	= PlayerHex.."Check to activate Combat Check.",
				enable	= true,
			},
			{ 	name	= "Racials",
				tooltip	= PlayerHex.."toggle Automatic Racials.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
				newSection = true,
			},	
			{ 	name	= "Professions CDs",
				tooltip	= PlayerHex.."toggle Automatic Professions CDs.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},					
			{ 	name	= "Trinkets",
				tooltip	= PlayerHex.."toggle Automatic Trinkets.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Both Active","|cffFFE100Both On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose Trinkets to use.",	
				},
			},		
			{ 	name	= "DPS Potion on Heroism",
				tooltip	= PlayerHex.."toggle Automatic DPS Potions when Heroism starts.",
				enable	= true,
			},			
		},
		--[[ Keybinds ]]
		hotkeys = {
			{	name	= "Pause",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= PlayerHex.."Assign Pause Will Stop Rotation.",
			},
			{	name	= "Set Focus",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign Mouseover Focus Set focus to mouseover.",
			},	
		},
	}
	CODEMYLIFE_COMBAT = PQI:AddRotation(CML_Combat_config)
end

--[[           ]] 	--[[]]	   --[[]]	--[[           ]] 
--[[           ]] 	--[[]]	   --[[]]	--[[           ]] 
--[[]]				--[[]]	   --[[]]	--[[]]	   --[[]]
--[[           ]] 	--[[]]	   --[[]]	--[[         ]]	 
	   	   --[[]]	--[[]]	   --[[]]	--[[]]	   --[[]]
--[[           ]] 	--[[           ]] 	--[[           ]]
--[[           ]] 	--[[           ]] 	--[[           ]]
	
--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Rogue Subtlety -----PQI_CodeMyLifeSubtlety_Name_value-----------------------------------------------------------------------]]

if _Spec == 1 and CML_Sub_config == nil then
	PQIprefix = "PQI_CodeMyLifeSubtlety_"
	_AoEModes = 2
	_RangeSpell = 1752
	CML_Sub_config = {
		name	= "Subtlety",
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
			{ 	name	= "Combat Check", 
				tooltip	= PlayerHex.."Check to activate Combat Check.",
				enable	= true,
			},
			{ 	name	= "Racials",
				tooltip	= PlayerHex.."toggle Automatic Racials.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
				newSection = true,
			},	
			{ 	name	= "Professions CDs",
				tooltip	= PlayerHex.."toggle Automatic Professions CDs.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},					
			{ 	name	= "Trinkets",
				tooltip	= PlayerHex.."toggle Automatic Trinkets.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Both Active","|cffFFE100Both On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose Trinkets to use.",	
				},
			},		
			{ 	name	= "DPS Potion on Heroism",
				tooltip	= PlayerHex.."toggle Automatic DPS Potions when Heroism starts.",
				enable	= true,
			},			
		},
		--[[ Keybinds ]]
		hotkeys = {
			{	name	= "Pause",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= PlayerHex.."Assign Pause Will Stop Rotation.",
			},
			{	name	= "Set Focus",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign Mouseover Focus Set focus to mouseover.",
			},	
		},
	}
	CODEMYLIFE_SUBTLETY = PQI:AddRotation(CML_Sub_config)
end

--[[           ]]	--[[]]	   --[[]]	--[[]]	   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[  ]]   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[  ]]   --[[]]
--[[]]				--[[]]	   --[[]]	--[[    ]] --[[]]   --[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[    ]] --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[           ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[           ]]
--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[   		   ]]
--[[]]	   			--[[           ]]	--[[]]	 --[[  ]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	 --[[  ]]
--[[]]	   			--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]
if not RogueFunctions then
	RogueFunctions = true
	
	_Ambush     				= 8676
	_Backstab     				= 53 
	_Berserking  				= 26297
	_BladeFlurry				= 13877
	_Blind          			= 2094 
	_BloodFury					= 20572      
	_CheapShot      			= 1833  
	_CloakOfShadows 			= 31224 
	_CrimsonTempest 			= 121411
	_CripplingPoison  			= 3408 
	_DeadlyPoison   			= 2823 
	_DeadlyThrow    			= 26679
	_DisarmTrap    				= 1842
	_Dismantle    				= 51722
	_Dispatch					= 111240
	_Distract    				= 1725
	_Evasion    				= 5277 
	_Envenom					= 32645
	_Eviscerate     			= 2098 
	_ExposeArmor    			= 8647 
	_FanOfKnives   				= 51723 
	_Feint     					= 1966
	_Garrote    				= 703 
	_Gouge     					= 1776 
	_Hemorrhage    				= 16511
	_Kick     					= 1766
	_KidneyShot    				= 408 
	_KillingSpree				= 51690
	_LeechingPoison   			= 108211
	_MarkedForDeath				= 137619
	_MindnumbingPoison  		= 5761 
	_Mutilate					= 1329
	_ParalyticPoison  			= 108215 
	_PickLock    				= 1804
	_PickPocket    				= 921  
	_Premeditation   			= 14183 
	_Preparation   				= 14185 
	_Recuperate    				= 73651 
	_Redirect      				= 73981 
	_RevealingStrike			= 84617
	_Rupture    				= 1943
	_Sap      					= 6770 
	_ShadowBlades    			= 121471 
	_ShadowDance    			= 51713 
	_Shadowmeld					= 58984
	_ShadowWalk    				= 114842 
	_Shadowstep    				= 36554 
	_Shiv      					= 5938
	_ShroudOfConcealment 		= 114018 
	_SinisterStrike				= 1752
	_SliceAndDice   			= 5171 
	_SmokeBomb    				= 76577 
	_Sprint     				= 2983 
	_Stealth    				= 115191
	_Throw     					= 121733 
	_TricksOfTheTrade  			= 57934 
	_Vanish     				= 1856 
	_WoundPoison   				= 8679

	_Queues = {	
		[4]						= false,
		[_SmokeBomb] 			= false,
	}
			_AdrenalineRush				= 13750

end

end