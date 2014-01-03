function CML.MageStartup()
	
if _Spec == 1 then PQIprefix = "PQI_CodeMyLifeArcane_" UnitDispel = {'Curse'} end
if _Spec == 2 then PQIprefix = "PQI_CodeMyLifeFire_" UnitDispel = {'Curse'} end
if _Spec == 3 then PQIprefix = "PQI_CodeMyLifeFrost_" UnitDispel = {'Curse'} end

_HealingRangeSpell = 102694 -- First Aid

	  --[[]]		--[[           ]]	--[[           ]] 		  --[[]]		--[[]]	   --[[]]	--[[           ]]
     --[[  ]]		--[[           ]]	--[[           ]]	     --[[  ]]		--[[  ]]   --[[]]	--[[           ]]
    --[[    ]] 		--[[]]	   --[[]]	--[[]]				    --[[    ]] 		--[[    ]] --[[]]	--[[]]			
   --[[      ]] 	--[[         ]]		--[[]] 				   --[[      ]] 	--[[           ]]	--[[           ]]
  --[[        ]]	--[[        ]]		--[[]] 				  --[[        ]]	--[[           ]]	--[[]]			
 --[[]]    --[[]]	--[[]]	  --[[]]	--[[           ]]	 --[[]]    --[[]]	--[[]]	 --[[  ]]	--[[           ]]
--[[]]      --[[]]	--[[]]	   --[[]]	--[[           ]]	--[[]]      --[[]]	--[[]]	   --[[]]	--[[           ]]


--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Mage Arcane -----PQI_CodeMyLifeArcane_Name_value-----------------------------------------------------------------------]]

if _Spec == 1 and CML_Arcane_config == nil then
	PQIprefix = "PQI_CodeMyLifeArcane_"
	_AoEModes = 2
	_RangeSpell = 116
	CML_Arcane_config = {
		name	= "Arcane",
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
	CODEMYLIFE_ARCANE = PQI:AddRotation(CML_Arcane_config)
end
	
--[[           ]]	--[[           ]]	--[[           ]]	--[[           ]]
--[[           ]] 		 --[[ ]]		--[[           ]]	--[[           ]]
--[[]] 					 --[[ ]]		--[[]]	   --[[]]	--[[]]
--[[           ]]		 --[[ ]]		--[[           ]]	--[[           ]]
--[[]] 	   	 			 --[[ ]]		--[[        ]]		--[[]]
--[[]]	   	 			 --[[ ]]		--[[]]	  --[[]]	--[[           ]]
--[[]]	   	 		--[[           ]]	--[[]]	   --[[]]	--[[           ]]
	
--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Mage Fire -----PQI_CodeMyLifeFire_Name_value-----------------------------------------------------------------------]]

if _Spec == 2 and CML_Fire_config == nil then
	PQIprefix = "PQI_CodeMyLifeFire_"
	_AoEModes = 2
	_RangeSpell = 116
	CML_Fire_config = {
		name	= "Fire",
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
			{ 	name	= "Active Inner Will",
				tooltip	= PlayerHex.."toggle Automatic Inner Will will use Inner Will when out of combat and moving.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 6,
					width 	= 70,
					max 	= 30,
					step	= 1,
					tooltip	= "|cffFFFFFFTime to wait before changing buff.",
				},
			},				
			{ 	name	= "Fortitude",
				enable	= false,
				tooltip	= "|cffFFFFFFCheck "..PlayerHex.."to use Fortitude.",
				newSection = true,
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
	CODEMYLIFE_FIRE = PQI:AddRotation(CML_Fire_config)
end
--[[           ]]	--[[           ]]	--[[           ]]	--[[           ]]	--[[           ]]
--[[           ]] 	--[[           ]]	--[[           ]]	--[[           ]]	--[[           ]]
--[[]] 				--[[]]	   --[[]]	--[[]]	   --[[]]	--[[]]					 --[[ ]]
--[[           ]]	--[[           ]]	--[[]]	   --[[]]	--[[           ]]		 --[[ ]]
--[[]] 	   	 		--[[        ]]		--[[]]	   --[[]]			   --[[]]		 --[[ ]]
--[[]]	   	 		--[[]]	  --[[]]	--[[           ]]	--[[           ]]		 --[[ ]]
--[[]]	   	 		--[[]]	   --[[]]	--[[           ]]	--[[           ]]		 --[[ ]]

--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Mage Frost -----PQI_CodeMyLifeFrost_Name_value-----------------------------------------------------------------------]]

if _Spec == 3 and CML_Frost_config == nil then
	PQIprefix = "PQI_CodeMyLifeFrost_"
	_AoEModes = 2
	_RangeSpell = 116
	CML_Frost_config = {
		name	= "Frost",
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
	CODEMYLIFE_FROST = PQI:AddRotation(CML_Frost_config)
end	

--[[           ]]	--[[]]	   --[[]]	--[[]]	   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[  ]]   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[  ]]   --[[]]
--[[]]				--[[]]	   --[[]]	--[[    ]] --[[]]   --[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[    ]] --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[           ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[           ]]
--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[   		   ]]
--[[]]	   			--[[           ]]	--[[]]	 --[[  ]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	 --[[  ]]
--[[]]	   			--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]
if not MageFunctions then
	MageFunctions = true
	macros = { 
	    ["ActiveCooldowns"]   		= false, 
	    ["AoE"]    					= 1,  
	    ["Pause"]					= false,
	} 
	_Queues = {	
		[8]						= false,
	}
end

end