function CML.PaladinStartup()

if _Spec == 1 then PQIprefix = "PQI_CodeMyLifeHoly_" UnitDispel = {'Disease','Poison','Magic'} end
if _Spec == 2 then PQIprefix = "PQI_CodeMyLifeProtection_" UnitDispel = {'Disease','Poison'} end
if _Spec == 3 then PQIprefix = "PQI_CodeMyLifeRetribution_" UnitDispel = {'Disease','Poison'} end

_RangeSpell = 20271
_HealingRangeSpell = 19750 -- Flash Heal

--[[]]	   --[[]]	--[[           ]]	--[[]]				--[[]]	  --[[]]
--[[]]	   --[[]]	--[[           ]]	--[[]]				--[[]]	  --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[]]				   --[[    ]]	   
--[[           ]]	--[[]]	   --[[]]	--[[]]				   --[[    ]]
--[[           ]]	--[[]]	   --[[]]	--[[]]					 --[[]]
--[[]]	   --[[]]	--[[           ]]	--[[           ]]		 --[[]]
--[[]]	   --[[]]	--[[           ]]	--[[           ]]		 --[[]]

--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Holy Paladin  ----- PQI_CodeMyLifeHoly_Name_value -------------------------------------------------------------------]]
if _Spec == 1 and CML_Holy_config == nil then
	PQIprefix = "PQI_CodeMyLifeHoly_"
	_AoEModes = 0
	_RangeSpell = _HolyShock
	CML_Holy_config = {
		name	= "Holy",
		author	= "CodeMyLife",
		abilities = {
				    ----  Options  ----	
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
			{ 	name	= "Active Blessings",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Blessings|cffFFFFFF.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff24E0FBKings","|cffFF9900Might"},
					value = 1,
					width = 70,
					tooltip = PlayerHex.."Choose Blessing. Choose Auto for class scanning feature that select appropriate buff to use.",	
				},
			},	
			{ 	name	= "Shock Mode",
				tooltip	= PlayerHex.."toggle Automatic Holy Shock out of combat.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."5 HP","|cff24E0FBBlanket","|cffFF9900Disable"},
					value = 1,
					width = 70,
					tooltip = PlayerHex.."Choose Holy Shock Behaviour. 5 HP will keep ou at 5 HP. Blanket will keep putting EF on as much people as it can. Disable will do nothing.",	
				},
			},
			{ 	name	= "Cleanse",
				tooltip	= PlayerHex.."toggle Automatic Cleanse|cffFFFFFF.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff2DD600Auto","|cffFFEE00Mouseover","|cffD90000Disable"},
					value = 1,
					width = 80,
					tooltip = PlayerHex.."Choose Cleanse Mode.",	
				},
			},					
			{ 	name	= "Beacon Of Light",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Beacon of Light.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Auto","|cffFF8000Tanks","|cff6BD600Focus"},
					value = 1,
					width = 70,
					tooltip = PlayerHex.."Choose Beacon Mode.|cffFFFFFFAuto will take the most appropriate target for beacon.|cffFF8000Tanks will put it on the active tanks or your focus if you set one.|cff6BD600Focus will put it on focus.",	
				},
			},		
			----  Healing  ----
			{ 	name	= "Holy Radiance",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate Holy Radiance.",
				widget	= { type = "numBox",
					value	= 80,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Holy Radiance.",
				},
				newSection = true,
			},
			
			{ 	name	= "Light Of Dawn",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate Light Of Dawn.",
				widget	= { type = "numBox",
					value	= 80,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Light Of Dawn.",
				},
			},	

			{ 	name	= "AoE Heal Targets",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate AoE Healing.",
				widget	= { type = "numBox",
					min 	= 1,
					max 	= 25,
					value	= 3,
					step	= 1,
					width 	= 70,
					tooltip	= PlayerHex.."Number of members under treshold to cast AoE Healing.",
				},
			},	
						
			{ 	name	= "Holy Shock",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate Holy Shock.",
				widget	= { type = "numBox",
					value	= 90,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Holy Shock.",
				},
			},
			
			{ 	name	= "Word Of Glory",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate Word of Glory.",
				widget	= { type = "numBox",
					value	= 70,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Word of Glory.",
				},
			},
			
			{ 	name	= "Eternal Flame",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate Eternal Flame.",
				widget	= { type = "numBox",
					value	= 70,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Eternal Flame.",
				},
			},
			
			{ 	name	= "Holy Light",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate Holy Light.",
				widget	= { type = "numBox",
					value	= 65,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Holy Light.",
				},
			},
			
			{ 	name	= "Divine Light",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate Divine Light.",
				widget	= { type = "numBox",
					value	= 45,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Divine Light.",
				},
			},
			
			{ 	name	= "Flash Of Light",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate Flash of Light.",
				widget	= { type = "numBox",
					value	= 20,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Flash of Light.",
				},
			},
			
			{ 	name	= "Holy Prism",
				enable	= true,
				widget	= { type = "numBox",
					value	= 70,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value "..PlayerHex.."to cast Holy Prism on any Raid or Group member(will prefer casting on its target).",
				},
			},
			
			{ 	name	= "Stay Of Execution",
				enable	= true,
				tooltip = PlayerHex.."Activate |cffFFFFFFStayOfExecution",
				widget	= { type = "numBox",
					min		= 0,
					max 	= 100,
					value	= 25,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Stay Of Execution|cffFFFFFF. Set |cffFFFFFFHealth |cffFFFFFFtreshold.",
				},
			},
			
			{ 	name	= "Lay on Hands",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate |cffFFFFFFLay on Hands.",
				widget	= { type = "numBox",
					value	= 12,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast |cffFFFFFFLay on Hands.",
				},
			},

			{ 	name	= "Lay on Hands Targets",
				enable	= true,
				tooltip	= PlayerHex.."Select Lay on Hands Targets.",
				widget = { type = 'select',
					values = {PlayerHex.."Raid","|cff24E0FBTanks","|cffFF9900Tanks/Heals"},
					value = 1,
					width = 80,
					tooltip = PlayerHex.."Choose wich players should be Lay on Hand under treshold.",	
				},
			},

			{ 	name	= "Healthstone",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					step	= 1,
					width 	= 70,
					tooltip	= PlayerHex.."Health value "..PlayerHex.."to use |cffFFFFFFHealthstone|cffFFFFFF.",
				},
			},			
			{ 	name	= "Selfless Healer",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate |cffFFFFFFSelfless Healer.",
				widget	= { type = "numBox",
					value	= 60,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast |cffFFFFFFSelfless Healer.",
				},
			},				
			----  Utility  ----
				
			{ 	name	= "Hand of Sacrifice",
				enable	= true,
				widget	= { type = "numBox",
					value	= 35,
					step	= 1,
					width 	= 70,
					tooltip	= PlayerHex.."Health value "..PlayerHex.."to cast |cffFFFFFFHand of Sacrifice |cffFFFFFFon Tank or No Role assigned Raid or Group member.",
				},
				newSection = true,
			},	
			{ 	name	= "Hand of Salvation",
				enable	= true,
				widget	= { type = "numBox",
					value	= 80,
					step	= 1,
					width 	= 70,
					tooltip	= PlayerHex.."Health value "..PlayerHex.."to cast |cffFFFFFFHand of Salvation |cffFFFFFFon DPS or Healer Raid or Group member.",
				},
			},				
			{ 	name	= "Hand of Protection",
				enable	= true,
				widget	= { type = "numBox",
					value	= 45,
					step	= 1,
					width 	= 70,
					tooltip	= PlayerHex.."Health value "..PlayerHex.."to cast |cffFFFFFFHand of Protection |cffFFFFFFon DPS or Healer Raid or Group member.",
				},
			},				
			{ 	name	= "Hand of Freedom",
				tooltip	= PlayerHex.."Active Hand of Freedom |cffFFFFFFon Raid or Group|cffFFFFFF.",
				enable	= true,
			},					
			{ 	name	= "Avenging Wrath",
				enable	= true,
				widget	= { type = "numBox",
					value	= 30,
					step	= 1,
					width 	= 70,
					tooltip	= PlayerHex.."Health value "..PlayerHex.."to use |cffFFFFFFAvenging Wrath|cffFFFFFF.",
				},
			},
			{ 	name	= "Divine Favor",
				enable	= true,
				widget	= { type = "numBox",
					value	= 20,
					step	= 1,
					width 	= 70,
					tooltip	= PlayerHex.."Health value "..PlayerHex.."to use |cffFFFFFFDivine Favor|cffFFFFFF.",
				},
			},
			{ 	name	= "Guardian Of Ancient Kings",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					step	= 1,
					width 	= 70,
					tooltip	= PlayerHex.."Health value "..PlayerHex.."to use |cffFFFFFFGuardian of Ancient Kings|cffFFFFFF.",
				},
			},
			{ 	name	= "Members for Cooldowns",
				enable	= true,
				widget	= { type = "numBox",
					min 	= 1,
					max 	= 25,
					value	= 3,
					step	= 1,
					width 	= 70,
					tooltip	= PlayerHex.."How many players need to be under tresholds to use Cooldowns.",
				},
			},

			{ 	name	= "Trinket 1",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate Trinket 1.",
				widget = { type = 'select',
					values = {"|cff0082D975% Mana","|cffD9000040% HP","|cffFF9900On CD"},
					value = 1,
					width = 80,
					tooltip = PlayerHex.."Choose wich mode you want to use trinket 1. 1 for mana returning use. 2 for spell power use. 3 to use on CD regardless",	
				},
			},
			{ 	name	= "Trinket 2",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate Trinket 1.",
				widget = { type = 'select',
					values = {"|cff0082D975% Mana","|cffD9000040% HP","|cffFF9900On CD"},
					value = 1,
					width = 80,
					tooltip = PlayerHex.."Choose wich mode you want to use trinket 2. 1 for mana returning use. 2 for spell power use. 3 to use on CD regardless",	
				},
			},

			{ 	name	= "Sacred Shield",
				enable	= true,
				widget	= { type = "numBox",
					value	= 100,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."What HP |cffFFFFFFwe wait before using |cffFFFFFFSacred Shield "..PlayerHex.."to buff ourself. Set to 100 to keep it up as much as possible, it will still only cast to keep the buff up.",
				},
			},	

			{ 	name	= "Divine Protection",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."What HP to use Divine Protection on us.",
				},
			},						

			{ 	name	= "Divine Plea",
				enable	= true,
				widget	= { type = "numBox",
					value	= 100,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."What Mana |cffFFFFFFwe wait before using |cffFFFFFFDivine Plea |cffFFFFFF.",
				},
			},	
			{ 	name	= "Denounce",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate |cffFFFFFFDenounce.",
				widget	= { type = "numBox",
					value	= 40,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."What Minimum Mana we stop using |cffFFFFFFDenounce.",
				},
			},	
			{ 	name	= "Rebuke",
				tooltip	= PlayerHex.."Enables |cffFFFFFFRebuke.",
				enable	= true,
				widget = { type = 'select',
					values 	= {PlayerHex.."Random","|cff00CC0030","|cff00CC000"},
					value	= 1,
					width	= 70,
					tooltip	= PlayerHex.."What % of cast |cffFFFFFFyou want to wait before using |cffFFFFFFRebuke|cffFFFFFF. The channels will always be instant Rebuke unless Avenger's Shield is ready.",
				},
				newSection = true,
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
				newSection = true,
			},		
		},
		--[[ Keybinds ]]
		hotkeys = {
			{	name	= "Lights Hammer",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFLight's Hammer |cffFFFFFFKeybind.",
			},
			{	name	= "Pause",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFPause |cffFFFFFFKeybind.",
			},
			{	name	= "Focus",
				enable	= true,
				hotkeys	= {'ls'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFMouseover Focus |cffFFFFFFKeybind",
			},
		},
	}
	CODEMYLIFE_HOLY = PQI:AddRotation(CML_Holy_config)
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
--------- Protection Paladin -------- PQI_CodeMyLifeProtection_Name_value ---------------------------------------------------]]
if _Spec == 2 and CML_Prot_config == nil then
	PQIprefix = "PQI_CodeMyLifeProtection_"
	_AoEModes = 2
	_RangeSpell = 35395
	CML_Prot_config = {
		name	= "Protection",
		author	= "CodeMyLife",
		abilities = {
		
		    ----  Options  ----	
			{ 	name	= "Combat Check", 
				tooltip	= PlayerHex.."Combat Check.",
				enable	= true,
			},		    	    
			{ 	name	= "Player Status", 
				tooltip	= PlayerHex.."Enables Player Status.",
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
			{ 	name	= "Righteous Fury",
				tooltip	= PlayerHex.."Toggle Automatic Righteous Fury when protection.",
				enable	= true,
			},	
			{ 	name	= "Active Blessings",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Blessings.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."|cff24E0FBKings","|cffFF9900Might"},
					value = 1,
					width = 70,
					tooltip = PlayerHex.."Choose Blessing.",	
				},
				newSection = true,
			},	
			{ 	name	= "Active Seals",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Seal|cffFF0066, should let that always checked and use |cffFFFFFF/activeseals |cffFF0066macro to toggle.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Auto","|cffFFFF33Truth","|cffFF9900Insight","|cff24E0FBRighteousness"},
					value = 1,
					width = 70,
					tooltip = PlayerHex.."Choose Seal. Auto should take the most appropriate Seal for your class/aoe mode.",	
				},
			},	
			{ 	name	= "Execution Sentence",
				enable	= true,
				tooltip = PlayerHex.."Activate Execution Sentence",
				widget	= { type = "numBox",
					min		= 0,
					max 	= 400000,
					width 	= 70,
					value	= 75000,
					step	= 10000,
					tooltip	= PlayerHex.."Set Vengeance treshold for protection.",
				},
				newSection = true,
			},
			
			{  name = "Sacred Vengeance",
		     	enable = true,
		     	tooltip = PlayerHex.."Activate Sacred Shield",
		     	widget = { type = "numBox",
		      		min  = 0,
		      		max  = 400000,
					width 	= 70,
		      		value = 75000,
		      		step = 10000,
		      		tooltip = PlayerHex.."How much vengeance gain is needed to overwrite Sacred Shield or Eternal Flame buffs on you.",
		     	},
		    },
			----  Healing  ----
			{ 	name	= "Selfless Healer",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate Selfless Healer.",
				widget	= { type = "numBox",
					value	= 60,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Selfless Healer.",
				},
			},	
			{ 	name	= "Sacred Shield",
				enable	= false,
				tooltip	= PlayerHex.."Check to activate Sacred Shield.",
				widget	= { type = "numBox",
					value	= 100,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."What HP we wait before using Sacred Shield to buff ourself. Set to 100 to keep it up as much as possible, it will still only cast to keep the buff up.",
				},
			},		
			{ 	name	= "SelfFlame",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate Eternal Flame with 4 Holy Power on self.",
				widget	= { type = "numBox",
					value	= 70,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Eternal Flame with 4 Holy Power on self. If 4pcs T16 found, will use T16 code. ",
				},
			},
				
			{ 	name	= "Word Of Glory",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate Word of Glory or Eternal Flame with 3 Holy Power on Raid or Group members while /activehealing.",
				widget	= { type = "numBox",
					value	= 60,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Word of Glory with 3 Holy Power on Raid or Group member while /activehealing.",
				},
			},
			{ 	name	= "Lay on Hands",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate Lay on Hands on Raid or Group members.",
				widget	= { type = "numBox",
					value	= 17,
					step	= 1,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Lay on Hands on Raid or Group member.",
				},
			},
			{ 	name	= "Lay on Hands Targets",
				enable	= true,
				tooltip	= PlayerHex.."Select Lay on Hands Targets.",
				widget = { type = 'select',
					values = {PlayerHex.."Raid","|cff24E0FBTanks","|cffFF9900Tanks/Heals"},
					value = 1,
					width = 80,
					tooltip = PlayerHex.."Choose wich players should be Lay on Hand under treshold.",	
				},
			},	
			{ 	name	= "Healthstone",
				enable	= true,
				tooltip	= PlayerHex.."Check to use Healthstones.",
				widget	= { type = "numBox",
					value	= 25,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to use Healthstones.",
				},
			},				
			----  Utility  ----	
			{ 	name	= "Hand of Sacrifice",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate Hand of Sacrifice on Tank Role assigned Raid or Group member.",
				widget	= { type = "numBox",
					value	= 35,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Hand of Sacrifice on Tank Role assigned Raid or Group member.",
				},
				newSection = true,
			},	
			{ 	name	= "Hand of Salvation",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate Hand of Salvation on DPS or Healer Raid or Group member.",
					widget	= { type = "numBox",
					value	= 80,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Hand of Salvation on DPS or Healer Raid or Group member.",
				},
			},				
			{ 	name	= "Hand of Protection",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate Hand of Protection on DPS or Healer Raid or Group member.",
				widget	= { type = "numBox",
					value	= 45,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Hand of Protection on DPS or Healer Raid or Group member.",
				},
			},				
			{ 	name	= "Hand of Freedom",
				tooltip	= PlayerHex.."Active Hand of Freedom on Self.",
				enable	= false,
			},	
			{ 	name	= "Ardent Defender",
				enable	= true,
				tooltip	= PlayerHex.."Check to activate Ardent Defender.",
				widget	= { type = "numBox",
					value	= 12,
					step	= 1,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Ardent Defender.",
				},
				newSection = true,
			},					
			{ 	name	= "Divine Protection",
				enable	= false,
				tooltip	= PlayerHex.."Check to activate Divine Protection.",
				widget	= { type = "numBox",
					value	= 45,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Divine Protection.",
				},
			},					
			{ 	name	= "Guardian Of Ancient Kings",
				enable	= false,
				tooltip	= PlayerHex.."Check to activate Guardian of Ancient Kings.",
				widget	= { type = "numBox",
					value	= 30,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Guardian of Ancient Kings.",
				},
				
			},
			{ 	name	= "Shield of the Righteous",
				enable	= false,
				tooltip	= PlayerHex.."Check to activate SotR Chat Overlay.",
				widget = { type = 'select',
					values = {"Manual","3 HP","4 HP","5 HP",PlayerHex.."Wise Mode"},
					value = 5,
					width = 85,
					tooltip	= PlayerHex.."How much Holy Power we want to have before using Shield of Righteous to buff ourself. Setting it to Manual will enable Manual shielding(No Shielding at all, ALL Manual) // 3 HP will instantly use at 3 holy power // 4 HP instant use at 4 holy power // 5 HP instant use at 5 holy power //  Wise Shielding mode will use at 5 holy power only if another holy generator ability is near ready to cast. Additionally if you check the box it will report Shielding Events to your overlay.",
				},			
			},	
			{ 	name	= "Lights Hammer",
				tooltip	= PlayerHex.."toggle |cffFFFFFFLight's Hammer "..PlayerHex.."on cursor.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Keypress","|cff00A8ABAuto","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFSet Strategy to use"..PlayerHex.." Automatic Light's Hammer |cffFFFFFF on "..PlayerHex.."cursor.",	
				},
			},		
			{ 	name	= "Glyphed Consecration",
				tooltip	= PlayerHex.."toggle |cffFFFFFFGlyphed Consecration "..PlayerHex.."on cursor.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Keypress","|cff00A8ABAuto","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFSet Strategy to use"..PlayerHex.." Glyphed Consecration|cffFFFFFF on "..PlayerHex.."cursor.",	
				},
			},			
		},
		--[[ Keybinds ]]			
		hotkeys = {
			{	name	= "Lights Hammer Key",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign Light's Hammer Keybind.",
			},
			{	name	= "Glyphed Consecration Key",
				enable	= true,
				hotkeys	= {'ls'},
				tooltip	= PlayerHex.."Assign Glyphed Consecration Keybind.",
			},
			{	name	= "Pause",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= PlayerHex.."Assign Pause Keybind.",
			},
			{	name	= "Focus",
				enable	= true,
				hotkeys	= {'ls'},
				tooltip	= PlayerHex.."Assign Mouseover Focus Keybind",
			},
		},
	}
	CODEMYLIFE_PROTECTION = PQI:AddRotation(CML_Prot_config)
end
--[[           ]]	--[[           ]]	--[[           ]]
--[[           ]]	--[[           ]]	--[[           ]]
--[[]]	   --[[]]	--[[]]					 --[[ ]]
--[[         ]]		--[[           ]]	  	 --[[ ]]
--[[        ]]		--[[]]				  	 --[[ ]]
--[[]]	  --[[]]	--[[           ]]	 	 --[[ ]]		
--[[]]	   --[[]] 	--[[           ]]		 --[[ ]]

--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Retribution Paladin --------PQI_CodeMyLifeRetribution_Name_value----------------------------------------------]]
if _Spec == 3 and CML_Ret_config == nil then
	PQIprefix = "PQI_CodeMyLifeRetribution_"
	_AoEModes = 3
	_RangeSpell = 35395
	CML_Ret_config = {
		name	= "Retribution",
		author	= "CodeMyLife",
		abilities = {
		
		    ----  Options  ----		    
			{ 	name	= "Player Status", 
				tooltip	= PlayerHex.."Enables Player Status.",
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
			{ 	name	= "Active Blessings",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Blessings.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."|cff24E0FBKings","|cffFF9900Might"},
					value = 1,
					width = 70,
					tooltip = PlayerHex.."Choose Blessing.",	
				},
				newSection = true,
			},	
			{ 	name	= "Active Seals",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Seal|cffFF0066, should let that always checked and use |cffFFFFFF/activeseals |cffFF0066macro to toggle.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Auto","|cffFFFF33Truth","|cffFF9900Insight","|cff24E0FBRighteousness","|cff33FF33Justice","|cffDD0000Solo"},
					value = 1,
					width = 70,
					tooltip = PlayerHex.."Choose Seal. Auto should take the most appropriate Seal for your class/aoe mode.",	
				},
			},			
			----  Healing  ----				
			{ 	name	= "Divine Protection",
				enable	= false,
				tooltip	= PlayerHex.."Check to activate Divine Protection.",
				widget	= { type = "numBox",
					value	= 45,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Divine Protection.",
				},
			},
			{ 	name	= "Selfless Healer",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate Selfless Healer.",
				widget	= { type = "numBox",
					value	= 60,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Selfless Healer.",
				},
			},	
			{ 	name	= "Sacred Shield",
				enable	= false,
				tooltip	= PlayerHex.."Check to activate Sacred Shield.",
				widget	= { type = "numBox",
					value	= 100,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."What HP we wait before using Sacred Shield to buff ourself. Set to 100 to keep it up as much as possible, it will still only cast to keep the buff up.",
				},
			},		
			{ 	name	= "Word Of Glory",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate Word of Glory or Eternal Flame with 3 Holy Power on Raid or Group members while /activehealing.",
				widget	= { type = "numBox",
					value	= 60,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Word of Glory with 3 Holy Power on Raid or Group member while /activehealing.",
				},
			},
			{ 	name	= "Lay on Hands",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate Lay on Hands on Raid or Group members.",
				widget	= { type = "numBox",
					value	= 17,
					step	= 1,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Lay on Hands on Raid or Group member.",
				},
			},
			{ 	name	= "Lay on Hands Targets",
				enable	= true,
				tooltip	= PlayerHex.."Select Lay on Hands Targets.",
				widget = { type = 'select',
					values = {PlayerHex.."Raid","|cff24E0FBTanks","|cffFF9900Tanks/Heals"},
					value = 1,
					width = 80,
					tooltip = PlayerHex.."Choose wich players should be Lay on Hand under treshold.",	
				},
			},	
			{ 	name	= "Healthstone",
				enable	= true,
				tooltip	= PlayerHex.."Check to use Healthstones.",
				widget	= { type = "numBox",
					value	= 25,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to use Healthstones.",
				},
			},				
			----  Utility  ----	
			{ 	name	= "Hand of Sacrifice",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate Hand of Sacrifice on Tank Role assigned Raid or Group member.",
				widget	= { type = "numBox",
					value	= 35,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Hand of Sacrifice on Tank Role assigned Raid or Group member.",
				},
			},	
			{ 	name	= "Hand of Salvation",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate Hand of Salvation on DPS or Healer Raid or Group member.",
					widget	= { type = "numBox",
					value	= 80,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Hand of Salvation on DPS or Healer Raid or Group member.",
				},
			},				
			{ 	name	= "Hand of Protection",
				enable	= true,
				tooltip	= PlayerHex.."Check to Activate Hand of Protection on DPS or Healer Raid or Group member.",
				widget	= { type = "numBox",
					value	= 45,
					step	= 5,
					width 	= 70,
					tooltip	= PlayerHex.."Health value to cast Hand of Protection on DPS or Healer Raid or Group member.",
				},
			},				
			{ 	name	= "Hand of Freedom",
				tooltip	= PlayerHex.."Active Hand of Freedom on Self.",
				enable	= false,
			},		
			{ 	name	= "Avenging Wrath",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Avenging Wrath.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
				newSection = true,
			},	
			{ 	name	= "Guardian Of Ancient Kings",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Avenging Wrath.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},	
			{ 	name	= "Holy Avenger",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Avenging Wrath.",
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
			{ 	name	= "Synapse Springs",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Synapse Springs.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},					
			{ 	name	= "Trinkets",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Trinkets|cffFFFFFF.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Both Active","|cffFFE100Both On CD","|cffD90000Disable"},
					value = 1,
					width = 70,
					tooltip = PlayerHex.."Choose |cffFFFFFFTrinkets to use|cffFFFFFF.",	
				},
			},		
			{ 	name	= "DPS Potion on Heroism",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Agility Potions|cffFFFFFF when |cffFFFFFFHeroism |cffFFFFFFstarts.",
				enable	= true,
			},
			{ 	name	= "Execution Sentence",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Execution Sentence.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},	
			{ 	name	= "Lights Hammer",
				tooltip	= PlayerHex.."toggle |cffFFFFFFLight's Hammer "..PlayerHex.."on cursor.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Keypress","|cff00A8ABAuto","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFSet Strategy to use"..PlayerHex.." Automatic Light's Hammer |cffFFFFFF on "..PlayerHex.."cursor.",	
				},
			},								
		},
		--[[ Keybinds ]]			
		hotkeys = {
			{	name	= "Lights Hammer Key",
				enable	= true,
				hotkeys	= {'ls'},
				tooltip	= PlayerHex.."Assign Light's Hammer Keybind.",
			},			
			{	name	= "Pause",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= PlayerHex.."Assign Pause Keybind.",
			},
			{	name	= "Focus",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign Mouseover Focus Keybind",
			},
		},
	}
	CODEMYLIFE_RETRIBUTION = PQI:AddRotation(CML_Ret_config)
end

--[[           ]]	--[[]]	   --[[]]	--[[]]	   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[  ]]   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[  ]]   --[[]]
--[[]]				--[[]]	   --[[]]	--[[    ]] --[[]]   --[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[    ]] --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[           ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[           ]]
--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[   		   ]]
--[[]]	   			--[[           ]]	--[[]]	 --[[  ]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	 --[[  ]]
--[[]]	   			--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]
if not PaladinFunctions then
	PaladinFunctions = true

	_ArdentDefender				= 31850
	_AvengersShield				= 31935
	_AvengingWrath				= 31884
	_BeaconOfLight				= 53563 
	_BlessingOfKings			= 20217
	_BlessingOfMight			= 19740
	_BlindingLight				= 115750
	_Cleanse					= 4987
	_Consecration				= 26573
	_CrusaderStrike				= 35395
	_Denounce					= 2812
	_DevotionAura				= 31821
	_DivineFavor				= 31842
	_DivineLight				= 82326
	_DivinePlea					= 54428
	_DivineProtection 			= 498
	_DivineShield				= 642
	_DivineStorm				= 53385
	_EternalFlame				= 114163
	_ExecutionSentence			= 114157
	_Exorcism					= 879
	_FistOfJustice				= 105593
	_FlashOfLight				= 19750
	_HandOfFreedom 				= 1044
	_HandOfProtection 			= 1022
	_HandOfPurity				= 114039
	_HandOfSacrifice	 		= 6940
	_HandOfSalvation	 		= 1038
	_HammerOfJustice			= 853
	_HammerOfTheRighteous		= 53595
	_HammerOfWrath				= 24275
	_HolyAvenger				= 105809
	_HolyLight					= 635
	_HolyPrism					= 114165
	_HolyRadiance				= 82327
	_HolyShock					= 20473
	_HolyWrath					= 119072
	_GlyphedConsecration		= 116467
	_GuardianOfAncientKings		= 86659
	_GuardianOfAncientKingsHoly	= 86669
	_GuardianOfAncientKingsRet	= 86698
	_Inquisition				= 84963
	_Judgement					= 20271
	_LayOnHands					= 633
	_LightOfDawn				= 85222
	_LightsHammer				= 114158
	_MassExorcism				= 122032
	_MassResurection			= 83968
	_Reckoning					= 62124
	_Redemption					= 7328
	_RighteousFury 				= 25780			
	_Repentance					= 20066
	_SacredShield				= 20925
	_SealOfInsight 				= 20165
	_SealOfRighteousness 		= 20154
	_SealOfThruth 				= 31801
	_ShieldOfTheRighteous 		= 53600
	_SpeedOfLight				= 85499
	_TemplarsVerdict			= 85256
	_TurnEvil					= 10326		
	_WordOfGlory				= 85673
	-- Paladin T16
	ProtPalT16 = {
		99126, -- Chest
		99127, -- Gloves
		99128, -- Helm
		99129, -- Legs
		99130 -- Shoulders
	}
	macros = { 
	    ["ActiveCooldowns"]   		= false,
	    ["ActiveDispel"]			= true, 
	   	["ActiveDPS"]   			= false,
	    ["ActiveHealing"]   		= false, 
	    ["ActiveSeal"]				= false,	
	    ["AoE"]    					= 1,  
	    ["Consecration"]   			= true,
	    ["Pause"]					= false,    
	    ["TakeControl"]				= false,
	} 
	_Queues = {	
		[2]							= false,
		[_AvengersShield] 			= false,
		[_BlindingLight]  			= false,
		[_DivineShield] 			= false,
		[_ExecutionSentence]		= false,
		[_FistOfJustice]			= false,
		[_GlyphedConsecration]		= false,
		[_HammerOfJustice] 			= false,
		[_LightsHammer] 			= false,
		[_TurnEvil]					= false,
	}
	SLASH_CONSECRATION1 = "/consecration"
	function SlashCmdList.CONSECRATION(msg, editbox)
		if not macros["Consecration"] then
			xrn:message("|cffFF78A0Consecration - Active.")
			macros["Consecration"] = true
		else
			xrn:message("|cffFF78A0Consecration - Inactive.")
			macros["Consecration"] = false
		end
	end
	SLASH_HOFREE1 = "/hofree"
	function SlashCmdList.HOFREE(msg, editbox)
		if not macros["HoFreeQueue"] then
			xrn:message("\124cFFFFFFFFHand of Freedom Queued.")
			macros["HoFreeQueue"] = true
		else
			xrn:message("\124cFFCC99FFHand of Freedom Canceled.")
			macros["HoFreeQueue"] = false
		end
	end
	SLASH_HOSAC1 = "/hosac"
	function SlashCmdList.HOSAC(msg, editbox)
		if not macros["HoSacQueue"] and GetNumGroupMembers() > 0 then
			xrn:message("\124cFFFFFFFFHand of Sacrifice Queued.")
			macros["HoSacQueue"] = true
		elseif GetNumGroupMembers() > 0 then
			xrn:message("\124cFFCC99FFHand of Sacrifice Canceled.")
			macros["HoSacQueue"] = false
		end
	end
	SLASH_HOSALV1 = "/hosalv"
	function SlashCmdList.HOSALV(msg, editbox)
		if not macros["HoSalvQueue"] then
			xrn:message("\124cFFFFFFFFHand of Salvation Queued.")
			macros["HoSalvQueue"] = true
		else
			xrn:message("\124cFFCC99FFHand of Salvation Canceled.")
			macros["HoSalvQueue"] = false
		end
	end
	SLASH_HOPROT1 = "/hoprot"
	function SlashCmdList.HOPROT(msg, editbox)
		if not macros["HoProtQueue"] then
			xrn:message("\124cFFFFFFFFHand of Protection Queued.")
			macros["HoProtQueue"] = true
		else
			xrn:message("\124cFFCC99FFHand of Protection Canceled.")
			macros["HoProtQueue"] = false
		end
	end
	SLASH_HOPUR1 = "/hopur"
	function SlashCmdList.HOPUR(msg, editbox)
		if not macros["HoPurQueue"] then
			xrn:message("\124cFFFFFFFFHand of Purity Queued.")
			macros["HoPurQueue"] = true
		else
			xrn:message("\124cFFCC99FFHand of Purity Canceled.")
			macros["HoPurQueue"] = false
		end
	end
	SLASH_TAKECONTROL1 = "/takecontrol"
	function SlashCmdList.TAKECONTROL(msg, editbox)
		if not macros["TakeControl"] then
			xrn:message("\124cFFFF33CCMouseover Control Activated.")
			macros["TakeControl"] = true
		else
			xrn:message("\124cFFCC99FFMouseover Control Canceled.")
			macros["TakeControl"] = false
		end
	end

	function CML.BeaconOfLight()
		if _G[PQIprefix.."BeaconOfLight_enable"] ~= true then return false end
		if UnitExists("focus") and UnitCanCooperate("player","focus") then
			ProbablyEngine.dsl.parsedTarget = "focus"
			BeaconTarget = ProbablyEngine.dsl.parsedTarget
			if not UnitBuffID("focus", 53563) then
				return true	
			end
		elseif _G[PQIprefix.."BeaconOfLight_value"] == 1 then
			BeaconFound = false
			for i = 1, #nNova - 1 do
				if UnitBuffID(nNova[i].unit, 53563) then
					BeaconFound = true
					BeaconTarget = nNova[i].unit
					if UnitGUID(nNova[i].unit) == "0xF1311A1A0000574F" then
						BeaconRole = "TANK"
					else
						BeaconRole = nNova[i].role
					end
				end
			end
			if BeaconFound then
				if UnitBuffID(nNova[1].unit, 53563) and nNova[1].hp < 100 then
					if BeaconRole == "TANK" then OverBeacon = 55 else OverBeacon = 25 end
					if not BeaconRole then BeaconRole = "NOOB" end
					if not BeaconFound 
					  or nNova[1].hp < CML.GetHP(BeaconTarget) - OverBeacon
					  or CML.GetHP(BeaconTarget) >= 99 and BeaconRole ~= "TANK"
					  or ( nNova[1].role == "TANK" and BeaconRole ~= "TANK" ) then
						ProbablyEngine.dsl.parsedTarget = nNova[1].unit
						BeaconTarget = ProbablyEngine.dsl.parsedTarget
						if not UnitBuffID(ProbablyEngine.dsl.parsedTarget,53563) then
							return true
						end
					end
				end
			elseif nNova[1].hp < 100 and not UnitBuffID(nNova[1].unit, 53563) then
				ProbablyEngine.dsl.parsedTarget = nNova[1].unit
				BeaconTarget = ProbablyEngine.dsl.parsedTarget
				if not UnitBuffID(ProbablyEngine.dsl.parsedTarget,53563) then
					return true
				end
			end	
		elseif _G[PQIprefix.."BeaconOfLight_value"] == 2 then
			if UnitExists("focus") and UnitCanCooperate("player","focus") then
				if not UnitBuffID("focus", 53563) then
				 	ProbablyEngine.dsl.parsedTarget = "focus"
				 	BeaconTarget = ProbablyEngine.dsl.parsedTarget
					if not UnitBuffID(ProbablyEngine.dsl.parsedTarget,53563) then
				 		return true
				 	end
				end
			end
			for i=1, #nNova do
				if nNova[i].threat == 3 and nNova[i].role == "TANK" then
			 		ProbablyEngine.dsl.parsedTarget = nNova[i].unit
			 		BeaconTarget = ProbablyEngine.dsl.parsedTarget
					if not UnitBuffID(ProbablyEngine.dsl.parsedTarget,53563) then
			 			return true
					end	
				end
			end				
		elseif _G[PQIprefix.."BeaconOfLight_value"] == 3 then
			ProbablyEngine.dsl.parsedTarget = "focus"
			BeaconTarget = ProbablyEngine.dsl.parsedTarget
			if not UnitBuffID("focus", 53563) then
				return true
			end
		end
	end

	function CML.Blessings(Buff)
		local ActiveBlessingsCheck = _G[PQIprefix.."BeaconOfLight_enable"]
		local ActiveBlessingsValue = _G[PQIprefix.."BeaconOfLight_value"]
		if UnitBuffID("player",144051) then return false end
		if ActiveBlessingsCheck then
			if ActiveBlessingsValue == 2 and Buff == 1 then CML_MyBlessing = 20217 end
			if ActiveBlessingsValue == 3 and Buff == 2 then CML_MyBlessing = 19740 end
			if ActiveBlessingsValue == 1 then
				CML_BlessingCount = 0
				for i = 1, #nNova do
				    local _, CML_MemberClass = select(2,UnitClass(nNova[i].unit))
				    if UnitExists(nNova[i].unit) then 
					    if CML_MemberClass ~= nil then
							if CML_MemberClass == "DRUID" then CML_BlessingCount = CML_BlessingCount + 1 end				
							if CML_MemberClass == "MONK" then CML_BlessingCount = CML_BlessingCount + 1	end					
						    if CML_MemberClass == "PALADIN" then CML_BlessingCount = CML_BlessingCount + 50 end
						end		
					end	
				end	
				if CML_BlessingCount > 50 then CML_MyBlessing = 19740 else CML_MyBlessing = 20217 end
			end
			if BuffTimer == nil or BuffTimer < GetTime() and ((Buff == 1 and CML_MyBlessing == 20217) or (Buff == 2 and CML_MyBlessing == 19740)) then
				for i=1, #nNova do
					if not UnitBuffID(nNova[i].unit,CML_MyBlessing) then
			 			BuffTimer = GetTime() + random(15,30)
				 		return true
					end
				end	
			end
		end
		return false
	end

	function CML.Cleanse()
		if macros["ActiveDispel"] then
			if UnitExists("boss1") then
				if CML.GetUnitID("boss1") == 71734 then
					if not UnitBuffID("player",144359) then 
						return false
					end
				end
			end
			for i=1, #nNova do
				if nNova[i].dispel == true then 
					ProbablyEngine.dsl.parsedTarget = nNova[i].unit
					return true
				end
			end
		end
		return false
	end

	function CML.Consecration()
		if macros["Consecration"] == true then
			return true
		end
		return false
	end

	function CML.EternalFlame()
		if _G[PQIprefix.."WordOfGlory_enable"] and macros["ActiveHealing"] then
			for i = 1, #nNova do
				if UnitPower("player", SPELL_POWER_HOLY_POWER) >= 3 and nNova[i].hp <= _G[PQIprefix.."EternalFlame_value"] and not UnitBuffID(nNova[i].unit,114163) then
					ProbablyEngine.dsl.parsedTarget = nNova[i].unit
					return true
				end
				if UnitPower("player", SPELL_POWER_HOLY_POWER) == 5 and not UnitBuffID(nNova[i].unit,114163) then
					ProbablyEngine.dsl.parsedTarget = nNova[i].unit
					return true
				end
				if nNova[i].hp <= 10 then
					ProbablyEngine.dsl.parsedTarget = nNova[i].unit
					return true
				end
			end
		end
		return false
	end 

	function CML.Execution()
		if _G[PQIprefix.."ExecutionSentence_enable"] then
			if _G[PQIprefix.."ExecutionSentence_value"] and CML.GetVengeance(93098) then
				if CML.GetVengeance(93098) >= _G[PQIprefix.."ExecutionSentence_value"] then
					return true
				end
			else
				return true
			end
		end
	end

	function CML.GlyphedConsecration()
		if macros["Consecration"] ~= true then return false end
		if _G[PQIprefix.."GlyphedConsecration_enable"] and _G[PQIprefix.."GlyphedConsecration_value"] == 2 and _Queues[_GlyphedConsecration] ~= true then
			if UnitIsUnit("target","mouseover") == 1 then 
				_Queues[_GlyphedConsecration] = true 
				return true
			end
		end
		local PQICheck = _G[PQIprefix.."GlyphedConsecrationKey_enable"]
  		local PQIValue = PQI:IsHotkeys(_G[PQIprefix.."GlyphedConsecrationKey_key"])
  		if PQICheck and PQIValue then
  			_Queues[_GlyphedConsecration] = true 
  		    return true
  		end	
	end

	function CML.HandActive(target)
		if UnitBuffID(target, _HandOfFreedom)
		  or UnitBuffID(target, _HandOfProtection)
		  or UnitBuffID(target, _HandOfPurity)
		  or UnitBuffID(target, _HandOfSacrifice)
		  or UnitBuffID(target, _HandOfSalvation) then
		  	return true
		end
		return false
	end

	function CML.HandOfFreedom()	
		if _G[PQIprefix.."HandofFreedom_enable"] then
			if not CML.Melee() and not CML.HandActive("player") and GetUnitSpeed("player") ~= 0 and GetUnitSpeed("player") <= ((select(2,GetUnitSpeed("player"))/2)-0.2) then
				return true
			end
		end
		return false
	end

	function CML.HandOfPurity()
		-- Hand of Purity return true, SpellTarget, SpellName, EndTime, SpellType
		local PurityDebuffs =
		{
			{ID = 145263, 	Remain = 30, 	Health = 80 }, -- Proving Grounds Healer Debuff.	
			{ID = 144089, 	Remain = 5, 	Health = 100 }, -- Toxic Mist - Dark Shamans 
			{ID = 143638, 	Remain = 30, 	Health = 100 }, -- Bonecracker 	

		}
		for t=1,#nNova do
			if nNova[t].range == 1 then
				for i=1,#PurityDebuffs do
					if not CML.HandActive(nNova[t].unit) and UnitDebuffID(nNova[t].unit,PurityDebuffs[i].ID) then
						local SpellName, _, _, _, SpellType, _, EndTime, SpellTarget = UnitDebuffID(nNova[t].unit,PurityDebuffs[i].ID)
						if EndTime - GetTime() <= PurityDebuffs[i].Remain and CML.GetHP(nNova[t].unit) <= PurityDebuffs[i].Health then
							ProbablyEngine.dsl.parsedTarget = nNova[t].unit
							return true
						end
					end
				end
			end
		end
		return false
	end

	function CML.HandOfProtection()
		if _G[PQIprefix.."HandofProtection_enable"] then
			-- Hand of Purity return true, SpellTarget, SpellName, EndTime, SpellType
			local ProtectionDebuffs =
			{
				{ID = 144331, 	Remain = 10, 	Health = 100 }, -- Prisons - Dark Shamans 	
			}
			for t=1,#nNova do
				if nNova[t].range == 1 and nNova[t].role ~= "TANK" and nNova[t].role ~= "NOOB" then
					for i=1,#ProtectionDebuffs do
						if not CML.HandActive(nNova[t].unit) and UnitDebuffID(nNova[t].unit,ProtectionDebuffs[i].ID) then
							local SpellName, _, _, _, SpellType, _, EndTime, SpellTarget = UnitDebuffID(nNova[t].unit,ProtectionDebuffs[i].ID)
							if EndTime - GetTime() <= ProtectionDebuffs[i].Remain and CML.GetHP(nNova[t].unit) <= ProtectionDebuffs[i].Health then
								ProbablyEngine.dsl.parsedTarget = nNova[t].unit
								return true
							end
						end
					end
				end
			end
			return false
		end
	end

	function CML.HandOfSacrifice()	
		if _G[PQIprefix.."HandOfSacrifice_enable"] and nNova[1].hp < _G[PQIprefix.."HandOfSacrifice_value"] and _HP >= 35 then
			if UnitGUID(nNova[1].unit) ~= UnitGUID("player") and nNova[1].range == 1 and UnitThreatSituation(nNova[1].unit) == 3
			  and not CML.HandActive(nNova[1].unit)
			  and (nNova[1].role == "TANK" 
			  or nNova[1].role == "HEALER" 
			  or nNova[1].role == "NONE") then
			  	ProbablyEngine.dsl.parsedTarget = nNova[1].unit
				return true
			end
		end
	end

	function CML.HandOfSalvation()	
		if _G[PQIprefix.."HandOfSalvation_enable"] and nNova[1].hp < _G[PQIprefix.."HandOfSalvation_value"] then
			if nNova[1].range == 1 and UnitThreatSituation(nNova[1].unit) == 3
			  and not CML.HandActive(nNova[1].unit)
			  and (nNova[1].role ~= "TANK" 
			  and nNova[1].role ~= "NONE") then
			  	ProbablyEngine.dsl.parsedTarget = nNova[1].unit
				return true
			end
		end
		return false
	end

	function CML.HasForbearance(target)
		if UnitDebuffID(target, 25771) then
			return true
		end
		return false
	end

	function CML.LayOnHands()
		if _G[PQIprefix.."LayonHands_enable"] then
			-- Bosses on wich we do not want to use Lay on Hands on us.
			local NoLoHBosses = { 
				68036, -- Durumu the Forgotten 
				68078, -- Iron Qon
				68476 -- Horridon
			}
			if _HP <= _G[PQIprefix.."LayonHands_value"] then
				local DoHeal = true
				for i = 1, #NoLoHBosses do
					if UnitExists("boss1") == 1 and UnitGUID("boss1") == UnitGUID(NoLoHBosses[i]) then
					  	DoHeal = false
				 	end
				end
				if DoHeal == true then
					ProbablyEngine.dsl.parsedTarget = "player"
					return true
				end
			end

			if _G[PQIprefix.."LayonHandsTargets_value"] == 1 or not _G[PQIprefix.."LayonHandsTargets_enable"] then
				if nNova[1].range == 1 and nNova[1].hp < _G[PQIprefix.."LayonHands_value"] and UnitGUID(nNova[1].unit) ~= UnitGUID("player") then
					LoHTarget = nNova[1].unit
				 	return true
				end
			elseif _G[PQIprefix.."LayonHandsTargets_value"] == 2 and _G[PQIprefix.."LayonHandsTargets_enable"] then
				for i = 1, #nNova do
					if nNova[i].range == 1 and nNova[i].role == "TANK" and nNova[i].hp < _G[PQIprefix.."LayonHands_value"] and UnitGUID(nNova[i].unit) ~= UnitGUID("player") then
						ProbablyEngine.dsl.parsedTarget = nNova[i].unit
					 	return true
					end
				end
			elseif LayonHandsTargetsValue == 3 then
				for i = 1, #nNova do
					if nNova[i].range == 1 and (nNova[i].role == "TANK" or nNova[i].role == "HEALER") and nNova[i].hp < _G[PQIprefix.."LayonHands_value"] and UnitGUID(nNova[i].unit) ~= UnitGUID("player") then
					 	ProbablyEngine.dsl.parsedTarget = nNova[i].unit
					 	return true
					end
				end
			end
			return false
		end
	end

	function CML.LightsHammer()
		if _G[PQIprefix.."LightsHammer_enable"] and _G[PQIprefix.."LightsHammer_value"] == 2 then
			if UnitIsUnit("target","mouseover") == 1 then 
				_Queues[_LightsHammer] = true 
				return true
			end
		end
	end

	function CML.RighteousFury()
		if _G[PQIprefix.."RighteousFury_enable"] and not UnitBuffID("player",25780) then
			return true
		end
		return false
	end

	function CML.SacredShield(Prio)
		if UnitBuffID("player",20925) then SacredShieldTimer = select(7, UnitBuffID("player", GetSpellInfo(20925))) - GetTime() else SacredShieldTimer = 0 end
		if _G[PQIprefix.."SacredShield_enable"] and _HP <= _G[PQIprefix.."SacredShield_value"] then  
			if Prio == 1 then
				if ( SacredShieldTimer == 0 and (GetUnitSpeed("player") ~= 0 or UnitAffectingCombat("player")) ) 
				  or (_Spec == 3 or (LastVengeance ~= nil and CML.GetVengeance(93098) > (_G[PQIprefix.."SacredVengeance_value"] + LastVengeance))) then 
				  	if _Spec == 2 then
				  		LastVengeance = CML.GetVengeance(93098) 
				  	end
				  	return true
				end	
			end
			if Prio == 2 then
	 			if (LastVengeance and SacredShieldTimer <= 7 and CML.GetVengeance(93098) >= LastVengeance)
	 			  or SacredShieldTimer <= 2 then
	  				LastVengeance = CML.GetVengeance(93098)
	   				return true
	 			end
	 		end
		end	
		return false
	end

	function CML.Seal(modifier)
		_ActiveSeal = GetShapeshiftForm()
		_Spec = GetSpecialization()
		if modifier == 1 then 
			if _Spec == 3 and macros["AoE"] == 1 and _ActiveSeal ~= 1 then
				return true
			end
		end	
		if modifier == 2 then 
			if _Spec == 3 and macros["AoE"] == 3 and _ActiveSeal ~= 2 then
				return true
			end
		end		
		if modifier == 3 then 
			if _Spec == 1 and _ActiveSeal ~= 3 then
				return true
			end
			if _Spec == 2 and _ActiveSeal ~= 3 then
				return true
			end
		end
		return false
	end

	function CML.SelfFlame()
		if _G[PQIprefix.."SelfFlame_enable"] then
			local Go = false
			if ProtT16Equipped then if UnitBuffID("player",114637) and select(4,UnitBuffID("player",114637)) >= 3 then Go = true end
			elseif _HolyPower >= 4 or divinePurpose then Go = true end
			if Go == true then	
				if _HP <= _G[PQIprefix.."SelfFlame_value"] and not UnitBuffID("player",114163) then
					return true
				end
				if _HP <= _G[PQIprefix.."SelfFlame_value"] - 30 then
					return true
				end
				if LastVengeance ~= nil and LastVengeance <= CML.GetVengeance(93098) + _G[PQIprefix.."SacredVengeance_value"] then
					return true
				end
			end
		end
	end
		
	function CML.SelflessHealer(Modifier)
		if _G[PQIprefix.."SelflessHealer_enable"] and select(4,UnitBuffID("player",114250)) == 3 then
			if Modifier == 1 and _HP <= _G[PQIprefix.."SelflessHealer_value"] then 
				return true
			end
			if Modifier == 2 and nNova[1].range == 1 and nNova[1].hp <= _G[PQIprefix.."SelflessHealer_value"] then 
				ProbablyEngine.dsl.parsedTarget = nNova[1].unit
				return true
			end
		end
	end

	function CML.Verdict(modifier)
		if CML.NotFacingTarget(0.25)  then
			if modifier == true and _HolyPower >= 3 then
				return true
			elseif (_HolyPower == 5 or ((UnitBuffID("player",_HolyAvenger) or UnitBuffID("player",86172)))  and _HolyPower >= 3) then
				return true
			end
		end
		return false
	end

	function CML.WordOfGlory()
		if _G[PQIprefix.."WordOfGlory_enable"] and (_HolyPower >= 3 or CML_HaveBuff("player",90174)) then
			if nNova[1].range == 1 and nNova[1].hp <= _G[PQIprefix.."WordOfGlory_value"] then
				ProbablyEngine.dsl.parsedTarget = nNova[1].unit
				return true
			end	
		end
		return false
	end
end

end