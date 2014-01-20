function CML.RogueStartup()

--PQR_BotLoaded()
PQR_RotationChanged("Mystic")

_RangeSpell = 1752

if _Spec == 1 then PQIprefix = "PQI_Skorp05MysticAssassination_" Coolprefix = "PQI_Skorp05MysticCooldownsAssa_" PQR_Text("Skorp05 Mystic(Assassination)",nil,"fff569") end
if _Spec == 2 then PQIprefix = "PQI_Skorp05MysticCombat_" Coolprefix = "PQI_Skorp05MysticCooldownsComb_" PQR_Text("Skorp05 Mystic(Combat)",nil,"fff569") end
if _Spec == 3 then PQIprefix = "PQI_Skorp05MysticSubtlety_" Coolprefix = "PQI_Skorp05MysticCooldownsSubt_" PQR_Text("Skorp05 Mystic(Subtlety)",nil,"fff569") end

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
			{ 	name	= "Tricks of the Trade",
				enable	= true,
				tooltip = "|cffFFEA00Enables |cffFFFFFFTricks of the Trade|cffFFEA00.",	
				widget = { type = 'select',
					values = {"TANK","FOCUS"},
					value = 2,
					width = 60,
					tooltip = "|cffFFEA00Choose |cffFFFFFFTricks of the Trade TARGET|cffFFEA00.",	
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
			{ 	name	= "Restealth",
				tooltip	= PlayerHex.."toggle Automatic  Restealth Out of Combat.",
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
if _MyClass == 4 and _Spec == 1 and CML_Cooldowns_Config == nil then
	Coolprefix = "PQI_Skorp05MysticCooldownsAssa_"

	CML_Cooldowns_Config = {
		name	= "CooldownsAssa",
		author	= "Skorp05Mystic",
		abilities = {

			--[[ Cooldowns ]]
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
				tooltip	= "|cff7EBF37Toggle |cffFFFFFFAutomatic Counter Shot |cff7EBF37On target.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Random","|cff00CC0030","|cff00CC000"},
					value = 1,
					width = 70,
					tooltip = "|cffFFFFFFSet Treshold to use|cff7EBF37 Kick|cffFFFFFF on |cff7EBF37Target/Mouseover/Focus.",	
				},
				newSection = true,
			},
		},
	}
	CODEMYLIFE_COOLDOWNS = PQI:AddRotation(CML_Cooldowns_Config)
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
			{ 	name	= "Tricks of the Trade",
				enable	= true,
				tooltip = "|cffFFEA00Enables |cffFFFFFFTricks of the Trade|cffFFEA00.",	
				widget = { type = 'select',
					values = {"TANK","FOCUS"},
					value = 2,
					width = 60,
					tooltip = "|cffFFEA00Choose |cffFFFFFFTricks of the Trade TARGET|cffFFEA00.",	
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
			{ 	name	= "Restealth",
				tooltip	= PlayerHex.."toggle Automatic  Restealth Out of Combat.",
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


if _MyClass == 4 and _Spec == 2 and CML_Cooldowns_Config == nil then
	Coolprefix = "PQI_Skorp05MysticCooldownsComb_"

	CML_Cooldowns_Config = {
		name	= "CooldownsComb",
		author	= "Skorp05Mystic",
		abilities = {

			--[[ Cooldowns ]]
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
				tooltip	= "|cff7EBF37Toggle |cffFFFFFFAutomatic Counter Shot |cff7EBF37On target.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Random","|cff00CC0030","|cff00CC000"},
					value = 1,
					width = 70,
					tooltip = "|cffFFFFFFSet Treshold to use|cff7EBF37 Kick|cffFFFFFF on |cff7EBF37Target/Mouseover/Focus.",	
				},
				newSection = true,
			},
		},
	}
	CODEMYLIFE_COOLDOWNS = PQI:AddRotation(CML_Cooldowns_Config)
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
			{ 	name	= "Tricks of the Trade",
				enable	= true,
				tooltip = "|cffFFEA00Enables |cffFFFFFFTricks of the Trade|cffFFEA00.",	
				widget = { type = 'select',
					values = {"TANK","FOCUS"},
					value = 2,
					width = 60,
					tooltip = "|cffFFEA00Choose |cffFFFFFFTricks of the Trade TARGET|cffFFEA00.",	
				},
			},
			{ 	name	= "Restealth",
				tooltip	= PlayerHex.."toggle Automatic  Restealth Out of Combat.",
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
if _MyClass == 4 and _Spec == 3 and CML_Cooldowns_Config == nil then
	Coolprefix = "PQI_Skorp05MysticCooldownsSubt_"

	CML_Cooldowns_Config = {
		name	= "CooldownsSubt",
		author	= "Skorp05Mystic",
		abilities = {

			--[[ Cooldowns ]]
						{ 	name	= "Premeditation",
				tooltip	= PlayerHex.."toggle Automatic Premeditation.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 1,
					width = 70,
					tooltip = PlayerHex.."Choose Shadow Dance to use.",	
				},
			},
			{ 	name	= "Shadow Dance",
				tooltip	= PlayerHex.."toggle Automatic Shadow Dance.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 1,
					width = 70,
					tooltip = PlayerHex.."Choose Shadow Dance to use.",	
				},
			},		
			{ 	name	= "Preparation",
				tooltip	= PlayerHex.."toggle Automatic Preparation.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 1,
					width = 70,
					tooltip = PlayerHex.."Choose Preparation to use.",	
				},
			},	
			{ 	name	= "Shadow Blades",
				tooltip	= PlayerHex.."toggle Automatic Shadow Blades.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 1,
					width = 70,
					tooltip = PlayerHex.."Choose Shadow Blades to use.",	
				},
			},	
			{ 	name	= "Vanish",
				tooltip	= PlayerHex.."toggle Automatic Vanish.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 1,
					width = 70,
					tooltip = PlayerHex.."Choose Vanish to use.",	
				},
			},				
			{ 	name	= "Racials",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Racials.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 1,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},	
			{ 	name	= "Professions CDs",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Professions CDs.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 1,
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
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFSet way to use|cff7EBF37 Potions.",	
				},
			},				
			{ 	name	= "Interrupt",
				tooltip	= "|cff7EBF37Toggle |cffFFFFFFAutomatic Counter Shot |cff7EBF37On target.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Random","|cff00CC0030","|cff00CC000"},
					value = 1,
					width = 70,
					tooltip = "|cffFFFFFFSet Treshold to use|cff7EBF37 Kick|cffFFFFFF on |cff7EBF37Target/Mouseover/Focus.",	
				},
				newSection = true,
			},
		},
	}
	CODEMYLIFE_COOLDOWNS = PQI:AddRotation(CML_Cooldowns_Config)
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
function CML.BladeFlurry()
    local BladeFlurry = UnitBuffID("player",13877)
  if not BladeFlurry and macros["BladeFlurry"] == true then
 CastSpellByName(GetSpellInfo(13877), nil )
    end
 if BladeFlurry and macros["BladeFlurry"] == false then
 RunMacroText("/cancelaura Blade Flurry")
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

	function CML.AutoTarget()
if UnitExists("Target") == nil 
or UnitExists("Target") and UnitIsDead("Target")
and UnitAffectingCombat("Player")
then TargetNearestEnemy() 
end
end

function CML.TOTT()
if _G[PQIprefix.."TricksoftheTrade_value"] == 1 then
for i = 1, #nNova do
if nNova[i].role == "TANK" then
ProbablyEngine.dsl.parsedTarget = nNova[i].unit
return true
end
end
elseif _G[PQIprefix.."TricksoftheTrade_value"] == 2 then
ProbablyEngine.dsl.parsedTarget = "focus"
return true
end
end

function CML.Restealth()
if _G[PQIprefix.."Restealth_enable"]  then
--print("test")
return true
end
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