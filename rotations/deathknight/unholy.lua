ProbablyEngine.rotation.register_custom(252, "CodeMyLife Unholy", {
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
    {"PetMover",{
        "PetMoveToMouse.pqicheck",
        "PetMoveToMouse.pqikeybind",
        "@CML.PetMove()",
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
        "talent(13)",
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

    -- auto_attack
 
    -- mogu_power_potion,if=target.time_to_die<=30|(target.time_to_die<=60&buff.pillar_of_frost.up)
    -- empower_rune_weapon,if=target.time_to_die<=60&(buff.mogu_power_potion.up|buff.golemblood_potion.up)
    { "47568",{
        "EmpowerRuneWeapon.novaHealing(0)",
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

    -- unholy_frenzy,if=time>=4
    {"49016",{ -- On ActiveCooldowns
        "UnholyFrenzy.pqivalue = 1",
        "macros(ActiveCooldowns)",
    },"player"},
    {"49016",{ -- On CD
        "UnholyFrenzy.pqivalue = 2",
    },"player"},    
    {"Trololol","@CML.PetPassiveBehaviour()"}, 
-------------------------------------Interrupts--------------------------------------
    {{
            { "47528","target.range <= 5" }, -- MindFreeze
            { "47476","player.spell(47528).cooldown"}, -- Strangulate 
            { "47476","target.range > 5"}, -- Strangulate 
        }, "modifier.interrupts"
    },


    --[[ run_action_list,name=aoe,if=active_enemies>=3
    -- run_action_list,name=single_target,if=active_enemies<3]]

    --[[Single]]
    -- outbreak,if=stat.attack_power>(dot.blood_plague.attack_power*1.1)&time>15&!(cooldown.unholy_blight.remains>79)

    -- plague_strike,if=stat.attack_power>(dot.blood_plague.attack_power*1.1)&time>15&!(cooldown.unholy_blight.remains>79)

    -- blood_tap,if=talent.blood_tap.enabled&(buff.blood_charge.stack>10&runic_power>=32)
    {"45529",{
        "player.aoe = 1",
        "player.talent(13)", -- player.talent.blood_tap.enabled
        "player.buff(114851).count > 10", -- buff.blood_charge.stack>10
        "player.runic > 32", -- runic_power>76
        "@CML.CanTap()",
    }},  
    -- unholy_blight,if=talent.unholy_blight.enabled&((dot.frost_fever.remains<3|dot.blood_plague.remains<3))
    { "115989",{
        "player.aoe = 1",
        "player.talent(3)",
        "target.debuff(55095).duration < 3", -- dot.frost_fever.remains<3
    }},   
    { "115989",{
        "player.aoe = 1",
        "player.talent(3)",
        "target.debuff(55078).duration < 3", -- dot.blood_plague.remains<3
    }}, 
    -- outbreak,if=dot.frost_fever.remains<3|dot.blood_plague.remains<3
    {"77575",{
        "player.aoe = 1",
        "!target.debuff(55095)", -- !dot.frost_fever.ticking
    }},  
    {"77575",{
        "player.aoe = 1",
        "!target.debuff(55078)", -- !dot.blood_plague.ticking
    }}, 
    -- soul_reaper,if=target.health.pct-3*(target.health.pct%target.time_to_die)<=35
    { "130736",{
        "player.aoe = 1",
        "target.health <= 35",
        "player.runes(unholy) = 1", -- unholy=2
    }}, 
    -- blood_tap,if=talent.blood_tap.enabled&((target.health.pct-3*(target.health.pct%target.time_to_die)<=35&cooldown.soul_reaper.remains=0))
    {"45529",{
        "player.aoe = 1",
        "player.talent(13)", -- player.talent.blood_tap.enabled
        "player.buff(114851).count > 5",
        "player.runic > 32", -- runic_power>76
        "target.health < 35",
        "@CML.CanTap()",
    }},  
    -- plague_strike,if=!dot.blood_plague.ticking|!dot.frost_fever.ticking
    {"45462",{
        "player.aoe = 1",
        "!target.debuff(55078)", -- !dot.blood_plague.ticking
    }},  
    -- summon_gargoyle
    {"49206",{
        "player.aoe = 1",
    }},   
    -- dark_transformation
    {"63560",{
        "player.aoe = 1",
    }}, 
    -- death_coil,if=runic_power>90
    {"47541",{
        "player.aoe = 1",
        "player.runic > 90", -- runic_power>90
    }},     
    -- death_and_decay,if=unholy=2
    -- blood_tap,if=talent.blood_tap.enabled&(unholy=2&cooldown.death_and_decay.remains=0)
    -- scourge_strike,if=unholy=2
    {"55090",{
        "player.aoe = 1",
        "player.runes(unholy) = 2", -- unholy=2
    }},
    -- festering_strike,if=blood=2&frost=2
    {"85948",{
        "player.aoe = 1",
        "player.runes(blood) = 2", -- blood=2
        "player.runes(frost) = 2", -- frost=2
    }},    
    -- death_and_decay
    -- blood_tap,if=talent.blood_tap.enabled&cooldown.death_and_decay.remains=0
    -- death_coil,if=buff.sudden_doom.react|(buff.dark_transformation.down&rune.unholy<=1)
    {"47541",{
        "player.aoe = 1",
        "player.runic > 90", -- runic_power>90
    }}, 
    -- scourge_strike
    {"55090",{
        "player.aoe = 1",
    }},    
    -- plague_leech,if=talent.plague_leech.enabled&cooldown.outbreak.remains<1
    {"123693",{
        "player.aoe = 1",
        "player.talent(2)", -- player.talent.plague_leech.enabled
        "player.spell(77575).cooldown > 1",
    }},    
    -- festering_strike
    {"85948",{
        "player.aoe = 1",
    }},    
    -- horn_of_winter
    {"57330","player.aoe = 1"},     
    -- death_coil
    {"47541",{
        "player.aoe = 1",
    }},     
    -- blood_tap,if=talent.blood_tap.enabled&buff.blood_charge.stack>=8
    {"45529",{
        "player.aoe = 1",
        "player.talent(13)", -- player.talent.blood_tap.enabled
        "player.buff(114851).count > 8", -- buff.blood_charge.stack>=8
        "@CML.CanTap()",
    }},  
    -- empower_rune_weapon 
    {"47568",{
        "player.aoe = 1",
    }},    

    --[[AoE]]
    -- unholy_blight,if=talent.unholy_blight.enabled
    { "115989",{
        "player.aoe = 2",
        "talent(3)",
    }}, 
    -- plague_strike,if=!dot.blood_plague.ticking|!dot.frost_fever.ticking
    {"45462",{
        "player.aoe = 2",
        "!target.debuff(55078)", -- !dot.blood_plague.ticking
    }}, 
    -- pestilence,if=dot.blood_plague.ticking&talent.plague_leech.enabled,line_cd=28
    {"50842",{
        "player.aoe = 2",
        "talent(2)",
        "!target.debuff(55078)", -- !dot.blood_plague.ticking
    }}, 
    -- pestilence,if=dot.blood_plague.ticking&talent.unholy_blight.enabled&cooldown.unholy_blight.remains<49,line_cd=28
    {"50842",{
        "player.aoe = 2",
        "target.debuff(55078)", -- dot.blood_plague.ticking
        "talent(3)", -- talent.unholy_blight.enabled
        "player.spell(115989).cooldown > 49", -- cooldown.unholy_blight.remains<49
    }}, 
    -- summon_gargoyle
    {"49206",{
        "player.aoe = 2",
    }},     
    -- dark_transformation
    {"63560",{
        "player.aoe = 2",
    }}, 
    -- blood_tap,if=talent.blood_tap.enabled&buff.shadow_infusion.stack=5
    {"45529",{
        "player.aoe = 2",
        "player.buff(91342).count = 5", -- buff.shadow_infusion.stack>=8
        "@CML.CanTap()",
    }}, 
    -- blood_boil,if=blood=2|death=2
    {"48721",{
        "player.aoe = 2",
        "player.runes(blood) = 2", -- blood=2
    }},     
    {"48721",{
        "player.aoe = 2",
        "player.runes(death) = 2", -- blood=2
    }}, 
    -- death_and_decay,if=unholy=1
    -- soul_reaper,if=unholy=2&target.health.pct-3*(target.health.pct%target.time_to_die)<=35
    { "130735",{
        "player.aoe = 2",
        "target.health <= 35",
        "player.runes(unholy) = 2",
    }}, 
    -- scourge_strike,if=unholy=2
    {"55090",{
        "player.aoe = 2",
        "player.runes(unholy) = 2",
    }},    
    -- blood_tap,if=talent.blood_tap.enabled&buff.blood_charge.stack>10
    {"45529",{
        "player.aoe = 2",
        "player.talent(13)",
        "player.buff(114851).count >= 10",
        "@CML.CanTap()",
    }},  
    -- death_coil,if=runic_power>90|buff.sudden_doom.react|(buff.dark_transformation.down&rune.unholy<=1)
    {"47541",{
        "player.aoe = 2",
        "player.runic > 90",
    }}, 
    {"47541",{
        "player.aoe = 2",
        "player.buff(49530)",
    }},    
    -- blood_boil
    {"48721",{
        "player.aoe = 2",
    }},      
    -- icy_touch
    {"45477",{
        "player.aoe = 2",    
    }},    
    -- soul_reaper,if=unholy=1&target.health.pct-3*(target.health.pct%target.time_to_die)<=35
    { "130735",{
        "player.aoe = 2",
        "target.health <= 35",
    }}, 
    -- scourge_strike,if=unholy=1
    {"55090",{
        "player.aoe = 2",
    }},      
    -- death_coil
    {"47541",{
        "player.aoe = 2",
    }},     
    -- blood_tap,if=talent.blood_tap.enabled
    {"45529",{
        "player.aoe = 2",
        "player.buff(114851).count >= 10",
        "@CML.CanTap()",
    }},     
    -- plague_leech,if=talent.plague_leech.enabled&unholy=1
    {"123693",{
        "player.aoe = 2",
        "player.talent(2)",
    }},    
    -- horn_of_winter
    {"57330","player.aoe = 2"},
    -- empower_rune_weapon
    {"47568",{
        "player.aoe = 2",
    }},      
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
