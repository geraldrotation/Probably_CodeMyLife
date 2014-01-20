ProbablyEngine.rotation.register_custom(266, "CodeMyLife Demonology", {
--------------------------------------------------Defensive-------------------------------------------- 
    {"TaMere","@CML.PQIConfing()"},{"TaMere","@CML.Status()"},{"pause","@CML.CombatCheck()"}, -- Combat Check/Pause

    {"30283","queuecast(30283)","ground"}, -- ShadowFury

  -- Healthstone   
    {"#5512",{"Healthstone.novaHealing(0)"}},
    -- Sacrificial Pact
    {"108416",{"SacrificialPact.novaHealing(0)"},"player"}, 
    -- Unending Resolve
    {"104773",{"UnendingResolve.novaHealing(0)"}}, 
    -- Mortal Coil
    {"6789",{"MortalCoil.novaHealing(0)","target.range <= 30"}}, 

	--[[Pre-Combat]]
	-- dark_intent,if=!aura.spell_power_multiplier.up
    {"109773",{"!player.hasaura(5)","DarkIntent.pqicheck"},"player"},
	-- summon_pet,if=!talent.grimoire_of_sacrifice.enabled|buff.grimoire_of_sacrifice.down
	{"30146",{"talent(15)","!player.buff(108503)","!pet.exists"}},	
    -- flames of xoroth
    {"120451",{"!talent(15)","pet.dead"}},      
	-- grimoire_of_sacrifice,if=talent.grimoire_of_sacrifice.enabled
	{"108503",{"talent(15)","!player.buff(108503)","pet.exists"}},		
	-- service_pet,if=talent.grimoire_of_service.enabled
    {"111898",{"talent(14)","GrimoireOfService.coolvalue = 1","macros(ActiveCooldowns)"}},  
    {"111898",{"talent(14)","GrimoireOfService.coolvalue = 2"}},	
    -- summon_pet,if=!talent.grimoire_of_sacrifice.enabled|buff.grimoire_of_sacrifice.down
    {"688",{"PetManager.pqivalue = 1","!talent(15)","!pet.exists","!modifier.last"}}, -- Imp
    {"697",{"PetManager.pqivalue = 2","!talent(15)","!pet.exists","!modifier.last"}}, -- Void
    {"691",{"PetManager.pqivalue = 3","!talent(15)","!pet.exists","!modifier.last"}}, -- Felhunter
    {"712",{"PetManager.pqivalue = 4","!talent(15)","!pet.exists","!modifier.last"}}, -- Succubus
    {"30146",{"PetManager.pqivalue = 5","!talent(15)","!pet.exists","!modifier.last"}}, -- Felguard
	-- curse_of_the_elements,if=debuff.magic_vulnerability.down
	{"1490",{"1490.multidot360(1)"}},	
    -- Hand of Guldan
    {"105174",{"player.aoe = 1","player.spell(105174).charges >= 2","!target.debuff(47960)","!player.lastcast"}},	
   	{"105174",{"player.aoe = 1","target.debuff(47960)","target.debuff(47960).duration <= 4","!player.lastcast"}},	    
	-- dark_soul,if=!talent.archimondes_darkness.enabled|(talent.archimondes_darkness.enabled&(charges=2|trinket.proc.intellect.react|trinket.stacking_proc.intellect.react|target.health.pct<=10))         
    {"113861",{"!talent(16)","target.debuff(47960)","player.spell(105174).charges = 0","DarkSould.coolvalue = 1","macros(ActiveCooldowns)"}}, 
    {"113861",{"talent(16)","player.spell(113861).charges = 2","target.debuff(47960)","player.spell(105174).charges = 0","DarkSould.coolvalue = 1","macros(ActiveCooldowns)"}},       
    {"113861",{"target.debuff(47960)","player.spell(105174).charges = 0","DarkSould.coolvalue = 1","macros(ActiveCooldowns)"}},       
    {"113861",{"talent(16)","target.debuff(47960)","player.spell(105174).charges = 0","player.buff(145085).remains >= 3","DarkSould.coolvalue = 1","macros(ActiveCooldowns)"}},   
    {"113861",{"!talent(16)","target.debuff(47960)","player.spell(105174).charges = 0","DarkSould.coolvalue = 2"}}, 
    {"113861",{"talent(16)","player.spell(113861).charges = 2","target.debuff(47960)","player.spell(105174).charges = 0","DarkSould.coolvalue = 2"}},       
    {"113861",{"target.debuff(47960)","player.spell(105174).charges = 0","DarkSould.coolvalue = 2"}},       
    {"113861",{"talent(16)","target.debuff(47960)","player.spell(105174).charges = 0","player.buff(145085).remains >= 3","DarkSould.coolvalue = 2"}},          
	-- service_pet,if=talent.grimoire_of_service.enabled
    {"111898",{"talent(14)"}},		
	-- felguard:felstorm
    {"119914",{"player.aoe = 2","Felstorm.pqivalue = 1","petinmelee"}}, 
    {"119914",{"Felstorm.pqivalue = 2","target.petinmelee"}},
    {"CancelMeta",{"player.buff(103958)","player.demonicfury <= 50","@CML.CancelMeta()"}},	
	-- Imp Swarm
	{"104316",{"ImpSwarm.pqivalue = 2","target.range <= 40","target.debuff(47960)",}},	    
	-- Imp Swarm
	{"104316",{"ImpSwarm.pqivalue = 1","macros(ActiveCooldowns)","target.range <= 40","target.debuff(47960)"}},	    
	--[[Single Target]]
    -- run_action_list,name=aoe,if=active_enemies>4     
    {"CancelMeta",{"player.aoe = 1","player.buff(103958)","!player.buff(113861)","player.demonicfury <= 650","target.debuff(603).duration > 25","@CML.CancelMeta()"}},      
    -- fel_flame,moving=1   talent 17
    {"77799",{"player.aoe = 1","player.moving"}},
    -- touch_of_chaos,if=buff.metamorphosis.up
    {"103964",{"player.aoe = 1","player.buff(103958)","player.moving"}},        
    -- summon_doomguard
    {"18540",{"DoomGuard.pqivalue = 1","macros(ActiveCooldowns)","boss1.exists"}}, 
    {"18540",{"DoomGuard.pqivalue = 2","boss1.exists"}},        
    -- doom,cycle_targets=1,if=buff.metamorphosis.up&(ticks_remain<=1|(ticks_remain+1<n_ticks&buff.dark_soul.up)|(ticks_remain<=add_ticks%2&stat.spell_power>spell_power))&target.time_to_die>=30&miss_react
    {"603",{"player.aoe = 1","player.buff(103958)","603.multidot(25)"}},        
    -- touch_of_chaos,if=buff.metamorphosis.up
    {"103964",{"player.buff(103958)","146739.multirefresh(5)"}},         
    -- soul_fire,if=buff.metamorphosis.up&buff.molten_core.react&(buff.dark_soul.remains<action.shadow_bolt.cast_time|buff.dark_soul.remains>cast_time)
    {"104027",{"player.aoe = 1","player.buff(103958)","player.buff(140074)","player.buff(113861).duration >= 2"}},   
    -- touch_of_chaos,if=buff.metamorphosis.up
    {"103964",{"player.aoe = 1","player.buff(103958)"}},           
    -- corruption,cycle_targets=1,if=!ticking&target.time_to_die>=6&miss_react
    {"172",{"!player.buff(103958)","146739.multidot360(1)"}},   
    -- metamorphosis,if=(buff.dark_soul.up&buff.dark_soul.remains<demonic_fury%32)|demonic_fury>=950|demonic_fury%32>target.time_to_die|(action.hand_of_guldan.in_flight&dot.shadowflame.remains)
    {"103958",{"player.aoe = 1","target.debuff(47960)","player.spell(105174).charges = 0","!player.buff(103958)","player.buff(113861)","player.demonicfury >= 300"}},   
    {"103958",{"player.aoe = 1","target.debuff(47960)","player.spell(105174).charges = 0","!player.buff(103958)","player.demonicfury >= 650"}}, 
    {"103958",{"player.aoe = 1","!player.buff(103958)","player.demonicfury >= 950"}},       
    -- hand_of_guldan,if=!in_flight&dot.shadowflame.remains<travel_time+action.shadow_bolt.cast_time&(charges=2|dot.shadowflame.remains>travel_time|(charges=1&recharge_time<4))
    {"105174",{"player.aoe = 1","player.spell(105174).charges >= 2","!target.debuff(47960)","!player.lastcast"}},   
    {"105174",{"player.aoe = 1","target.debuff(47960)","target.debuff(47960).duration <= 4","!player.lastcast"}},       
    -- soul_fire,if=buff.molten_core.react&(buff.dark_soul.remains<action.shadow_bolt.cast_time|buff.dark_soul.remains>cast_time)&(buff.molten_core.react>9|target.health.pct<=28)
    {"104027",{"player.aoe = 1","player.buff(140074)","player.buff(113861).duration <= 2"}},     
    -- life_tap,if=mana.pct<60
    {"1454",{"player.mana <= 60","player.health >= 20"}},       
    -- shadow_bolt
    {"686","player.aoe = 1"},

	--[[Multiple Targets]]
    -- cancel_metamorphosis,if=buff.metamorphosis.up&dot.corruption.remains>10&demonic_fury<=650&buff.dark_soul.down&!dot.immolation_aura.ticking
    {"CancelMeta",{"player.aoe = 2","player.buff(103958)","!player.buff(113861)","player.demonicfury <= 500","@CML.CancelMeta()"}}, 
    -- Chaos Wave
    {"124916",{"player.aoe = 2","player.buff(103958)"}},    
    -- immolation_aura,if=buff.metamorphosis.up
    {"104025",{"player.aoe = 2","!player.buff(104025)","player.buff(103958)","target.range <= 5","player.demonicfury >= 500"}}, 
    -- void_ray,if=buff.metamorphosis.up&dot.corruption.remains<10
    {"115422",{"player.aoe = 2","player.buff(103958)","target.debuff(146739).duration <= 10","target.range <= 20"}},        
    -- touch_of_chaos,
    {"103964",{"player.aoe = 2","player.buff(103958)","target.debuff(146739).duration <= 10","target.range > 20"}},  
    -- doom,cycle_targets=1,if=buff.metamorphosis.up&(!ticking|remains<tick_time|(ticks_remain+1<n_ticks&buff.dark_soul.up))&target.time_to_die>=30&miss_react
    {"603",{"player.aoe = 2","player.buff(103958)","603.multidot360(25)"}}, 
    -- void_ray,if=buff.metamorphosis.up
    {"115422",{ "player.aoe = 2","player.buff(103958)","target.range <= 20"}},      
    -- corruption,cycle_targets=1,if=!ticking&target.time_to_die>30&miss_react
    {"172",{"player.aoe = 2","!target.debuff(146739)"}},        
    -- hand_of_guldan
    {"105174",{"player.aoe = 2","player.spell(105174).charges >= 2","!target.debuff(47960)","!player.lastcast"}},   
    {"105174",{"player.aoe = 2","target.debuff(47960)","target.debuff(47960).duration <= 4","!player.lastcast"}},       
    -- metamorphosis,if=dot.corruption.remains<10|buff.dark_soul.up|demonic_fury>=950|demonic_fury%32>target.time_to_die
    {"103958",{"player.aoe = 2","!player.buff(103958)","player.buff(113861)","player.demonicfury >= 300"}}, 
    -- hellfire,chain=1,interrupt=1
    {"1949",{"player.aoe = 2","!player.buff(1949)","target.range <= 5","player.health >= 20"}}, 
    -- shadow_bolt
    {"686","player.aoe = 2"},   

}, 
--------------------------------------------------Out of Combat-------------------------------------------- 
{ 
    -- PQI Globals 
    {"TaMere","@CML.PQIConfing()"},
    -- Player Status
    {"TaMere","@CML.Status()"}, 
    {"CancelMeta",{"player.buff(103958)","@CML.CancelMeta()"}}, 

    -- dark_intent,if=!aura.spell_power_multiplier.up
    {"109773",{"!player.hasaura(5)","DarkIntent.pqicheck"},"player"},
    {"30146",{"talent(15)","!player.buff(108503)","!pet.exists"}},  
    -- grimoire_of_sacrifice,if=talent.grimoire_of_sacrifice.enabled
    {"108503",{"talent(15)","!player.buff(108503)","pet.exists"}},      
    {"PetMover",{"PetMoveToMouse.pqikeybind","@CML.PetMove()"}},    
    -- summon_pet,if=!talent.grimoire_of_sacrifice.enabled|buff.grimoire_of_sacrifice.down
    {"688",{"PetManager.pqivalue = 1","!talent(15)","!pet.exists","!modifier.last"}}, -- Imp
    {"697",{"PetManager.pqivalue = 2","!talent(15)","!pet.exists","!modifier.last"}}, -- Void
    {"691",{"PetManager.pqivalue = 3","!talent(15)","!pet.exists","!modifier.last"}}, -- Felhunter
    {"712",{"PetManager.pqivalue = 4","!talent(15)","!pet.exists","!modifier.last"}}, -- Succubus
    {"30146",{"PetManager.pqivalue = 5","!talent(15)","!pet.exists","!modifier.last"}}, -- Felguard
    -- Health Stones
    {"6201",{"!player.moving","@CML.NeedStones()","!modifier.last"}},
})