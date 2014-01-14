ProbablyEngine.rotation.register_custom(71, "CodeMyLife Arms", {  
--------------------------------------------------Defensive-------------------------------------------- 
    {"TaMere","@CML.PQIConfing()"},
    {"TaMere","@CML.Status()"},
    {"pause","@CML.CombatCheck()"}, -- Combat Check/Pause

    {"64382","queuecast(64382)","target"}, -- Shattering Throw
    {"5246","queuecast(5246)","target"}, -- Intimidating Shout
    {"676","queuecast(676)","target"}, -- Disarm
    {"12323","queuecast(12323)","target"}, -- Piercing Howl

    
    {"2457",{"player.seal != 1","ActiveStance.coolvalue = 1"}}, -- Battle Stance 
    {"71",{"player.seal != 2","ActiveStance.pqivalue = 2"}}, -- Defensive Stance
    {"2458",{"player.seal != 3","ActiveStance.pqivalue = 3"}}, -- Berserker Stance
    {"2457",{"player.seal != 1","ActiveStance.pqivalue = 4","player.activestance = 1"}}, -- Battle Stance
    {"71",{"player.seal != 2","ActiveStance.pqivalue = 4","player.activestance = 2"}}, -- Battle Stance
    {"2457",{"player.seal != 1","ActiveStance.pqivalue = 5","player.activestance = 1"}}, -- Defensive Stance
    {"71",{"player.seal != 2","ActiveStance.pqivalue = 5","player.activestance = 2"}}, -- Defensive Stance
    {"2458",{"player.seal != 3","ActiveStance.pqivalue = 5","player.activestance = 3"}}, -- Berserker Stance

    -- Impending Victory
    {"103840",{"player.spell(103840).exists","ImpendingVictoryRush.novaHealing(0)"},"target"},
    {"34428",{"!player.spell(103840).exists","ImpendingVictoryRush.novaHealing(0)","target.health <= 20"},"target"},   
    -- Healthstone   
    {"#5512",{"Healthstone.novaHealing(0)","@CML.HealthStone()"}},  
    -- shield_wall,if=incoming_damage_2500ms>health.max*0.6
    {"871",{"ShieldWall.novaHealing(0)"}},
    -- Die By The Sword
    {"118038",{"DieByTheSword.novaHealing(0)"}},

--------------------------------------------------Interrupts-------------------------------------------- 
    {{  {"6552","target.range <= 5"}, -- Pummel
            -- Spell Reflect
            { "23920",{"player.spell(6552).cooldown"}},
            { "23920",{"target.range > 4"}},     
            -- Disrupting Shout       
            { "102060",{"player.spell(102060).exists","player.spell(6552).cooldown","player.spell(6552).cooldown < 12","player.spell(23920).cooldown","target.range <= 5"}},

        }, "modifier.interrupts"
    }, 
--------------------------------------------------DPS Rotation-------------------------------------------- 
    -- berserker_rage,if=buff.enrage.down&rage<=rage.max-10
    {"18499",{"target.range <= 5","player.rage < 85","!player.buff(12880)"}},

    -- Leap
    {"6544",{"Leap.pqikeybind"},"ground"},

    -- dps_cds=avatar,if=enabled
    {"107574",{"target.debuff(86346)","target.range <= 5","player.spell(107574).exists","Avatar.coolvalue = 1","macros(ActiveCooldowns)"}},
    {"107574",{"target.debuff(86346)","target.range <= 5","player.spell(107574).exists","Avatar.coolvalue = 2"}},
    -- dps_cds+=/bloodbath,if=enabled
    {"12292",{"target.debuff(86346)","target.range <= 5","player.spell(12292).exists","Bloodbath.coolvalue = 1","macros(ActiveCooldowns)"}},
    {"12292",{"target.debuff(86346)","target.range <= 5","player.spell(12292).exists","Bloodbath.coolvalue = 2"}},    
    -- dps_cds+=/skull_banner
    {"114207",{"target.debuff(86346)","target.range <= 5","SkullBanner.coolvalue = 1","macros(ActiveCooldowns)"}},   
    {"114207",{"target.debuff(86346)","target.range <= 5","SkullBanner.coolvalue = 2"}}, 
    -- dps_cds+=/recklessness
    {"1719",{"target.debuff(86346)","target.range <= 5","Recklessness.coolvalue = 1","macros(ActiveCooldowns)"}},
    {"1719",{"target.debuff(86346)","target.range <= 5","Recklessness.coolvalue = 2"}},
    -- dps_cds+=/shockwave,if=enabled
    {"46968",{"target.debuff(86346)","target.range <= 5","player.spell(46968).exists","Shockwave.coolvalue = 1","macros(ActiveCooldowns)"}},
    {"46968",{"target.debuff(86346)","target.range <= 5","player.spell(46968).exists","Shockwave.coolvalue = 2"}},





    -- berserker_rage,if=buff.enrage.remains<0.5
    {"18499",{"player.buff(12880).duration < 0.5","player.rage < 85","target.range <= 5"}},
    -- heroic_leap,if=debuff.colossus_smash.up

    -- run_action_list,name=aoe,if=active_enemies>=2
    -- run_action_list,name=single_target,if=active_enemies<2
    -- stance,choose=berserker,damage_taken=150000,swap=20

    --[[Single]]
    -- heroic_strike,if=rage>115|(debuff.colossus_smash.up&rage>60&set_bonus.tier16_2pc_melee)
    {"78",{"player.aoe = 1","target.range <= 5","player.rage > 115","@CML.IsGlyphed(58098,true)"}}, 
    {"78",{"player.aoe = 1","player.rage > 95","@CML.IsGlyphed(58098,false)","target.range <= 5"}},    
    {"78",{"player.aoe = 1","player.rage > 60","target.debuff(86346)","target.range <= 5"}},  
    -- mortal_strike,if=dot.deep_wounds.remains<1.0|buff.enrage.down|rage<10   
    {"12294",{"player.aoe = 1","target.range <= 5","target.debuff(115767).duration < 1"}},  
    {"12294",{"player.aoe = 1","target.range <= 5","!player.buff(12880)"}},  
    {"12294",{"player.aoe = 1","target.range <= 5","player.rage < 10"}},        
    -- colossus_smash,if=debuff.colossus_smash.remains<1.0
    {"86346",{"player.aoe = 1","target.range <= 5","target.debuff(86346).duration < 0.7"}}, 
    -- mortal_strike
    {"12294",{"player.aoe = 1","target.range <= 5"}},     
    -- storm_bolt,if=enabled&debuff.colossus_smash.up
    {"107570",{"player.aoe = 1","target.debuff(86346)","player.spell(107570).exists","StormBolt.coolvalue = 2"}},
    {"107570",{"player.aoe = 1","target.debuff(86346)","player.spell(107570).exists","StormBolt.coolvalue = 1","macros(ActiveCooldowns)"}},   
    -- dragon_roar,if=enabled&debuff.colossus_smash.down
    {"118000",{"!target.debuff(86346)","target.range <= 5","player.spell(118000).exists","DragonRoar.coolvalue = 1","macros(ActiveCooldowns)"}},   
    {"118000",{"!target.debuff(86346)","target.range <= 5","player.spell(118000).exists","DragonRoar.coolvalue = 2"}},  
    -- execute,if=buff.sudden_execute.down|buff.taste_for_blood.down|rage>90|target.time_to_die<12
    {"5308",{"player.aoe = 1","target.range <= 5","!player.buff(60503)"}},  
    {"5308",{"player.aoe = 1","target.range <= 5","player.buff(52437)"}},
    {"5308",{"player.aoe = 1","target.range <= 5","player.rage > 90","target.health <= 20"}},  
    -- slam,if=target.health.pct>=20&(stat.crit>25000|buff.recklessness.up)
    {"1464",{"player.aoe = 1","target.range <= 5","target.debuff(86346)"}},
    {"1464",{"player.aoe = 1","target.range <= 5","player.rage > 65","player.buff(1719)"}}, 
    {"1464",{"player.aoe = 1","target.range <= 5","player.rage > 85","player.buff(1719)"}},    
    -- overpower,if=target.health.pct>=20&rage<100|buff.sudden_execute.up
    {"7384",{"player.aoe = 1","player.buff(60503)","target.range <= 5",}},
    -- slam,if=target.health.pct>=20
    {"1464",{"player.aoe = 1","player.rage > 85","target.range <= 5"}},    
    -- battle_shout
    {"6673",{"player.aoe = 1","ActiveShouts.pqivalue = 1","player.rage < 80"},"player"},
    {"469",{"player.aoe = 1","ActiveShouts.pqivalue = 2","player.rage < 80"},"player"},
    -- heroic_throw
     {"57755",{"player.aoe = 1","target.range <= 30"}}, 

    --[[MultiTarget]]
    -- sweeping strikes
    {"12328",{"player.aoe = 2","target.range <= 5","!player.buff(12328)","!modifier.last"}},    
    -- cleave,if=rage>110&active_enemies<=4
    {"845",{"player.aoe = 2","target.range <= 5","player.rage > 110","@CML.IsGlyphed(58098,true)"}}, 
    {"845",{"player.aoe = 2","target.range <= 5","player.rage > 90","@CML.IsGlyphed(58098,false)",}},  
    -- bladestorm,if=enabled&(buff.bloodbath.up|!talent.bloodbath.enabled)
    {"46924",{"target.range <= 5","player.spell(46924).exists","player.buff(12292).duration >= 3","Bladestorm.coolvalue = 1","macros(ActiveCooldowns)"}},
    {"46924",{"target.range <= 5","player.spell(46924).exists","!player.spell(12292).exists","Bladestorm.coolvalue = 2"}}, 
    -- dragon_roar,if=enabled&debuff.colossus_smash.down
    {"118000",{"player.aoe = 2","target.range <= 5","player.spell(118000).exists","!target.debuff(86346)"}},      
    -- colossus_smash,if=debuff.colossus_smash.remains<1
    {"86346",{"player.aoe = 2","target.range <= 5","target.debuff(86346).duration < 1"}},     
    -- thunder_clap,target=2,if=dot.deep_wounds.attack_power*1.1<stat.attack_power
    {"6343",{"player.aoe = 2","target.range <= 5","target.debuff(115767).duration <= 1"}},    
    -- mortal_strike,if=active_enemies=2|rage<50
    {"12294",{"player.aoe = 2","target.range <= 5","player.rage < 80"}},      
    -- execute,if=buff.sudden_execute.down&active_enemies=2
    {"5308",{"player.aoe = 2","target.range <= 5","player.buff(52437)"}},   
    -- slam,if=buff.sweeping_strikes.up&debuff.colossus_smash.up
    {"1464",{"player.aoe = 2","target.range <= 5","player.buff(12328)","target.debuff(86346)"}},       
    -- overpower,if=active_enemies=2
    {"7384",{"player.aoe = 2","target.range <= 5","player.buff(60503)"}},    
    -- slam,if=buff.sweeping_strikes.up
    {"1464",{"player.aoe = 2","target.range <= 5","player.buff(12328)"}},     
    -- Shouts
    {"6673",{"player.aoe = 2","ActiveShouts.coolvalue = 1","player.rage < 80"},"player"},
    {"469",{"player.aoe = 2","ActiveShouts.coolvalue = 2","player.rage < 80",},"player"},


--[[ 
-- Deep Wounds Target Debuff 115767
-- Colossus Smash Target Debuff 86346
-- Sudden Death Player Buff 52437
-- Taste For Blood Player Buff 60503
-- Enrage Player Buff 12880

]]
}, 
--------------------------------------------------Out of Combat-------------------------------------------- 
{ 
    -- PQI Globals 
    {"TaMere","@CML.PQIConfing()"},
    -- Player Status
    {"TaMere","@CML.Status()"}, 
    {"2457",{ -- Battle Stance 
        "player.seal != 1",
        "ActiveStance.pqivalue = 1",
    }},
    {"71",{ -- Defensive Stance
        "player.seal != 2",
        "ActiveStance.pqivalue = 2",
    }},
    {"2458",{ -- Berserker Stance
        "player.seal != 3",
        "ActiveStance.pqivalue = 3",
    }},         
    {"2457",{ -- Battle Stance
        "player.seal != 1",
        "ActiveStance.pqivalue = 4",
        "player.activestance = 1",
    }},  
    {"71",{ -- Defensive Stance
        "player.seal != 2",
        "ActiveStance.pqivalue = 4",
        "player.activestance = 2",
    }},
    {"2457",{ -- Battle Stance
        "player.seal != 1",
        "ActiveStance.pqivalue = 5",
        "player.activestance = 1",
    }},  
    {"71",{ -- Defensive Stance
        "player.seal != 2",
        "ActiveStance.pqivalue = 5",
        "player.activestance = 2",
    }}, 
    {"2458",{ -- Berserker Stance
        "player.seal != 3",
        "ActiveStance.pqivalue = 5",
        "player.activestance = 3",
    }},
    -- Leap
    {"6544",{
        "Leap.pqikeybind", 
    },"ground"},
}) 
