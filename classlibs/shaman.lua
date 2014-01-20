function CML.ShamanStartup()

if _Spec == 1 then PQIprefix = "PQI_CodeMyLifeElemental_" UnitDispel = {'Curse'} _DPSPotion = 105702 end
if _Spec == 2 then PQIprefix = "PQI_CodeMyLifeEnhancement_" UnitDispel = {'Curse'} end
if _Spec == 3 then PQIprefix = "PQI_SedsRestoration_" UnitDispel = {'Curse','Magic'} _DPSPotion = 105702 end

_HealingRangeSpell = 8004 -- Healing Surge

--[[           ]]	--[[]]				--[[           ]]
--[[           ]]	--[[]]				--[[           ]]
--[[]]				--[[]]				--[[]]
--[[           ]]	--[[]]				--[[           ]]
--[[]]				--[[]]				--[[]]
--[[           ]]	--[[]]				--[[           ]]
--[[           ]] 	--[[           ]]	--[[           ]]

--[[           ]]	--[[         ]]		--[[           ]] 	
--[[           ]]	--[[          ]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]	--[[]]				
--[[]]				--[[]]	   --[[]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]		   	   --[[]]	
--[[   		   ]]	--[[          ]]	--[[           ]] 	
--[[   		   ]]	--[[         ]] 	--[[           ]] 	

if _Spec == 1 and CML_Cooldowns_Config == nil then
	Coolprefix = "PQI_CodeMyLifeCooldownsEle_"

	CML_Cooldowns_Config = {
		name	= "CooldownsEle",
		author	= "CodeMyLife",
		abilities = {
			--[[ Cooldowns ]]
			{ 	name	= "Earthquake",
				tooltip	= PlayerHex.."Toggle Earthquake on cursor.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff5EAB00Keypress","|cff00A8ABAuto","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Set Strategy to use Automatic Earthquake on cursor.",	
				},
			},
			{ 	name	= "Ascendance",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Ascendance.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
				newSection = true,
			},
			{ 	name	= "AncestralSwiftness",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Ancestral Swiftness.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},
			{ 	name	= "ElementalMastery",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Elemental Mastery.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},	
			{ 	name	= "Fire Elemental Totem",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Racials.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},	
			{ 	name	= "Racials",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Racials.",
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
					values = {PlayerHex.."On Boss","|cffFFBF00On Heroism","|cffD90000Never"},
					value = 1,
					width = 70,
					tooltip = "|cffFFFFFFSet way to use|cff7EBF37 Potions.",	
				},
			},				
			{ 	name	= "Interrupt",
				tooltip	= "|cff7EBF37Toggle |cffFFFFFFAutomatic Counter Shot |cff7EBF37On target.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Random","|cff00CC0030","|cffFFFFFF0"},
					value = 1,
					width = 70,
					tooltip = "|cffFFFFFFSet Treshold to use Interrupt on Target/Mouseover/Focus.",	
				},
				newSection = true,
			},
		},
	}
	CODEMYLIFE_COOLDOWNS = PQI:AddRotation(CML_Cooldowns_Config)
end


--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Elemental Shaman -----PQI_CodeMyLifeElemental_Name_value-----------------------------------------------------------------------]]
if _Spec == 1 and CML_Ele_config == nil then
	PQIprefix = "PQI_CodeMyLifeElemental_"
	_AoEModes = 3
	_RangeSpell = 403
	CML_Ele_config = {
		name	= "Elemental",
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
            {   name    = "Multi Dotting",
                tooltip = PlayerHex.."Dotting on Mouse Over/focus/multi boss unit.",
                enable  = true,
                widget 	= { type = 'select',
                    values 	= {"|cff0DFF00All Targets","|cffFFE100My Targets","|cffD90000Disable"},
                    value 	= 2,
                    width 	= 70,
                    tooltip = "|cffFFFFFFChoose desired Multi Dotting Options.|cff0DFF00All Targets will dot as much targets as it can find.|cffFFE100My Targets will use Mouseover/Focus/PetTarget and bosses.|cffD90000Disable will never use Multi Dotting.",    
                },    
                newSection = true,
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
			{ 	name	= "Shamanistic Rage",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFF|cff33FF33Shamanistic Rage.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 40,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFF|cff33FF33Shamanistic Rage.",
				},
			},			
			{ 	name	= "Healing Surge",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFHealing Surge.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 40,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFHealing Surge.",
				},
			},	
			{ 	name	= "Healing Stream Totem",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFHealing Stream Totem.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 40,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFHealing Stream Totem.",
				},
			},		
			{ 	name	= "Healing Tide Totem",
				tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFHealing Tide Totem on 4 targets.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 40,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value "..PlayerHex.."to use |cffFFFFFFHealing Tide Totem on 4 targets.",
				},
			},				
		},
		--[[ Keybinds ]]
		hotkeys = {			
			{	name	= "Earthquake Key",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign Earthquake to mouseover.",
			},	
			{	name	= "Pause",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= PlayerHex.."Assign Pause, Will Stop Rotation.",
			},
			{	name	= "Set Focus",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign Mouseover Focus Set focus to mouseover.",
			},		
		},
	}
	CODEMYLIFE_ELEMENTAL = PQI:AddRotation(CML_Ele_config)
end




--[[           ]]	--[[]]	   --[[]]	--[[]]	   --[[]]		  --[[]]		--[[]]	   --[[]]	--[[   		   ]]	--[[           ]]		
--[[           ]]	--[[  ]]   --[[]]	--[[]]	   --[[]]		 --[[  ]] 		--[[  ]]   --[[]]	--[[   		   ]]	--[[           ]]
--[[]]				--[[    ]] --[[]]	--[[]]	   --[[]]	    --[[    ]]		--[[    ]] --[[]]	--[[]]				--[[]]
--[[           ]]	--[[           ]]	--[[           ]]	   --[[      ]] 	--[[           ]]	--[[]]				--[[           ]]
--[[]]				--[[   		   ]]	--[[]]	   --[[]]	  --[[        ]]	--[[   		   ]]	--[[]]				--[[]]
--[[           ]]	--[[]]	 --[[  ]]	--[[]]	   --[[]]	 --[[]]    --[[]]	--[[]]	 --[[  ]]	--[[   		   ]]	--[[           ]]
--[[           ]] 	--[[]]	   --[[]]	--[[]]	   --[[]]	--[[]]      --[[]]	--[[]]	   --[[]]	--[[   		   ]]	--[[           ]]

--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Enhancement Shaman -----PQI_CodeMyLifeEnhancement_Name_value-----------------------------------------------------------------------]]
if _Spec == 2 and CML_Enhance_config == nil then
	PQIprefix = "PQI_CodeMyLifeEnhancement_"
	_AoEModes = 2
	_RangeSpell = 73899
	CML_Enhance_config = {
		name	= "Enhancement",
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
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic Trinkets|cffff7d0a.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Both Active","|cffFFE100Both On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = PlayerHex.."Choose |cffFFFFFFTrinkets to use|cffff7d0a.",	
				},
			},		
			{ 	name	= "DPS Potion On Heroism",
				tooltip	= PlayerHex.."toggle Automatic DPS Potionsa when Heroism starts.",
				enable	= true,
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
		},
	}
	CODEMYLIFE_ENHANCEMENT = PQI:AddRotation(CML_Enhance_config)
end	

--[[           ]]	--[[           ]]	--[[           ]]	--[[           ]]	--[[           ]]
--[[           ]]	--[[           ]]	--[[           ]]	--[[           ]]	--[[           ]]
--[[]]	   --[[]]	--[[]]				--[[]]					 --[[ ]]		--[[]]	   --[[]]
--[[           ]]	--[[           ]]	--[[           ]]		 --[[ ]]		--[[]]	   --[[]]
--[[        ]]		--[[]]						   --[[]]		 --[[ ]]		--[[]]	   --[[]]
--[[]]	  --[[]]	--[[           ]]	--[[           ]]		 --[[ ]]		--[[           ]]
--[[]]	   --[[]]	--[[           ]] 	--[[           ]]		 --[[ ]]		--[[           ]]

--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Restoration Shaman -----PQI_CodeMyLifeRestoration_Name_value-----------------------------------------------------------------------]]
if _Spec == 3 and CML_Resto_config == nil then
	PQIprefix = "PQI_SedsRestoration_"
	_AoEModes = 2
	_RangeSpell = 403
	CML_Resto_config = {
		name	= "Restoration",
		author	= "Seds",
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
			{ 	name	= "Chain Heal",
				tooltip	= PlayerHex.."toggle |cffFFFFFFChain Heal hp %",
				enable	= true,
				widget = { type = 'numBox',
					value = 90,
					width = 70,
					step	= 5,
					tooltip = PlayerHex.."Choose |cffFFFFFFTrinkets to use|cffff7d0a.",	
				},
			},	
			{ 	name	= "Healing Surge",
				tooltip	= PlayerHex.."toggle |cffFFFFFFHealing Surge hp %",
				enable	= true,
				widget = { type = 'numBox',
					value = 50,
					width = 70,
					step	= 5,
					tooltip = PlayerHex.."|cffFFFFFFHealing Surge hp %.",	
				},
			},
			{ 	name	= "Greater Healing Wave",
				tooltip	= PlayerHex.."toggle |cffFFFFFFGreater Healing Wave hp %",
				enable	= true,
				widget = { type = 'numBox',
					value = 50,
					width = 60,
					step	= 5,
					tooltip = PlayerHex.."|cffFFFFFFGreater Healing Wave %.",	
				},
			},
			{ 	name	= "Healing Wave",
				tooltip	= PlayerHex.."toggle |cffFFFFFFHealing Wave hp %",
				enable	= true,
				widget = { type = 'numBox',
					value = 90,
					width = 60,
					step	= 5,
					tooltip = PlayerHex.."|cffFFFFFFHealing Wave %.",	
				},
			},
			{ 	name	= "Riptide",
				tooltip	= PlayerHex.."toggle |cffFFFFFFRiptide %",
				enable	= true,
				widget = { type = 'numBox',
					value = 80,
					width = 60,
					step	= 5,
					tooltip = PlayerHex.."|cffFFFFFFRiptide %.",	
				},
			},		
			{ 	name	= "DPS Potion on Heroism",
				tooltip	= PlayerHex.."toggle |cffFFFFFFAutomatic DPS Potions|cffff7d0a when |cffFFFFFFHeroism |cffff7d0astarts.",
				enable	= true,
			},			
		},
		--[[ Keybinds ]]
		hotkeys = {
			{	name	= "Pause",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFPause |cffff7d0aWill |cffFFFFFFStop Rotation, ClearTarget |cffff7d0aand |cffFFFFFFPet Stop Attack.",
			},
			{	name	= "Spiritwalker's Grace",
				enable	= true,
				hotkeys	= {'rc'},
				tooltip	= PlayerHex.."Use |cffFFFFFFMouseover Focus |cffff7d0aSpiritwalker's Grace.",
			},	
			{	name	= "Spirit link",
				enable	= true,
				hotkeys	= {'rs'},
				tooltip	= PlayerHex.."Use |cffFFFFFFSpirit link",
			},

			{	name	= "Totemic Projection",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= PlayerHex.."Use |cffFFFFFFTotemic Projection",
			},
			
			{	name	= "Healing Tide Totem",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= PlayerHex.."Use |cffFFFFFFHealing Tide Totem",
			},

			{	name	= "Set Focus",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFMouseover Focus |cffff7d0aSet focus to mouseover.",
			},					
		},
	}
	CODEMYLIFE_RESTORATION = PQI:AddRotation(CML_Resto_config)
end





--[[           ]]	--[[]]	   --[[]]	--[[]]	   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[  ]]   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[  ]]   --[[]]
--[[]]				--[[]]	   --[[]]	--[[    ]] --[[]]   --[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[    ]] --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[           ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[           ]]
--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[   		   ]]
--[[]]	   			--[[           ]]	--[[]]	 --[[  ]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	 --[[  ]]
--[[]]	   			--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]
if not ShamanFunctions then
	ShamanFunctions = true

	function CML.Magmabusive()
	 	if ProbablyEngine.module.player.shouldproject and ProbablyEngine.module.player.shouldproject >= GetTime() - 10 then
	 		if UnitIsUnit("target","mouseover") then
	 			return true
	 		end
		end	
	end

	function CML.Earthquake()
		if _G[PQIprefix.."Earthquake_enable"] and _G[PQIprefix.."Earthquake_value"] == 2 then
			if UnitIsUnit("target","mouseover") == 1 then 
				_Queues[61882] = true 
				return false
			else 
				_Queues[61882] = false 
			end
		end
	end

	function  CML.EarthShield()
		CEarthShield = false
		for i=1, #nNova do	
			if UnitBuffID(nNova[i].unit, 974)
			  and (select(7, UnitBuffID(nNova[i].unit, 974, "PLAYER")) - GetTime() > 1 
			  or select(4, UnitBuffID(nNova[i].unit, 974, "PLAYER")) > 1)
			  and (UnitThreatSituation(nNova[i].unit) == 3 or not UnitAffectingCombat(nNova[i].unit)) then
				CEarthShield = true
			end
		end
		if not CEarthShield then
			if #nNova > 1 then
				for i=1, #nNova do
					if UnitThreatSituation(nNova[i].unit) == 3 and not UnitBuffID(nNova[i].unit, 52127)
					  and nNova[i].role == "TANK" or nNova[i].role == "NONE" then
					  	ProbablyEngine.dsl.parsedTarget = nNova[i].unit
						return true
					end
				end
			end
		end	
	end	

	macros = { 
	    ["ActiveCooldowns"]   		= false, 
	    ["ActiveHealing"]			= false,
	    ["AoE"]    					= 1,     
	    ["Pause"]					= false, 
	} 
	_Queues = {	
		[7]						= false,
		[307]					= false, -- Purge
		[61882]					= false, -- Earthquake
		[73920]					= false, -- Healing Rain
		[51490]					= false, -- Thunderstorm
		[51485]					= false, -- EarthGrab Totem
		[2894]					= false, -- Fire Elemental Totem
		[2062]					= false, -- Earth Elemental Totem
		[76780]					= false, -- Bind Elemental
		[51514]					= false, -- Hex
		[36936]					= false, -- Totemic Recall
		[98008]					= false, -- Spirit link


	}

end


end