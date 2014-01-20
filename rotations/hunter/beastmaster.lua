ProbablyEngine.rotation.register_custom(253, "CodeMyLife BeastMaster", {  
--------------------------------------------------Defensive-------------------------------------------- 

    {"TaMere","@CML.PQIConfing()"},
    {"TaMere","@CML.Status()"},
    {"pause","@CML.CombatCheck()"}, -- Combat Check/Pause
    {"pause","player.buff(5384)"}, -- Pause for Feign Death 
    {"PetManager","@CML.PetManager()"},
    {"PetPassiveBehaviour","@CML.PetPassiveBehaviour()"},
    {"Cooldowns","@CML.Cooldowns()"},
    {"PetMover",{"PetMoveToMouse.pqikeybind","@CML.PetMove()"}},
    {"SuperPsyStuff", "@CML.SuperDuperMacroBeast()"},
    {"pause","@CML.SuperDuperMacroTimer()"},

    -- Aspect of the Iron Hawk
    {"109260",{"player.spell(109260).exists","player.stance != 1"}},
    -- Aspect of the Hawk
    {"13165",{"ActiveAspects.pqicheck","player.spell(13165).exists","player.stance != 1"}},   
    -- Exhilaration
     {"109304",{"player.spell(109304).exists","Exhilaration.novaHealing(0)"}},      
    -- Healthstone
    {"#5512",{"@CML.HealthStone()"}}, 
    -- Deterrence
     {"19263",{"Deterrence.novaHealing(0)"}},   
    -- Feign Death
    {"5384",{"FeignDeath.novaHealing(0)"}}, 
    -- Hearth of the Phoenix               
    {"55709",{"pet.spell(55709).exists","!pet.alive"}},
    -- Tranquilizing Shot
    { "19801",{"target.dispellable(19801)"},"target" },    
    -- Master's Call
    {"53271","player.state.root"},
    {"53271","player.state.snare"},
    -- Misdirection
    {"34477",{"Misdirection.pqicheck","@CML.Misdirection()"}},          

    -- Pet Related Queues
    {"883","queuecast(883)",nil}, -- Call Pet 1 Queue
    {"83242","queuecast(83242)",nil}, -- Call Pet 2 Queue
    {"83243","queuecast(83243)",nil}, -- Call Pet 3 Queue
    {"83244","queuecast(83244)",nil}, -- Call Pet 4 Queue
    {"83245","queuecast(83245)",nil}, -- Call Pet 5 Queue
    {"2641",{"queuecast(2641)","!modifier.last"},nil}, 

    -- Traps Queues   
    {"60192","queuecast(60192)","ground"}, -- Freezing Trap Queue
    {"82939","queuecast(82939)","ground"}, -- Explosive Trap Queue
    {"82948","queuecast(82948)","ground"}, -- Snakes Trap Queue     
    {"82941","queuecast(82941)","ground"}, -- Ice Trap Queue
    {"1543","queuecast(1543)","ground"}, -- Flare
    {"109248","queuecast(109248)","ground"}, -- BindingShot
    
    -- Ability Queues 
    {"82692","queuecast(82692)"}, -- Focus Fire Queue 
    {"121818","queuecast(121818)"}, -- Stampede Queue 
    {"5116","queuecast(5116)"}, -- Concussive Shot Queue 
    {"19801","queuecast(19801)"}, -- Tranq Shot Queue 
    {"20736","queuecast(20736)"}, -- Distracting Shot Queue 
    {"19503","queuecast(19503)"}, -- Scatter Shot Queue 
    {"82654","queuecast(82654)"}, -- Widow Venom Queue                          
--------------------------------------------------DPS Rotation-------------------------------------------- 
    -- Serpent Sting ,if=!ticking  
    {"1978",{"@CML.LastSerpent()","!target.debuff(118253)"}},
    -- Rapid Fire ,if=!buff.rapid_fire.up  -- On CD
    {"3045",{"target.exists","pet.alive","RapidFire.coolvalue = 2"}},   
    {"3045",{"target.exists","pet.alive","RapidFire.coolvalue = 1","macros(ActiveCooldowns)"}},    
    -- Stampede ,if=buff.rapid_fire.up|buff.bloodlust.react|target.time_to_die<=25
    {"121818",{"pet.alive","target.exists","Stampede.coolvalue = 1","macros(ActiveCooldowns)"}}, 
    {"121818",{"pet.alive","target.exists","Stampede.coolvalue = 2"}},  

    -- Dire Beast ,if=enabled&focus<=90
    {"120679",{"talent(11)"}}, 
    -- Auto Traps
    {"82939",{"@CML.TrapExplosive()"},"ground"}, 
    {"82948",{"@CML.TrapSnakes()"},"ground"},     
    {"82941",{"IceTrap.pqicheck","@CML.TrapIce()"},"ground"},   
    -- Explosive Trap ,if=active_enemies>1
    {"82939",{"ExplosiveTrap.pqivalue = 1","Traps.pqikeybind"},"ground"},
    -- Snakes Trap 
    {"82948",{"SnakesTrap.pqivalue = 1","Traps.pqikeybind"},"ground"},
    -- Ice Trap
    {"82941",{"IceTrap.pqivalue = 1","Traps.pqikeybind"},"ground"},
    -- Freezing Trap
    {"82941",{"FreezingTrap.pqikeybind"},"ground"},
    -- Kill Shot
    {"53351",{"target.health <= 20"}},    
    -- Focus Fire ,five_stacks=1,if=!ticking&!buff.beast_within.up -- On CD
    {"82692",{"pet.alive","target.exists","@CML.FocusFire()","!player.buff(34471)","player.spell(19574).cooldown > 15","FocusFire.coolvalue = 1","macros(ActiveCooldowns)"},"player"},
    {"82692",{"pet.alive","target.exists","@CML.FocusFire()","!player.buff(34471)","player.spell(19574).cooldown > 15","FocusFire.coolvalue = 2"},"player"},
    -- Fervor ,if=enabled&!ticking&focus<=65
    {"82726",{"talent(10)","player.focus < 55"}},
    -- Bestial Wrath ,if=focus>60&!buff.beast_within.up -- On CD
    {"19574",{"pet.alive","target.exists","player.focus > 60","player.spell(34026).cooldown <= 3","BestialWrath.coolvalue = 1","macros(ActiveCooldowns)"}},
    {"19574",{"pet.alive","target.exists","player.focus > 60","player.spell(34026).cooldown <= 3","BestialWrath.coolvalue = 2"}},

    -- Multi Shot ,if=active_enemies>5|(active_enemies>1&buff.beast_cleave.down)
    {"2643",{"player.aoe != 1","player.buff(34720)","pet.buff(118455).duration <= 1","player.focus >= 30","!modifier.last"}},   
    {"2643",{"player.aoe != 1","pet.buff(118455).duration <= 1","player.focus >= 40","!modifier.last"}},    
    {"2643",{"macros(Cleave)","player.buff(34720)","pet.buff(118455).duration <= 1","player.focus >= 30","!modifier.last"}},   
    {"2643",{"macros(Cleave)","pet.buff(118455).duration <= 1","player.focus >= 40","!modifier.last"}},    
    -- Kill Command
    {"34026",{"target.petinmelee","pet.alive","@CML.KillCommand()"}},
    -- Glaive Toss ,if=enabled
    {"117050",{"talent(16)"}},
    -- Cobra Shot if BW near to be ready    
    {"77767",{"player.spell(19574).cooldown < 2","player.focus < 45","BestialWrath.pqivalue = 1","macros(ActiveCooldowns)"}}, 
    {"77767",{"player.spell(19574).cooldown < 2","player.focus < 45","BestialWrath.pqivalue = 2"}}, 
    -- A Murder of Crows ,if=enabled&!ticking
    {"131894",{"talent(13)","player.focus > 59","AMurderofCrows.coolvalue = 1","macros(ActiveCooldowns)"}}, 
    {"131894",{"talent(13)","player.focus > 59","AMurderofCrows.coolvalue = 2"}},    

    -- Lynx Rush ,if=enabled&!dot.lynx_rush.ticking
    {"120697",{"talent(15)"}},       
    -- Barrage ,if=enabled
    {"120360",{"talent(18)"}},    
    -- Powershot ,if=enabled
    {"109259",{"talent(17)"}},   
    -- Focus Fire ,five_stacks=1 
    {"82692",{"pet.alive","target.exists","@CML.FocusFire()","!player.buff(34471)","player.spell(19574).cooldown > 15","FocusFire.pqivalue = 2"},"player"},
    {"82692",{"macros(ActiveCooldowns)","FocusFire.pqivalue = 1","pet.alive","target.exists","@CML.FocusFire()","!player.buff(34471)","player.spell(19574).cooldown > 15"},"player"},
    -- Arcane Shot ,if=buff.thrill_of_the_hunt.react|buff.beast_within.up
    {"3044",{"player.aoe = 1","talent(16)","player.spell(117050).cooldown >= 2","player.buff(34720)","player.focus >= 41"}},
    {"3044",{"player.aoe = 1","talent(16)","player.spell(117050).cooldown >= 2","player.buff(34720)","player.focus >= 0","player.buff(34471)"}}, 
    {"3044",{"player.aoe = 1","talent(16)","player.spell(117050).cooldown >= 2","player.buff(34471)","player.focus >= 51"}}, 
    {"3044",{"player.aoe = 1","!talent(16)","player.buff(34720)","player.focus >= 41"}},
    {"3044",{"player.aoe = 1","!talent(16)","player.buff(34720)","player.buff(34471)","player.focus >= 0"}}, 
    {"3044",{"player.aoe = 1","!talent(16)","player.buff(34471)","player.focus >= 51",}},     
   -- Cobra Shot,if=dot.serpent_sting.remains<6
    {"77767",{"!target.debuff(118253).duration > 6"}},
    -- Cobra Shot -- Stack Focus
    {"77767",{"StackFocus.pqikeybind","player.focus < 82"}}, 
    -- Arcane Shot ,if=focus>=61
    {"3044",{"player.aoe = 1","player.focus >= 65"}},
    -- Multi Shot ,if=focus>=91
    {"2643",{"player.aoe = 2","player.focus >= 95"}},    
    {"2643",{"player.aoe = 2","player.focus >= 75","player.buff(34471)"}},      
    -- Cobra Shot
    {"77767"}
}, 
--------------------------------------------------Out of Combat-------------------------------------------- 
{ 
    -- PQI Globals 
    {"TaMere","@CML.PQIConfing()"},
    -- Player Status
    {"TaMere","@CML.Status()"}, 
    {"pause","player.buff(5384)"}, -- Pause for Feign Death 
    {"PetManager","@CML.PetManager()"},
    -- Aspect Swapping
    {"5118",{"!toggle.pack","ActiveAspects.pqicheck","@CML.Aspects(2)","!player.buff(5118)"},"player"},
    {"13159",{"toggle.pack","ActiveAspects.pqicheck","@CML.Aspects(2)","!player.buff(13159)"},"player"},

    -- Aspect of the Iron Hawk
    {"109260",{"ActiveAspects.pqicheck","target.exists","@CML.Aspects(1)","player.spell(109260).exists","player.stance != 1"}},
    -- Aspect of the Hawk
    {"13165",{"target.exists","@CML.Aspects(1)","player.spell(13165).exists","player.stance != 1"}},

    -- Hunters Mark
    {"1130",{"target.exists","@CML.HuntersMark()","!target.debuff(1130).any"},"target"},
    {"PetMover",{"PetMoveToMouse.pqikeybind","@CML.PetMove()"}},
}) 