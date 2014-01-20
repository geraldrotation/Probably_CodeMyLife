function CML.MageStartup()
	
if _Spec == 1 then PQIprefix = "PQI_CodeMyLifeArcane_" UnitDispel = {'Curse'} Coolprefix = "PQI_CodeMyLifeCooldownsArcane_" end
if _Spec == 2 then PQIprefix = "PQI_CodeMyLifeFire_" UnitDispel = {'Curse'} Coolprefix = "PQI_CodeMyLifeCooldownsFire_" end
if _Spec == 3 then PQIprefix = "PQI_CodeMyLifeFrost_" UnitDispel = {'Curse'} Coolprefix = "PQI_CodeMyLifeCooldownsFrost_" end

_HealingRangeSpell = 102694 -- First Aid

	  --[[]]		--[[           ]]	--[[           ]] 		  --[[]]		--[[]]	   --[[]]	--[[           ]]
     --[[  ]]		--[[           ]]	--[[           ]]	     --[[  ]]		--[[  ]]   --[[]]	--[[           ]]
    --[[    ]] 		--[[]]	   --[[]]	--[[]]				    --[[    ]] 		--[[    ]] --[[]]	--[[]]			
   --[[      ]] 	--[[         ]]		--[[]] 				   --[[      ]] 	--[[           ]]	--[[           ]]
  --[[        ]]	--[[        ]]		--[[]] 				  --[[        ]]	--[[           ]]	--[[]]			
 --[[]]    --[[]]	--[[]]	  --[[]]	--[[           ]]	 --[[]]    --[[]]	--[[]]	 --[[  ]]	--[[           ]]
--[[]]      --[[]]	--[[]]	   --[[]]	--[[           ]]	--[[]]      --[[]]	--[[]]	   --[[]]	--[[           ]]

--[[           ]]	--[[         ]]		--[[           ]] 	
--[[           ]]	--[[          ]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]	--[[]]				
--[[]]				--[[]]	   --[[]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]		   	   --[[]]	
--[[   		   ]]	--[[          ]]	--[[           ]] 	
--[[   		   ]]	--[[         ]] 	--[[           ]] 	

if _Spec == 1 and CML_Cooldowns_Config == nil then
	Coolprefix = "PQI_CodeMyLifeCooldownsArcane_"

	CML_Cooldowns_Config = {
		name	= "CooldownsArcane",
		author	= "CodeMyLife",
		abilities = {
			--[[ Cooldowns ]]
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
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Trinkets|cff7EBF37.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Both Active","|cffFFE100Both On CD","|cffD90000Disable"},
					value = 1,
					width = 70,
					tooltip = "|cff7EBF37Choose |cffFFFFFFTrinkets to use|cff7EBF37.",	
				},
			},		
			{ 	name	= "DPS Potion",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Agility Potions|cff7EBF37 when |cffFFFFFFHeroism |cff7EBF37starts.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."On Boss","|cffFFFFFFOn Heroism","|cffFFDD00Never"},
					value = 1,
					width = 70,
					tooltip = "|cffFFFFFFSet way to use Potions.",	
				},
			},				
			{ 	name	= "Interrupt",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Interrupt On "..PlayerHex.."Target/Mouseover/Focus.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Random","|cff00CC0030","|cff00CC000"},
					value = 1,
					width = 70,
					tooltip = "|cffFFFFFFSet Treshold to use Interrupt on "..PlayerHex.."Target/Mouseover/Focus.",	
				},
				newSection = true,
			},
		},
	}
	CODEMYLIFE_COOLDOWNS = PQI:AddRotation(CML_Cooldowns_Config)
end

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
				widget = { type = 'select',
					values 	= {PlayerHex.."Full Bar","|cffFFFFFFMini Bar","|cffD90000Disable"},
					value	= 1,
					width	= 70,
					tooltip	= PlayerHex.."Select what bar style you want.",
				},
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
	
--[[           ]]	--[[         ]]		--[[           ]] 	
--[[           ]]	--[[          ]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]	--[[]]				
--[[]]				--[[]]	   --[[]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]		   	   --[[]]	
--[[   		   ]]	--[[          ]]	--[[           ]] 	
--[[   		   ]]	--[[         ]] 	--[[           ]] 	

if _Spec == 2 and CML_Cooldowns_Config == nil then
	Coolprefix = "PQI_CodeMyLifeCooldownsFire_"

	CML_Cooldowns_Config = {
		name	= "CooldownsFire",
		author	= "CodeMyLife",
		abilities = {
			--[[ Cooldowns ]]
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
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Trinkets|cff7EBF37.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Both Active","|cffFFE100Both On CD","|cffD90000Disable"},
					value = 1,
					width = 70,
					tooltip = "|cff7EBF37Choose |cffFFFFFFTrinkets to use|cff7EBF37.",	
				},
			},		
			{ 	name	= "DPS Potion",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Agility Potions|cff7EBF37 when |cffFFFFFFHeroism |cff7EBF37starts.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."On Boss","|cffFFFFFFOn Heroism","|cffFFDD00Never"},
					value = 1,
					width = 70,
					tooltip = "|cffFFFFFFSet way to use Potions.",	
				},
			},				
			{ 	name	= "Interrupt",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Interrupt On "..PlayerHex.."Target/Mouseover/Focus.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Random","|cff00CC0030","|cff00CC000"},
					value = 1,
					width = 70,
					tooltip = "|cffFFFFFFSet Treshold to use Interrupt on "..PlayerHex.."Target/Mouseover/Focus.",	
				},
				newSection = true,
			},
		},
	}
	CODEMYLIFE_COOLDOWNS = PQI:AddRotation(CML_Cooldowns_Config)
end
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
				widget = { type = 'select',
					values 	= {PlayerHex.."Full Bar","|cffFFFFFFMini Bar","|cffD90000Disable"},
					value	= 1,
					width	= 70,
					tooltip	= PlayerHex.."Select what bar style you want.",
				},
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

--[[           ]]	--[[         ]]		--[[           ]] 	
--[[           ]]	--[[          ]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]	--[[]]				
--[[]]				--[[]]	   --[[]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]		   	   --[[]]	
--[[   		   ]]	--[[          ]]	--[[           ]] 	
--[[   		   ]]	--[[         ]] 	--[[           ]] 	

if _Spec == 3 and CML_Cooldowns_Config == nil then
	Coolprefix = "PQI_CodeMyLifeCooldownsFrost_"

	CML_Cooldowns_Config = {
		name	= "CooldownsFrost",
		author	= "CodeMyLife",
		abilities = {
			--[[ Cooldowns ]]
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
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Trinkets|cff7EBF37.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Both Active","|cffFFE100Both On CD","|cffD90000Disable"},
					value = 1,
					width = 70,
					tooltip = "|cff7EBF37Choose |cffFFFFFFTrinkets to use|cff7EBF37.",	
				},
			},		
			{ 	name	= "DPS Potion",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Agility Potions|cff7EBF37 when |cffFFFFFFHeroism |cff7EBF37starts.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."On Boss","|cffFFFFFFOn Heroism","|cffFFDD00Never"},
					value = 1,
					width = 70,
					tooltip = "|cffFFFFFFSet way to use Potions.",	
				},
			},				
			{ 	name	= "Interrupt",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Interrupt On "..PlayerHex.."Target/Mouseover/Focus.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Random","|cff00CC0030","|cff00CC000"},
					value = 1,
					width = 70,
					tooltip = "|cffFFFFFFSet Treshold to use Interrupt on "..PlayerHex.."Target/Mouseover/Focus.",	
				},
				newSection = true,
			},
		},
	}
	CODEMYLIFE_COOLDOWNS = PQI:AddRotation(CML_Cooldowns_Config)
end
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
				widget = { type = 'select',
					values 	= {PlayerHex.."Full Bar","|cffFFFFFFMini Bar","|cffD90000Disable"},
					value	= 1,
					width	= 70,
					tooltip	= PlayerHex.."Select what bar style you want.",
				},
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
			{ 	name	= "Arcane Brilliance",
				tooltip	= PlayerHex.."Buff Arcane Brilliance on me.",
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