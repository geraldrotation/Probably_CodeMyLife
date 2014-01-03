function CML.DeathknightStartup()

_RangeSpell = 45462
_HealingRangeSpell = 102694 -- First Aid

if _Spec == 1 then PQIprefix = "PQI_CodeMyLifeBlood_" end
if _Spec == 2 then PQIprefix = "PQI_CodeMyLifeFrost_" end
if _Spec == 3 then PQIprefix = "PQI_CodeMyLifeUnholy_" end

--[[           ]]	--[[]]				--[[           ]]	--[[           ]]	--[[        ]]
--[[           ]]	--[[]]				--[[           ]]	--[[           ]]	--[[         ]]
--[[]]	   --[[]]	--[[]]				--[[]]	   --[[]]	--[[]]	   --[[]]	--[[]]    --[[]]
--[[         ]]		--[[]]				--[[]]	   --[[]]	--[[]]	   --[[]]	--[[]]	   --[[]]
--[[]]	   --[[]]	--[[]]				--[[]]	   --[[]]	--[[]]	   --[[]]	--[[]]	  --[[]]
--[[           ]]	--[[]]				--[[           ]]	--[[           ]]	--[[         ]]
--[[           ]] 	--[[           ]]	--[[           ]]	--[[           ]]	--[[        ]]
	
--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Blood DeathKnight -----PQI_CodeMyLifeBlood_Name_value-----------------------------------------------------------------------]]
if _Spec == 1 and CML_Blood_config == nil then
	PQIprefix = "PQI_CodeMyLifeBlood_"
	_AoEModes = 2
	CML_Blood_config = {
		name	= "Blood",
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
			{ 	name	= "Healthstone",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFF|cff33FF33Healthstone.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFF|cff33FF33Healthstone.",
				},
				newSection = true,
			},	
			{ 	name	= "AntiMagicShell",
				tooltip	= "|cffFFFFFFCheck "..PlayerHex.."to use this Cooldown.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use this Cooldown.",
				},
			},	
			{ 	name	= "Conversion",
				tooltip	= "|cffFFFFFFCheck "..PlayerHex.."to use this Cooldown.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use this Cooldown.",
				},
			},				
			{ 	name	= "DancingRuneWeapon",
				tooltip	= "|cffFFFFFFCheck "..PlayerHex.."to use this Cooldown.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use this Cooldown.",
				},
			},	
			{ 	name	= "EmpowerRuneWeapon",
				tooltip	= "|cffFFFFFFCheck "..PlayerHex.."to use this Cooldown.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use this Cooldown.",
				},
			},				
			{ 	name	= "IceboundFortitude",
				tooltip	= "|cffFFFFFFCheck "..PlayerHex.."to use this Cooldown.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use this Cooldown.",
				},
			},					
			{ 	name	= "VampiricBlood",
				tooltip	= "|cffFFFFFFCheck "..PlayerHex.."to use this Cooldown.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use this Cooldown.",
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
				newSection = true,
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
			{ 	name	= "Death And Decay",
				tooltip	= PlayerHex.."toggle |cffFFFFFFDeath And Decay "..PlayerHex.."on cursor.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Keypress","|cff00A8ABAuto","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFSet Strategy to use"..PlayerHex.." Automatic Death And Decay |cffFFFFFF on "..PlayerHex.."cursor.",	
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
			{	name	= "Death and Decay",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFMouseover Focus |cffff7d0aSet focus to mouseover.",
			},				
		},
	}
	CODEMYLIFE_BLOOD = PQI:AddRotation(CML_Blood_config)
end	

--[[           ]]	--[[           ]]	--[[           ]] 	--[[           ]]	--[[           ]]
--[[           ]]	--[[           ]]	--[[           ]] 	--[[           ]]	--[[           ]]
--[[]]	  			--[[]]	   --[[]]	--[[]]	   --[[]]	--[[]]				     --[[ ]]			   
--[[         ]]		--[[         ]]	    --[[]]	   --[[]]	--[[           ]]		 --[[ ]]		
--[[       	 ]]		--[[        ]]		--[[]]	   --[[]]			   --[[]]	 	 --[[ ]]				   
--[[]]				--[[]]	  --[[]]	--[[           ]]	--[[           ]]	 	 --[[ ]]				
--[[]] 				--[[]]	   --[[]]	--[[           ]]	--[[           ]]		 --[[ ]]		

--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Frost DeathKnight -----PQI_CodeMyLifeFrost_Name_value-----------------------------------------------------------------------]]
if _Spec == 2 and CML_Frost_config == nil then
	PQIprefix = "PQI_CodeMyLifeFrost_"
	_AoEModes = 2
	_RangeSpell = 55050
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
			{ 	name	= "Healthstone",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFF|cff33FF33Healthstone.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFF|cff33FF33Healthstone.",
				},
				newSection = true,
			},	
			{ 	name	= "AntiMagicShell",
				tooltip	= "|cffFFFFFFCheck "..PlayerHex.."to use this Cooldown.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use this Cooldown.",
				},
			},			
			{ 	name	= "IceboundFortitude",
				tooltip	= "|cffFFFFFFCheck "..PlayerHex.."to use this Cooldown.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use this Cooldown.",
				},
			},		
			{ 	name	= "PillarofFrost",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic PillarofFrost.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
				newSection = true,
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
				newSection = true,
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
			{ 	name	= "Death And Decay",
				tooltip	= PlayerHex.."toggle |cffFFFFFFDeath And Decay "..PlayerHex.."on cursor.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Keypress","|cff00A8ABAuto","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFSet Strategy to use"..PlayerHex.." Automatic Death And Decay |cffFFFFFF on "..PlayerHex.."cursor.",	
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
			{	name	= "Death and Decay",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFMouseover Focus |cffff7d0aSet focus to mouseover.",
			},				
		},
	}
	CODEMYLIFE_FROST = PQI:AddRotation(CML_Frost_config)
end	

--[[]]	   --[[]]	--[[]]	   --[[]]	--[[]]	   --[[]]	 --[[         ]] 	--[[]]				--[[]]	  --[[]]
--[[]]	   --[[]]	--[[  ]]   --[[]]	--[[]]	   --[[]]	--[[           ]] 	--[[]]				--[[]]	  --[[]]
--[[]]	   --[[]]	--[[  ]]   --[[]]	--[[           ]]	--[[]]	   --[[]]	--[[]]				   --[[    ]]		   
--[[]]	   --[[]]	--[[           ]]	 --[[         ]]	--[[]]	   --[[]]	--[[]]				   --[[    ]]
--[[]]	   --[[]]	--[[           ]]	--[[           ]]	--[[]]	   --[[]]	--[[]]			  		 --[[]] 
--[[           ]]	--[[]]	 --[[  ]]	--[[]]	   --[[]]	--[[           ]]	--[[           ]]		 --[[]]	
--[[           ]]	--[[]]	   --[[]]	--[[]]	   --[[]]	 --[[         ]]	--[[           ]]		 --[[]]
	
--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- DeathKnight Unholy -----PQI_CodeMyLifeUnholy_Name_value-----------------------------------------------------------------------]]
if _Spec == 3 and CML_Unholy_config == nil then
	PQIprefix = "PQI_CodeMyLifeUnholy_"
	_AoEModes = 2
	_RangeSpell = 55050
	CML_Unholy_config = {
		name	= "Unholy",
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
			{ 	name	= "Healthstone",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFF|cff33FF33Healthstone.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFF|cff33FF33Healthstone.",
				},
				newSection = true,
			},	
			{ 	name	= "AntiMagicShell",
				tooltip	= "|cffFFFFFFCheck "..PlayerHex.."to use this Cooldown.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use this Cooldown.",
				},
			},			
			{ 	name	= "IceboundFortitude",
				tooltip	= "|cffFFFFFFCheck "..PlayerHex.."to use this Cooldown.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use this Cooldown.",
				},
			},				
			{ 	name	= "Raise Dead",
				tooltip	= "|cffFFFFFFCheck "..PlayerHex.."to use when we |cffFFFFFFRaise Dead.",
				enable	= true,
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
			{ 	name	= "UnholyFrenzy",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic UnholyFrenzy.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
				newSection = true,
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
				newSection = true,
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
			{ 	name	= "Death And Decay",
				tooltip	= PlayerHex.."toggle |cffFFFFFFDeath And Decay "..PlayerHex.."on cursor.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Keypress","|cff00A8ABAuto","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFSet Strategy to use"..PlayerHex.." Automatic Death And Decay |cffFFFFFF on "..PlayerHex.."cursor.",	
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
			{	name	= "Death And Decay Key",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFMouseover Focus |cffff7d0aSet focus to mouseover.",
			},		
			{	name	= "Pet Move To Mouse",
				enable	= true,
				hotkeys	= {'rc'},
				tooltip	= "|cff7EBF37Assign |cffFFFFFFPet Move To Mouse |cff7EBF37Use this to |cffFFFFFFmove your pet "..PlayerHex.."toward your mouse.",
			},		
		},
	}
	CODEMYLIFE_UNHOLY = PQI:AddRotation(CML_Unholy_config)
end

--[[           ]]	--[[]]	   --[[]]	--[[]]	   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[  ]]   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[  ]]   --[[]]
--[[]]				--[[]]	   --[[]]	--[[    ]] --[[]]   --[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[    ]] --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[           ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[           ]]
--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[   		   ]]
--[[]]	   			--[[           ]]	--[[]]	 --[[  ]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	 --[[  ]]
--[[]]	   			--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]
if not DeathknightFunctions then
	DeathknightFunctions = true

	function CML.CanTap()
		local RuneCount = 0
		for i = 1,6 do
			RuneCount = RuneCount + GetRuneCount(i) 
		end
		if RuneCount < 3 then
			return true
		end
	end

	function CML.DeathAndDecay()
		if _G[PQIprefix.."DeathAndDecay_enable"] and _G[PQIprefix.."DeathAndDecay_value"] == 2 then
			if UnitIsUnit("target","mouseover") == 1 then 
				_Queues[43265] = true 
				return false
			end
		end
	end

	function CML.PetMove()
		if UnitExists("pet") then
			if UnitExists("mouseover") == 1 then
				PetAttack("mouseover") 
				return false
			end
			if not GetCurrentKeyBoardFocus() then
				PetMoveTo()
				CameraOrSelectOrMoveStart() 
				CameraOrSelectOrMoveStop() 
			end
			return false
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

	macros = { 
	    ["ActiveCooldowns"]   		= false, 
	    ["AoE"]    					= 1,  
	    ["Pause"]					= false,
	} 
	_Queues = {	
		[6]						= false,
		[43265]					= false, -- Death and Decay
		[49576]					= false, -- Death Grip
		[46584]					= false, -- Raise Dead 
	}
end			

end