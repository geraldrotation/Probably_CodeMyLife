ProbablyEngine.rotation.register_custom(266, "CodeMyLife Demonology", {
--------------------------------------------------Defensive-------------------------------------------- 
    {"TaMere","@CML.PQIConfing()"},{"TaMere","@CML.Status()"},{"pause","@CML.CombatCheck()"}, -- Combat Check/Pause

    {"30283","queuecast(30283)","ground"}, -- ShadowFury
	--[[Pre-Combat]]
	-- dark_intent,if=!aura.spell_power_multiplier.up
    {"109773",{ -- Dark Intent 
        "!player.hasaura(5)",
        "DarkIntent.pqicheck",
    },"player"},
	-- summon_pet,if=!talent.grimoire_of_sacrifice.enabled|buff.grimoire_of_sacrifice.down
	{"30146",{ -- Fel Hunter
		"!talent(15)", -- !talent.grimoire_of_sacrifice.enabled
		"!pet.exists",
	}},
	{"30146",{ -- Fel Hunter
		"talent(15)",
		"!player.buff(108503)", -- buff.grimoire_of_sacrifice.down
		"!pet.exists",
	}},	
	-- grimoire_of_sacrifice,if=talent.grimoire_of_sacrifice.enabled
	{"108503",{
		"talent(15)",
		"!player.buff(108503)", -- buff.grimoire_of_sacrifice.down
		"pet.exists",
	}},		
	-- service_pet,if=talent.grimoire_of_service.enabled
	{"111898",{ -- Fel Guard
		"talent(14)",
		"!pet.exists",
	}},	
	-- curse_of_the_elements,if=debuff.magic_vulnerability.down
	{"1490",{
		"1490.multidot360(1)",
	}},	
    -- Hand of Guldan
    {"105174",{ -- 1er
		"player.aoe = 1",
   		"player.spell(105174).charges >= 2",
    	"!target.debuff(47960)", -- !ticking
    	"!player.lastcast",
    }},	
   	{"105174",{ -- 2e
		"player.aoe = 1",
    	"target.debuff(47960)",
    	"target.debuff(47960).duration <= 4",
    	"!player.lastcast",
    }},	    
	-- dark_soul,if=!talent.archimondes_darkness.enabled|(talent.archimondes_darkness.enabled&(charges=2|trinket.proc.intellect.react|trinket.stacking_proc.intellect.react|target.health.pct<=10))
    {"113861",{
    	"!talent(16)",
		"target.debuff(47960)",
   		"player.spell(105174).charges = 0",
    }},	
    {"113861",{
    	"talent(16)", -- talent.archimondes_darkness.enabled
    	"player.spell(113861).charges = 2", -- charges=2
		"target.debuff(47960)",
   		"player.spell(105174).charges = 0",
    }},	    
    {"113861",{
		"target.debuff(47960)",
   		"player.spell(105174).charges = 0",
    }},	    
    {"113861",{
    	"talent(16)", -- talent.archimondes_darkness.enabled
		"target.debuff(47960)",
   		"player.spell(105174).charges = 0",
    	"player.buff(145085).remains >= 3", -- trinket.proc.intellect.react
    }},	      	
	-- service_pet,if=talent.grimoire_of_service.enabled
    {"111898",{
    	"talent(14)", -- talent.grimoire_of_service.enabled
    }},		
	-- felguard:felstorm
	{"119914"},	
	-- wrathguard:wrathstorm
    {"CancelMeta",{
    	"player.buff(103958)", -- buff.metamorphosis.up
    	"player.demonicfury <= 50",
    	"@CML.CancelMeta()",
    }},	
	-- Imp Swarm
	{"104316",{
		"ImpSwarm.pqivalue = 2",
    	"target.range <= 40",
    	"player.spell(113861).cooldown >= 50",
    	--"player.spell(113861).recharge >= 50",
    }},	
	{"104316",{
		"ImpSwarm.pqivalue = 2",
    	"target.range <= 40",
    	"player.spell(113861).cooldown >= 50",
    	--"player.spell(113861).recharge >= 50",
    }},	    
	-- Imp Swarm
	{"104316",{
		"ImpSwarm.pqivalue = 1",
        "macros(ActiveCooldowns)",	
    	"target.debuff(47960)",
    	"target.range <= 40",
    }},	    
	--[[Single Target]]
	-- run_action_list,name=aoe,if=active_enemies>4		
    {"CancelMeta",{
		"player.aoe = 1",
    	"player.buff(103958)", -- buff.metamorphosis.up
    	"!player.buff(113861)", -- buff.dark_soul.down
    	"player.demonicfury <= 650", -- demonic_fury<=650
    	"target.debuff(603).duration > 25",
    	"@CML.CancelMeta()",
    }},		
	-- fel_flame,moving=1   talent 17
	{"77799",{
		"player.aoe = 1",
		"player.moving",
	}},
	-- touch_of_chaos,if=buff.metamorphosis.up
    {"103964",{
    	"player.aoe = 1",
    	"player.buff(103958)", -- buff.metamorphosis.up
		"player.moving",
    }},	 	
	-- summon_doomguard
    {"18540",{ -- On CD
    	"DoomGuard.pqivalue = 2",
    }},		
    {"18540",{ -- On ActiveCooldowns
        "DoomGuard.pqivalue = 1",  
        "macros(ActiveCooldowns)",  
     }},	
	-- doom,cycle_targets=1,if=buff.metamorphosis.up&(ticks_remain<=1|(ticks_remain+1<n_ticks&buff.dark_soul.up)|(ticks_remain<=add_ticks%2&stat.spell_power>spell_power))&target.time_to_die>=30&miss_react
    {"603",{"player.aoe = 1","player.buff(103958)","603.multidot(25)"}},		
	-- touch_of_chaos,if=buff.metamorphosis.up
    {"103964",{
    	"player.buff(103958)", -- buff.metamorphosis.up
        "146739.multirefresh(5)",
    }},	     
	-- soul_fire,if=buff.metamorphosis.up&buff.molten_core.react&(buff.dark_soul.remains<action.shadow_bolt.cast_time|buff.dark_soul.remains>cast_time)
    {"104027",{
		"player.aoe = 1",
    	"player.buff(103958)", -- buff.metamorphosis.up
    	"player.buff(140074)", -- buff.molten_core.react
    	"player.buff(113861).duration >= 2", -- buff.dark_soul.remains<action.shadow_bolt.cast_time
    }},	 
	-- touch_of_chaos,if=buff.metamorphosis.up
    {"103964",{
    	"player.aoe = 1",
    	"player.buff(103958)", -- buff.metamorphosis.up
    }},	 	   
	-- corruption,cycle_targets=1,if=!ticking&target.time_to_die>=6&miss_react
    {"172",{
		"player.aoe = 1",
        "!player.buff(103958)", -- buff.metamorphosis.down
        "target.debuff(146739).duration <= 2", -- !ticking
    }},	
	-- corruption,cycle_targets=1,if=!ticking&target.time_to_die>=6&miss_react
    {"172",{
		"player.aoe = 2",
    	"!player.buff(103958)", -- buff.metamorphosis.down
        "146739.multidot(2)", -- !ticking
    }},	
	-- metamorphosis,if=(buff.dark_soul.up&buff.dark_soul.remains<demonic_fury%32)|demonic_fury>=950|demonic_fury%32>target.time_to_die|(action.hand_of_guldan.in_flight&dot.shadowflame.remains)
    {"103958",{
		"player.aoe = 1",
		"target.debuff(47960)",
   		"player.spell(105174).charges = 0",
    	"!player.buff(103958)", -- buff.metamorphosis.down
    	"player.buff(113861)", -- buff.dark_soul.up
    	"player.demonicfury >= 300", -- demonic_fury>=950
    }},	
    {"103958",{
		"player.aoe = 1",
		"target.debuff(47960)",
   		"player.spell(105174).charges = 0",
    	"!player.buff(103958)", -- buff.metamorphosis.down
--    	"player.buff(113861)", -- buff.dark_soul.up
    	"player.demonicfury >= 650", -- demonic_fury>=950
    }},	
    {"103958",{
		"player.aoe = 1",
    	"!player.buff(103958)", -- buff.metamorphosis.down
    	"player.demonicfury >= 950", -- demonic_fury>=950
    }},		
	-- hand_of_guldan,if=!in_flight&dot.shadowflame.remains<travel_time+action.shadow_bolt.cast_time&(charges=2|dot.shadowflame.remains>travel_time|(charges=1&recharge_time<4))
   {"105174",{
		"player.aoe = 1",
   		"player.spell(105174).charges >= 2",
    	"!target.debuff(47960)",
    	"!player.lastcast",
    }},	
   {"105174",{
		"player.aoe = 1",
    	"target.debuff(47960)",
    	"target.debuff(47960).duration <= 4",
    	"!player.lastcast",
    }},	    
	-- soul_fire,if=buff.molten_core.react&(buff.dark_soul.remains<action.shadow_bolt.cast_time|buff.dark_soul.remains>cast_time)&(buff.molten_core.react>9|target.health.pct<=28)
    {"104027",{
		"player.aoe = 1",
    	"player.buff(140074)", -- buff.molten_core.react
    	"player.buff(113861).duration <= 2", -- buff.dark_soul.down
    }},	 
	-- life_tap,if=mana.pct<60
    {"1454",{
    	"player.mana <= 60",
    	"player.health >= 20",
    }},		
	-- shadow_bolt
    {"686","player.aoe = 1"},

	--[[Multiple Targets]]
	-- cancel_metamorphosis,if=buff.metamorphosis.up&dot.corruption.remains>10&demonic_fury<=650&buff.dark_soul.down&!dot.immolation_aura.ticking
    {"CancelMeta",{
    	"player.aoe = 2", -- AoE
    	"player.buff(103958)", -- buff.metamorphosis.up
    	"!player.buff(113861)", -- buff.dark_soul.down
    	"player.demonicfury <= 500", -- demonic_fury<=650
    	"@CML.CancelMeta()",
    }},	
	-- Chaos Wave
	{"124916",{
    	"player.aoe = 2", -- AoE
    	"player.buff(103958)", -- buff.metamorphosis.up
    }},	
	-- immolation_aura,if=buff.metamorphosis.up
	{"104025",{
    	"player.aoe = 2", -- AoE
		"!player.buff(104025)", 
    	"player.buff(103958)", -- buff.metamorphosis.up
    	"target.range <= 5",
        "player.demonicfury >= 500"
    }},	
	-- void_ray,if=buff.metamorphosis.up&dot.corruption.remains<10
	{"115422",{ 
    	"player.aoe = 2", -- AoE
    	"player.buff(103958)", -- buff.metamorphosis.up
    	"target.debuff(146739).duration <= 10",
    	"target.range <= 20",
    }},		
    -- touch_of_chaos,
    {"103964",{
    	"player.aoe = 2", -- AoE
    	"player.buff(103958)", -- buff.metamorphosis.up
    	"target.debuff(146739).duration <= 10",
    	"target.range > 20",
    }},	 
	-- doom,cycle_targets=1,if=buff.metamorphosis.up&(!ticking|remains<tick_time|(ticks_remain+1<n_ticks&buff.dark_soul.up))&target.time_to_die>=30&miss_react
    {"603",{
        "player.aoe = 2",
        "player.buff(103958)", -- buff.metamorphosis.up
        "603.multidot360(25)", -- ticks_remain<=1
    }}, 
	-- void_ray,if=buff.metamorphosis.up
	{"115422",{ 
    	"player.aoe = 2", -- AoE
    	"player.buff(103958)", -- buff.metamorphosis.up
    	"target.range <= 20",
    }},		
	-- corruption,cycle_targets=1,if=!ticking&target.time_to_die>30&miss_react
   {"172",{
    	"player.aoe = 2", -- AoE
    	"!target.debuff(146739)", -- !ticking
    }},		
	-- hand_of_guldan
   {"105174",{
    	"player.aoe = 2", -- AoE
   		"player.spell(105174).charges >= 2",
    	"!target.debuff(47960)", -- !ticking
    	"!player.lastcast",
    }},	
   {"105174",{
    	"player.aoe = 2", -- AoE
    	"target.debuff(47960)",
    	"target.debuff(47960).duration <= 4",
    	"!player.lastcast",
    }},	 	
	-- metamorphosis,if=dot.corruption.remains<10|buff.dark_soul.up|demonic_fury>=950|demonic_fury%32>target.time_to_die
    {"103958",{
    	"player.aoe = 2", -- AoE
    	"!player.buff(103958)", -- buff.metamorphosis.down
    	"player.buff(113861)", -- buff.dark_soul.up
    	"player.demonicfury >= 300", -- demonic_fury>=950
    }},	
	-- hellfire,chain=1,interrupt=1
    {"1949",{
    	"player.aoe = 2", -- AoE
    	"!player.buff(1949)",
    	"target.range <= 5",
        "player.health >= 20",
    }},	
    -- shadow_bolt
    {"686","player.aoe = 2"},	
}, 
--------------------------------------------------Out of Combat-------------------------------------------- 
{ 
    -- PQI Globals 
    {"TaMere","@CML.PQIConfing()"},
    -- Player Status
    {"TaMere","@CML.Status()"}, 

	-- dark_intent,if=!aura.spell_power_multiplier.up
    {"109773",{ -- Dark Intent 
        "!player.hasaura(5)",
        "DarkIntent.pqicheck",
    },"player"},
	-- summon_pet,if=!talent.grimoire_of_sacrifice.enabled|buff.grimoire_of_sacrifice.down
	{"30146",{ -- Fel Guard
		"!talent(15)", -- !talent.grimoire_of_sacrifice.enabled
		"!pet.exists",
	}},
	{"30146",{ -- Fel Guard
		"talent(15)",
		"!player.buff(108503)", -- buff.grimoire_of_sacrifice.down
		"!pet.exists",
	}},	
	-- grimoire_of_sacrifice,if=talent.grimoire_of_sacrifice.enabled
	{"108503",{
		"talent(15)",
		"!player.buff(108503)", -- buff.grimoire_of_sacrifice.down
		"pet.exists",
	}},		
	-- service_pet,if=talent.grimoire_of_service.enabled
	{"111898",{ -- Fel Guard
		"talent(14)",
		"!pet.exists",
	}},	
    {"PetMover",{
        "PetMoveToMouse.pqicheck",
        "PetMoveToMouse.pqikeybind",
        "@CML.PetMove()",
    }},	
})