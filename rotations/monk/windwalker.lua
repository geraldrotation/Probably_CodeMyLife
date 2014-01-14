ProbablyEngine.rotation.register_custom(269, "CodeMyLife Windwalker", {  
--------------------------------------------------Defensive-------------------------------------------- 
    {"TaMere","@CML.PQIConfing()"},
    {"TaMere","@CML.Status()"},
    {"pause","@CML.CombatCheck()"}, -- Combat Check/Pause

    {"116095","queuecast(116095)"}, -- Disable
    {"113656","queuecast(113656)"}, -- Fist of Fury
    {"119381","queuecast(119381)"}, -- Leg Sweep 
    {"113656","queuecast(113656)"}, -- Fist of Fury
    {"115460","queuecast(115460)","ground"}, -- Healing Sphere
    {"115460",{"HealingSpheres.pqikeybind"},"ground"}, 
    {"101545","queuecast(101545)","ground"}, -- Flying Serpent Kick

	-- Expel Harm
    {"115072",{"ExpelHarm.novaHealing(0)"},nil},	
	-- Legacy of The Emperor               
    {"117666",{"player.spell(117666).exists","LegacyOfTheEmperor.pqivalue = 1","!player.hasaura(1)"},"player"},
	-- Legacy of The White Tiger            
    {"116781",{"player.spell(116781).exists","LegacyOfTheWhiteTiger.pqivalue = 1","!player.hasaura(7)"},"player"},    
    -- Fortifying Brew
    {"115203",{"FortifyingBrew.novaHealing(0)"}},
    -- Touch Of Karma
    {"122470",{"TouchOfKarma.novaHealing(0)"},"target"},
	-- auto_attack

	-- chi_brew,if=talent.chi_brew.enabled&chi<=2&(trinket.proc.agility.react|(charges=1&recharge_time<=10)|charges=2|target.time_to_die<charges*10)
	{"115399",{"player.chi <= 2","talent(9)","player.buff(125195).count <= 6"}},
	-- Spear and Strike
    {"116705",{"target.range <= 5","modifier.interrupts"}}, -- Counter Shot
	-- tiger_palm,if=buff.tiger_power.remains<=3
	{"100787",{"player.buff(125359).duration <= 3"}},	
	-- tigereye_brew,if=buff.tigereye_brew_use.down&buff.tigereye_brew.stack=20
	{"116740",{"player.buff(125195).count = 20","!player.buff(116740)"}},		
	-- tigereye_brew,if=buff.tigereye_brew_use.down&trinket.proc.agility.react

	-- tigereye_brew,if=buff.tigereye_brew_use.down&chi>=2&(trinket.proc.agility.react|buff.tigereye_brew.stack>=15|target.time_to_die<40)&debuff.rising_sun_kick.up&buff.tiger_power.up
	{"116740",{"!player.buff(116740)","player.chi >= 2","player.buff(125195).count >= 15","target.debuff(125359)","player.buff(125359)"}},
	-- energizing_brew,if=energy.time_to_max>5
	{"115288",{"player.energy <= 50"}},	
	-- rising_sun_kick,if=debuff.rising_sun_kick.down
	{"107428",{"!target.debuff(107428)"}},			
	-- tiger_palm,if=buff.tiger_power.down&debuff.rising_sun_kick.remains>1&energy.time_to_max>1
	{"100787",{"!player.buff(125359)","target.debuff(107428).duration >= 1","player.energy <= 80"}},	
	-- invoke_xuen,if=talent.invoke_xuen.enabled
	{"123904",{"talent(18)","target.range <= 5"}},

	-- run_action_list,name=aoe,if=active_enemies>=3
	-- run_action_list,name=single_target,if=active_enemies<3

	--[[Multi Target]]
	-- rushing_jade_wind,if=talent.rushing_jade_wind.enabled
	{"116847",{"target.range <= 5","player.aoe = 2","talent(16)"}},
	-- zen_sphere,cycle_targets=1,if=talent.zen_sphere.enabled&!dot.zen_sphere.ticking
	{"124081",{"player.aoe = 2","talent(5)","!target.debuff(124081)"}},
	-- chi_wave,if=talent.chi_wave.enabled
	{"115098",{"player.aoe = 2","talent(4)","target.range <= 40"}},	
	-- chi_burst,if=talent.chi_burst.enabled
	{"123986",{"player.aoe = 2","talent(6)","target.range <= 5","!player.moving"}},
	-- rising_sun_kick,if=chi=chi.max
	{"107428",{"player.aoe = 2","player.chi = 5"}},	
	-- spinning_crane_kick,if=!talent.rushing_jade_wind.enabled
	{"101546",{"target.range <= 5","player.aoe = 2","!talent(16)"}},		
	

	--[[Single Target]]
	-- rising_sun_kick
	{"107428"},	
	-- Touch of Death
	{"115080",{"player.buff(121125)"}},		
	-- fists_of_fury,if=buff.energizing_brew.down&energy.time_to_max>4&buff.tiger_power.remains>4
	{"113656",{"macros(FistOfFury)","!player.moving","target.range <= 5","player.energy <= 40","!player.buff(115288)"}},		
	-- zen_sphere,cycle_targets=1,if=talent.zen_sphere.enabled&!dot.zen_sphere.ticking
	{"124081",{"talent(5)","!target.debuff(124081)"}},
	-- chi_wave,if=talent.chi_wave.enabled
	{"115098",{"target.range <= 40","talent(4)"}},	
	-- chi_burst,if=talent.chi_burst.enabled
	{"123986",{"!player.moving","target.range <= 5","talent(6)"}},
	-- blackout_kick,if=buff.combo_breaker_bok.react
	{"100784",{"player.buff(116768)"}},	
	-- tiger_palm,if=buff.combo_breaker_tp.react&(buff.combo_breaker_tp.remains<=2|energy.time_to_max>=2)
	{"100787",{"player.buff(118864)"}},	
	-- jab,if=chi.max-chi>=2
	{"100780",{"player.chi <= 4"}},		
	-- blackout_kick,if=energy+energy.regen*cooldown.rising_sun_kick.remains>=40
	{"100784",{"player.energy >= 65"}},	
},
--------------------------------------------------Out of Combat-------------------------------------------- 
{     
    -- PQI Globals 
    {"TaMere","@CML.PQIConfing()"},
    -- Player Status
    {"TaMere","@CML.Status()"}, 
	-- Expel Harm
    {"115072",{"ExpelHarm.novaHealing(0)"}},	    
    {"pause","@CML.CombatCheck()"}, -- Combat Check/Pause
	-- Expel Harm
    {"115072",{"ExpelHarm.novaHealing(0)"},nil},	
	-- Fortifying Brew
    {"115203",{"FortifyingBrew.novaHealing(0)"}},
    -- Touch Of Karma
    {"122470",{"TouchOfKarma.novaHealing(0)"},"target"},
    -- Healing Spheres
    {"115460",{"HealingSpheres.pqikeybind"},"ground"}, 
	-- Legacy of The Emperor               
    {"117666",{"player.spell(117666).exists","LegacyOfTheEmperor.pqivalue = 1","117666.needaura(1)"},"player"},
	-- Legacy of The White Tiger            
    {"116781",{"player.spell(116781).exists","LegacyOfTheWhiteTiger.pqivalue = 1","116781.needaura(7)"},"player"},
})