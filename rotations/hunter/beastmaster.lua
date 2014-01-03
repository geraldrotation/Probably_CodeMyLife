ProbablyEngine.rotation.register_custom(253, "CodeMyLife BeastMaster", {  
--------------------------------------------------Defensive-------------------------------------------- 
    {"TaMere","@CML.PQIConfing()"},
    {"TaMere","@CML.Status()"},
    {"pause","@CML.CombatCheck()"}, -- Combat Check/Pause
    {"pause","player.buff(5384)"}, -- Pause for Feign Death
    -- Aspect of the Iron Hawk
    {"109260",{ 
        "player.spell(109260).exists",
        "player.stance != 1",
    }},
    -- Aspect of the Hawk
    {"13165",{
        "player.spell(13165).exists",
        "player.stance != 1",
    }},   
    -- Exhilaration
     {"109304",{
        "spell.exists",
        "Exhilaration.novaHealing(0)",
    }},                
    -- Healthstone   
    {"#5512",{
        "@CML.HealthStone()",
        "Healthstone.novaHealing(0)",
    }},   
    -- Deterrence
     {"19263",{
        "Deterrence.novaHealing(0)",
    }},   
    -- Feign Death
    {"5384",{
        "FeignDeath.novaHealing(0)",
    }}, 
    -- Hearth of the Phoenix               
    {"55709",{
        "!pet.alive",
        "player.spell(55709).exists",
    }},
    -- Mend Pet
    {"136",{
        "MendPet.novaHealing(69)",
        "pet.alive",
        "!pet.buff(136)"
    }},
    -- Tranquilizing Shot
    { "19801",{
        "target.dispellable(19801)",
    },"target" },    
    -- Master's Call
    {"53271","player.state.root"},
    {"53271","player.state.snare"},
    -- Misditrection
    {"34477",{
        "Misdirection.pqicheck",
        "@CML.Misdirection()"
    }},          

    -- Pet Related Queues
    {"883","queuecast(883)",nil}, -- Call Pet 1 Queue
    {"83242","queuecast(83242)",nil}, -- Call Pet 2 Queue
    {"83243","queuecast(83243)",nil}, -- Call Pet 3 Queue
    {"83244","queuecast(83244)",nil}, -- Call Pet 4 Queue
    {"83245","queuecast(83245)",nil}, -- Call Pet 5 Queue
    {"2641",{ -- Dissmiss Pet Queue  
        "queuecast(2641)",
        "!modifier.last",
    },nil}, 

    -- Traps Queues   
    {"1499","queuecast(1499)","ground"}, -- Freezing Trap Queue
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
    {"883","@CML.PetManager(1)"}, -- Call Pet Slot 1
    {"83242","@CML.PetManager(2)"}, -- Call Pet Slot 2
    {"83243","@CML.PetManager(3)"}, -- Call Pet Slot 3
    {"83244","@CML.PetManager(4)"}, -- Call Pet Slot 4
    {"83245","@CML.PetManager(5)"}, -- Call Pet Slot 5
    {"982","@CML.PetManager(0)"}, -- Revive Pet                           
--------------------------------------------------Interrupts-------------------------------------------- 
    -- Interrupts
    {{
            {"147362","player.range < 40"}, -- Counter Shot
            { "96231",{"player.spell(96231).cooldown","player.range < 20"}},  -- Scatter Shot 
        }, "modifier.interrupts"
    }, 
--------------------------------------------------DPS Rotation-------------------------------------------- 
    -- virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<=60
-- /dump ProbablyEngine.dsl.get("pqicheck")("AgilityPotiononHeroism")
    {"#76089",{
        "AgilityPotiononHeroism.pqicheck",
        "@CML.DPSPotion(76089)",
    }},
    -- Auto Shot 
    {"PetMover",{
        "PetMoveToMouse.pqicheck",
        "PetMoveToMouse.pqikeybind",
        "@CML.PetMove()",
    }}, 
    -- Serpent Sting ,if=!ticking  
    {"1978",{
        "!target.debuff(118253)",
    }},      
    -- Auto Traps
    {"82939",{ -- Explosive Trap
        "ExplosiveTrap.pqivalue = 2",
        "player.spell(82939).cooldown < 2",
        "@CML.TrapExplosive()",
    },"ground"}, 
    {"82948",{ -- Snakes Trap
        "SnakesTrap.pqivalue = 2",
        "player.spell(82948).cooldown < 2",
        "@CML.TrapSnakes()",
    },"ground"},     
    {"82941",{  -- Ice Trap
        "IceTrap.pqivalue = 2",
        "player.spell(82941).cooldown < 2",
        "@CML.TrapIce()",
    },"ground"},   
    -- Explosive Trap ,if=active_enemies>1
    {"82939",{
        "ExplosiveTrap.pqicheck",
        "ExplosiveTrap.pqivalue = 1",
        "Traps.pqikeybind",
    },"ground"},
    -- Snakes Trap 
    {"82948",{
        "SnakesTrap.pqicheck",
        "SnakesTrap.pqivalue = 1",
        "Traps.pqikeybind",
    },"ground"},
    -- Ice Trap
    {"82941",{
        "IceTrap.pqicheck",
        "IceTrap.pqivalue = 1",
        "Traps.pqikeybind",
    },"ground"},
    {"82939","queuecast(82939)","ground"}, -- Explosive Trap Queue
    {"82948","queuecast(82948)","ground"}, -- Snakes Trap Queue     
    {"82941","queuecast(82941)","ground"}, -- Ice Trap Queue
    -- Freezing Trap
    {"82941",{
        "FreezingTrap.pqicheck",
        "FreezingTrap.pqikeybind",
    },"ground"}, 
    -- Stampede ,if=buff.rapid_fire.up|buff.bloodlust.react|target.time_to_die<=25
    {"121818",{
        "Stampede.pqicheck",
        "Stampede.pqivalue = 2",
        "pet.exists",
        "target.exists",
    },"target"},
    -- Stampede ,if=buff.rapid_fire.up|buff.bloodlust.react|target.time_to_die<=25
    {"121818",{
        "macros(ActiveCooldowns)",
        "Stampede.pqivalue = 1",
        "pet.exists",
        "target.exists",
    }}, 
    {"pause",{
        "Stampede.pqivalue = 2",
        "player.spell(121818).cooldown < 1",
    }},
    {"pause",{
        "macros(ActiveCooldowns)",
        "Stampede.pqivalue = 1",
        "player.spell(121818).cooldown < 1",
    }},    
    -- Bloodfury
    {"20572",{ -- On CD
        "player.spell(20572).exists",
        "Racials.pqicheck",
        "Racials.pqivalue = 2",
    }},
    {"20572",{ -- On ActiveCooldowns
        "player.spell(20572).exists",
        "Racials.pqivalue = 1",
        "macros(ActiveCooldowns)",
    }},
    -- Berserking
    {"26297",{ -- On CD
        "player.spell(26297).exists",
        "Racials.pqivalue = 2",
    }},
    {"26297",{ -- On ActiveCooldowns
        "player.spell(26297).exists",
        "Racials.pqivalue = 1",
        "macros(ActiveCooldowns)",
    }},
   -- Lifeblood
    {"121279",{ -- On CD
        "player.spell(121279).exists",
        "ProfessionsCDs.pqivalue = 2",
    }},
    {"121279",{ -- On ActiveCooldowns 
        "player.spell(121279).exists",
        "ProfessionsCDs.pqivalue = 1",
        "macros(ActiveCooldowns)",
    }},
    -- Gloves  
    {"#gloves",{ -- On CD
        "ProfessionsCDs.pqivalue = 2",
        "pet.exists",
        "target.exists",
    }},  
    {"#gloves",{ -- On ActiveCooldowns
        "macros(ActiveCooldowns)",
        "ProfessionsCDs.pqivalue = 1",
        "pet.exists",
        "target.exists",
    }}, 
     -- Trinket1 
    {"#trinket1",{ -- On CD
        "Trinkets.pqivalue = 2",
        "pet.exists",
        "target.exists",
    }},
    {"#trinket1",{ -- On ActiveCooldowns
        "Trinkets.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "pet.exists",
        "target.exists",
    }},
     -- Trinket2   
    {"#trinket2",{ -- On CD
        "Trinkets.pqivalue = 2",
        "pet.exists",
        "target.exists",
    }}, 
    {"#trinket2",{ -- On ActiveCooldowns 
        "Trinkets.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "pet.exists",
        "target.exists",
    }},
    -- Focus Fire ,five_stacks=1,if=!ticking&!buff.beast_within.up -- On CD
    {"82692",{
        "FocusFire.pqicheck",
        "FocusFire.pqivalue = 2",
        "pet.exists",
        "target.exists",
        "@CML.FocusFire()", -- 5 stacks of Frenzy
        "!player.buff(34471)", -- Not under bestial wrath
        "player.spell(19574).cooldown > 15",
    },"player"},
    -- Focus Fire ,five_stacks=1,if=!ticking&!buff.beast_within.up -- On ActiveCooldowns
    {"82692",{
        "FocusFire.pqicheck",
        "macros(ActiveCooldowns)",
        "FocusFire.pqivalue = 1",
        "pet.exists",
        "target.exists",
        "@CML.FocusFire()", -- 5 stacks of Frenzy
        "!player.buff(34471)", -- Not under bestial wrath
        "player.spell(19574).cooldown > 15",
    },"player"},
    -- Fervor ,if=enabled&!ticking&focus<=65
    {"82726",{
        "Fervor.pqicheck",
        "talent(10)",
        "player.focus < 45",
    }},
    -- Rapid Fire ,if=!buff.rapid_fire.up  -- On CD
    {"3045",{
        "RapidFire.pqivalue = 2",
        "pet.exists",
        "target.exists",
        "!player.buff(82692)", -- Not under focus fire
    }},    
    -- Rapid Fire ,if=!buff.rapid_fire.up  -- On ActiveCooldowns
    {"3045",{
        "macros(ActiveCooldowns)",
        "RapidFire.pqivalue = 1",
        "pet.exists",
        "target.exists",
        "!player.buff(82692)", -- Not under focus fire
    }}, 
    -- Bestial Wrath ,if=focus>60&!buff.beast_within.up -- On CD
    {"19574",{
        "BestialWrath.pqivalue = 2",
        "pet.alive",
        "target.exists",
        "player.focus > 60",
        "player.spell(34026).cooldown <= 2",
    }},
    -- Bestial Wrath ,if=focus>60&!buff.beast_within.up -- On ActiveCooldowns
    {"19574",{
        "macros(ActiveCooldowns)",
        "BestialWrath.pqivalue = 1",
        "pet.alive",
        "target.exists",
        "player.focus > 60",
        "player.spell(34026).cooldown <= 2",
    }},
    -- Multi Shot ,if=active_enemies>5|(active_enemies>1&buff.beast_cleave.down)
    {"2643",{
        "player.aoe != 1",
        "player.buff(34720)",
        "!pet.buff(188455)",
        "player.focus >= 51"
    }},   
    {"2643",{
        "player.aoe != 1",
        "!pet.buff(188455)",
        "player.focus >= 71"
    }},      
    -- Cobra Shot ,if=active_enemies>5
    {"77767",{
        "player.aoe != 1",
    }},
    -- Kill Shot
    {"53351",{
        "target.health <= 20"
    }},    
    -- Kill Command
    {"34026",{
        "target.petinmelee",
        "pet.alive",
        "@CML.KillCommand()",
    }},
    -- Glaive Toss ,if=enabled
    {"117050",{
        "talent(16)",
    }}, 
    -- Dire Beast ,if=enabled&focus<=90
    {"120679",{
        "talent(11)",
    }},       
    -- Cobra Shot if BW near to be ready    
    {"77767",{
        "BestialWrath.pqivalue = 2",
        "player.spell(19574).cooldown < 3",
        "player.focus < 80",
    }}, 
    {"77767",{
        "macros(ActiveCooldowns)",
        "BestialWrath.pqivalue = 1",
        "player.spell(19574).cooldown < 3",
        "player.focus < 80",
    }},
    -- A Murder of Crows ,if=enabled&!ticking
    {"131894",{ -- On CD
        "talent(13)",
        "AMurderofCrows.pqivalue = 2",
        "player.focus > 59", 
    }},    
    {"131894",{ -- On ActiveCooldowns
        "talent(13)",
        "macros(ActiveCooldowns)",
        "AMurderofCrows.pqivalue = 1",
        "player.focus > 59", 
    }}, 
    -- Lynx Rush ,if=enabled&!dot.lynx_rush.ticking
    {"120697",{
        "talent(15)",
    }},       
    -- Barrage ,if=enabled
     {"120360",{
        "talent(18)",
    }},    
    -- Powershot ,if=enabled
    {"109259",{
        "talent(17)",
    }},
    -- Arcane Shot ,if=buff.thrill_of_the_hunt.react|buff.beast_within.up
    {"3044",{
        "player.buff(34720)",
        "player.focus >= 41"
    }},
    {"3044",{
        "player.buff(34720)",
        "player.buff(34471)",
        "player.focus >= 0"
    }}, 
    {"3044",{
        "player.buff(34471)",
        "player.focus >= 15"
    }}, 
    -- Focus Fire ,five_stacks=1 -- On CD
    {"82692",{
        "FocusFire.pqivalue = 2",
        "pet.exists",
        "target.exists",
        "@CML.FocusFire()", -- 5 stacks of Frenzy
        "!player.buff(34471)", -- Not under bestial wrath
        "player.spell(19574).cooldown > 15",
    },"player"},
    -- Focus Fire ,five_stacks=1 -- On ActiveCooldowns
    {"82692",{
        "macros(ActiveCooldowns)",
        "FocusFire.pqivalue = 1",
        "pet.exists",
        "target.exists",
        "@CML.FocusFire()", -- 5 stacks of Frenzy
        "!player.buff(34471)", -- Not under bestial wrath
        "player.spell(19574).cooldown > 15",
    },"player"},
    -- Cobra Shot,if=dot.serpent_sting.remains<6
    {"77767",{
        "!target.debuff(118253).duration > 6",
    }},
    -- Cobra Shot -- Stack Focus
    {"77767",{
        "StackFocus.pqicheck",
        "StackFocus.pqikeybind",
        "player.focus < 82",
    }}, 
    -- Arcane Shot ,if=focus>=61
    {"3044",{
        "player.focus >= 61"
    }},
    -- Cobra Shot
    {"77767"}
}, 
--------------------------------------------------Out of Combat-------------------------------------------- 
{ 
    -- PQI Globals 
    {"TaMere","@CML.PQIConfing()"},
    -- Player Status
    {"TaMere","@CML.Status()"}, 
    -- Aspect Swapping
    {"5118",{
        "!toggle.pack",
        "ActiveAspects.pqicheck",
        "@CML.Aspects(2)",
        "!player.buff(5118)"
    },"player"},
    {"13159",{
        "toggle.pack",
        "ActiveAspects.pqicheck",
        "@CML.Aspects(2)",
        "!player.buff(13159)"
    },"player"},

    -- Aspect of the Iron Hawk
    {"109260",{ 
        "ActiveAspects.pqicheck",
        "target.exists",
        "@CML.Aspects(1)",
        "player.spell(109260).exists",
        "player.stance != 1",
    }},
    -- Aspect of the Hawk
    {"13165",{
        "ActiveAspects.pqicheck",
        "target.exists",
        "@CML.Aspects(1)",
        "player.spell(13165).exists",
        "player.stance != 1",
    }},
    -- Hunters Mark
    {"1130",{
        "target.alive",
        "!target.debuff(1130)",
        "@CML.HuntersMark()",
    }},
    {"PetMover",{
        "PetMoveToMouse.pqicheck",
        "PetMoveToMouse.pqikeybind",
        "@CML.PetMove()",
    }},

}) 