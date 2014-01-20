ProbablyEngine.rotation.register_custom(254, "CodeMyLife Marksman", {  
--------------------------------------------------Defensive-------------------------------------------- 
    {"TaMere","@CML.PQIConfing()"},
    {"TaMere","@CML.Status()"},
    {"pause","@CML.CombatCheck()"}, -- Combat Check/Pause
    {"pause","player.buff(5384)"}, -- Pause for Feign Death
    {"PetManager","@CML.PetManager()"},
       
    -- Aspect of the Iron Hawk
    {"109260",{"player.spell(109260).exists","player.stance != 1"}},
    -- Aspect of the Hawk
    {"13165",{"player.spell(13165).exists","player.stance != 1"}},   
    -- Exhilaration
     {"109304",{"player.spell(109304).exists","Exhilaration.novaHealing(0)"},"player"},            
    -- Deterrence
     {"19263",{"Deterrence.novaHealing(0)"}},   
    -- Feign Death
    {"5384",{"FeignDeath.novaHealing(0)"}}, 
    -- Hearth of the Phoenix               
    {"55709",{"!pet.alive","player.spell(55709).exists"}},
    -- Mend Pet
    {"136",{"pet.alive","MendPet.novaHealing(69)","!pet.buff(136)"}},
    -- Tranquilizing Shot
    {"19801",{"target.dispellable(19801)"},"target"},    
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
    {"2641",{"queuecast(2641)","!modifier.last"},nil}, -- Dissmiss Pet Queue  

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

    -- Serpent Sting ,if=!ticking  
    {"1978",{"!target.debuff(118253)"}},      
    -- Auto Shot 
    {"PetMover",{"PetMoveToMouse.pqicheck","PetMoveToMouse.pqikeybind","@CML.PetMove()"}}, 
    -- Auto Traps
    {"82939",{"ExplosiveTrap.pqivalue = 2","player.spell(82939).cooldown < 2","@CML.TrapExplosive()"},"ground"}, 
    {"82948",{"SnakesTrap.pqivalue = 2","player.spell(82948).cooldown < 2","@CML.TrapSnakes()"},"ground"},     
    {"82941",{"IceTrap.pqivalue = 2","player.spell(82941).cooldown < 2","@CML.TrapIce()"},"ground"},   
    -- Explosive Trap ,if=active_enemies>1
    {"82939",{"ExplosiveTrap.pqicheck","ExplosiveTrap.pqivalue = 1","Traps.pqikeybind"},"ground"},
    -- Snakes Trap 
    {"82948",{"SnakesTrap.pqicheck","SnakesTrap.pqivalue = 1","Traps.pqikeybind"},"ground"},
    -- Ice Trap
    {"82941",{"IceTrap.pqicheck","IceTrap.pqivalue = 1","Traps.pqikeybind"},"ground"},
    {"82939","queuecast(82939)","ground"}, -- Explosive Trap Queue
    {"82948","queuecast(82948)","ground"}, -- Snakes Trap Queue     
    {"82941","queuecast(82941)","ground"}, -- Ice Trap Queue
    -- Freezing Trap
    {"82941",{"FreezingTrap.pqicheck","FreezingTrap.pqikeybind"},"ground"},   
    -- Powershot ,if=enabled
    {"109259",{"talent(17)","!player.moving"}},
    -- Lynx Rush ,if=enabled&!dot.lynx_rush.ticking
    {"120697",{"talent(15)"}},
    -- Fervor ,if=enabled&!ticking&focus<=50
    {"82726",{"Fervor.pqicheck","talent(10)","player.focus < 45"}},
    -- Rapid Fire ,if=!buff.rapid_fire.up  -- On CD
    {"3045",{"target.exists","pet.alive","RapidFire.coolvalue = 1","macros(ActiveCooldowns)",}},
    {"3045",{"target.exists","pet.alive","RapidFire.coolvalue = 2"}},
    -- stampede,if=buff.rapid_fire.up|buff.bloodlust.react|target.time_to_die<=25
    {"121818",{"target.exists","pet.alive","Stampede.coolvalue = 1","macros(ActiveCooldowns)"}}, 
    {"121818",{"target.exists","pet.alive","Stampede.coolvalue = 2"}},  
    -- A Murder of Crows ,if=enabled&!ticking    
    {"131894",{"player.focus > 59","talent(13)","AMurderofCrows.coolvalue = 1","macros(ActiveCooldowns)"}}, 
    {"131894",{"player.focus > 59","talent(13)","AMurderofCrows.coolvalue = 2"}}, 
    -- Dire Beast ,if=enabled
    {"120679",{"talent(11)"}}, 
    -- run_action_list,name=careful_aim,if=target.health.pct>80
    -- Serpent Stingcareful_aim=serpent_sting,if=!ticking
    {"1978",{"target.health >= 80","!target.debuff(118253)"}},
    -- Chimera Shot careful_aim+=/chimera_shot
    {"53209",{"target.health >= 80"}},
    -- Steady Shot careful_aim+=/steady_shot,if=buff.pre_steady_focus.up&buff.steady_focus.remains<6
    {"56641",{"target.health >= 80","!player.buff(53220).duration > 6"}},
    -- Aimed Shot careful_aim+=/aimed_shot
    {"19434",{"target.health >= 80","player.focus > 70"}},
    -- Glaive Toss careful_aim+=/glaive_toss,if=enabled
    {"117050",{"target.health >= 80","talent(16)"}}, 
    -- Steady Shot careful_aim+=/steady_shot
    {"56641",{"target.health >= 80"}},

    -- Steady Shot ,if=buff.pre_steady_focus.up&buff.steady_focus.remains<=4
    {"56641",{"@CML.SteadyFocus()","!player.buff(53220).duration > 4"}},
    -- Glaive Toss ,if=enabled
    {"117050",{"talent(16)"}}, 
    -- Barrage ,if=enabled
    {"120360",{"talent(18)"}}, 
    -- serpent_sting,if=!ticking
    {"1978",{"!target.debuff(118253)"}},
    -- chimera_shot
    {"53209"},
    -- steady_shot,if=buff.steady_focus.remains<(action.steady_shot.cast_time+1)&!in_flight
    {"56641",{"@CML.SteadyFocus()","!player.buff(53220).duration > 4"}},
    -- Kill Shot
    {"53351",{"target.health <= 20"}},     
    -- Multi Shot ,if=active_enemies>=4
    {"2643",{"player.aoe == 2","player.focus >= 65"}},      
    -- Aimed Shot ,if=buff.master_marksman_fire.react
    {"19434",{"player.buff(82926)"}},
    -- Arcane Shot ,if=buff.thrill_of_the_hunt.react
    {"3044",{"player.buff(34720)","player.focus >= 45"}},
    -- Aimed Shot ,if=cast_time<1.6
    {"19434",{"spell.casttime(19434) < 1.6","player.focus >= 70"}},
    -- arcane_shot,if=focus>=60|(focus>=43&(cooldown.chimera_shot.remains>=action.steady_shot.cast_time))&(!buff.rapid_fire.up&!buff.bloodlust.react)
    {"3044",{"player.focus >= 65"}},
    -- steady_shot
    {"56641"},
}, 
--------------------------------------------------Out of Combat-------------------------------------------- 
{ 
    {"PetManager","@CML.PetManager()"},
    {"TaMere","@CML.PQIConfing()"},
    {"TaMere","@CML.Status()"}, 
    {"pause","player.buff(5384)"}, -- Pause for Feign Death 
    
    -- Aspect Swapping
    {"5118",{"!toggle.pack","ActiveAspects.pqicheck","@CML.Aspects(2)","!player.buff(5118)"},"player"},
    {"13159",{"toggle.pack","ActiveAspects.pqicheck","@CML.Aspects(2)","!player.buff(13159)"},"player"},
    -- Aspect of the Iron Hawk
    {"109260",{"ActiveAspects.pqicheck","target.exists","@CML.Aspects(1)","player.spell(109260).exists","player.stance != 1"}},
    -- Aspect of the Hawk
    {"13165",{"ActiveAspects.pqicheck","target.exists","@CML.Aspects(1)","player.spell(13165).exists","player.stance != 1"}},

    -- Hunters Mark
    {"1130",{"target.alive","!target.debuff(1130)","@CML.HuntersMark()"}},
    {"PetMover",{"PetMoveToMouse.pqicheck","PetMoveToMouse.pqikeybind","@CML.PetMove()"}},
}) 
