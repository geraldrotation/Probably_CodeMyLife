function CML.WarlockStartup()
	
if _Spec == 1 then PQIprefix = "PQI_CodeMyLifeAffliction_" end
if _Spec == 2 then PQIprefix = "PQI_CodeMyLifeDemonology_" end
if _Spec == 3 then PQIprefix = "PQI_CodeMyLifeDestruction_" end


_HealingRangeSpell = 102694 -- First Aid

	  --[[]]		--[[           ]]	--[[           ]]	--[[]]				--[[           ]]
     --[[  ]]		--[[           ]]	--[[           ]]	--[[]]				--[[           ]]
    --[[    ]] 		--[[]]				--[[]]				--[[]]					 --[[ ]]
   --[[      ]] 	--[[           ]]	--[[           ]]	--[[]]					 --[[ ]]
  --[[        ]]	--[[           ]]	--[[           ]]	--[[]]					 --[[ ]]
 --[[]]    --[[]]	--[[]]				--[[]]				--[[           ]]	--[[           ]]
--[[]]      --[[]]	--[[]]				--[[]]				--[[           ]]	--[[           ]]

--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Affliction Warlock -----PQI_CodeMyLifeAffliction_Name_value-----------------------------------------------------------------------]]
if _Spec == 1 and CML_Affli_config == nil then
	PQIprefix = "PQI_CodeMyLifeAffliction_"
	_AoEModes = 2
	_RangeSpell = 686
	CML_Affli_config = {
		name	= "Affliction",
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
				tooltip	= PlayerHex.."toggle Automatic DPS Potionsa when Heroism starts.",
				enable	= true,
			},			
		},
		--[[ Keybinds ]]
		hotkeys = {
			{	name	= "Pause",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFPause , Will Stop Rotation.",
			},
			{	name	= "Set Focus",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFMouseover Focus |cffff7d0aSet focus to mouseover.",
			},					
		},
	}
	CODEMYLIFE_AFFLICTION = PQI:AddRotation(CML_Affli_config)
end

--[[           ]]	--[[         ]]		--[[           ]] 	
--[[           ]]	--[[          ]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]	--[[]]				
--[[]]				--[[]]	   --[[]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]		   	   --[[]]	
--[[   		   ]]	--[[          ]]	--[[           ]] 	
--[[   		   ]]	--[[         ]] 	--[[           ]] 	

if _Spec == 1 and CML_Cooldowns_Config == nil then
	Coolprefix = "PQI_CodeMyLifeCooldownsAfflic_"

	CML_Cooldowns_Config = {
		name	= "CooldownsAfflic",
		author	= "CodeMyLife",
		abilities = {
			--[[ Cooldowns ]]
			{ 	name	= "Dark Soul",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Dark Soul.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
				newSection = true,
			},	
			{ 	name	= "Doom Guard",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Doom Guard.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},		
			{ 	name	= "Imp Swarm",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Imp Swarm.",
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

--[[         ]]		--[[           ]]	--[[]]     --[[]]	--[[           ]]
--[[          ]]	--[[           ]]	--[[ ]]   --[[ ]] 	--[[           ]]
--[[]]	   --[[]]	--[[]]				--[[           ]]	--[[]]	   --[[]]
--[[]]	   --[[]]	--[[           ]]	--[[           ]]	--[[]]	   --[[]]
--[[]]	   --[[]]	--[[]]				--[[]] 	   --[[]]	--[[]]	   --[[]]
--[[          ]]	--[[           ]]	--[[]] 	   --[[]]	--[[           ]]
--[[         ]] 	--[[           ]]	--[[]] 	   --[[]]	--[[           ]]

--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Demonology Warlock -----PQI_CodeMyLifeDemonology_Name_value-----------------------------------------------------------------------]]
if _Spec == 2 and CML_Demo_config == nil then
	PQIprefix = "PQI_CodeMyLifeDemonology_"
	_AoEModes = 2
	_RangeSpell = 686
	CML_Demo_config = {
		name	= "Demonology",
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
			{ 	name	= "Dark Intent",
				tooltip	= PlayerHex.."Buff Spell Power Aura on self if needed.",
				enable	= true,
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
				tooltip	= PlayerHex.."Assign |cffFFFFFFPause , Will Stop Rotation.",
			},
			{	name	= "Set Focus",
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
	CODEMYLIFE_DEMONOLOGY = PQI:AddRotation(CML_Demo_config)
end

--[[           ]]	--[[         ]]		--[[           ]] 	
--[[           ]]	--[[          ]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]	--[[]]				
--[[]]				--[[]]	   --[[]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]		   	   --[[]]	
--[[   		   ]]	--[[          ]]	--[[           ]] 	
--[[   		   ]]	--[[         ]] 	--[[           ]] 	

if _Spec == 2 and CML_Cooldowns_Config == nil then
	Coolprefix = "PQI_CodeMyLifeCooldownsDemo_"

	CML_Cooldowns_Config = {
		name	= "CooldownsDemo",
		author	= "CodeMyLife",
		abilities = {
			--[[ Cooldowns ]]
			{ 	name	= "Dark Soul",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Dark Soul.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
				newSection = true,
			},	
			{ 	name	= "Doom Guard",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Doom Guard.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
			},		
			{ 	name	= "Imp Swarm",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Imp Swarm.",
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

--[[         ]]		--[[           ]]	--[[           ]]	--[[           ]]	--[[           ]]	--[[           ]]
--[[          ]]	--[[           ]]	--[[           ]]	--[[           ]] 	--[[           ]]	--[[           ]]
--[[]]	   --[[]]	--[[]]				--[[]]					 --[[ ]]		--[[]]	   --[[]]	--[[]]	   --[[]]
--[[]]	   --[[]]	--[[           ]]	--[[           ]]		 --[[ ]]		--[[]]	   --[[]]	--[[]]	   --[[]]
--[[]]	   --[[]]	--[[]]						   --[[]]		 --[[ ]]		--[[        ]]		--[[]]	   --[[]]
--[[          ]]	--[[           ]]	--[[           ]]		 --[[ ]]		--[[]]	  --[[]]	--[[           ]]
--[[         ]] 	--[[           ]]	--[[           ]]		 --[[ ]]		--[[]]	   --[[]]	--[[           ]]

--[[------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--------- Destruction Warlock -----PQI_CodeMyLifeDestruction_Name_value-----------------------------------------------------------------------]]
if _Spec == 3 and CML_Destro_config == nil then
	PQIprefix = "PQI_CodeMyLifeDestruction_"
	_AoEModes = 2
	_RangeSpell = 116858
	CML_Destro_config = {
		name	= "Destruction",
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
			{ 	name	= "Dark Intent",
				tooltip	= PlayerHex.."Buff Spell Power Aura on self if needed.",
				enable	= true,
			},			
			{ 	name	= "Dark Bargain",
				tooltip	= "|cffFFFFFFHealth value to use"..PlayerHex.." Dark Bargain.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 15,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value to use"..PlayerHex.." Dark Bargain.",
				},
				newSection = true,
			},	
			{ 	name	= "Ember Tap",
				tooltip	= "|cffFFFFFFHealth value to use"..PlayerHex.." Ember Tap.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 15,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value to use"..PlayerHex.." Ember Tap.",
				},
			},			
			{ 	name	= "Healthstone",
				tooltip	= "|cffFFFFFFHealth value to use"..PlayerHex.." Healthstone.",
				enable	= true,
				widget	= { type = "numBox",
					value	= 25,
					width 	= 70,
					step	= 5,
					tooltip	= "|cffFFFFFFHealth value to use"..PlayerHex.." Healthstone.",
				},
			},					
		},
		--[[ Keybinds ]]
		hotkeys = {
			{	name	= "Rain Of Fire Key",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= "|cffFFFFFFAssign "..PlayerHex.."Rain Of Fire |cffFFFFFFOn Cursor Key.",
			},
			{	name	= "Pause",
				enable	= true,
				hotkeys	= {'la'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFPause , Will Stop Rotation.",
			},
			{	name	= "Set Focus",
				enable	= true,
				hotkeys	= {'lc'},
				tooltip	= PlayerHex.."Assign |cffFFFFFFMouseover Focus |cffff7d0aSet focus to mouseover.",
			},					
		},
	}
	CODEMYLIFE_DESTRUCTION = PQI:AddRotation(CML_Destro_config)
end

--[[           ]]	--[[         ]]		--[[           ]] 	
--[[           ]]	--[[          ]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]	--[[]]				
--[[]]				--[[]]	   --[[]]	--[[           ]] 	
--[[]]				--[[]]	   --[[]]		   	   --[[]]	
--[[   		   ]]	--[[          ]]	--[[           ]] 	
--[[   		   ]]	--[[         ]] 	--[[           ]] 	

if _Spec == 3 and CML_Cooldowns_Config == nil then
	Coolprefix = "PQI_CodeMyLifeCooldownsDestro_"

	CML_Cooldowns_Config = {
		name	= "CooldownsDestro",
		author	= "CodeMyLife",
		abilities = {
			{ 	name	= "Rain Of Fire",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFRain Of Fire "..PlayerHex.."on cursor.",
				enable	= true,
				widget = { type = 'select',
					values = {PlayerHex.."Keypress","|cff00A8ABAuto","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFSet Strategy to use"..PlayerHex.." Automatic Rain Of Fire |cffFFFFFF on "..PlayerHex.."cursor.",	
				},
			},	
			--[[ Cooldowns ]]
			{ 	name	= "Dark Soul",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Dark Soul.",
				enable	= true,
				widget = { type = 'select',
					values = {"|cff0DFF00Active","|cffFFE100On CD","|cffD90000Disable"},
					value = 2,
					width = 70,
					tooltip = "|cffFFFFFFChoose desired Cooldowns Options.|cff0DFF00Active will use when you activate Active Cooldowns macro.|cffFFE100On CD will fire on Cooldown regardless of Active Cooldowns.|cffD90000Disable will never use this Cooldown.",	
				},
				newSection = true,
			},	
			{ 	name	= "Doom Guard",
				tooltip	= PlayerHex.."Toggle |cffFFFFFFAutomatic Doom Guard.",
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

--[[           ]]	--[[]]	   --[[]]	--[[]]	   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[  ]]   --[[]]	--[[   		   ]]	--[[   		   ]]	--[[   		   ]]	--[[           ]]	--[[  ]]   --[[]]
--[[]]				--[[]]	   --[[]]	--[[    ]] --[[]]   --[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[    ]] --[[]]
--[[           ]]	--[[]]	   --[[]]	--[[           ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[           ]]
--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]	--[[]]					 --[[ ]]			 --[[ ]]		--[[]]	   --[[]]	--[[   		   ]]
--[[]]	   			--[[           ]]	--[[]]	 --[[  ]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	 --[[  ]]
--[[]]	   			--[[           ]]	--[[]]	   --[[]]	--[[   		   ]]		 --[[ ]]		--[[   		   ]]	--[[           ]]	--[[]]	   --[[]]
if not WarlockFunctions then
	WarlockFunctions = true
	macros = { 
	    ["ActiveCooldowns"]   		= false, 
	    ["AoE"]    					= 1,  
	    ["Pause"]					= false,
	} 	
	_Queues = {	
		[9]							= false,
		[689]						= false, -- Drain Life
		[30283]						= false, -- Shadowfury
		[48018]						= false, -- Demonic Circle Summon
		[48020]						= false, -- Demonic Circle Teleport
		[104232]					= false, -- Rain of Fire
		[111771]					= false, -- Demonic Circle Gateway
		[114635]					= false, -- Ember Tap

		


	}

function CML.ImmolatePro()
	if ProbablyEngine.parser.lastCast ~= GetSpellInfo(172) and not UnitDebuffID("target",108686) then
		if not UnitBuffID("player",108683) then
			CastSpellByName(GetSpellInfo(108683))
		end
		ProbablyEngine.parser.lastCast = GetSpellInfo(172)
		if UnitBuffID("player",108683) then
			return true
		else
			return false
		end
	end
end

function CML.CancelMeta()
	local MetaName = GetSpellInfo("103958")
	local MacroText = tostring("/cancelaura "..MetaName)
	RunMacroText(MacroText)
end


end

end