ProbablyEngine.rotation.register_custom(267, "CodeMyLife Destruction", {
--------------------------------------------------Defensive-------------------------------------------- 
    {"TaMere","@CML.PQIConfing()"},
    {"TaMere","@CML.Status()"},
    {"pause","@CML.CombatCheck()"}, -- Combat Check/Pause

    {"114635","queuecast(114635)"}, -- Ember Tap
    {"30283","queuecast(30283)","ground"}, -- ShadowFury
    {"104232","queuecast(104232)","ground"}, -- Rain of Fire
    {"48020","queuecast(48020)"}, -- Demonic Circle Teleport
    {"48018","queuecast(48018)"}, -- Demonic Circle Summon
    {"689","queuecast(689)"}, -- Drain Life
    {"111771","queuecast(111771)"}, -- Demonic Circle Gateway

	--[[Pre-Combat]]
	-- Dark Bargain
    {"110913",{"DarkBargain.novaHealing(0)"},"player"},	
    {"108416",{"SacrificialPact.novaHealing(0)"},"player"},	
	-- precombat+=/dark_intent,if=!aura.spell_power_multiplier.up
    {"109773",{"109773.needaura(5)","DarkIntent.pqicheck"},"player"},
	-- precombat+=/summon_pet,if=!talent.grimoire_of_sacrifice.enabled|buff.grimoire_of_sacrifice.down
    {"688",{"PetManager.pqivalue = 1","!talent(15)","!pet.exists","!modifier.last"}}, -- Imp
    {"697",{"PetManager.pqivalue = 2","!talent(15)","!pet.exists","!modifier.last"}}, -- VoidLord
    {"691",{"PetManager.pqivalue = 3","!talent(15)","!pet.exists","!modifier.last"}}, -- Observer
    {"712",{"PetManager.pqivalue = 4","!talent(15)","!pet.exists","!modifier.last"}}, -- Shivara
	{"691",{"talent(15)","!player.buff(108503)","!pet.exists","!modifier.last"}},	
	-- precombat+=/grimoire_of_sacrifice,if=talent.grimoire_of_sacrifice.enabled
	{"108503",{"talent(15)","!player.buff(108503)","pet.exists"}},	
    -- flames of xoroth
    {"120451",{"!talent(15)","pet.dead"}}, 	
	-- precombat+=/service_pet,if=talent.grimoire_of_service.enabled
	{"111898",{"talent(14)","!pet.exists","!modifier.last"}},	
	-- Ember Tap (114635) (if live < 10% && Burning Embers>=10)
    { "114635",{"EmberTap.novaHealing(0)","player.embers >= 10"}},
	-- precombat+=/jade_serpent_potion
    {"PetMover",{"PetMoveToMouse.pqicheck","PetMoveToMouse.pqikeybind","@CML.PetMove()"}},

	--[[Single]]
	-- single+=/fel_flame,moving=1
	{"77799",{"player.aoe = 1","player.moving","!player.spell(137587).exists"}},
	-- single=curse_of_the_elements,if=debuff.magic_vulnerability.down
	{"1490",{"!target.debuff(1490)"}},
	-- single+=/dark_soul,if=!talent.archimondes_darkness.enabled|(talent.archimondes_darkness.enabled&(charges=2|trinket.proc.intellect.react|trinket.stacking_proc.intellect.react|target.health.pct<=10))
    {"113858",{"DarkSoul.coolvalue = 1","!player.moving","macros(ActiveCooldowns)","!talent(16)","player.spell(113858).charges = 1","player.embers >= 30","!modifier.last"}},	
    {"113858",{"DarkSoul.coolvalue = 1","!player.moving","macros(ActiveCooldowns)","talent(16)","player.spell(113858).charges >= 1","player.spell(113858).recharge <= 5","!modifier.last"}},	    
    {"113858",{"DarkSoul.coolvalue = 1","!player.moving","macros(ActiveCooldowns)","talent(16)","player.spell(113858).charges >= 1","player.embers >= 30","!modifier.last"}},	  
    {"113858",{"DarkSoul.coolvalue = 1","!player.moving","macros(ActiveCooldowns)","spellpower.snapboost","player.spell(113858).charges = 1","player.embers >= 25","!modifier.last"}},	     
    {"113858",{"DarkSoul.coolvalue = 1","!player.moving","macros(ActiveCooldowns)","modifier.time <= 10","player.spell(113858).charges >= 1","!modifier.last"}},	  
    {"113858",{"DarkSoul.coolvalue = 2","!player.moving","!talent(16)","player.spell(113858).charges = 1","player.embers >= 30","!modifier.last"}},	
    {"113858",{"DarkSoul.coolvalue = 2","!player.moving","talent(16)","player.spell(113858).charges >= 1","player.spell(113858).recharge <= 5","!modifier.last"}},	    
    {"113858",{"DarkSoul.coolvalue = 2","!player.moving","talent(16)","player.spell(113858).charges >= 1","player.embers >= 30","!modifier.last"}},	  
    {"113858",{"DarkSoul.coolvalue = 2","!player.moving","spellpower.snapboost","player.spell(113858).charges = 1","player.embers >= 25","!modifier.last"}},	     
    {"113858",{"DarkSoul.coolvalue = 2","!player.moving","modifier.time <= 10","player.spell(113858).charges >= 1","!modifier.last"}},	
	-- single+=/service_pet,if=talent.grimoire_of_service.enabled
    {"111898",{"talent(14)","GrimoireOfService.coolvalue = 1","macros(ActiveCooldowns)"}},  
    {"111898",{"talent(14)","GrimoireOfService.coolvalue = 2"}},		
	-- single+=/summon_doomguard
    {"18540",{"DoomGuard.coolvalue = 1","!player.moving","macros(ActiveCooldowns)","spellpower.snapboost","player.buff(113858)","player.hashero"}},
    {"18540",{"DoomGuard.coolvalue = 2","!player.moving","spellpower.snapboost","player.buff(113858)","player.hashero"}},
	-- single+=/havoc,target=2,if=active_enemies>1
	{"80240", {"player.aoe = 1","!player.moving","player.embers >= 10","!player.spell(113858).cooldown < 5","80240.notontarget"}},	
	-- Chaos Havoc
	{"116858",{"player.aoe = 1","!player.moving","player.embers >= 10","target.health > 20","player.buff(80240)","116858.stopcasting"}},
	{"17877",{"player.aoe = 1","!player.moving","player.embers >= 10","target.health <= 20","player.buff(80240)","17877.stopcasting"}},
	{"pause",{"player.aoe = 1","!player.moving","player.embers >= 10","player.buff(80240)"}},
	-- single+=/shadowburn,if=ember_react&(burning_ember>3.5|mana.pct<=20|target.time_to_die<20|buff.havoc.stack>=1|trinket.proc.intellect.react|(trinket.stacking_proc.intellect.remains<cast_time*4&trinket.stacking_proc.intellect.remains>cast_time))
	{"17877",{"player.aoe = 1","target.health <= 20","!player.moving","player.embers >= 10","player.buff(113858)","17877.stopcasting"}},
	{"17877",{"player.aoe = 1","target.health <= 20","!player.moving","player.embers >= 10","player.buff(80240).count >= 1","player.buff(80240).duration > 2","player.spell(113858).cooldown > 15","17877.stopcasting"}},
	{"17877",{"player.aoe = 1","target.health <= 20","!player.moving","player.embers >= 33","17877.stopcasting"}},
	{"17877",{"player.aoe = 1","target.health <= 20","!player.moving","player.embers >= 10","spellpower.snapboost","player.spell(113858).cooldown > 20","17877.stopcasting"}},
	-- single+=/immolate,cycle_targets=1,if=n_ticks*crit_pct_current>3*dot.immolate.ticks_remain*dot.immolate.crit_pct&miss_react
	{"348",{"player.aoe = 1","!player.buff(108683)","!player.moving","!modifier.last","348.stopcasting","348.multidot360(1)"}},
	-- single+=/conflagrate,if=charges=2&buff.havoc.stack=0	-- Vider au début et quand snapshot+
	{"17962",{"player.aoe = 1","!player.buff(108683)","!player.moving","player.spell(17962).charges = 2","!player.buff(80240)","!player.buff(117828)","17877.stopcasting"}},
	{"17962",{"player.aoe = 1","!player.buff(108683)","!player.moving","player.spell(17962).charges = 1","spellpower.snapboost","!player.buff(80240)","!player.buff(117828)","17877.stopcasting"}},
	-- single+=/rain_of_fire,if=!ticking&!in_flight,moving=1
	{"104232",{"player.aoe = 1","player.moving","104232.automouse(RainOfFire)"},"ground"}, 
	-- single+=/chaos_bolt,if=ember_react&target.health.pct>20&(buff.backdraft.stack<3|level<86|(active_enemies>1&action.incinerate.cast_time<1))&(burning_ember>(4.5-active_enemies)|buff.skull_banner.remains>cast_time|(trinket.proc.intellect.react&trinket.proc.intellect.remains>cast_time)|(trinket.stacking_proc.intellect.remains<cast_time*2.5&trinket.stacking_proc.intellect.remains>cast_time))
	-- single+=/chaos_bolt,if=ember_react&target.health.pct>20&(buff.havoc.stack=3&buff.havoc.remains>cast_time)
	{"116858",{"player.aoe = 1","!player.moving","player.embers > 10","target.health > 20","player.buff(113858)","116858.stopcasting"}},
	{"116858",{"player.aoe = 1","!player.moving","player.embers > 10","target.health > 20","player.buff(80240).count >= 1","player.buff(80240).duration > 2","player.spell(113858).cooldown > 15","116858.stopcasting"}},
	{"116858",{"player.aoe = 1","!player.moving","player.embers > 33","target.health > 20","116858.stopcasting"}},
	{"116858",{"player.aoe = 1","!player.moving","player.embers > 20","spellpower.snapboost","player.spell(113858).cooldown > 20","116858.stopcasting"}},
	-- single+=/conflagrate
	{"17962",{"player.aoe = 1","!player.buff(108683)","player.spell(17962).charges = 1","player.spell(17962).recharge <= 6","!player.buff(80240)","!player.buff(117828)","17962.stopcasting"}},
	-- single+=/incinerate
	{"29722",{"player.aoe = 1","!player.buff(108683)","!player.moving","29722.stopcasting"}}, 

	-- aoe=summon_infernal
    {"1122",{"Infernal.coolvalue = 1","!player.moving","macros(ActiveCooldowns)","spellpower.snapboost","player.buff(113858).duration > 5","player.hashero"}},
    {"1122",{"Infernal.coolvalue = 2","!player.moving","spellpower.snapboost","player.buff(113858).duration > 5","player.hashero"}},
	-- aoe+=/rain_of_fire,if=!ticking&!in_flight
	{"104232",{"player.aoe = 2","!modifier.last","104232.automouse(RainOfFire)"},"ground"},  	
	-- aoe+=/fire_and_brimstone,if=ember_react&buff.fire_and_brimstone.down
	{"108683",{"player.aoe = 2","player.embers >= 10","!modifier.last","!player.buff(108683)"}}, 	
	-- aoe+=/immolate,if=buff.fire_and_brimstone.up&!ticking
	{"172",{"player.aoe = 2","!modifier.last","player.embers >= 10","player.buff(108683)","!target.debuff(108686)","172.stopcasting"}},
	-- aoe+=/conflagrate,if=buff.fire_and_brimstone.up
	{"108685",{"player.buff(108683)","player.spell(108685).charges >= 1"}}, 
	-- aoe+=/incinerate,if=buff.fire_and_brimstone.up
	{"686",{"player.buff(108683)","686.stopcasting"}}, 
	-- aoe+=/incinerate
	--{"17962",{"!player.buff(108683)","player.spell(17962).charges = 1","player.spell(17962).recharge <= 6","!player.buff(117828)"}},
	{"29722",{"!player.buff(108683)","29722.stopcasting"}},
},	
	--------------------------------------------------Out of Combat-------------------------------------------- 
{ 
    -- PQI Globals 
    {"TaMere","@CML.PQIConfing()"},
    -- Player Status
    {"TaMere","@CML.Status()"}, 
	-- dark_intent,if=!aura.spell_power_multiplier.up
    {"109773",{"109773.needaura(5)","DarkIntent.pqicheck"},"player"},	
	-- summon_pet,if=!talent.grimoire_of_sacrifice.enabled|buff.grimoire_of_sacrifice.down   
    {"688",{"PetManager.pqivalue = 1","!talent(15)","!pet.exists","!modifier.last"}}, -- Imp
    {"697",{"PetManager.pqivalue = 2","!talent(15)","!pet.exists","!modifier.last"}}, -- VoidLord
    {"691",{"PetManager.pqivalue = 3","!talent(15)","!pet.exists","!modifier.last"}}, -- Observer
    {"712",{"PetManager.pqivalue = 4","!talent(15)","!pet.exists","!modifier.last"}}, -- Shivara
	{"691",{"talent(15)","!player.buff(108503)","!pet.exists","!modifier.last"}},	
	-- grimoire_of_sacrifice,if=talent.grimoire_of_sacrifice.enabled
	{"108503",{"talent(15)","!player.buff(108503)","pet.exists"}},	
    {"PetMover",{"PetMoveToMouse.pqicheck","PetMoveToMouse.pqikeybind","@CML.PetMove()"}},	
})