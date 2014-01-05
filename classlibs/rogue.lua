function CML.RogueStartup()

--PQR_BotLoaded()
PQR_RotationChanged("Mystic")

_RangeSpell = 1766

if _Spec == 1 then PQIprefix = "PQI_Skorp05MysticAssassination_" PQR_Text("Skorp05 Mystic(Assassination)",nil,"fff569") end
if _Spec == 2 then PQIprefix = "PQI_Skorp05MysticCombat_" PQR_Text("Skorp05 Mystic(Combat)",nil,"fff569") end
if _Spec == 3 then PQIprefix = "PQI_Skorp05MysticSubtlety_" PQR_Text("Skorp05 Mystic(Subtlety)",nil,"fff569") end

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
	PQIprefix = "PQI_Skorp05MysticAssassination_"
	_AoEModes = 2
	_RangeSpell = 1752
	CML_Assass_config = {
		name	= "Assassination",
		author	= "Skorp05Mystic",
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
			{ 	name	= "Healthstone",
				enable	= true,
				tooltip	= PlayerHex.."Check to activate Healthstone.",
				widget	= { type = "numBox",
				value	= 45,
				step	= 5,
				tooltip	= PlayerHex.."Health value to cast Healthstone.",
				newSection = true,
				},
			},
			{ 	name	= "Feint",
				enable	= true,
				tooltip	= PlayerHex.."Check to activate Feint.",
				widget	= { type = "numBox",
				value	= 45,
				step	= 5,
				tooltip	= PlayerHex.."Health value to cast Feint.",
				},
			},
			{ 	name	= "Recuperate",
				enable	= true,
				tooltip	= PlayerHex.."Check to activate Recuperate.",
				widget	= { type = "numBox",
				value	= 60,
				step	= 5,
				tooltip	= PlayerHex.."Health value to cast Recuperate.",
				},
			},	
			{ 	name	= "Lethal Poison",
				enable	= true,
				tooltip = "|cffFFEA00Enables |cffFFFFFFLethal Poison|cffFFEA00.",	
				widget = { type = 'select',
					values = {"|cff0EAB00Deadly","|cffFF6600Wound"},
					value = 1,
					width = 60,
					tooltip = "|cffFFEA00Choose |cffFFFFFFLethal Poison|cffFFEA00(Deadly is Recommended).",	
				},
				newSection = true,
			},
			{ 	name	= "Non Lethal Poison",
				enable	= true,
				tooltip = "|cffFFEA00Enables |cffFFFFFFNon Lethal Poison|cffFFEA00.",	
				widget = { type = 'select',
					values = {"|cffA8009DCrippling","|cffFF9EF9Mind-Numbling","|cff1EFF00Leeching","|cff9DFF00Paralytic"},
					value = 2,
					width = 60,
					tooltip = "|cffFFEA00Choose |cffFFFFFFNon Lethal Poison|cffFFEA00.",	
				},
			},			
			{ 	name	= "DPS Potion on Heroism",
				tooltip	= PlayerHex.."toggle Automatic DPS Potions when Heroism starts.",
				enable	= true,
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
			{ 	name	= "Preparation",
				tooltip	= PlayerHex.."toggle Automatic Preparation.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose Preparation to use.",	
				},
			},	
			{ 	name	= "Shadow Blades",
				tooltip	= PlayerHex.."toggle Automatic Shadow Blades.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose Shadow Blades to use.",	
				},
			},	
			{ 	name	= "Vanish",
				tooltip	= PlayerHex.."toggle Automatic Vanish.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose Vanish to use.",	
				},
			},	
			{ 	name	= "Vendetta",
				tooltip	= PlayerHex.."toggle Automatic Vendetta.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose Vendetta to use.",	
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
	PQIprefix = "PQI_Skorp05MysticCombat_"
	_AoEModes = 2
	_RangeSpell = 1752
	CML_Combat_config = {
		name	= "Combat",
		author	= "Skorp05Mystic",
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
			{ 	name	= "Healthstone",
				enable	= true,
				tooltip	= PlayerHex.."Check to activate Healthstone.",
				widget	= { type = "numBox",
				value	= 45,
				step	= 5,
				tooltip	= PlayerHex.."Health value to cast Healthstone.",
				newSection = true,
				},
			},
			{ 	name	= "Feint",
				enable	= true,
				tooltip	= PlayerHex.."Check to activate Feint.",
				widget	= { type = "numBox",
				value	= 45,
				step	= 5,
				tooltip	= PlayerHex.."Health value to cast Feint.",
				},
			},
			{ 	name	= "Recuperate",
				enable	= true,
				tooltip	= PlayerHex.."Check to activate Recuperate.",
				widget	= { type = "numBox",
				value	= 60,
				step	= 5,
				tooltip	= PlayerHex.."Health value to cast Recuperate.",
				},
			},	
			{ 	name	= "Lethal Poison",
				enable	= true,
				tooltip = "|cffFFEA00Enables |cffFFFFFFLethal Poison|cffFFEA00.",	
				widget = { type = 'select',
					values = {"|cff0EAB00Deadly","|cffFF6600Wound"},
					value = 1,
					width = 60,
					tooltip = "|cffFFEA00Choose |cffFFFFFFLethal Poison|cffFFEA00(Deadly is Recommended).",	
				},
				newSection = true,
			},
			{ 	name	= "Non Lethal Poison",
				enable	= true,
				tooltip = "|cffFFEA00Enables |cffFFFFFFNon Lethal Poison|cffFFEA00.",	
				widget = { type = 'select',
					values = {"|cffA8009DCrippling","|cffFF9EF9Mind-Numbling","|cff1EFF00Leeching","|cff9DFF00Paralytic"},
					value = 2,
					width = 60,
					tooltip = "|cffFFEA00Choose |cffFFFFFFNon Lethal Poison|cffFFEA00.",	
				},
			},			
			{ 	name	= "DPS Potion on Heroism",
				tooltip	= PlayerHex.."toggle Automatic DPS Potions when Heroism starts.",
				enable	= true,
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
			{ 	name	= "Adrenaline Rush",
				tooltip	= PlayerHex.."toggle Automatic Adrenaline Rush.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose Adrenaline Rush to use.",	
				},
			},		
			{ 	name	= "Killing Spree",
				tooltip	= PlayerHex.."toggle Automatic Killing Spree.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose Killing Spree to use.",	
				},
			},			
			{ 	name	= "Preparation",
				tooltip	= PlayerHex.."toggle Automatic Preparation.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose Preparation to use.",	
				},
			},	
			{ 	name	= "Shadow Blades",
				tooltip	= PlayerHex.."toggle Automatic Shadow Blades.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose Shadow Blades to use.",	
				},
			},	
			{ 	name	= "Vanish",
				tooltip	= PlayerHex.."toggle Automatic Vanish.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose Vanish to use.",	
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

if _Spec == 3 and CML_Sub_config == nil then
	PQIprefix = "PQI_Skorp05MysticSubtlety_"
	_AoEModes = 2
	_RangeSpell = 1752
	CML_Sub_config = {
		name	= "Subtlety",
		author	= "Skorp05Mystic",
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
			{ 	name	= "Healthstone",
				enable	= true,
				tooltip	= PlayerHex.."Check to activate Healthstone.",
				widget	= { type = "numBox",
				value	= 45,
				step	= 5,
				tooltip	= PlayerHex.."Health value to cast Healthstone.",
				newSection = true,
				},
			},
			{ 	name	= "Feint",
				enable	= true,
				tooltip	= PlayerHex.."Check to activate Feint.",
				widget	= { type = "numBox",
				value	= 45,
				step	= 5,
				tooltip	= PlayerHex.."Health value to cast Feint.",
				},
			},
			{ 	name	= "Recuperate",
				enable	= true,
				tooltip	= PlayerHex.."Check to activate Recuperate.",
				widget	= { type = "numBox",
				value	= 60,
				step	= 5,
				tooltip	= PlayerHex.."Health value to cast Recuperate.",
				},
			},	
			{ 	name	= "Lethal Poison",
				enable	= true,
				tooltip = "|cffFFEA00Enables |cffFFFFFFLethal Poison|cffFFEA00.",	
				widget = { type = 'select',
					values = {"|cff0EAB00Deadly","|cffFF6600Wound"},
					value = 1,
					width = 60,
					tooltip = "|cffFFEA00Choose |cffFFFFFFLethal Poison|cffFFEA00(Deadly is Recommended).",	
				},
				newSection = true,
			},
			{ 	name	= "Non Lethal Poison",
				enable	= true,
				tooltip = "|cffFFEA00Enables |cffFFFFFFNon Lethal Poison|cffFFEA00.",	
				widget = { type = 'select',
					values = {"|cffA8009DCrippling","|cffFF9EF9Mind-Numbling","|cff1EFF00Leeching","|cff9DFF00Paralytic"},
					value = 2,
					width = 60,
					tooltip = "|cffFFEA00Choose |cffFFFFFFNon Lethal Poison|cffFFEA00.",	
				},
			},			
			{ 	name	= "DPS Potion on Heroism",
				tooltip	= PlayerHex.."toggle Automatic DPS Potions when Heroism starts.",
				enable	= true,
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
			{ 	name	= "Premeditation",
				tooltip	= PlayerHex.."toggle Automatic Premeditation.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose Premeditation to use.",	
				},
			},	
			{ 	name	= "Preparation",
				tooltip	= PlayerHex.."toggle Automatic Preparation.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose Preparation to use.",	
				},
			},	
			{ 	name	= "Shadow Blades",
				tooltip	= PlayerHex.."toggle Automatic Shadow Blades.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose Shadow Blades to use.",	
				},
			},	
			{ 	name	= "Shadow Dance",
				tooltip	= PlayerHex.."toggle Automatic Shadow Dance.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose Shadow Dance to use.",	
				},
			},
			{ 	name	= "Vanish",
				tooltip	= PlayerHex.."toggle Automatic Vanish.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose Vanish to use.",	
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

	macros = { 
	    ["AoE"]    				= 1,  
	    ["ActiveCooldowns"]   	= false,
	    ["BladeFlurry"]			= false,
	    ["Feint"]				= false,
		["Pause"]				= false,
	} 

	_Queues = {	
		[4]						= false,
		[76577] 				= false, -- Smoke Bomb
	}
		
	SLASH_FLURRY1 = "/flurry"
	function SlashCmdList.FLURRY(msg, editbox)
		if not macros["BladeFlurry"] then
			xrn:message("|cffFF78A0BladeFlurry - Active.")
			macros["BladeFlurry"] = true
		else
			xrn:message("|cffFF78A0BladeFlurry - Inactive.")
			macros["BladeFlurry"] = false
		end
	end	

	--------------------------------------------------
	--------------------------------------------------
	function Buff_Check( SpellID, TargetID )
		if UnitBuffID(TargetID, SpellID) then
			local StackCount = select(4, UnitBuffID(TargetID, SpellID) )
			local Duration	 = select(7, UnitBuffID(TargetID, SpellID) )
			return true, Duration - GetTime(), StackCount
		else
			return false, nil, nil
		end
	end
	function Debuff_Check( SpellID, TargetID, Filter )
		if UnitDebuffID( TargetID, SpellID, Filter ) then
			local Duration = select(7, UnitDebuffID( TargetID, SpellID, Filter ) )
			return true, Duration - GetTime()
		else
			return false, nil, nil
		end
	end
	--------------------------------------------------
	--------------------------------------------------

	function canSND(var1,var2)
		local SnD, SnDTimeLeft = Buff_Check( 5171, "player" )
		local CPs = GetComboPoints( "player", "target" )

		if SnD and CPs > 0 then
			if SnDTimeLeft < 2 then
				return true
			end
		elseif not SnD and CPs > 0 then
			return true 
		end
	end



	function canRPT(var1,var2)
		local Rup, RupTimeLeft 	= Debuff_Check( 1943, "target", "PLAYER" )
		local CPs 				= GetComboPoints( "player", "target" )

		if Rup then
			if CPs > 0 and RupTimeLeft < 2 then
				return true
			end
		else
			return true 
		end
	end


	function canENV(var1,var2)
		local CPs 					= GetComboPoints( "player", "target" )
		local Env, EnvTimeLeft 		= Buff_Check( 32645, "player" )
		local Rup, RupTimeLeft 		= Debuff_Check( 1943, "target", "PLAYER" )
		local Ven, VenTimeLeft 		= Debuff_Check( 79140, "target", "PLAYER" )
		local CurrentEnergy			= UnitPower("player")
		local ShadowBladesUP, SBTimeLeft = Buff_Check( 121471, "player" )
		local EnergyRegen 			= select(2, GetPowerRegen("player"))
		local Anti, _, AntiCharges 	= Buff_Check( 115189, "player" )
		local EnergyAfterEnvenom 	= CurrentEnergy + (EnergyRegen * 1.5)

		if CPs > 4 and Rup and not ShadowBladesUP and (not Anti or AntiCharges < 3) then
			if RupTimeLeft < 6 and RupTimeLeft > 4 and (CurrentEnergy + (EnergyRegen * (RupTimeLeft - 2)) + 25) < 110 then
				return true
			end
			if RupTimeLeft < 3 or (RupTimeLeft > 3 and CurrentEnergy < 60 and not Ven) then
				return true
			end
		end
		if CPs > 4 and (not Env or EnvTimeLeft < 1 or (EnergyAfterEnvenom > 100 and (Anti and AntiCharges > 2)) or (ShadowBladesUP and SBTimeLeft > 1 and EnergyAfterEnvenom < 100 and (Anti and AntiCharges > 2)))  then
			CastSpellByName( GetSpellInfo(32645), nil )
			return true
		end 
	end


	function canMUTI(var1,var2)
		local CPs 					= GetComboPoints( "player", "target" )
		local van 					= Buff_Check( 115193, "player" );
		local vstart, vduration 	= GetSpellCooldown(1856);
		local Anti, _, AntiCharges 	= Buff_Check( 115189, "player" )
		local Env, EnvTimeLeft 		= Buff_Check( 32645, "player" )
		local Rup, RupTimeLeft 		= Debuff_Check( 1943, "target", "PLAYER" )
		local Blindside 			= Buff_Check( 121153, "player" )

		if van and (vstart + vduration - GetTime()) > 119.9 then 
			return 
		end
		if CPs < 5 or (Env and EnvTimeLeft > 2 and (not Anti or AntiCharges < 3)) then 
			return true 
		end
	end

	function canMUTIENERGY(var1,var2)
		local CurHealth		 		= 100 * UnitHealth("target") / UnitHealthMax("target")
		local Rup, RupTimeLeft 		= Debuff_Check( 1943, "target", "PLAYER" )
		local CurrentEnergy			= UnitPower("player")
		local CPs 					= GetComboPoints( "player", "target" )

		if CurHealth > 35 then
			if CurrentEnergy > 71 then
				if Rup then
					if RupTimeLeft < 2 then
						return true
					end
				else
					return true
				end
			end
		end
	end

	function canDISP(var1,var2)
		local CPs 					= GetComboPoints( "player", "target" )
		local CurHealth		 		= 100 * UnitHealth("target") / UnitHealthMax("target")
		local CurrentEnergy			= UnitPower("player")
		local EnergyRegen 			= select(2, GetPowerRegen("player"))
		local Blindside 			= Buff_Check( 121153, "player" )
		local ShadowBladesUP 		= Buff_Check( 121471, "player" )
		local van 					= Buff_Check( 115193, "player" );
		local Anti, _, AntiCharges 	= Buff_Check( 115189, "player" )
		local Env, EnvTimeLeft 		= Buff_Check( 32645, "player" )

		if Blindside and not van and (CPs < 5 or (Env and EnvTimeLeft > 2 and (not Anti or (ShadowBladesUP and AntiCharges < 3 
		  and (CurrentEnergy + (EnergyRegen * 1.5)) < 100) or (not ShadowBladesUP and AntiCharges < 4)))) then
			CastSpellByName( GetSpellInfo(111240), nil )
			return true
		elseif CurHealth < 35 and not van and (CPs < 5 or (Env and EnvTimeLeft > 2 and (not Anti or (ShadowBladesUP and AntiCharges < 3) 
			or (not ShadowBladesUP and AntiCharges < 4 )))) then
			CastSpellByName( GetSpellInfo(111240), nil )
			return true
		end
	end

	function canDISPENERGY(var1,var2)
		local CurHealth		 		= 100 * UnitHealth("target") / UnitHealthMax("target")
		local Blindside 			= Buff_Check( 121153, "player" )
		local Rup, RupTimeLeft 		= Debuff_Check( 1943, "target", "PLAYER" )
		local CurrentEnergy			= UnitPower("player")
		local CPs 					= GetComboPoints( "player", "target" )
		local Env, EnvTimeLeft 		= Buff_Check( 32645, "player" )
		local van 					= Buff_Check( 115193, "player" );
		local Anti, _, AntiCharges 	= Buff_Check( 115189, "player" )
		local CurrentEnergy			= UnitPower("player")
		local ShadowBladesUP 		= Buff_Check( 121471, "player" )
		local EnergyRegen 			= select(2, GetPowerRegen("player"))

		if (CurHealth < 35 or Blindside) and not van then
			if CurrentEnergy > 90 then
				if Rup then
					if RupTimeLeft < 2 then
						CastSpellByName( GetSpellInfo(111240), nil )
						return true
					end
				else
					CastSpellByName( GetSpellInfo(111240), nil )
					return true
				end
			end
		
			-- 5cps with dispatch proc
			if Blindside and CPs > 4 and Rup and RupTimeLeft > 3 and Env and (not Anti or ((ShadowBladesUP and AntiCharges < 3) or (not ShadowBladesUP and AntiCharges < 4))) and (CurrentEnergy + (EnergyRegen * 1.5)) < 100 then
				CastSpellByName( GetSpellInfo(111240), nil )
				return true
			end
		end
	end

	function canRED(var1,var2)
		if not Redirect then 
	   		Redirect = CreateFrame("Frame")
		end
		local Reframe = Redirect
		Reframe:RegisterEvent("UNIT_COMBO_POINTS")
		Reframe:SetScript("OnEvent", function(self, event, ...)

			if event == "UNIT_COMBO_POINTS" then 
	       		Combo = GetComboPoints("player")    
			end
		end)
		if Combo == nil then
			Combo = 0
		end
		if UnitAffectingCombat("player") == nil then
			Combo = 0
		end
		local ComboPoints = GetComboPoints("player", "target")
		if UnitExists("Target") and ComboPoints ~= Combo and Combo~=0 then
	    	return true
		end
	end

	function canHS(var1,var2)
		local HealthstoneCD = select(2,GetItemCooldown(5512))
		local Playerhealth = 100 * UnitHealth("player") / UnitHealthMax("player")
		if  Playerhealth <= 30
		  and HealthstoneCD < 1 then
			UseItemByName(5512, "player")
		end	
	end

	function validTarget(unit)
	  	local inRange = IsSpellInRange(GetSpellInfo(1934), unit) -- Rupture
	  	if not UnitIsVisible(unit) or not UnitExists(unit) or UnitCanAttack("player", unit) ~= 1 
	  	  or UnitIsDeadOrGhost(unit) or not inRange or not immuneEvents(unit) then 
	  	  	return false 
	  	end
	  	return true
	end

	function immuneEvents(unit)
	  	if UnitAura(unit,GetSpellInfo(116994))
	  	  or UnitAura(unit,GetSpellInfo(122540))
		  or UnitAura(unit,GetSpellInfo(123250))
		  or UnitAura(unit,GetSpellInfo(106062))
		  or UnitAura(unit,GetSpellInfo(110945))
		  or UnitAura(unit,GetSpellInfo(143593)) -- General Nazgrim: Defensive Stance
	      or UnitAura(unit,GetSpellInfo(143574)) -- Heroic Immerseus: Swelling Corruption
			then return false 
		end
	  	return true
	end

	function canPot(var1,var2)
		if not UnitBuff("player", 2825) or not UnitBuff("player", 32182) or not UnitBuff("player", 80353) 
		  or not UnitBuff("player", 90355) then
			return false
		end
		if GetItemCount(76089) < 1 then return false end
		if GetItemCooldown(76089) ~= 0 then return false end
		return true 
	end	

	Mystic = {} 

	function Mystic.Redirect()
		if not Redirect then 
		   Redirect = CreateFrame("Frame")
		end
		local Reframe = Redirect
		Reframe:RegisterEvent("UNIT_COMBO_POINTS")
		Reframe:SetScript("OnEvent", function(self, event, ...)

			if event == "UNIT_COMBO_POINTS" then 
			       Combo = GetComboPoints("player")    
			end
		end)
		if Combo == nil then
			Combo = 0
		end
		if UnitAffectingCombat("player") == nil then
			Combo = 0
		end
		local ComboPoints = GetComboPoints("player", "target")
		if UnitExists("Target") and ComboPoints ~= Combo and Combo~=0 then
		    return true
		end
	end
		
	function Mystic.AutoTarget()
		if UnitExists("Target") == nil 
		  or (UnitExists("Target") and UnitIsDead("Target") and UnitAffectingCombat("Player")) then 
		  	TargetNearestEnemy() 
		end
	end

	ProbablyEngine.library.register("Mystic", Mystic)

	ProbablyEngine.library.register('coreHealing', {
	  	needsHealing = function(percent, count)
	    	return ProbablyEngine.raid.needsHealing(tonumber(percent)) >= count
	  	end,
	  	needsDispelled = function(spell)
	    	for unit,_ in pairs(ProbablyEngine.raid.roster) do
	      		if UnitDebuff(unit, spell) then
	        		ProbablyEngine.dsl.parsedTarget = unit
	        		return true
	      		end
	    	end
	  	end,
	  	hasBuff = function(spell)
	    	for unit,_ in pairs(ProbablyEngine.raid.roster) do
	      		if UnitBuff(unit, spell) then
	        		return true
	      		end
	    	end
	  	end,
	})
end

end