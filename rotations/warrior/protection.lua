ProbablyEngine.rotation.register_custom(73, "CodeMyLife Protection", {  
--------------------------------------------------Defensive-------------------------------------------- 
    {"TaMere","@CML.PQIConfing()"},
    {"TaMere","@CML.Status()"},
    {"pause","@CML.CombatCheck()"}, -- Combat Check/Pause

    {"64382","queuecast(64382)","target"}, -- Shattering Throw
    {"5246","queuecast(5246)","target"}, -- Intimidating Shout
    {"676","queuecast(676)","target"}, -- Disarm
    {"12323","queuecast(12323)","target"}, -- Piercing Howl

    -- Stances
    {"2457",{"player.seal != 1","ActiveStance.coolvalue = 1"}}, -- Battle Stance 
    {"71",{"player.seal != 2","ActiveStance.coolvalue = 2"}}, -- Defensive Stance
    {"2458",{"player.seal != 3","ActiveStance.coolvalue = 3"}}, -- Berserker Stance    
    {"2457",{"player.seal != 1","ActiveStance.coolvalue = 4","player.activestance = 1"}}, -- Battle Stance    
    {"71",{"player.seal != 2","ActiveStance.coolvalue = 4","player.activestance = 2"}}, -- Defensive Stance
    {"2457",{"player.seal != 1","ActiveStance.coolvalue = 5","player.activestance = 1"}}, -- Battle Stance
    {"71",{"player.seal != 2","ActiveStance.coolvalue = 5","player.activestance = 2"}}, -- Defensive Stance
    {"2458",{"player.seal != 3","ActiveStance.coolvalue = 5","player.activestance = 3"}}, -- Berserker Stance

    {"103840",{"player.spell(103840).exists","ImpendingVictoryRush.novaHealing(0)"},"target"}, -- Impending Victory
    {"34428",{"!player.spell(103840).exists","ImpendingVictoryRush.novaHealing(0)","target.health <= 20"},"target"}, -- Victory Rush
    {"12975",{"LastStand.novaHealing(0)"}}, -- Last Stand
    {"#5512",{"@CML.HealthStone()","Healthstone.novaHealing(0)"}}, -- Healthstone  

    --[[------------------------------------------------Interrupts-------------------------------------------- ]]
    {{
            {"6552","target.range <= 5"}, -- Pummel
            { "23920"},     
            { "102060",{ -- Disrupting Shout
                "player.spell(102060).exists",
                "player.spell(6552).cooldown < 13",
                "player.spell(23920).cooldown",
                "target.range <= 5",
            }},
        }, "modifier.interrupts"
    }, 
    -- auto_attack 
    -- berserker_rage,if=buff.enrage.down&rage<=rage.max-10
    {"18499",{"!player.buff(12880)","player.rage < 80","target.range <= 5"}},
    -- shield_block
    {"2565",{"ActiveMitigationSelector.coolvalue = 3","!player.buff(132404)","target.threat > 100","ShieldBlock.novaHealing(0)","player.rage > 60","target.range <= 5"}},
    {"2565",{"ActiveMitigationSelector.coolvalue = 1","player.mitigation = 1","!player.buff(132404)","target.threat > 100","ShieldBlock.novaHealing(0)","player.rage > 60","target.range <= 5"}},
    {"2565",{"ActiveMitigationSelector.coolvalue = 1","player.mitigation = 3","!player.buff(132404)","target.threat > 100","ShieldBlock.novaHealing(0)","player.rage > 60","target.range <= 5"}},        
    -- shield_barrier,if=incoming_damage_1500ms>health.max*0.3|rage>rage.max-20
    {"112048",{"ActiveMitigationSelector.coolvalue = 2","!player.buff(112048)","target.threat > 100","ShieldBarrier.novaHealing(0)","player.rage > 60","target.range <= 5"}},    
    {"112048",{"ActiveMitigationSelector.coolvalue = 1","player.mitigation = 2","!player.buff(112048)","target.threat > 100","ShieldBarrier.novaHealing(0)","player.rage > 60","target.range <= 5"}},
    {"112048",{"ActiveMitigationSelector.coolvalue = 1","player.mitigation = 3","!player.buff(112048)","target.threat > 100","ShieldBarrier.novaHealing(0)","player.rage > 60","target.range <= 5"}},    
    -- shield_wall,if=incoming_damage_2500ms>health.max*0.6
    {"871",{"target.threat > 100","ShieldWall.novaHealing(0)","target.range <= 5"}},
    -- Leap
    {"6544",{"Leap.pqikeybind"},"ground"},
    --[[------------------------------------------------Cooldowns--------------------------------------------]]    

    -- dps_cds=avatar,if=enabled
    {"107574",{"target.range <= 5","player.spell(107574).exists","Avatar.coolvalue = 1","macros(ActiveCooldowns)"}},
    {"107574",{"target.range <= 5","player.spell(107574).exists","Avatar.coolvalue = 2"}},
    -- dps_cds+=/bloodbath,if=enabled
    {"12292",{"target.range <= 5","player.spell(12292).exists","Bloodbath.coolvalue = 1","macros(ActiveCooldowns)"}},
    {"12292",{"target.range <= 5","player.spell(12292).exists","Bloodbath.coolvalue = 2"}},    
    -- dps_cds+=/dragon_roar,if=enabled
    {"118000",{"target.range <= 5","player.spell(118000).exists","DragonRoar.coolvalue = 1","macros(ActiveCooldowns)"}},   
    {"118000",{"target.range <= 5","player.spell(118000).exists","DragonRoar.coolvalue = 2"}},  
    -- dps_cds+=/shattering_throw   
    -- dps_cds+=/skull_banner
    {"114207",{"target.range <= 5","SkullBanner.coolvalue = 1","macros(ActiveCooldowns)"}},   
    {"114207",{"target.range <= 5","SkullBanner.coolvalue = 2"}}, 
    -- dps_cds+=/recklessness
    {"1719",{"target.range <= 5","Recklessness.coolvalue = 1","macros(ActiveCooldowns)"}},
    {"1719",{"target.range <= 5","Recklessness.coolvalue = 2"}},
    -- dps_cds+=/storm_bolt,if=enabled
    {"107570",{"player.spell(107570).exists","StormBolt.coolvalue = 2"}},
    {"107570",{"player.spell(107570).exists","StormBolt.coolvalue = 1","macros(ActiveCooldowns)"}},    
    -- dps_cds+=/shockwave,if=enabled
    {"46968",{"target.range <= 5","player.spell(46968).exists","Shockwave.coolvalue = 1","macros(ActiveCooldowns)"}},
    {"46968",{"target.range <= 5","player.spell(46968).exists","Shockwave.coolvalue = 2"}},
    -- dps_cds+=/bladestorm,if=enabled
    {"46924",{"target.range <= 5","player.spell(46924).exists","Bladestorm.coolvalue = 1","macros(ActiveCooldowns)"}},
    {"46924",{"target.range <= 5","player.spell(46924).exists","Bladestorm.coolvalue = 2"}},


    --[[------------------------------------------------DPS Rotation--------------------------------------------]]
    -- Cleave 
    {"845",{"player.aoe = 2","target.range <= 5","player.rage > 90","@CML.IsGlyphed(58098,false)"}},    
    {"845",{"player.aoe = 2","target.range <= 5","player.rage > 110","@CML.IsGlyphed(58098,true)"}},      
    -- heroic_strike,if=buff.ultimatum.up|buff.glyph_incite.up
    {"78",{"player.aoe = 1","target.range <= 5","player.buff(122510)"}}, 
    {"78",{"player.aoe = 1","target.range <= 5","player.buff(122016)"}},  
    {"78",{"player.aoe = 1","target.range <= 5","player.rage > 90","@CML.IsGlyphed(58098,false)"}}, 
    {"78",{"player.aoe = 1","player.rage > 110","@CML.IsGlyphed(58098,true)","target.range <= 5"}}, 
    -- normal_rotation=shield_slam
    {"23922",{"target.range <= 5"}},    
    -- normal_rotation+=/revenge
    {"6572",{"target.range <= 5"}},      
    -- normal_rotation+=/battle_shout,if=rage<=rage.max-20               
    {"6673",{"ActiveShouts.coolvalue = 1","player.rage < 80"},"player"},
    {"469",{"ActiveShouts.coolvalue = 2","player.rage < 80",},"player"},
    -- normal_rotation+=/thunder_clap,
    {"6343",{"target.range <= 5","@CML.IsGlyphed(507,true)"}},
    {"6343",{"target.range <= 5","player.aoe = 2"}},
    {"6343",{"target.range <= 5","!target.debuff(115798)"}},
    -- normal_rotation+=/demoralizing_shout
    {"1160",{"target.range <= 5","player.health <= 35"}},    
    -- normal_rotation+=/impending_victory,if=enabled
    {"103840",{"target.range <= 5","player.spell(103840).exists","player.health <= 80"}},     
    -- normal_rotation+=/victory_rush,if=!talent.impending_victory.enabled
    {"34428",{"target.range <= 5","player.health <= 80"}}, 
    -- normal_rotation+=/devastate
    {"20243",{"target.range <= 5"}}, 
}, 
--------------------------------------------------Out of Combat-------------------------------------------- 
{ 
    -- PQI Globals 
    {"TaMere","@CML.PQIConfing()"},
    -- Player Status
    {"TaMere","@CML.Status()"}, 
    -- Stances
    {"2457",{"player.seal != 1","ActiveStance.coolvalue = 1"}}, -- Battle Stance 
    {"71",{"player.seal != 2","ActiveStance.coolvalue = 2"}}, -- Defensive Stance
    {"2458",{"player.seal != 3","ActiveStance.coolvalue = 3"}}, -- Berserker Stance    
    {"2457",{"player.seal != 1","ActiveStance.coolvalue = 4","player.activestance = 1"}}, -- Battle Stance    
    {"71",{"player.seal != 2","ActiveStance.coolvalue = 4","player.activestance = 2"}}, -- Defensive Stance
    {"2457",{"player.seal != 1","ActiveStance.coolvalue = 5","player.activestance = 1"}}, -- Battle Stance
    {"71",{"player.seal != 2","ActiveStance.coolvalue = 5","player.activestance = 2"}}, -- Defensive Stance
    {"2458",{"player.seal != 3","ActiveStance.coolvalue = 5","player.activestance = 3"}}, -- Berserker Stance
})