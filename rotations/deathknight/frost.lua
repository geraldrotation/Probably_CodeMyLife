ProbablyEngine.rotation.register_custom(251, "CodeMyLife Frost", {
--------------------------------------------------Defensive-------------------------------------------- 
    {"TaMere","@CML.PQIConfing()"},{"TaMere","@CML.Status()"},{"pause","@CML.CombatCheck()"}, -- Combat Check/Pause
    {"49576","queuecast(49576)","target"}, -- Death Grip
    {"43265","queuecast(43265)","ground"}, -- Death and Decay 
    -- Frost Presence
    {"48266",{
        "player.seal != 2",
        "target.range <= 5",
    }},
    -- Unholy Presence
    {"48265",{
        "player.seal != 3",
        "player.health >= 60",
        "target.range > 5",
    }}, 
    -- Blood Presence
    {"48263",{
        "player.seal != 1",
        "player.health < 60",
        "target.range > 5",
    }},       
    -- Anti Magi Shell
    { "48707",{
        "AntiMagicShell.novaHealing(0)",
    }},            
    -- Healthstone   
    {"#5512",{
        "@CML.HealthStone()",
        "Healthstone.novaHealing(0)",
    }},   
    -- Conversion
    { "119975",{
        "Conversion.novaHealing(0)",
    }},
    -- Icebound Fortitude
    { "48792",{
        "IceboundFortitude.novaHealing(0)",
    }},
    -- Death Pact Macro
    {"!/cast Raise Dead\n/cast Death Pact",{
        "player.health < 35",
        "player.spell(Death Pact).cooldown",
        "player.spell(Raise Dead).cooldown",
        "player.spell.usable(Death Pact)",
    }},

    -- Death and Decay
    {"43265",{
        "DeathAndDecayKey.pqikeybind",
        "player.runes(unholy) > 1",
    },"ground"},
    {"43265",{{
        "DeathAndDecay.pqivalue = 2",
        "player.runes(unholy) > 1",
        },{
        "!player.spell(43265).cooldown > 2",
        "@CML.DeathAndDecay()"
    }},"ground"}, 

    -- OOR
    -- Howling Blast
    { "49184","player.range > 5"}, 
    -- Death Coil
    { "49184",{
        "player.range > 5",
        "player.runic >= 76",
    }},     
    { "pause","player.range > 5"}, 
-------------------------------------Interrupts--------------------------------------
    {{
            { "47528","target.range <= 5" }, -- MindFreeze
            { "47476","player.spell(47528).cooldown"}, -- Strangulate 
            { "47476","target.range > 5"}, -- Strangulate 
        }, "modifier.interrupts"
    },

    -- auto_attack
    -- pillar_of_frost
    {"51271",{ -- On CD
        "PillarofFrost.pqivalue = 2",
    }},   
    {"20572",{ -- On ActiveCooldowns
        "PillarofFrost.pqivalue = 1",
        "macros(ActiveCooldowns)",
    }},
    -- mogu_power_potion,if=target.time_to_die<=30|(target.time_to_die<=60&buff.pillar_of_frost.up)
    -- empower_rune_weapon,if=target.time_to_die<=60&(buff.mogu_power_potion.up|buff.golemblood_potion.up)
    { "47568",{
        "player.buff(105706)",
    }},
    -- Bloodfury
    {"20572",{ -- On CD
        "Racials.pqicheck",
        "Racials.pqivalue = 2",
        "spell.exists"
    }},
    {"20572",{ -- On ActiveCooldowns
        "Racials.pqicheck",
        "Racials.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "spell.exists"
    }},
    -- Berserking
    {"26297",{ -- On CD
        "Racials.pqicheck",
        "Racials.pqivalue = 2",
        "spell.exists"
    }},
    {"26297",{ -- On ActiveCooldowns
        "Racials.pqicheck",
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
    -- raise_dead

    -- run_action_list,name=aoe,if=active_enemies>=3
    -- run_action_list,name=single_target,if=active_enemies<3

    --[[Single Target]]
    -- unholy_blight,if=player.talent.unholy_blight.enabled
    { "115989",{
        "player.aoe = 1",
        "player.talent(3)",
    }},
    -- pestilence,if=dot.blood_plague.ticking&player.talent.plague_leech.enabled,line_cd=28
    { "50842",{
        "player.aoe = 1",
        "player.talent(2)", -- player.talent.plague_leech.enabled
        "target.debuff(55078)", -- dot.blood_plague.ticking
    }},    
    -- pestilence,if=dot.blood_plague.ticking&player.talent.unholy_blight.enabled&cooldown.unholy_blight.remains<49,line_cd=28
    { "50842",{
        "player.aoe = 1",
        "target.debuff(55078)", -- dot.blood_plague.ticking
        "player.talent(3)", -- player.talent.unholy_blight.enabled
        "player.spell(115989).cooldown < 49", -- cooldown.unholy_blight.remains<49
    }},
    -- howling_blast
    { "49184","player.aoe = 1"},    
    -- blood_tap,if=player.talent.blood_tap.enabled&buff.blood_charge.stack>10
    {"45529",{
        "player.aoe = 1",
        "player.talent(13)", -- player.talent.blood_tap.enabled
        "@CML.CanTap()",
        "player.buff(114851).count > 10", -- buff.blood_charge.stack>10
    }},
    -- frost_strike,if=runic_power>76
    {"49143",{
        "player.aoe = 1",
        "player.runic > 76", -- runic_power>76
    }},
    -- plague_strike,if=unholy=2
    {"45462",{
        "player.aoe = 1",
        "player.runes(unholy) = 2", -- unholy=2
    }},    
    -- blood_tap,if=player.talent.blood_tap.enabled
    {"45529",{
        "player.aoe = 1",
        "player.talent(13)", -- player.talent.blood_tap.enabled
        "@CML.CanTap()",
    }},    
    -- frost_strike
    {"49143","player.aoe = 1"},    
    -- horn_of_winter
    {"57330","player.aoe = 1"},    
    -- plague_leech,if=player.talent.plague_leech.enabled&unholy=1
    {"123693",{
        "player.aoe = 1",
        "player.talent(2)", -- player.talent.plague_leech.enabled
        "player.runes(unholy) = 1", -- unholy=1
    }},    
    -- plague_strike,if=unholy=1
    {"45462",{
        "player.aoe = 1",
        "player.runes(unholy) = 1", -- unholy=1
    }},    
    -- empower_rune_weapon
    {"47568",{
        "player.aoe = 1",
    }},

    --[[Multi Target]]
    -- plague_leech,if=player.talent.plague_leech.enabled&((dot.blood_plague.remains<1|dot.frost_fever.remains<1))
    {"123693",{
        "player.aoe = 2",
        "player.talent(2)", -- player.talent.plague_leech.enabled
        "target.debuff(55095).duration < 1", -- dot.frost_fever.remains<1
    }}, 
    {"123693",{
        "player.aoe = 2",
        "player.talent(2)", -- player.talent.plague_leech.enabled
        "!target.debuff(55078)", -- dot.blood_plague.remains<1
    }},     
    -- outbreak,if=!dot.frost_fever.ticking|!dot.blood_plague.ticking
    {"77575",{
        "player.aoe = 2",
        "!target.debuff(55095)", -- !dot.frost_fever.ticking
    }},  
    {"77575",{
        "player.aoe = 2",
        "!target.debuff(55078)", -- !dot.blood_plague.ticking
    }},       
    -- unholy_blight,if=player.talent.unholy_blight.enabled&((!dot.frost_fever.ticking|!dot.blood_plague.ticking))
    { "115989",{
        "player.aoe = 2",
        "player.talent(3)",
        "!target.debuff(55095)", -- !dot.frost_fever.ticking
    }},   
    { "115989",{
        "player.aoe = 2",
        "player.talent(3)",
        "!target.debuff(55078)", -- !dot.blood_plague.ticking
    }}, 
    -- soul_reaper,if=target.health.pct-3*(target.health.pct%target.time_to_die)<=35
    { "130735",{
        "player.aoe = 2",
        "target.health <= 35",
    }}, 
    -- blood_tap,if=player.talent.blood_tap.enabled&((target.health.pct-3*(target.health.pct%target.time_to_die)<=35&cooldown.soul_reaper.remains=0))
    {"45529",{
        "player.aoe = 2",
        "player.talent(13)", -- player.talent.blood_tap.enabled
        "target.health <= 35",
        "player.spell(130735)",
        "@CML.CanTap()",
    }}, 
    -- howling_blast,if=!dot.frost_fever.ticking      
    {"49184",{
        "player.aoe = 2",
        "!target.debuff(55095)", -- !dot.frost_fever.ticking
    }},   
    -- plague_strike,if=!dot.blood_plague.ticking
    {"45462",{
        "player.aoe = 2",
        "!target.debuff(55078)", -- !dot.blood_plague.ticking
    }},    
    -- howling_blast,if=buff.rime.react
    {"49184",{
        "player.aoe = 2",
        "player.buff(59052)", -- buff.rime.react
    }},     
    -- obliterate,if=buff.killing_machine.react
    {"49020",{
        "player.aoe = 2",
        "player.buff(51124)", -- buff.killing_machine.react
    }},     
    -- blood_tap,if=player.talent.blood_tap.enabled&buff.killing_machine.react
    {"45529",{
        "player.aoe = 2",
        "player.talent(13)", -- player.talent.blood_tap.enabled
        "player.buff(51124)", -- buff.killing_machine.react
        "@CML.CanTap()",
    }}, 
    -- blood_tap,if=player.talent.blood_tap.enabled&(buff.blood_charge.stack>10&runic_power>76)
    {"45529",{
        "player.aoe = 2",
        "player.talent(13)", -- player.talent.blood_tap.enabled
        "player.buff(114851).count > 10", -- buff.blood_charge.stack>10
        "player.runic > 76", -- runic_power>76
        "@CML.CanTap()",
    }},  
    -- frost_strike,if=runic_power>76
    {"49143",{
        "player.aoe = 2",
        "player.runic > 76", -- runic_power>76
    }},
    -- obliterate,if=blood=2|frost=2|unholy=2
    {"49020",{
        "player.aoe = 2",
        "player.runes(blood) = 2", -- blood=2
        "player.runes(frost) = 2", -- frost=2
        "player.runes(unholy) = 2", -- unholy=2
    }},
    -- plague_leech,if=player.talent.plague_leech.enabled&((dot.blood_plague.remains<3|dot.frost_fever.remains<3))
    {"123693",{
        "player.aoe = 2",
        "player.talent(2)", -- player.talent.plague_leech.enabled
        "target.debuff(55078).duration < 3", -- dot.blood_plague.remains<3
    }}, 
    {"123693",{
        "player.aoe = 2",
        "player.talent(2)", -- player.talent.plague_leech.enabled
        "target.debuff(55095).duration < 3", -- !dot.frost_fever.ticking
    }}, 
    -- outbreak,if=dot.frost_fever.remains<3|dot.blood_plague.remains<3
    {"77575",{
        "player.aoe = 2",
        "target.debuff(55095).duration < 3", -- dot.frost_fever.remains<3
    }},  
    {"77575",{
        "player.aoe = 2",
        "target.debuff(55078).duration < 3", -- dot.blood_plague.remains<3
    }},  
    -- unholy_blight,if=player.talent.unholy_blight.enabled&((dot.frost_fever.remains<3|dot.blood_plague.remains<3))
    { "115989",{
        "player.aoe = 2",
        "player.talent(3)",
        "target.debuff(55095).duration < 3", -- dot.frost_fever.remains<3
    }},   
    { "115989",{
        "player.aoe = 2",
        "player.talent(3)",
        "target.debuff(55078).duration < 3", -- dot.blood_plague.remains<3
    }}, 
    -- frost_strike,if=player.talent.runic_empowerment.enabled&(frost=0|unholy=0|blood=0)
    {"49143",{
        "player.aoe = 2",
        "player.talent(14)",
        "player.runes(blood) = 0", -- blood=2
    }},  
    {"49143",{
        "player.aoe = 2",
        "player.talent(14)", 
        "player.runes(frost) = 0", -- frost=2
    }},
    {"49143",{
        "player.aoe = 2",
        "player.talent(14)",
        "player.runes(unholy) = 0", -- unholy=2
    }},            
    -- frost_strike,if=player.talent.blood_tap.enabled&buff.blood_charge.stack<=10
    {"49143",{
        "player.aoe = 2",
        "player.talent(13)",
        "player.runes(unholy) = 0", -- unholy=2
        "player.buff(114851).count > 10", -- buff.blood_charge.stack>10
    }},     
    -- horn_of_winter
    {"57330","player.aoe = 2"},  
    -- obliterate
    {"49020","player.aoe = 2"},
    -- blood_tap,if=player.talent.blood_tap.enabled&(buff.blood_charge.stack>10&runic_power>=20)
    {"45529",{
        "player.aoe = 2",
        "player.talent(13)", -- player.talent.blood_tap.enabled
        "player.buff(114851).count > 10", -- buff.blood_charge.stack>10
        "player.runic > 76", -- runic_power >= 20     
        "@CML.CanTap()",   
    }}, 
    -- frost_strike
    {"49143","player.aoe = 2"},    
    -- plague_leech,if=player.talent.plague_leech.enabled
    {"123693",{
        "player.aoe = 2",
        "player.talent(2)", -- player.talent.plague_leech.enabled
    }},
    -- empower_rune_weapon
    { "47568","player.aoe = 2"},
}, 
--------------------------------------------------Out of Combat-------------------------------------------- 
{ 
    -- PQI Globals 
    {"TaMere","@CML.PQIConfing()"},
    -- Player Status
    {"TaMere","@CML.Status()"}, 
    -- Frost Presence
    {"48266",{
        "player.seal != 2",
    }},
})
