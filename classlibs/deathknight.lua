function CML.DeathknightStartup()

_RangeSpell = 45462
_HealingRangeSpell = 102694 -- First Aid

if _Spec == 1 then PQIprefix = "PQI_CodeMyLifeBlood_" Coolprefix = "PQI_CodeMyLifeCooldownsBlood_" end
if _Spec == 2 then PQIprefix = "PQI_CodeMyLifeFrost_" end
if _Spec == 3 then PQIprefix = "PQI_CodeMyLifeUnholy_" end


--[[           ]]	--[[         ]]		--[[           ]] 	
--[[           ]]	--[[          ]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]	--[[]]				
--[[]]				--[[]]	   --[[]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]		   	   --[[]]	
--[[   		   ]]	--[[          ]]	--[[           ]] 	
--[[   		   ]]	--[[         ]] 	--[[           ]] 	

if _Spec == 1 and CML_Cooldowns_Config == nil then
	Coolprefix = "PQI_CodeMyLifeCooldownsBlood_"
	CML_Cooldowns_Config = {
		name	= "CooldownsBlood",
		author	= "CodeMyLife",
		abilities = {
			--[[ Cooldowns ]]	
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
			{ 	name	= "Racials",
				tooltip	= PlayerHex.."Toggle Automatic Racials.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},	
			{ 	name	= "Professions CDs",
				tooltip	= PlayerHex.."Toggle Automatic Professions CDs.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},					
			{ 	name	= "Trinkets",
				tooltip	= PlayerHex.."Toggle Automatic Trinkets.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Both Active","|cffFFE100Both On CD","|cffD90000Disable"},
					value = 1,
					width = 70,
					tooltip = "|cff7EBF37Choose |cffFFFFFFTrinkets to use|cff7EBF37.",	
				},
			},		
			{ 	name	= "DPS Potion",
				tooltip	= PlayerHex.."Toggle Automatic Agility Potions when Heroism starts.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."On Boss","|cffFFFFFFOn Heroism","|cffFFDD00Never"},
					value = 1,
					width = 70,
					tooltip = "|cffFFFFFFSet way to use Potions.",	
				},
			},				
			{ 	name	= "Interrupt",
				tooltip	= PlayerHex.."Toggle Automatic Interrupt On Target/Mouseover/Focus.",
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
			{ 	name	= "Rune Tap",
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
		},
		--[[ Keybinds ]]
		hotkeys = {
			{	name	= "Death And Decay Key",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign Mouseover Death And Decay.",
			},	
			{	name	= "Pause",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= PlayerHex.."Assign Pause Will Stop Rotation and ClearTarget.",
			},
			{	name	= "Set Focus",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign Mouseover Focus Set focus to mouseover.",
			},	
		},
	}
	CODEMYLIFE_BLOOD = PQI:AddRotation(CML_Blood_config)
end	



--[[           ]]	--[[         ]]		--[[           ]] 	
--[[           ]]	--[[          ]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]	--[[]]				
--[[]]				--[[]]	   --[[]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]		   	   --[[]]	
--[[   		   ]]	--[[          ]]	--[[           ]] 	
--[[   		   ]]	--[[         ]] 	--[[           ]] 	

if _Spec == 2 and CML_Cooldowns_Config == nil then
	Coolprefix = "PQI_CodeMyLifeCooldownsFrost_"
	CML_Cooldowns_Config = {
		name	= "CooldownsFrost",
		author	= "CodeMyLife",
		abilities = {

			--[[ Cooldowns ]]
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
					tooltip = "|cffFFFFFFSet Treshold to use|cff7EBF37 Counter Shot |cffFFFFFF on |cff7EBF37Target/Mouseover/Focus.",	
				},
				newSection = true,
			},
		},
	}
	CODEMYLIFE_COOLDOWNS = PQI:AddRotation(CML_Cooldowns_Config)
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
		},
		--[[ Keybinds ]]
		hotkeys = {
			{	name	= "Death And Decay Key",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign Mouseover Death And Decay.",
			},	
			{	name	= "Pause",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= PlayerHex.."Assign Pause Will Stop Rotation and ClearTarget.",
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


--[[           ]]	--[[         ]]		--[[           ]] 	
--[[           ]]	--[[          ]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]	--[[]]				
--[[]]				--[[]]	   --[[]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]		   	   --[[]]	
--[[   		   ]]	--[[          ]]	--[[           ]] 	
--[[   		   ]]	--[[         ]] 	--[[           ]] 	

if _Spec == 3 and CML_Cooldowns_Config == nil then
	Coolprefix = "PQI_CodeMyLifeCooldownsUnholy_"
	CML_Cooldowns_Config = {
		name	= "CooldownsUnholy",
		author	= "CodeMyLife",
		abilities = {

			--[[ Cooldowns ]]
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
					tooltip = "|cffFFFFFFSet Treshold to use|cff7EBF37 Counter Shot |cffFFFFFF on |cff7EBF37Target/Mouseover/Focus.",	
				},
				newSection = true,
			},
		},
	}
	CODEMYLIFE_COOLDOWNS = PQI:AddRotation(CML_Cooldowns_Config)
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
		},
		--[[ Keybinds ]]
		hotkeys = {
			{	name	= "Death And Decay Key",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign Mouseover Death And Decay.",
			},	
			{	name	= "Pause",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= PlayerHex.."Assign Pause Will Stop Rotation and ClearTarget.",
			},
			{	name	= "Set Focus",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign Mouseover Focus Set focus to mouseover.",
			},	
			{	name	= "Pet Move To Mouse",
				enable	= true,
				hotkeys	= {'rc'},
				tooltip	= PlayerHex.."Assign Pet Move To Mouse Use this to move your pet toward your mouse.",
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
		[77575]					= false, -- Outbreak
		[50842]					= false, -- Pestilence

	}
end			

end