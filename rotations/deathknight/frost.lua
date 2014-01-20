ProbablyEngine.rotation.register_custom(251, "CodeMyLife Frost", {
--------------------------------------------------Defensive-------------------------------------------- 
    {"TaMere","@CML.PQIConfing()"},
    {"TaMere","@CML.Status()"},
    {"pause","@CML.CombatCheck()"}, -- Combat Check/Pause

    {"43265","queuecast(43265)","ground"}, -- Death and Decay 
    {"49576","queuecast(49576)"}, -- Death Grip
    {"77575","queuecast(77575)"}, -- Outbreak
    {"50842","queuecast(50842)"}, -- Pestilence
    
    -- Frost Presence
    {"48266",{"player.seal != 2","target.range <= 5"}},
    -- Unholy Presence if out of range 
    {"48265",{"ActivePresence.pqivalue = 1","player.seal != 3","player.health >= 60","target.range > 5"}}, 
    -- Blood Presence if out of range and under 50% hp
    {"48263",{"ActivePresence.pqivalue = 1","player.seal != 1","player.health < 50","target.range > 5"}},       
    -- Anti Magi Shell
    { "48707",{"AntiMagicShell.novaHealing(0)"}},     
    -- Icebound Fortitude
    {"48792",{"IceboundFortitude.novaHealing(0)"}},
    -- Death Pact Macro
    {"48743",{"player.health < 35","player.spell(48743).exists","pet.alive"}},
    -- Conversion
    {"119975",{"Conversion.novaHealing(0)"}},

    -- Howling Blast if out of range 
    { "49184","target.range > 5"}, 
    -- Death Coil if out of range 
    { "49184",{"target.range > 5","player.runic >= 76"}},     
    { "pause","target.range > 5"}, 

    -- pillar_of_frost  
    {"51271",{"PillarofFrost.coolvalue = 1","macros(ActiveCooldowns)"}},
    {"51271",{"PillarofFrost.coolvalue = 2"}}, 
    -- empower_rune_weapon,if=target.time_to_die<=60&(buff.mogu_power_potion.up|buff.golemblood_potion.up)
    {"47568",{"player.buff(105706)"}},
    -- raise_dead 
    {"46584",{"RaiseDead.coolvalue = 1","macros(ActiveCooldowns)"}},
    {"46584",{"RaiseDead.coolvalue = 2"}}, 
    -- run_action_list,name=aoe,if=active_enemies>=3
    -- run_action_list,name=single_target,if=active_enemies<3

    --[[Single Target]]
    -- single_target=plague_leech,if=talent.plague_leech.enabled&((dot.blood_plague.remains<1|dot.frost_fever.remains<1))
    {"123693",{"player.aoe = 1","talent(2)","target.debuff(55078)","target.debuff(55078).duration < 1","target.debuff(55095)","@CML.CanTap()"}}, 
    -- single_target+=/outbreak,if=!dot.frost_fever.ticking|!dot.blood_plague.ticking
    {"77575",{"player.aoe = 1","!target.debuff(55078)"}},    
    -- single_target+=/unholy_blight,if=talent.unholy_blight.enabled&((!dot.frost_fever.ticking|!dot.blood_plague.ticking))
    {"115989",{"player.aoe = 1","talent(3)","!target.debuff(55078)"}},     
    -- single_target+=/soul_reaper,if=target.health.pct-3*(target.health.pct%target.time_to_die)<=35
    {"130735",{"player.aoe = 1","target.health <= 35"}}, 
    -- single_target+=/blood_tap,if=talent.blood_tap.enabled&((target.health.pct-3*(target.health.pct%target.time_to_die)<=35&cooldown.soul_reaper.remains=0))
    {"45529",{"player.aoe = 1","talent(13)","target.health <= 35","player.spell(130735)","@CML.CanTap()"}}, 
    -- single_target+=/howling_blast,if=!dot.frost_fever.ticking
    {"49184",{"player.aoe = 1","!target.debuff(55095)"}},    
    -- single_target+=/plague_strike,if=!dot.blood_plague.ticking
    {"45462",{"player.aoe = 1","!target.debuff(55078)"}},     
    -- single_target+=/howling_blast,if=buff.rime.react
    {"49184",{"player.aoe = 1","player.buff(59052)"}},         
    -- single_target+=/obliterate,if=buff.killing_machine.react
    {"49020",{"player.aoe = 1","player.buff(51124)"}},
    -- single_target+=/blood_tap,if=talent.blood_tap.enabled&buff.killing_machine.react 
    {"45529",{"player.aoe = 1","talent(13)","player.buff(51124)","player.buff(114851).count >= 5","@CML.CanTap()"}},    
    -- single_target+=/blood_tap,if=talent.blood_tap.enabled&(buff.blood_charge.stack>10&runic_power>76)
    {"45529",{"player.aoe = 1","talent(13)","player.buff(114851).count >= 10","player.spell(51271).cooldown >= 10","@CML.CanTap()"}},     
    -- single_target+=/frost_strike,if=runic_power>76
    {"49143",{"player.aoe = 1","player.runic > 76"}},
    -- single_target+=/obliterate,if=blood=2|frost=2|unholy=2
    {"49020",{"player.aoe = 1","player.runes(blood) = 1","player.runes(frost) = 1","player.runes(unholy) = 1"}},
    {"49020",{"player.aoe = 1","player.runes(blood) = 2"}},
    {"49020",{"player.aoe = 1","player.runes(frost) = 2"}},
    {"49020",{"player.aoe = 1","player.runes(unholy) = 2"}},
    -- single_target+=/plague_leech,if=talent.plague_leech.enabled&((dot.blood_plague.remains<3|dot.frost_fever.remains<3))
    {"123693",{"player.aoe = 1","talent(2)","target.debuff(55078).duration < 4"}}, 
    -- single_target+=/outbreak,if=dot.frost_fever.remains<3|dot.blood_plague.remains<3
    {"77575",{"player.aoe = 1","target.debuff(55078).duration < 3"}}, 
    -- single_target+=/unholy_blight,if=talent.unholy_blight.enabled&((dot.frost_fever.remains<3|dot.blood_plague.remains<3))
    {"115989",{"player.aoe = 1","talent(13)","target.debuff(55078).duration < 3"}}, 
    -- single_target+=/frost_strike,if=talent.runic_empowerment.enabled&(frost=0|unholy=0|blood=0)
    {"49143",{"player.aoe = 1","talent(14)","player.runes(unholy) = 0","player.buff(114851).count > 10","@CML.CanTap()"}}, 
    {"49143",{"player.aoe = 1","talent(14)","player.runes(frost) = 0","player.buff(114851).count > 10","@CML.CanTap()"}}, 
    {"49143",{"player.aoe = 1","talent(14)","player.runes(blood) = 0","player.buff(114851).count > 10","@CML.CanTap()"}}, 
    -- single_target+=/frost_strike,if=talent.blood_tap.enabled&buff.blood_charge.stack<=10
    {"49143",{"player.aoe = 1","talent(13)","@CML.CanTap()"}},  
    -- single_target+=/horn_of_winter
    {"57330"},      
    -- single_target+=/obliterate
    {"49020","player.aoe = 1"},
    -- single_target+=/blood_tap,if=talent.blood_tap.enabled&(buff.blood_charge.stack>10&runic_power>=20)
    {"45529",{"player.aoe = 1","talent(13)","player.buff(114851).count > 10","player.runic > 20","@CML.CanTap()"}}, 
    -- single_target+=/frost_strike
    {"49143","player.aoe = 1"},   
    -- single_target+=/empower_rune_weapon
    {"47568","player.aoe = 1"},


    --[[Multi Target]]
    -- aoe=unholy_blight,if=talent.unholy_blight.enabled
    { "115989",{"player.aoe = 2","talent(3)"}},
    -- outbreak,if=!dot.frost_fever.ticking|!dot.blood_plague.ticking
    {"77575",{"player.aoe = 2","!target.debuff(55078)"}}, 
    -- aoe+=/pestilence,if=dot.blood_plague.ticking&talent.plague_leech.enabled,line_cd=28
    { "50842",{"player.aoe = 2","talent(2)","target.debuff(55078)","!modofier.last"}},  
    -- aoe+=/pestilence,if=dot.blood_plague.ticking&talent.unholy_blight.enabled&cooldown.unholy_blight.remains<49,line_cd=28
    { "50842",{"player.aoe = 2","target.debuff(55078)","talent(3)","player.spell(115989).cooldown < 49","!modofier.last"}},
    -- aoe+=/howling_blast
    { "49184",{"player.aoe = 2","player.runes(blood) = 2"}}, 
    -- aoe+=/blood_tap,if=talent.blood_tap.enabled&buff.blood_charge.stack>10
    {"45529",{"player.aoe = 2","talent(13)","player.buff(114851).count > 10","@CML.CanTap()"}},
    -- aoe+=/frost_strike,if=runic_power>76
    {"49143",{"player.aoe = 2","player.runic >= 76"}}, 
    -- aoe+=/death_and_decay,if=unholy=1
    {"43265",{"player.aoe = 2","player.runes(unholy) > 1","43265.automouse(DeathAndDecay)"},"ground"},   
    -- aoe+=/plague_strike,if=unholy=2
    {"45462",{"player.aoe = 2","player.runes(unholy) = 2","target.debuff(55078) < 3","!modifier.last"}},   
    -- aoe+=/blood_tap,if=talent.blood_tap.enabled
    {"45529",{"player.aoe = 2","talent(13)","player.buff(114851).count >= 5","@CML.CanTap()"}},
    -- aoe+=/frost_strike
    {"49143",{"player.aoe = 2","player.runic >= 20"}},   
    -- aoe+=/horn_of_winter
    {"57330",{"player.aoe = 2"}},   
    -- single_target+=/plague_leech,if=talent.plague_leech.enabled&((dot.blood_plague.remains<3|dot.frost_fever.remains<3))
    {"123693",{"player.aoe = 2","talent(2)","target.debuff(55078).duration < 4"}},           
    -- aoe+=/plague_strike,if=unholy=1
    {"45462",{"player.aoe = 2","player.runes(unholy) = 1","target.debuff(55078) < 3","!modifier.last"}},   
    -- aoe+=/empower_rune_weapon
    {"47568",{"player.aoe = 2"}},
    -- aoe+=/frost_strike
    {"49143",{"player.aoe = 2","player.buff(51124)"}},   







}, 
--------------------------------------------------Out of Combat-------------------------------------------- 
{ 
    -- PQI Globals 
    {"TaMere","@CML.PQIConfing()"},
    -- Player Status
    {"TaMere","@CML.Status()"}, 
    -- Unholy Presence if out of range 
    {"48265",{"ActivePresence.pqivalue = 1","player.seal != 3","player.health >= 60","target.range > 5"}}, 
    -- Frost Presence
    {"48266",{"player.seal != 2","target.alive","target.enemy","target.range <5"}},
})
