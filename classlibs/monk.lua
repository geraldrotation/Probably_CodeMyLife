function CML.MonkStartup()

if _Spec == 1 then PQIprefix = "PQI_CodeMyLifeBrewmaster_" Coolprefix = "PQI_CodeMyLifeCooldownsBrew_" UnitDispel = {'Disease','Poison'} end
if _Spec == 2 then PQIprefix = "PQI_CodeMyLifeMistweaver_" Coolprefix = "PQI_CodeMyLifeCooldownsMist_" UnitDispel = {'Disease','Poison','Magic'} end
if _Spec == 3 then PQIprefix = "PQI_CodeMyLifeWindwalker_" Coolprefix = "PQI_CodeMyLifeCooldownsWind_" UnitDispel = {'Disease','Poison'} end

_HealingRangeSpell = 102694 -- First Aid

--[[           ]]	--[[           ]]	--[[           ]]	--[[]] 	   --[[]]
--[[           ]]	--[[           ]]	--[[           ]]	--[[]] 	   --[[]]	
--[[]]	   --[[]]	--[[]]	   --[[]]	--[[]]				--[[ ]]   --[[ ]]
--[[         ]]		--[[           ]]	--[[           ]]	--[[           ]]
--[[]]	   --[[]]	--[[        ]]		--[[]]				--[[           ]]
--[[           ]]	--[[]]	  --[[]]	--[[           ]]	--[[ ]]   --[[ ]]
--[[           ]]	--[[]]	   --[[]]	--[[           ]]	 --[[]]   --[[]]
	
--[[           ]]	--[[         ]]		--[[           ]] 	
--[[           ]]	--[[          ]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]	--[[]]				
--[[]]				--[[]]	   --[[]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]		   	   --[[]]	
--[[   		   ]]	--[[          ]]	--[[           ]] 	
--[[   		   ]]	--[[         ]] 	--[[           ]] 	

if _Spec == 1 and CML_Cooldowns_Config == nil then
	Coolprefix = "PQI_CodeMyLifeCooldownsBrew_"
	CML_Cooldowns_Config = {
		name	= "CooldownsBrew",
		author	= "CodeMyLife",
		abilities = {
			--[[ Cooldowns ]]
			{ 	name	= "Healing Shperes",
				tooltip	= PlayerHex.."toggle |cffFFFFFFHealing Shperes "..PlayerHex.."on cursor.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Keypress","|cff00A8ABAuto","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFSet Strategy to use"..PlayerHex.." Automatic Healing Shperes |cffFFFFFF on "..PlayerHex.."cursor.",	
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
					tooltip = "|cffFFFFFFSet Treshold to use|cff7EBF37 Counter Shot |cffFFFFFF on |cff7EBF37Target/Mouseover/Focus.",	
				},
				newSection = true,
			},
		},
	}
	CODEMYLIFE_COOLDOWNS = PQI:AddRotation(CML_Cooldowns_Config)
end
		
--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Monk Brewmaster -----PQI_CodeMyLifeBrewmaster_Name_value-----------------------------------------------------------------------]]

if _Spec == 1 and CML_Brew_config == nil then
	PQIprefix = "PQI_CodeMyLifeBrewmaster_"
	_AoEModes = 2
	_RangeSpell = 100787
	CML_Brew_config = {
		name	= "Brewmaster",
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
			{ 	name	= "AoE Helper",
				tooltip	= PlayerHex.."Enables AoE Helper.",
				enable	= false,
				widget = { type = 'select',
					values 	= {PlayerHex.."Forced","|cffD90000Stop"},
					value	= 1,
					width	= 70,
					tooltip	= PlayerHex.."Select how you want the profile to react when you use mouseover ground effects spells.",
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
	CODEMYLIFE_BREWMASTER = PQI:AddRotation(CML_Brew_config)
end
	
--[[]]     --[[]]	--[[           ]]	--[[           ]]	--[[           ]]
--[[ ]]   --[[ ]] 		 --[[ ]]		--[[           ]]	--[[           ]]
--[[           ]] 		 --[[ ]]		--[[]]	   				 --[[ ]]
--[[           ]]		 --[[ ]]		--[[           ]]		 --[[ ]]
--[[]] 	   --[[]]		 --[[ ]]				   --[[]]		 --[[ ]]
--[[]]	   --[[]]		 --[[ ]]		--[[           ]]		 --[[ ]]
--[[]]	   --[[]]	--[[           ]]	--[[           ]]		 --[[ ]]
	
--[[           ]]	--[[         ]]		--[[           ]] 	
--[[           ]]	--[[          ]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]	--[[]]				
--[[]]				--[[]]	   --[[]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]		   	   --[[]]	
--[[   		   ]]	--[[          ]]	--[[           ]] 	
--[[   		   ]]	--[[         ]] 	--[[           ]] 	

if _Spec == 2 and CML_Cooldowns_Config == nil then
	Coolprefix = "PQI_CodeMyLifeCooldownsMist_"
	CML_Cooldowns_Config = {
		name	= "CooldownsMist",
		author	= "CodeMyLife",
		abilities = {
			--[[ Cooldowns ]]
			{ 	name	= "Healing Shperes",
				tooltip	= PlayerHex.."toggle |cffFFFFFFHealing Shperes "..PlayerHex.."on cursor.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Keypress","|cff00A8ABAuto","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFSet Strategy to use"..PlayerHex.." Automatic Healing Shperes |cffFFFFFF on "..PlayerHex.."cursor.",	
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
					tooltip = "|cffFFFFFFSet Treshold to use|cff7EBF37 Counter Shot |cffFFFFFF on |cff7EBF37Target/Mouseover/Focus.",	
				},
				newSection = true,
			},
		},
	}
	CODEMYLIFE_COOLDOWNS = PQI:AddRotation(CML_Cooldowns_Config)
end
		
--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Monk Mistweaver -----PQI_CodeMyLifeMistweaver_Name_value-----------------------------------------------------------------------]]

if _Spec == 2 and CML_Mist_config == nil then
	PQIprefix = "PQI_CodeMyLifeMistweaver_"
	_AoEModes = 2
	_RangeSpell = 100787
	CML_Mist_config = {
		name	= "Mistweaver",
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
			{ 	name	= "AoE Helper",
				tooltip	= PlayerHex.."Enables AoE Helper.",
				enable	= false,
				widget = { type = 'select',
					values 	= {PlayerHex.."Forced","|cffD90000Stop"},
					value	= 1,
					width	= 70,
					tooltip	= PlayerHex.."Select how you want the profile to react when you use mouseover ground effects spells.",
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
	CODEMYLIFE_MISTWEAVER = PQI:AddRotation(CML_Mist_config)
end

--[[]] 	   --[[]]	--[[           ]]	--[[]]	   --[[]]	--[[         ]]
--[[]] 	   --[[]]		  --[[]]		--[[  ]]   --[[]]	--[[          ]]
--[[ ]]   --[[ ]]		  --[[]]		--[[    ]] --[[]]	--[[]]	   --[[]]
--[[           ]]		  --[[]]		--[[           ]]	--[[]]	   --[[]]
--[[           ]]		  --[[]]		--[[   		   ]]	--[[]]	   --[[]]
--[[ ]]   --[[ ]]		  --[[]]		--[[]]	 --[[  ]]	--[[          ]]
 --[[]]   --[[]]	--[[           ]]	--[[]]	   --[[]]	--[[         ]]

--[[           ]]	--[[         ]]		--[[           ]] 	
--[[           ]]	--[[          ]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]	--[[]]				
--[[]]				--[[]]	   --[[]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]		   	   --[[]]	
--[[   		   ]]	--[[          ]]	--[[           ]] 	
--[[   		   ]]	--[[         ]] 	--[[           ]] 	

if _Spec == 3 and CML_Cooldowns_Config == nil then
	Coolprefix = "PQI_CodeMyLifeCooldownsWind_"
	CML_Cooldowns_Config = {
		name	= "CooldownsWind",
		author	= "CodeMyLife",
		abilities = {
			--[[ Cooldowns ]]
			{ 	name	= "Invoke Xuen",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Invoke Xuen.",
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
		
--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Rogue Windwalker -----PQI_CodeMyLifeWindwalker_Name_value-----------------------------------------------------------------------]]

if _Spec == 3 and CML_Wind_config == nil then
	PQIprefix = "PQI_CodeMyLifeWindwalker_"
	_AoEModes = 2
	_RangeSpell = 100787
	CML_Wind_config = {
		name	= "Windwalker",
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
			{ 	name	= "AoE Helper",
				tooltip	= PlayerHex.."Enables AoE Helper.",
				enable	= false,
				widget = { type = 'select',
					values 	= {PlayerHex.."Forced","|cffD90000Stop"},
					value	= 1,
					width	= 70,
					tooltip	= PlayerHex.."Select how you want the profile to react when you use mouseover ground effects spells.",
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
			{ 	name	= "Legacy Of The Emperor",
				tooltip	= PlayerHex.."Toggle Automatic Legacy of The Emperor.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Active","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose Legacy of The Emperor setting.",	
				},
				newSection = true,
			},				
			{ 	name	= "Legacy Of The White Tiger",
				tooltip	= PlayerHex.."Toggle Automatic Legacy of The White Tiger.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Active","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose Legacy of The White Tiger setting.",	
				},
			},		
			{ 	name	= "Fortifying Brew",
				tooltip	= PlayerHex.."Toggle Automatic Fortifying Brew.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 65,
					width 	= 70,
					step	= 5,
					tooltip	= PlayerHex.."Choose halth level to use Fortifying Brew.",
				},
				newSection = true,
			},	
			{ 	name	= "Touch Of Karma",
				tooltip	= PlayerHex.."Toggle Automatic Touch Of Karma.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 65,
					width 	= 70,
					step	= 5,
					tooltip	= PlayerHex.."Choose halth level to use Touch Of Karma.",
				},
			},
			{ 	name	= "Expel Harm",
				tooltip	= PlayerHex.."Toggle Automatic Expel Harm.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 35,
					width 	= 70,
					step	= 5,
					tooltip	= PlayerHex.."Choose halth level to use Expel Harm.",
				},
			},	
		},
		--[[ Keybinds ]]
		hotkeys = {
			{	name	= "Healing Spheres",
				enable	= true,
				hotkeys	= {'ls'},
				tooltip	= PlayerHex.."Assign Healing Spheres under cursor.",
			},
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
	CODEMYLIFE_WINDWALKER = PQI:AddRotation(CML_Wind_config)
end	


--[[           ]]	--[[]]	   --[[]]	--[[]]	   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[  ]]   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[  ]]   --[[]]
--[[]]				--[[]]	   --[[]]	--[[    ]] --[[]]   --[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[    ]] --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[           ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[           ]]
--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[   		   ]]
--[[]]	   			--[[           ]]	--[[]]	 --[[  ]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	 --[[  ]]
--[[]]	   			--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]
if not MonkFunctions then
	MonkFunctions = true
	macros = { 
	    ["ActiveCooldowns"]   	= false, 
	    ["AoE"]    				= 1,  
	    ["Pause"]				= false,
	} 
	_Queues = {	
		[10]					= false,
		[116095]				= false, -- Disable
		[113656]				= false, -- Fist of Fury
		[119381]				= false, -- Leg Sweep
		[113656]				= false, -- Fist of Fury
		[101545]				= false, -- Flying Serpent Kick
		[115460]				= false, -- Healing Sphere

	}

	SLASH_FISTS1 = "/fists"
	function SlashCmdList.FISTS(msg, editbox)
		if not macros["FistOfFury"] then
			xrn:message(PlayerHex.."Fists Of Fury Active.")
			macros["FistOfFury"] = true
		elseif macros["FistOfFury"] then
			xrn:message("\124cFFEB1B00Fists Of Fury Inactive.")
			macros["FistOfFury"] = false
		end
	end

	function HealingSpheresPower()
		if PQIprefix and UnitExists("mouseover") and UnitCanCooperate("player","mouseover")
			--and 
			--CML.GetHP("mouseover") <= _G[PQIprefix.."HealingSpheres_value"] 
			then
			print("mouahaha")
			return true
		end
	end

end

end