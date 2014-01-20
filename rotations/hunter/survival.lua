ProbablyEngine.rotation.register_custom(255, "CodeMyLife Survival", {  
--------------------------------------------------Defensive-------------------------------------------- 
    {" :) ","@CML.PQIConfing()"},
    {" (: ","@CML.Status()"},
    {"pause","@CML.CombatCheck()"}, -- Combat Check/Pause
    {"pause","player.buff(5384)"}, -- Pause for Feign Death
    {"PetManager","@CML.PetManager()"},
       
    -- Aspect of the Iron Hawk
    {"109260",{"player.spell(109260).exists","player.stance != 1"}},
    -- Aspect of the Hawk
    {"13165",{"player.spell(13165).exists","player.stance != 1",
    }},   
    -- Exhilaration
     {"109304",{"player.spell(109304).exists","Exhilaration.novaHealing(0)",
    }}, 
    -- Deterrence
     {"19263",{"Deterrence.novaHealing(0)",}},   
    -- Feign Death
    {"5384",{"FeignDeath.novaHealing(0)",}}, 
    -- Hearth of the Phoenix               
    {"55709",{"!pet.alive","player.spell(55709).exists"}},
    -- Mend Pet
    {"136",{"MendPet.novaHealing(69)","pet.alive","!pet.buff(136)"}},
    -- Tranquilizing Shot
    { "19801",{"target.dispellable(19801)"},"target" },    
    -- Master's Call
    {"53271","player.state.root"},
    {"53271","player.state.snare"},
    -- Misditrection
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
    {"121818","queuecast(121818)"}, -- Stampede Queue 
    {"5116","queuecast(5116)"}, -- Concussive Shot Queue 
    {"19801","queuecast(19801)"}, -- Tranq Shot Queue 
    {"20736","queuecast(20736)"}, -- Distracting Shot Queue 
    {"19503","queuecast(19503)"}, -- Scatter Shot Queue 
    {"82654","queuecast(82654)"}, -- Widow Venom Queue  
    {"PetHandler","@CML.PetPassiveBehaviour()"},                          

--------------------------------------------------DPS Rotation-------------------------------------------- 

    -- Auto Shot 
    {"PetMover",{"PetMoveToMouse.pqikeybind","@CML.PetMove()"}},    -- Auto Traps 
    -- Serpent Sting ,if=!ticking  
    {"1978",{"!target.debuff(118253)"}},      
    {"82939",{"ExplosiveTrap.pqivalue = 2","player.spell(82939).cooldown < 2","@CML.TrapExplosive()"},"ground"}, 
    {"82948",{"SnakesTrap.pqivalue = 2","player.spell(82948).cooldown < 2","@CML.TrapSnakes()"},"ground"},     
    {"82941",{"IceTrap.pqivalue = 2","player.spell(82941).cooldown < 2","@CML.TrapIce()",},"ground"},   
    -- Explosive Trap ,if=active_enemies>1
    {"82939",{"ExplosiveTrap.pqivalue = 1","Traps.pqikeybind"},"ground"},
    -- Snakes Trap 
    {"82948",{"SnakesTrap.pqivalue = 1","Traps.pqikeybind"},"ground"},
    -- Ice Trap
    {"82941",{"IceTrap.pqivalue = 1","Traps.pqikeybind"},"ground"},
    {"82939","queuecast(82939)","ground"}, -- Explosive Trap Queue
    {"82948","queuecast(82948)","ground"}, -- Snakes Trap Queue     
    {"82941","queuecast(82941)","ground"}, -- Ice Trap Queue
    -- Freezing Trap
    {"82941",{"FreezingTrap.pqikeybind"},"ground"},   
    -- Fervor ,if=enabled&!ticking&focus<=50
    {"82726",{"Fervor.pqicheck","talent(10)","player.focus < 45"}},
    -- A Murder of Crows ,if=enabled&!ticking
    {"131894",{"talent(13)","AMurderofCrows.coolvalue = 2","player.focus > 59"}},    
    {"131894",{"talent(13)","macros(ActiveCooldowns)","AMurderofCrows.coolvalue = 1","player.focus > 59"}}, 
    -- Lynx Rush ,if=enabled&!dot.lynx_rush.ticking
    {"120697",{"talent(15)"}}, 
    -- Explosive Shot ,if=buff.lock_and_load.react
    {"53301",{"player.buff(56453)"}},    
    -- Glaive Toss ,if=enabled
    {"117050",{"talent(16)"}},     
    -- Powershot ,if=enabled
    {"109259",{"talent(17)"}},
    -- Barrage ,if=enabled
    {"120360",{"talent(18)"}}, 
    -- Explosive Shot ,if=cooldown_react
    {"53301"}, 
    -- Kill Shot
    {"53351",{"target.health <= 20"}}, 
    -- Black Arrow ,if=!ticking&target.time_to_die>=8
    {"3674",{"player.aoe = 1","!target.debuff(3674)"}},
    -- multi_shot,if=active_enemies>3
    {"2643",{"player.aoe == 3","player.focus >= 65"}},   
    -- multi_shot,if=buff.thrill_of_the_hunt.react&dot.serpent_sting.remains<2
    {"2643",{"player.aoe != 1","player.buff(34720)","player.focus >= 35","target.debuff(118253).duration < 2"}}, 
    -- Arcane Shot ,if=buff.thrill_of_the_hunt.react
    {"3044",{"player.aoe = 1","player.buff(34720)","player.focus >= 35"}},
    -- Rapid Fire ,if=!buff.rapid_fire.up  -- On CD
    {"3045",{"pet.alive","target.exists","RapidFire.coolvalue = 1","macros(ActiveCooldowns)"}},
    {"3045",{"pet.alive","target.exists","RapidFire.coolvalue = 2"}},
    -- Dire Beast ,if=enabled
    {"120679",{"talent(11)"}}, 
    -- stampede,if=buff.rapid_fire.up|buff.bloodlust.react|target.time_to_die<=25
    {"121818",{"pet.alive","target.exists","Stampede.coolvalue = 1","macros(ActiveCooldowns)"}},
    {"121818",{"pet.alive","target.exists","Stampede.coolvalue = 2"}},

    -- Cobra Shot,if=dot.serpent_sting.remains<6
    {"77767",{"!target.debuff(118253).duration > 6"}},
    -- Cobra Shot -- Stack Focus
    {"77767",{"StackFocus.pqicheck","StackFocus.pqikeybind","player.focus < 65"}}, 
    -- Arcane Shot ,if=focus>=67
    {"3044",{"player.focus >= 67"}},
    -- Multi Shot ,if=focus>=67&active_enemies>1
    {"2643",{"player.aoe != 1","player.focus >= 67"}},
    -- Cobra Shot
    {"77767"}
}, 
--------------------------------------------------Out of Combat-------------------------------------------- 
{ 
    {" :) ","@CML.PQIConfing()"},
    {" (: ","@CML.Status()"}, 
    {"pause","player.buff(5384)"}, -- Pause for Feign Death 
    -- Aspect Swapping
    {"5118",{"!toggle.pack","ActiveAspects.pqicheck","@CML.Aspects(2)","!player.buff(5118)"},"player"},
    {"13159",{"toggle.pack","ActiveAspects.pqicheck","@CML.Aspects(2)","!player.buff(13159)"},"player"},

    -- Aspect of the Iron Hawk
    {"109260",{"target.exists","@CML.Aspects(1)","player.spell(109260).exists","player.stance != 1"}},
    -- Aspect of the Hawk
    {"13165",{"target.exists","@CML.Aspects(1)","player.spell(13165).exists","player.stance != 1"}},
    -- Hunters Mark
    {"1130",{"target.alive","!target.debuff(1130)","@CML.HuntersMark()"}},
    {"PetMover",{"PetMoveToMouse.pqikeybind","@CML.PetMove()"}},

}) 
