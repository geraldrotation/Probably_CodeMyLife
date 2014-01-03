ProbablyEngine.rotation.register_custom(262, "CodeMyLife Elemental", {
--------------------------------------------------Defensive-------------------------------------------- 
    {"TaMere","@CML.PQIConfing()"},{"TaMere","@CML.Status()"},{"pause","@CML.CombatCheck()"}, -- Combat Check/Pause     

	-- precombat+=/flametongue_weapon,weapon=main
    { "8024",{
    	"!player.enchant.mainhand",
    }},
	-- precombat+=/lightning_shield,if=!buff.lightning_shield.up
	{ "324",{
		"!player.buff(324)", 
	}},
	--[[ Snapshot raid buffed stats before combat begins and pre-potting is done.]]
	-- precombat+=/snapshot_stats
	-- precombat+=/jade_serpent_potion

	--[[ Executed every time the actor is available.]]
            
    -- Healthstone   
    {"#5512",{
        "@CML.HealthStone()",
        "Healthstone.novaHealing(0)",
    }},   
	-- wind_shear
	{{
            {"57994"}, -- Wind Shear
            {"8177",{ -- Grounding
            	"player.spell(57994).cooldown",
            }},
        }, "modifier.interrupts"
    },
	--[[ Bloodlust casting behavior mirrors the simulator settings for proxy bloodlust. See options 'bloodlust_percent', and 'bloodlust_time'. ]]
	-- bloodlust,if=target.health.pct<25|time>5
	--[[ Link Stormlash totem cast to early Bloodlust, and ensure that only one Stormlash is used at a time.]]
	-- stormlash_totem,if=!active&!buff.stormlash.up&(buff.bloodlust.up|time>=60)
	{ "120668",{
		"!player.buff(120676)",
		"player.hashero",
	}},	
	--[[ In-combat potion is linked to Primal or Greater Fire Elemental Totem, after the first 60 seconds of combat.]]
	-- jade_serpent_potion,if=time>60&(pet.primal_fire_elemental.active|pet.greater_fire_elemental.active|target.time_to_die<=60)

    -- Bloodfury
    {"20572",{ -- On CD
        "Racials.pqivalue = 2",
        "spell.exists"
    }},
    {"20572",{ -- On ActiveCooldowns
        "Racials.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "spell.exists"
    }},
    -- Berserking
    {"26297",{ -- On CD
        "Racials.pqivalue = 2",
        "spell.exists"
    }},
    {"26297",{ -- On ActiveCooldowns
        "Racials.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "spell.exists"
    }},
    -- arcane_torrent
    -- use_item,slot=hands 
    {"#gloves",{
        "@CML.ActiveCooldowns()",
    }}, 
     -- Trinket1 
    {"#trinket1",{
        "@CML.ActiveCooldowns()",
    }},
     -- Trinket2   
    {"#trinket2",{
        "@CML.ActiveCooldowns()",
    }},     

 

	-- elemental_mastery,if=talent.elemental_mastery.enabled&(time>15&((!buff.bloodlust.up&time<120)|(!buff.berserking.up&!buff.bloodlust.up&buff.ascendance.up)|(time>=200&(cooldown.ascendance.remains>30|level<87))))
    {"16166",{ -- On CD
        "talent(10)",
        "ElementalMastery.pqivalue = 2",
    }},
    {"16166",{ -- On ActiveCooldowns
    	"talent(10)",
        "ElementalMastery.pqivalue = 1",
        "macros(ActiveCooldowns)",
    }},
	-- ancestral_swiftness,if=talent.ancestral_swiftness.enabled&!buff.ascendance.up
    {"16188",{ -- On CD
        "talent(11)",
        "AncestralSwiftness.pqivalue = 2",
    }},
    {"16188",{ -- On ActiveCooldowns
        "talent(11)",
        "AncestralSwiftness.pqivalue = 1",
        "macros(ActiveCooldowns)",
    }},
	-- fire_elemental_totem,if=!active
    {"2894",{ -- On CD
        "FireElementalTotem.pqivalue = 2",
    }},
    {"2894",{ -- On ActiveCooldowns
        "FireElementalTotem.pqivalue = 1",
        "macros(ActiveCooldowns)",
    }},	
    -- flame_shock,if=ticks_remain<2
	{"8050",{ -- On CD
		"target.debuff(8050).duration < 16",
        "Ascendance.pqivalue = 2",
        "player.spell(2894).cooldown < 2",
	}},
	{"8050",{ -- On ActiveCooldowns
		"target.debuff(8050).duration < 16",
        "Ascendance.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "player.spell(2894).cooldown < 2",
	}},	
	-- ascendance,if=active_enemies>1|(dot.flame_shock.remains>buff.ascendance.duration&(target.time_to_die<20|buff.bloodlust.up|time>=60)&cooldown.lava_burst.remains>0)
    {"114049",{ -- On CD
        "Ascendance.pqivalue = 2",
        "!player.buff(114050)",
    }},
    {"114049",{ -- On ActiveCooldowns
        "Ascendance.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "!player.buff(114050)",
    }},	
    -- Earthquake
    {"61882",{
        "Earthquakekey.pqikeybind",
    },"ground"},

	--[[ If only one enemy, priority follows the 'single' action list.]]
	-- run_action_list,name=single,if=active_enemies=1
	--[[ On multiple enemies, the priority follows the 'aoe' action list.]]
	-- run_action_list,name=aoe,if=active_enemies>1

	--[[ Single target action priority list]]

	-- unleash_elements,if=talent.unleashed_fury.enabled&!buff.ascendance.up
	{"73680",{
        "@CML.IsInSight('target',1)",
        "player.aoe != 3",
		"talent(16)", -- talent.unleashed_fury.enabled
		"!player.buff(114050)"-- !buff.ascendance.up
	}},
	-- spiritwalkers_grace,moving=1,if=buff.ascendance.up
	{"79206",{
        "@CML.IsInSight('target',1)",
        "player.aoe != 3",
		"player.moving",
		"player.buff(114050)"-- buff.ascendance.up
	}},
	-- lava_burst,if=dot.flame_shock.remains>cast_time&(buff.ascendance.up|cooldown_react)
	{"51505",{
        "@CML.IsInSight('target',1)",
        "!player.moving",
        "player.aoe != 3",
		"player.spell(51505).shock",
	}},
    {"51505",{ -- Lava Surge while moving
        "@CML.IsInSight('target',1)",
        "player.moving",
        "target.debuff(8050).duration > 1",
        "player.buff(77762)",
    }},    
	-- flame_shock,if=ticks_remain<2
	{"8050",{
        "@CML.IsInSight('target',1)",
        "player.aoe != 3",
		"target.debuff(8050).duration < 2",
	}},	
	-- elemental_blast,if=talent.elemental_blast.enabled
	{"117014",{
        "@CML.IsInSight('target',1)",
        "!player.moving",
        "player.aoe != 3",
		"talent(18)",
	}},		
	--[[ Use Earth Shock if Lightning Shield is at max (7) charges]]
	-- earth_shock,if=buff.lightning_shield.react=buff.lightning_shield.max_stack
	{"8042",{
        "@CML.IsInSight('target',1)",
        "player.aoe != 3",
		"player.buff(324).count = 7",
	}},	
	--[[ Use Earth Shock if Lightning Shield is above 3 charges and the Flame Shock remaining duration is longer than the shock cooldown but shorter than shock cooldown + tick time interval]]
	-- earth_shock,if=buff.lightning_shield.react>3&dot.flame_shock.remains>cooldown&dot.flame_shock.remains<cooldown+action.flame_shock.tick_time
	{"8042",{
        "@CML.IsInSight('target',1)",
        "player.aoe != 3",
		"player.buff(324).count >= 3",
		"target.debuff(8050).duration > 5",
	}},	

	-- earth_elemental_totem,if=!active&cooldown.fire_elemental_totem.remains>=60
    {"2062",{ -- On CD
        "@CML.IsInSight('target',1)",
        "player.aoe != 3",
        "!totem(2).exists",
    }},
	--[[ Keep Searing Totem up, unless Fire Elemental Totem is coming off cooldown in the next 20 seconds]]
	-- searing_totem,if=cooldown.fire_elemental_totem.remains>20&!totem.fire.active
    {"3599",{
        "@CML.IsInSight('target',1)",
        "player.aoe != 3",
        "!player.totem(1).exists",
    }},
	-- spiritwalkers_grace,moving=1,if=((talent.elemental_blast.enabled&cooldown.elemental_blast.remains=0)|(cooldown.lava_burst.remains=0&!buff.lava_surge.react))|(buff.raid_movement.duration>=action.unleash_elements.gcd+action.earth_shock.gcd)
	{"73680",{ 
        "@CML.IsInSight('target',1)",
        "player.aoe != 3",
        "player.moving",
		"talent(18)",
	}},	
	{"73680",{
        "@CML.IsInSight('target',1)",
        "player.aoe != 3",
        "player.moving",
		"player.spell(51505).cooldown = 0",
		"!player.buff(77762)",
	}},		
    -- thunderstorm,if=mana.pct_nonproc<80
    {"51490",{
        "@CML.IsInSight('target',1)",
        "player.aoe = 2",
        "player.mana < 60",
    }},			
	-- lightning_bolt
	{"403",{
        "@CML.IsInSight('target',1)",
        "player.aoe = 1",
    }},
    -- chain_lightning,if=mana.pct_nonproc>10
    {"421",{
        "@CML.IsInSight('target',1)",
        "!player.moving",
        "player.aoe = 2",
        "player.mana > 10",
    }},	
    -- lightning_bolt
    {"403",{ 
        "@CML.IsInSight('target',1)",
        "player.aoe != 3",
        "player.moving",
    }},

	--[[ Multi target action priority list ]]

	-- lava_beam
    {"421",{
        "@CML.IsInSight('target',1)",
        "!player.moving",
        "player.buff(114050)",
    }},
	-- magma_totem,if=active_enemies>2&!totem.fire.active
    {"8190",{
        "@CML.IsInSight('target',1)",
        "!player.totem(1).exists",
    }},
	-- searing_totem,if=active_enemies<=2&!totem.fire.active
    {"8190",{
        "@CML.IsInSight('target',1)",
        "!player.totem(1).exists",
    }},    
	-- lava_burst,if=active_enemies<3&dot.flame_shock.remains>cast_time&cooldown_react
    {"51505",{
        "@CML.IsInSight('target',1)",
        "!player.moving",
        "player.spell(51505).shock",
    }},
    {"51505",{ -- Lava Surge while moving
        "@CML.IsInSight('target',1)",
        "player.moving",
        "target.debuff(8050).duration > 1",
        "player.buff(77762)",
    }},
	-- flame_shock,cycle_targets=1,if=!ticking&active_enemies<3
    {"8050",{
        "@CML.IsInSight('target',1)",
        "!target.debuff(8050)",
    }},
	-- earthquake,if=active_enemies>4
    {"61882",{
        "@CML.IsInSight('target',1)",
        "Earthquake.pqivalue = 2",
        "!player.moving",
        "queuecast(61882)",
        "!player.spell(114158).cooldown > 2",
        "@CML.Earthquake()",
    },"ground"},
	-- thunderstorm,if=mana.pct_nonproc<80
    {"51490",{
        "@CML.IsInSight('target',1)",
        "player.mana < 80",
    }},
	-- chain_lightning,if=mana.pct_nonproc>10
    {"421",{
        "@CML.IsInSight('target',1)",
        "!player.moving",
        "player.mana > 10",
    }},
	-- lightning_bolt
    {"403","@CML.IsInSight('target',1)"},  
}, 
--------------------------------------------------Out of Combat-------------------------------------------- 
{ 
    -- PQI Globals 
    {"TaMere","@CML.PQIConfing()"},
    -- Player Status
    {"TaMere","@CML.Status()"}, 
})