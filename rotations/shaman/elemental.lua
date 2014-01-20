ProbablyEngine.rotation.register_custom(262, "CodeMyLife Elemental", {
--------------------------------------------------Defensive-------------------------------------------- 
    {"TaMere","@CML.PQIConfing()"},
    {"TaMere","@CML.Status()"},
    {"pause","@CML.CombatCheck()"}, -- Combat Check/Pause  
    {"pause","player.buff(2645)"},

    -- Healing Rain Queuecast
    {"307", "queuecast(307)"}, 
    {"73920",{"421.stopcasting","!player.moving", "HealingRain.pqikeybind"}, "ground"}, 
    {"73920",{"421.stopcasting","!player.moving", "queuecast(73920)"},"ground"}, -- Healing Rain Queue


    --Healing Surge
    { "8004",{"!player.moving", "HealingSurge.novaHealing(0)"}},
    --Healing Stream Totem
    { "5394", "HealingStreamTotem.novaHealing(0)"},
	-- precombat+=/flametongue_weapon,weapon=main
    {"8024",{"!player.enchant.mainhand"}},
	-- precombat+=/lightning_shield,if=!buff.lightning_shield.up
	{"324",{"!player.buff(324)"}}, 
	-- stormlash_totem,if=!active&!buff.stormlash.up&(buff.bloodlust.up|time>=60)
	{"120668",{"!player.buff(120676)","player.hashero"}},	
	-- jade_serpent_potion,if=time>60&(pet.primal_fire_elemental.active|pet.greater_fire_elemental.active|target.time_to_die<=60)
    {"!/cast Purge",{"@CML.DispelThis('target')"},"target"},  
	-- elemental_mastery,if=talent.elemental_mastery.enabled&(time>15&((!buff.bloodlust.up&time<120)|(!buff.berserking.up&!buff.bloodlust.up&buff.ascendance.up)|(time>=200&(cooldown.ascendance.remains>30|level<87))))
    {"16166",{"talent(10)","ElementalMastery.coolvalue = 2"}},
    {"16166",{"talent(10)","ElementalMastery.coolvalue = 1","macros(ActiveCooldowns)"}},
	-- ancestral_swiftness,if=talent.ancestral_swiftness.enabled&!buff.ascendance.up
    {"16188",{"talent(11)","AncestralSwiftness.coolvalue = 2"}},
    {"16188",{"talent(11)","AncestralSwiftness.coolvalue = 1","macros(ActiveCooldowns)"}},
	-- fire_elemental_totem,if=!active
    {"2894",{"FireElementalTotem.coolvalue = 2"}},
    {"2894",{"FireElementalTotem.coolvalue = 1","macros(ActiveCooldowns)"}},	
    -- lava_beam
    {"421",{"player.aoe != 1","!player.moving","player.buff(114050)","421.stopcasting"}},
    -- flame_shock,if=ticks_remain<2
	{"8050",{"player.aoe != 3","target.debuff(8050).duration < 6","player.spell(2894).cooldown < 2"}},
	{"8050",{"player.aoe != 3","target.debuff(8050).duration < 6","player.spell(2894).cooldown < 2"}},	
	-- ascendance,if=active_enemies>1|(dot.flame_shock.remains>buff.ascendance.duration&(target.time_to_die<20|buff.bloodlust.up|time>=60)&cooldown.lava_burst.remains>0)
    {"114049",{"Ascendance.coolvalue = 2","!player.buff(114050)","player.totem(1).exists"}},
    {"114049",{"macros(ActiveCooldowns)","Ascendance.coolvalue = 1","!player.buff(114050)","player.totem(1).exists"}},	
    -- Earthquake
    {"61882",{"player.aoe = 3","queuecast(61882)"},"ground"},
    {"61882",{"player.aoe = 3","61882.automouse(Earthquake)"},"ground"},

	--[[ Single target action priority list]]
	-- unleash_elements,if=talent.unleashed_fury.enabled&!buff.ascendance.up
	{"73680",{"player.aoe != 3","talent(16)","!player.buff(114050)"}},
	-- spiritwalkers_grace,moving=1,if=buff.ascendance.up
	{"79206",{"player.aoe != 3","player.moving","player.buff(114050)"}},
    -- lava_beam
    {"114074",{"player.aoe != 1","!player.moving","player.buff(114050)","51505.stopcasting"}},
	-- lava_burst,if=dot.flame_shock.remains>cast_time&(buff.ascendance.up|cooldown_react)
	{"51505",{"player.aoe = 1","!player.moving","player.spell(51505).shock","51505.stopcasting"}},
    {"51505",{"player.aoe = 2","!player.moving","!player.buff(114050)","player.spell(51505).shock","51505.stopcasting"}},    
    {"51505",{"player.aoe != 3","target.debuff(8050).duration > 1","player.buff(77762)"}},    
    {"51505",{"player.aoe != 3","player.moving","player.spell(51505).shock","player.buff(79206)"}},      
	-- flame_shock,if=ticks_remain<2
    {"8050",{"player.aoe != 3","target.debuff(8050).duration < 6"}}, 
    {"8050",{"target.debuff(8050).duration < 20","!8042.stopcasting"}}, 
	-- elemental_blast,if=talent.elemental_blast.enabled
	{"117014",{"player.aoe != 3","talent(18)","!player.moving","117014.stopcasting"}},		
    {"117014",{"player.aoe != 3","talent(18)","player.moving","player.buff(79206)","117014.stopcasting"}},       
	-- earth_shock,if=buff.lightning_shield.react=buff.lightning_shield.max_stack
	{"8042",{"player.aoe != 3","player.buff(324).count = 7"}},	
    {"8042",{"!8042.stopcasting"}},
	-- earth_shock,if=buff.lightning_shield.react>3&dot.flame_shock.remains>cooldown&dot.flame_shock.remains<cooldown+action.flame_shock.tick_time
	{"8042",{"player.aoe != 3","player.buff(324).count >= 4","target.debuff(8050).duration > 12","target.debuff(8050).duration < 18"}},	
	-- earth_elemental_totem,if=!active&cooldown.fire_elemental_totem.remains>=60
    {"2062",{"player.aoe != 3","talent(17)","!totem(2).exists"}},
	--[[ Keep Searing Totem up, unless Fire Elemental Totem is coming off cooldown in the next 20 seconds]]
    -- magma_totem,if=active_enemies>2&!totem.fire.active
    {"8190",{"player.aoe = 3","target.range <= 5","!player.totem(1).exists"}},
    {"8190",{"player.aoe = 3","talent(9)","!player.totem(1).exists"}},
    {"108287",{"player.aoe = 3","player.totem(1).exists","CML.Magmabusive()"},"ground"},
    -- searing_totem,if=active_enemies<=2&!totem.fire.active
    {"3599",{"!player.totem(1).exists"}}, 
    -- thunderstorm,if=mana.pct_nonproc<80
    {"51490",{"player.aoe = 2","player.mana < 70"}},	
    -- chain_lightning,if=mana.pct_nonproc>10
    {"421",{"player.aoe != 1","!player.moving","player.mana > 10","421.stopcasting"}},
    -- Elemental Blast if moving and Spiritwalker	
    {"117014",{"player.aoe = 1","player.moving","player.buff(79206)","117014.stopcasting"}}, 
    -- lightning_bolt
    {"403",{"403.stopcasting"}},
}, 
--------------------------------------------------Out of Combat-------------------------------------------- 
{ 
    -- PQI Globals 
    {"TaMere","@CML.PQIConfing()"},
    -- Player Status
    {"TaMere","@CML.Status()"}, 
    -- precombat+=/flametongue_weapon,weapon=main
    {"8024",{"!player.enchant.mainhand"}},
    -- precombat+=/lightning_shield,if=!buff.lightning_shield.up
    {"324",{"!player.buff(324)"}},
    --Healing Surge
    { "8004",{"!player.moving", "HealingSurge.novaHealing(0)"}},
})