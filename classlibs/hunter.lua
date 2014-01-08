function CML.HunterStartup()

_RangeSpell = 3044
_HealingRangeSpell = 102694 -- First Aid

if _Spec == 1 then PQIprefix = "PQI_CodeMyLifeBeastmaster_" end
if _Spec == 2 then PQIprefix = "PQI_CodeMyLifeMarksmanship_" end
if _Spec == 3 then PQIprefix = "PQI_CodeMyLifeSurvival_" end

--[[           ]]	--[[           ]]		  --[[]]		--[[           ]]	--[[           ]]
--[[           ]]	--[[           ]]	     --[[  ]]		--[[           ]]	--[[           ]]
--[[]]	   --[[]]	--[[]]				    --[[    ]] 		--[[]]					 --[[ ]]
--[[         ]]		--[[           ]]	   --[[      ]] 	--[[           ]]		 --[[ ]]
--[[]]	   --[[]]	--[[]]				  --[[        ]]			   --[[]]		 --[[ ]]
--[[           ]]	--[[           ]]	 --[[]]    --[[]]	--[[           ]]		 --[[ ]]		
--[[           ]] 	--[[           ]]	--[[]]      --[[]]	--[[           ]]		 --[[ ]]

--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- BeastMaster Hunter -------- PQI_CodeMyLifeBeastmaster_Name_value  -------------------------------------------------------------]]
if _MyClass == 3 and _Spec == 1 and CML_Beast_config == nil then
	PQIprefix = "PQI_CodeMyLifeBeastmaster_"
	_AoEModes = 2
	CML_Beast_config = {
		name	= "Beastmaster",
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
			{ 	name	= "Exhilaration",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFExhilaration |cff7EBF37on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 35,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFExhilaration |cff7EBF37on me.",
				},
				newSection = true,
			},

			{ 	name	= "Healthstone",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFHealthstone|cff7EBF37.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFHealthstone|cff7EBF37.",
				},
			},	
			{ 	name	= "Deterrence",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFDeterrence|cff7EBF37.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 20,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFDeterrence|cff7EBF37.",
				},
			},	
			{ 	name	= "Feign Death",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFFeign Death|cff7EBF37.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 10,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFFeign Death|cff7EBF37.",
				},
			},	
			--[[ Utility ]]	
			{ 	name	= "Hunters Mark",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Hunter's Mark |cff7EBF37will use |cff7EBF37 when |cffFFFFFFout of combat after desired time(seconds).",
				enable	= true,
				widget	= { type = "numBox",
					min		= 0,
					max 	= 10,
					value	= 3,
					width 	= 70,
					step	= 1,
					tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Hunter's Mark |cff7EBF37will use |cff7EBF37 when |cffFFFFFFout of combat after desired time(seconds).",
				},
				newSection = true,
			},				
			{ 	name	= "Misdirection",
				tooltip	= "|cffFFFFFFMisdirection |cff7EBF37on |cffFFFFFFFocus or Pet |cff7EBF37when aggro on me.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff7EBF37Save Me","|cffD90000Help Tank","|cffFFFFFFAlways"},
					value = 1,
					width = 70,
					tooltip = "|cffFFFFFFSet |cff7EBF37 Misdirection |cffFFFFFFMode.",	
				},
			},
			{ 	name	= "Active Aspects",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Aspects |cff7EBF37will use |cffFFFFFFTraveling Aspect|cff7EBF37 when |cffFFFFFFout of combat and moving.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 6,
					width 	= 70,
					max 	= 30,
					step	= 1,
					tooltip	= "|cffFFFFFFTime to wait before casting Traveling Aspect.",
				},
			},	
			{ 	name	= "Masters Call",
				tooltip	= "|cffFFFFFFActive Master's Call |cff7EBF37on me|cff7EBF37.",
				enable	= true,
			},
			{ 	name	= "Active Pet Whistle",
				tooltip	= "|cffFFFFFFCall Pet Slot "..PlayerHex.."to use when we |cffFFFFFFWhistle|cff7EBF37.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff5EAB00Pet Slot 1","|cff5EAB00Pet Slot 2","|cff5EAB00Pet Slot 3","|cff5EAB00Pet Slot 4","|cff5EAB00Pet Slot 5"},
					value = 1,
					width = 70,
					tooltip = "|cffFFFFFFCall Pet Slot "..PlayerHex.."to use when we |cffFFFFFFWhistle|cff7EBF37.",	
				},
			},	
			{ 	name	= "Mend Pet",
				tooltip	= "|cffFFFFFFPet Health value "..PlayerHex.."to use |cffFFFFFFMend Pet|cff7EBF37.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 40,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFPet Health value "..PlayerHex.."to use |cffFFFFFFMend Pet|cff7EBF37.",
				},
			},	
			{ 	name	= "Fervor",
				tooltip	= "|cffFFFFFFCheck "..PlayerHex.."to activate |cffFFFFFFFervor.",
				enable	= true,
			},
			{ 	name	= "Explosive Trap",
				tooltip	= PlayerHex.."toggle |cffFFFFFFTraps |cff7EBF37on cursor.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff5EAB00Keypress","|cff00A8ABAuto","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFSet Strategy to use|cff7EBF37 Automatic Traps |cffFFFFFF on |cff7EBF37cursor.",	
				},
				newSection = true,
			},
			{ 	name	= "Snakes Trap",
				tooltip	= PlayerHex.."toggle |cffFFFFFFTraps |cff7EBF37on cursor.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff5EAB00Keypress","|cff00A8ABAuto","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFSet Strategy to use|cff7EBF37 Automatic Traps |cffFFFFFF on |cff7EBF37cursor.",	
				},
			},	
			{ 	name	= "Ice Trap",
				tooltip	= PlayerHex.."toggle |cffFFFFFFTraps |cff7EBF37on cursor.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff5EAB00Keypress","|cff00A8ABAuto","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFSet Strategy to use|cff7EBF37 Automatic Traps |cffFFFFFF on |cff7EBF37cursor.",	
				},
			},									
			{ 	name	= "Pet Passive Behaviour",
				tooltip	= PlayerHex.."toggle |cffFFFFFFPet Passive Behaviour|cff7EBF37.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cffE07000Target","|cff5EAB00Focus","|cff00A8ABMouse","|cffFFFFFFFollow"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFSet target to use|cff7EBF37 for your Pet. |cffFFFFFFIf invilaid it will attack Target|cff7EBF37.",	
				},
			},				

			--[[ Cooldowns ]]
			{ 	name	= "A Murder of Crows",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic A Murder of Crows.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},	
			{ 	name	= "Raid Burst",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFRaid Burst |cffD9000B(By Psyrex)|cffFFFFFF.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Boss Only","|cffFFE100Always","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose desired Raid Burst Option. This will start the fight with a 14 second Burst.|cffFFE100Use Always to test on dummy or if you want to burst like crazy on anything. |cff0DFF00Use Raid boss to check if Boss1 exists before using Burst.|cffD9000B(By Psyrex)|cffFFFFFF.",	
				},
				newSection = true,
			},	
			{ 	name	= "Bestial Wrath",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Bestial Wrath.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},				
			{ 	name	= "Focus Fire",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Focus Fire.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},	
			{ 	name	= "Rapid Fire",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Rapid Fire.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},
			{ 	name	= "Stampede",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Stampede.",
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
			{ 	name	= "Agility Potion on Heroism",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Agility Potions|cff7EBF37 when |cffFFFFFFHeroism |cff7EBF37starts.",
				enable	= true,
			},	
		},
		--[[ Keybinds ]]
		hotkeys = {
			{	name	= "Traps",
				enable	= true,
				hotkeys	= {'ls'},
				tooltip	= "|cff7EBF37Assign |cffFFFFFFTrap Launcher |cff7EBF37Hold to throw your |cffFFFFFFExplosive and Ice |cff7EBF37traps on your mouse.",
			},
			{	name	= "Freezing Trap",
				enable	= true,
				hotkeys	= {'rs'},
				tooltip	= "|cff7EBF37Assign |cffFFFFFFFreezing Trap |cffFFFFFFHold "..PlayerHex.."to throw |cffFFFFFFFreezing Trap |cff7EBF37on your mouse.",
			},
			{	name	= "Stack Focus",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= "|cff7EBF37Assign |cffFFFFFFStack Focus |cff7EBF37Use this to keep high focus before burn phases.",
			},
			{	name	= "Pause",
				enable	= true,
				hotkeys	= {'ra'},
				tooltip	= "|cff7EBF37Assign |cffFFFFFFPause |cff7EBF37Will |cffFFFFFFStop Rotation, ClearTarget |cff7EBF37and |cffFFFFFFPet Stop Attack.",
			},
			{	name	= "Pet Move To Mouse",
				enable	= true,
				hotkeys	= {'rc'},
				tooltip	= "|cff7EBF37Assign |cffFFFFFFPet Move To Mouse |cff7EBF37Use this to |cffFFFFFFmove your pet "..PlayerHex.."toward your mouse.",
			},
			{	name	= "Set Focus",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= "|cff7EBF37Assign |cffFFFFFFMouseover Focus |cff7EBF37Set focus to mouseover.",
			},			

		},
	}
	CODEMYLIFE_BEASTMASTER = PQI:AddRotation(CML_Beast_config)
end

--[[]]     --[[]] 		  --[[]]		--[[           ]]	--[[]]	   --[[]]	--[[           ]]
--[[ ]]   --[[ ]] 		 --[[  ]] 		--[[           ]]	--[[]]	  --[[]]	--[[           ]]
--[[           ]] 	    --[[    ]]		--[[]]	   --[[]]	--[[        ]]		--[[]]
--[[           ]]	   --[[      ]] 	--[[           ]] 	--[[    ]] 			--[[           ]]
--[[]] 	   --[[]]	  --[[        ]]	--[[        ]]		--[[        ]]				   --[[]]
--[[]]	   --[[]]	 --[[]]    --[[]]	--[[]]	  --[[]]	--[[]]	  --[[]]	--[[           ]]
--[[]]	   --[[]]	--[[]]      --[[]]	--[[]]	   --[[]]	--[[]]	   --[[]]	--[[           ]]

--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Marksmanship Hunter -----PQI_CodeMyLifeMarksmanship_Name_value-----------------------------------------------------------------------]]
if _MyClass == 3 and _Spec == 2 and CML_Marks_config == nil then
	PQIprefix = "PQI_CodeMyLifeMarksmanship_"
	_AoEModes = 2
	_RangeSpell = _ArcaneShot
	CML_Marks_config = {
		name	= "Marksmanship",
		author	= "CodeMyLife",
		abilities = {
			{ 	name	= "Player Status", 
				tooltip	= "|cff7EBF37Enables |cffFFFFFFPlayer Bar.",
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
				tooltip	= "|cff7EBF37Displays Rotation locally in chat.",
				enable	= false,
				widget = { type = 'select',
					values 	= {PlayerHex.."Success","|cffD90000Failed","|cffFFFFFFBoth"},
					value	= 1,
					width	= 70,
					tooltip	= "|cff7EBF37Select what spells you want to be shown in chat.",
				},
			},			
			{ 	name	= "Exhilaration",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFExhilaration |cff7EBF37on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 35,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFExhilaration |cff7EBF37on me.",
				},
				newSection = true,
			},					
			{ 	name	= "Healthstone",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFHealthstone|cff7EBF37.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFHealthstone|cff7EBF37.",
				},
			},	
			{ 	name	= "Deterrence",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFDeterrence|cff7EBF37.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 20,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFDeterrence|cff7EBF37.",
				},
			},	
			{ 	name	= "Feign Death",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFFeign Death|cff7EBF37.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 10,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFFeign Death|cff7EBF37.",
				},
			},	
			--[[ Utility ]]	
			{ 	name	= "Hunters Mark",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Hunter's Mark |cff7EBF37will use |cff7EBF37 when |cffFFFFFFout of combat after desired time(seconds).",
				enable	= true,
				widget	= { type = "numBox",
					min		= 0,
					max 	= 10,
					value	= 3,
					step	= 1,
					tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Hunter's Mark |cff7EBF37will use |cff7EBF37 when |cffFFFFFFout of combat after desired time(seconds).",
				},
				newSection = true,
			},				
			{ 	name	= "Misdirection",
				tooltip	= "|cffFFFFFFMisdirection |cff7EBF37on |cffFFFFFFFocus or Pet |cff7EBF37when aggro on me.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff7EBF37Save Me","|cff00CC00Help Tank","|cff00CC00Always"},
					value = 1,
					width = 70,
					tooltip = "|cffFFFFFFSet |cff7EBF37 Misdirection |cffFFFFFFMode.",	
				},
			},			
			{ 	name	= "Active Aspects",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Aspects |cff7EBF37will use |cffFFFFFFTraveling Aspect|cff7EBF37 when |cffFFFFFFout of combat and moving.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 6,
					width 	= 70,
					max 	= 30,
					step	= 1,
					tooltip	= "|cffFFFFFFTime to wait before casting Traveling Aspect.",
				},
			},		
			{ 	name	= "Masters Call",
				tooltip	= "|cffFFFFFFActive Master's Call |cff7EBF37on me|cff7EBF37.",
				enable	= true,
			},
			{ 	name	= "Active Pet Whistle",
				tooltip	= "|cffFFFFFFCall Pet Slot "..PlayerHex.."to use when we |cffFFFFFFWhistle|cff7EBF37.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff5EAB00Pet Slot 1","|cff5EAB00Pet Slot 2","|cff5EAB00Pet Slot 3","|cff5EAB00Pet Slot 4","|cff5EAB00Pet Slot 5"},
					value = 1,
					width = 70,
					tooltip = "|cffFFFFFFCall Pet Slot "..PlayerHex.."to use when we |cffFFFFFFWhistle|cff7EBF37.",	
				},
			},		
			{ 	name	= "Mend Pet",
				tooltip	= "|cffFFFFFFPet Health value "..PlayerHex.."to use |cffFFFFFFMend Pet|cff7EBF37.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 40,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFPet Health value "..PlayerHex.."to use |cffFFFFFFMend Pet|cff7EBF37.",
				},
			},		
			{ 	name	= "Fervor",
				tooltip	= "|cffFFFFFFCheck "..PlayerHex.."to activate |cffFFFFFFFervor.",
				enable	= true,
			},

			{ 	name	= "Explosive Trap",
				tooltip	= PlayerHex.."toggle |cffFFFFFFTraps |cff7EBF37on cursor.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff5EAB00Keypress","|cff00A8ABAuto","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFSet Strategy to use|cff7EBF37 Automatic Traps |cffFFFFFF on |cff7EBF37cursor.",	
				},
				newSection = true,
			},
			{ 	name	= "Snakes Trap",
				tooltip	= PlayerHex.."toggle |cffFFFFFFTraps |cff7EBF37on cursor.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff5EAB00Keypress","|cff00A8ABAuto","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFSet Strategy to use|cff7EBF37 Automatic Traps |cffFFFFFF on |cff7EBF37cursor.",	
				},
			},	
			{ 	name	= "Ice Trap",
				tooltip	= PlayerHex.."toggle |cffFFFFFFTraps |cff7EBF37on cursor.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff5EAB00Keypress","|cff00A8ABAuto","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFSet Strategy to use|cff7EBF37 Automatic Traps |cffFFFFFF on |cff7EBF37cursor.",	
				},
			},		
			{ 	name	= "Pet Passive Behaviour",
				tooltip	= PlayerHex.."toggle |cffFFFFFFPet Passive Behaviour|cff7EBF37.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cffE07000Target","|cff5EAB00Focus","|cff00A8ABMouse","|cffFFFFFFFollow"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFSet target to use|cff7EBF37 for your Pet. |cffFFFFFFIf invilaid it will attack Target|cff7EBF37.",	
				},
			},
			--[[ Cooldowns ]]
			{ 	name	= "A Murder of Crows",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic A Murder of Crows.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},				
			{ 	name	= "Stampede",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Stampede.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},
			{ 	name	= "Rapid Fire",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Rapid Fire.",
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
					value = 2,
					width = 70,
					tooltip = "|cff7EBF37Choose |cffFFFFFFTrinkets to use|cff7EBF37.",	
				},
			},		
			{ 	name	= "Agility Potion on Heroism",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Agility Potions|cff7EBF37 when |cffFFFFFFHeroism |cff7EBF37starts.",
				enable	= true,
			},	
		},
		--[[ Keybinds ]]
		hotkeys = {
			{	name	= "Traps",
				enable	= true,
				hotkeys	= {'ls'},
				tooltip	= "|cff7EBF37Assign |cffFFFFFFTrap Launcher |cff7EBF37Hold to throw your |cffFFFFFFExplosive and Ice |cff7EBF37traps on your mouse.",
			},
			{	name	= "Freezing Trap",
				enable	= true,
				hotkeys	= {'rs'},
				tooltip	= "|cff7EBF37Assign |cffFFFFFFFreezing Trap |cffFFFFFFHold "..PlayerHex.."to throw |cffFFFFFFFreezing Trap |cff7EBF37on your mouse.",
			},
			{	name	= "Stack Focus",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= "|cff7EBF37Assign |cffFFFFFFStack Focus |cff7EBF37Use this to keep high focus before burn phases.",
			},
			{	name	= "Pause",
				enable	= true,
				hotkeys	= {'ra'},
				tooltip	= "|cff7EBF37Assign |cffFFFFFFPause |cff7EBF37Will |cffFFFFFFStop Rotation, ClearTarget |cff7EBF37and |cffFFFFFFPet Stop Attack.",
			},
			{	name	= "Pet Move To Mouse",
				enable	= true,
				hotkeys	= {'rc'},
				tooltip	= "|cff7EBF37Assign |cffFFFFFFPet Move To Mouse |cff7EBF37Use this to |cffFFFFFFmove your pet "..PlayerHex.."toward your mouse.",
			},
			{	name	= "Set Focus",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= "|cff7EBF37Assign |cffFFFFFFMouseover Focus |cff7EBF37Set focus to mouseover.",
			},		

		},	
	}
	CODEMYLIFE_MARKSMANSHIP = PQI:AddRotation(CML_Marks_config)
end

--[[           ]] 	--[[]]	   --[[]]	--[[           ]]  	--[[]]	   --[[]]
--[[           ]] 	--[[]]	   --[[]]	--[[           ]] 	--[[]]	   --[[]]
--[[]]				--[[]]	   --[[]]	--[[]]	   --[[]]	 --[[]]	  --[[]]
--[[           ]] 	--[[]]	   --[[]]	--[[           ]] 	 --[[]]	  --[[]]
	   	   --[[]]	--[[]]	   --[[]]	--[[        ]]		  --[[]] --[[]]
--[[           ]] 	--[[           ]] 	--[[]]	  --[[]]	  --[[       ]]
--[[           ]] 	--[[           ]] 	--[[]]	   --[[]]	   --[[     ]]

--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Survival Hunter -----PQI_CodeMyLifeSurvival_Name_value-----------------------------------------------------------------------]]
if _MyClass == 3 and _Spec == 3 and CML_Surv_config == nil then
	PQIprefix = "PQI_CodeMyLifeSurvival_"
	_AoEModes = 3
	_RangeSpell = _ArcaneShot
	CML_Surv_config = {
		name	= "Survival",
		author	= "CodeMyLife",
		abilities = {
			{ 	name	= "Player Status", 
				tooltip	= "|cff7EBF37Enables |cffFFFFFFPlayer Bar.",
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
			{ 	name	= "Exhilaration",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFExhilaration |cff7EBF37on me.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 35,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to cast |cffFFFFFFExhilaration |cff7EBF37on me.",
				},
				newSection = true,
			},
			{ 	name	= "Healthstone",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFHealthstone|cff7EBF37.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFHealthstone|cff7EBF37.",
				},
			},	
			{ 	name	= "Deterrence",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFDeterrence|cff7EBF37.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 20,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFDeterrence|cff7EBF37.",
				},
			},	
			{ 	name	= "Feign Death",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFFeign Death|cff7EBF37.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 10,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFFeign Death|cff7EBF37.",
				},
			},	
			--[[ Utility ]]	
			{ 	name	= "Hunters Mark",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Hunter's Mark |cff7EBF37will use |cff7EBF37 when |cffFFFFFFout of combat after desired time(seconds).",
				enable	= true,
				widget	= { type = "numBox",
					min		= 0,
					max 	= 10,
					value	= 3,
					width 	= 70,
					step	= 1,
					tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Hunter's Mark |cff7EBF37will use |cff7EBF37 when |cffFFFFFFout of combat after desired time(seconds).",
				},
				newSection = true,
			},				
			{ 	name	= "Misdirection",
				tooltip	= "|cffFFFFFFMisdirection |cff7EBF37on |cffFFFFFFFocus or Pet |cff7EBF37when aggro on me.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff7EBF37Save Me","|cff00CC00Help Tank","|cff00CC00Always"},
					value = 1,
					width = 70,
					tooltip = "|cffFFFFFFSet |cff7EBF37 Misdirection |cffFFFFFFMode.",	
				},
			},	
			{ 	name	= "Active Aspects",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Aspects |cff7EBF37will use |cffFFFFFFTraveling Aspect|cff7EBF37 when |cffFFFFFFout of combat and moving.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 6,
					width 	= 70,
					max 	= 30,
					step	= 1,
					tooltip	= "|cffFFFFFFTime to wait before casting Traveling Aspect.",
				},
			},
			{ 	name	= "Masters Call",
				tooltip	= "|cffFFFFFFActive Master's Call |cff7EBF37on me|cff7EBF37.",
				enable	= false,
				newSection = true,
	
			},
			{ 	name	= "Active Pet Whistle",
				tooltip	= "|cffFFFFFFCall Pet Slot "..PlayerHex.."to use when we |cffFFFFFFWhistle|cff7EBF37.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff5EAB00Pet Slot 1","|cff5EAB00Pet Slot 2","|cff5EAB00Pet Slot 3","|cff5EAB00Pet Slot 4","|cff5EAB00Pet Slot 5"},
					value = 1,
					width = 70,
					tooltip = "|cffFFFFFFCall Pet Slot "..PlayerHex.."to use when we |cffFFFFFFWhistle|cff7EBF37.",	
				},
			},		
			{ 	name	= "Mend Pet",
				tooltip	= "|cffFFFFFFPet Health value "..PlayerHex.."to use |cffFFFFFFMend Pet|cff7EBF37.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 40,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFPet Health value "..PlayerHex.."to use |cffFFFFFFMend Pet|cff7EBF37.",
				},
			},		
			{ 	name	= "Fervor",
				tooltip	= "|cffFFFFFFCheck "..PlayerHex.."to activate |cffFFFFFFFervor.",
				enable	= true,
			},	
			{ 	name	= "Explosive Trap",
				tooltip	= PlayerHex.."toggle |cffFFFFFFTraps |cff7EBF37on cursor.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff5EAB00Keypress","|cff00A8ABAuto","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFSet Strategy to use|cff7EBF37 Automatic Traps |cffFFFFFF on |cff7EBF37cursor.",	
				},
				newSection = true,
			},
			{ 	name	= "Snakes Trap",
				tooltip	= PlayerHex.."toggle |cffFFFFFFTraps |cff7EBF37on cursor.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff5EAB00Keypress","|cff00A8ABAuto","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFSet Strategy to use|cff7EBF37 Automatic Traps |cffFFFFFF on |cff7EBF37cursor.",	
				},
			},	
			{ 	name	= "Ice Trap",
				tooltip	= PlayerHex.."toggle |cffFFFFFFTraps |cff7EBF37on cursor.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff5EAB00Keypress","|cff00A8ABAuto","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFSet Strategy to use|cff7EBF37 Automatic Traps |cffFFFFFF on |cff7EBF37cursor.",	
				},
			},		
			{ 	name	= "Pet Passive Behaviour",
				tooltip	= PlayerHex.."toggle |cffFFFFFFPet Passive Behaviour|cff7EBF37.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cffE07000Target","|cff5EAB00Focus","|cff00A8ABMouse","|cffFFFFFFFollow"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFSet target to use|cff7EBF37 for your Pet. |cffFFFFFFIf invilaid it will attack Target|cff7EBF37.",	
				},
			},
			--[[ Cooldowns ]]
			{ 	name	= "A Murder of Crows",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic A Murder of Crows.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},	
			{ 	name	= "Stampede",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Stampede.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},
			{ 	name	= "Rapid Fire",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Rapid Fire.",
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
			{ 	name	= "Agility Potion on Heroism",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Agility Potions|cff7EBF37 when |cffFFFFFFHeroism |cff7EBF37starts.",
				enable	= true,
			},			
			{ 	name	= "Debug",
				tooltip	= "|cff7EBF37Displays Rotation locally in chat.",
				enable	= false,
				widget = { type = 'select',
					values 	= {PlayerHex.."Success","|cffD90000Failed","|cffFFFFFFBoth"},
					value	= 1,
					width	= 70,
					tooltip	= "|cff7EBF37Select what spells you want to be shown in chat.",
				},
				newSection = true,
			},	
		},
		--[[ Keybinds ]]
		hotkeys = {
			{	name	= "Traps",
				enable	= true,
				hotkeys	= {'ls'},
				tooltip	= "|cff7EBF37Assign |cffFFFFFFTrap Launcher |cff7EBF37Hold to throw your |cffFFFFFFExplosive and Ice |cff7EBF37traps on your mouse.",
			},
			{	name	= "Freezing Trap",
				enable	= true,
				hotkeys	= {'rs'},
				tooltip	= "|cff7EBF37Assign |cffFFFFFFFreezing Trap |cffFFFFFFHold "..PlayerHex.."to throw |cffFFFFFFFreezing Trap |cff7EBF37on your mouse.",
			},
			{	name	= "Stack Focus",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= "|cff7EBF37Assign |cffFFFFFFStack Focus |cff7EBF37Use this to keep high focus before burn phases.",
			},
			{	name	= "Pause",
				enable	= true,
				hotkeys	= {'ra'},
				tooltip	= "|cff7EBF37Assign |cffFFFFFFPause |cff7EBF37Will |cffFFFFFFStop Rotation, ClearTarget |cff7EBF37and |cffFFFFFFPet Stop Attack.",
			},
			{	name	= "Pet Move To Mouse",
				enable	= true,
				hotkeys	= {'rc'},
				tooltip	= "|cff7EBF37Assign |cffFFFFFFPet Move To Mouse |cff7EBF37Use this to |cffFFFFFFmove your pet "..PlayerHex.."toward your mouse.",
			},
			{	name	= "Set Focus",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= "|cff7EBF37Assign |cffFFFFFFMouseover Focus |cff7EBF37Set focus to mouseover.",
			},
		},
	}
	CODEMYLIFE_SURVIVAL = PQI:AddRotation(CML_Surv_config)
end

--[[           ]]	--[[]]	   --[[]]	--[[]]	   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[  ]]   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[  ]]   --[[]]
--[[]]				--[[]]	   --[[]]	--[[    ]] --[[]]   --[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[    ]] --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[           ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[           ]]
--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[   		   ]]
--[[]]	   			--[[           ]]	--[[]]	 --[[  ]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	 --[[  ]]
--[[]]	   			--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]
if not HunterFunctions then
	HunterFunctions = true

	_AimedShot					= 19434
	_AMurderOfCrows				= 131894
	_ArcaneShot     			= 3044 
	_AspectOfTheCheetah			= 5118
	_AspectOfTheIronHawk		= 109260
	_AspectOfThePack   			= 13159 
	_Barrage					= 120360
	_BestialWrath				= 19574
	_BindingShot	 			= 109248 
	_BlackArrow	 				= 3674
	_CallPet1					= 883
	_CallPet2					= 83242
	_CallPet3					= 83243
	_CallPet4					= 83244
	_CallPet5					= 83245
	_Camouflage		  			= 51753 
	_ChimeraShot				= 53209
	_CobraShot		   			= 77767 
	_ConcussiveShot    			= 5116
	_CounterShot   				= 147362
	_Deterrence    				= 19263
	_DireBeast					= 120679
	_Disengage    				= 781
	_DismissPet    				= 2641 
	_DistractingShot			= 20736
	_EagleEye	     			= 6197 
	_ExplosiveShot   			= 53301 
	_FeignDeath   				= 5384 
	_Fervor						= 82726
	_Flare     					= 1543
	_FocusFire					= 82692
	_GlaiveToss    				= 117050 
	_HeartOfThePhoenix			= 55709
	_HuntersMark				= 1130 
	_KillCommand				= 34026
	_KillShot   				= 53351
	_LynxRush					= 120697
	_MastersCall				= 53271
	_MendPet    				= 136 
	_Misdirection				= 34477
	_MultiShot		   			= 2643
	_PowerShot					= 109259
	_RapidFire					= 3045
	_RevivePet			  		= 982 
	_ScareBeast					= 1513
	_ScatterShot	 			= 19503 
	_SerpentSting   			= 1978
	_SilencingShot				= 34490
	_Stampede    				= 121818 
	_SteadyShot					= 56641
	_TameBeast		   			= 1515 
	_TranquilizingShot			= 19801 
	_TrapLauncher  				= 77769 
	_TrapLauncherExplosive		= 82939
	_TrapLauncherFreezing		= 60192
	_TrapLauncherIce			= 82941
	_TrapLauncherSnakes			= 82948 
	_TrapExplosive 				= 13813 
	_TrapFreezing				= 1499
	_TrapIce	   				= 13809
	_TrapSnakes					= 34600 
	_WidowVenom	    			= 82654 
	-- Macros
	macros = { 
	    ["AoE"]    				= 1,  
	    ["ActiveCooldowns"]   	= false,
	    ["CallPet1Queue"]		= false,
		["CallPet2Queue"]		= false,
		["CallPet3Queue"]		= false,
		["CallPet4Queue"]		= false,
		["CallPet5Queue"]		= false,
	    ["Camouflage"]			= false,
		["ConcShotQueue"]		= false,
		["DisengageQueue"] 		= false, 
		["DismissPetQueue"]		= false,
		["DistractingShotQueue"]= false,	
		["ExplosiveTrapQueue"]	= false,
		["FreezingTrapQueue"]	= false,
		["IceTrapQueue"]		= false,
		["SnakesTrapQueue"]		= false,
		["Pause"]				= false,
		["ScatterQueue"]		= false,
		["StampedeQueue"]		= false,
		["WidowVenomQueue"] 	= false, 
	} 
	_Queues = {	
		[3]						= false,
		[_BindingShot]			= false,
		[_CallPet1] 			= false,
		[_CallPet2] 			= false,
		[_CallPet3] 			= false,
		[_CallPet4] 			= false,
		[_CallPet5] 			= false,
		[_ConcussiveShot] 		= false,
		[_DismissPet] 			= false,
		[_DistractingShot] 		= false,
		[_Flare]				= false,
		[_FocusFire]			= false,
		[_ScatterShot] 			= false,
		[_Stampede] 			= false,
		[_TranquilizingShot] 	= false,
		[_TrapLauncherExplosive]= false,
		[_TrapLauncherFreezing] = false,
		[_TrapLauncherIce] 		= false,
		[_TrapLauncherSnakes] 	= false,
		[_WidowVenom] 			= false,
	}
	function CML.Aspects(value)
		local _ActiveAspects = _G[PQIprefix.."ActiveAspects_enable"]
		local _ActiveAspectsValue = _G[PQIprefix.."ActiveAspects_value"]
		if GetUnitSpeed("player") > 0 then
			if IsRunning == nil then
				IsRunning = GetTime()
				IsStanding = nil
			end
		else
			if IsStanding == nil then
				IsStanding = GetTime()
				IsRunning = nil
			end
		end
		if IsRunning ~= nil and _ActiveAspects and value == 2 then
			if _ActiveAspectsValue < GetTime() - IsRunning then
				IsRunning = nil
				return true
			end
		end
		if IsStanding ~= nil and _ActiveAspects and value == 1 then
			if _ActiveAspectsValue < GetTime() - IsStanding then
				IsStanding = nil
				return true
			end
		end
	end	
	function CML.FocusFire()
		Stacks = select(4,UnitBuffID("player",19615))
		if Stacks == 5 then
			return true
		end
	end

	function CML.HuntersMark()
		if not MyTargetDelay or UnitGUID("target") ~= MyTargetGUID and UnitGUID("target") ~= nil then
			MyTargetGUID = UnitGUID("target")
			MyTargetDelay = GetTime()
		end
		if PQIprefix and MyTargetDelay and _G[PQIprefix.."HuntersMark_enable"] then
			if _G[PQIprefix.."HuntersMark_value"] < GetTime() - MyTargetDelay then
				MyTargetDelay = nil
				return true
			end
		end
	end

	function CML.KillCommand()
		if (CML.GetSpellCD(19574) > 0 and CML.GetSpellCD(19574) < 2) then
			DelayKC = GetTime() 
		end
		if DelayKC and DelayKC > GetTime() - 1 then
			return false
		end
		return true
	end

	function CML.Misdirection()
		local MisdirectionValue = _G[PQIprefix.."Misdirection_value"]
		if UnitIsUnit("player","target") ~= 1 then
			local MisdirectionTarget = nil
			if UnitExists("focus") and not UnitIsDeadOrGhost("focus") then
				MisdirectionTarget = "focus"
			elseif UnitExists("pet") and not UnitIsDeadOrGhost("pet") then
			    MisdirectionTarget = "pet"
			end	
		  	if UnitThreatSituation("player", "target") == 3 then
				if MisdirectionTarget ~= nil then
					ProbablyEngine.dsl.parsedTarget = MisdirectionTarget
					return true
				end
		  	end
		  	if UnitThreatSituation("player", "target") == 1 and MisdirectionValue == 2 then
				if MisdirectionTarget ~= nil then
					ProbablyEngine.dsl.parsedTarget = MisdirectionTarget
					return true
				end
		  	end
		  	if MisdirectionValue == 3 then
				if MisdirectionTarget ~= nil then
					ProbablyEngine.dsl.parsedTarget = MisdirectionTarget
					return true
				end
		  	end  	
		end
	end

	function CML.PetPassiveBehaviour()
		if macros["Pause"] == true then 
			RunMacroText("/petstopattack")
			PetFollow()
			return false
		end		
		if _G[PQIprefix.."PetPassiveBehaviour_enable"] and not PQI:IsHotkeys(_G[PQIprefix.."PetPassiveBehaviour_key"]) then
			local PetPassiveBehaviour = _G[PQIprefix.."PetPassiveBehaviour_value"]
			if PetPassiveBehaviour == 1 then
				PetAttack("target")
				return false
			elseif PetPassiveBehaviour == 2 then
				if UnitExists("focus") == 1 then
					PetAttack("focus") 
					return false
				else
					PetAttack("target")
					return false
				end
			elseif PetPassiveBehaviour == 3 then
				if UnitExists("mouseover") == 1 then
					PetAttack("mouseover") 
					return false
				else
					PetAttack("target")
					return false
				end
			elseif PetPassiveBehaviour == 4 then
				PetFollow()
				return false
			end
		end
	end

	function CML.LastSerpent()
		if LastSerpent and LastSerpent > GetTime() - 3 then
			return false
		end
		return true
	end

	function CML.SteadyFocus()
		if SteadyCount ~= nil and SteadyCount < 2 then
			return true
		end
	end

	function CML.SuperDuperMacroBeast()
		local FightTime = GetTime() - ProbablyEngine.module.player.combatTime
		if _G[PQIprefix.."RaidBurst_enable"] and ((_G[PQIprefix.."RaidBurst_value"] == 1 and UnitExists("boss1")) or _G[PQIprefix.."RaidBurst_value"] == 2) and FightTime < 14 then
			--print("it works")
			RunMacroText("/petattack")
			RunMacroText("/castsequence reset=14 Rapid Fire,Stampede,Dire Beast,Bestial Wrath,Kill Command,Glaive Toss,Arcane Shot,Arcane Shot,Arcane Shot,Arcane Shot,Arcane Shot,Kill Command,Arcane Shot,Arcane Shot,Arcane Shot,Cobra Shot")
			RunMacroText("/use Virmen's Bite")
			RunMacroText("/cast Berserking(Racial)")
			return false
		end
	end

	function CML.SuperDuperMacroTimer()
		local FightTime = GetTime() - ProbablyEngine.module.player.combatTime
		if _G[PQIprefix.."RaidBurst_enable"] and ((_G[PQIprefix.."RaidBurst_value"] == 1 and UnitExists("boss1")) or _G[PQIprefix.."RaidBurst_value"] == 2) and FightTime < 14 then
			return true
		end
	end	

	function CML.TrapExplosive()
		if _G[PQIprefix.."ExplosiveTrap_value"] == 2 then
			if UnitIsUnit("target","mouseover") == 1 then 
				_Queues[_TrapLauncherExplosive] = true 
				return true
			end
		end
	end
	function CML.TrapSnakes()
		if _G[PQIprefix.."SnakesTrap_value"] == 2 then
			if UnitIsUnit("target","mouseover") == 1 then 
				_Queues[_TrapLauncherSnakes] = true 
				return true
			end
		end
	end
	function CML.TrapIce()
		if _G[PQIprefix.."IceTrap_value"] == 2 then
			if UnitIsUnit("target","mouseover") == 1 then 
				_Queues[_TrapLauncherIce] = true 
				return true
			end
		end
	end
end

end