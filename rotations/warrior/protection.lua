ProbablyEngine.rotation.register_custom(73, "CodeMyLife Protection", {  
--------------------------------------------------Defensive-------------------------------------------- 
    {"TaMere","@CML.PQIConfing()"},
    {"TaMere","@CML.Status()"},
    {"pause","@CML.CombatCheck()"}, -- Combat Check/Pause

    {"64382","queuecast(64382)","target"}, -- Shattering Throw
    {"5246","queuecast(5246)","target"}, -- Intimidating Shout
    {"676","queuecast(676)","target"}, -- Disarm
    {"12323","queuecast(12323)","target"}, -- Piercing Howl
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
    {"103840",{ -- Impending Victory
        "player.spell(103840).exists",
        "ImpendingVictoryRush.novaHealing(0)",
    },"target"},
    {"34428",{ -- Victory Rush
        "!player.spell(103840).exists",
        "ImpendingVictoryRush.novaHealing(0)",
        "target.health <= 20",
    },"target"},
    {"12975",{ -- Last Stand
        "LastStand.novaHealing(0)",
    }},              
    {"#5512",{ -- Healthstone
        "@CML.HealthStone()",
        "Healthstone.novaHealing(0)",
    }},   
--------------------------------------------------Interrupts-------------------------------------------- 
    {{
            {"6552","target.range <= 5"}, -- Pummel
            { "23920"},     
            { "102060",{ -- Disrupting Shout
                "player.spell(102060).exists",
                "player.spell(6552).cooldown",
                "player.spell(23920).cooldown",
                "target.range <= 5",
            }},
        }, "modifier.interrupts"
    }, 
--------------------------------------------------DPS Rotation-------------------------------------------- 
    -- auto_attack
    -- Gloves  
    {"#gloves",{ -- On CD
        "SynapseSprings.pqivalue = 2",
        "target.range <= 5",
    }},   
    {"#gloves",{ -- On ActiveCooldowns
        "macros(ActiveCooldowns)",
        "SynapseSprings.pqivalue = 1",
        "target.range <= 5",
    }}, 
     -- Trinket1  
    {"#trinket1",{ -- On CD
        "Trinkets.pqivalue = 2",
        "target.range <= 5",
    }}, 
    {"#trinket1",{ -- On ActiveCooldowns
        "Trinkets.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "target.range <= 5",
    }},
    -- use_item,slot=trinket2  
    {"#trinket2",{ -- On CD
        "Trinkets.pqivalue = 2",
        "target.range <= 5",
    }}, 
    {"#trinket2",{ -- On ActiveCooldowns 
        "Trinkets.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "target.range <= 5",
    }},           
    -- berserker_rage,if=buff.enrage.down&rage<=rage.max-10
    {"18499",{
        "!player.buff(12880)",
        "player.rage < 80",
        "target.range <= 5",
    }},
    -- shield_block
    {"2565",{
        "ActiveMitigationSelector.pqivalue = 3",
        "!player.buff(132404)",
        "target.threat > 100",
        "ShieldBlock.novaHealing(0)",
        "player.rage > 60",
        "target.range <= 5",
    }},
    -- shield_block
    {"2565",{
        "ActiveMitigationSelector.pqivalue = 1",
        "player.mitigation = 1",
        "!player.buff(132404)",
        "target.threat > 100",
        "ShieldBlock.novaHealing(0)",
        "player.rage > 60",
        "target.range <= 5",
    }},
    -- shield_block
    {"2565",{
        "ActiveMitigationSelector.pqivalue = 1",
        "player.mitigation = 3",
        "!player.buff(132404)",
       "target.threat > 100",
        "ShieldBlock.novaHealing(0)",
        "player.rage > 60",
        "target.range <= 5",
    }},        
    -- shield_barrier,if=incoming_damage_1500ms>health.max*0.3|rage>rage.max-20
    {"112048",{
        "ActiveMitigationSelector.pqivalue = 2",
        "!player.buff(112048)",
        "target.threat > 100",
        "ShieldBarrier.novaHealing(0)",
        "player.rage > 60",
        "target.range <= 5",
    }},    
    -- shield_barrier,if=incoming_damage_1500ms>health.max*0.3|rage>rage.max-20
    {"112048",{
        "ActiveMitigationSelector.pqivalue = 1",
        "player.mitigation = 2",
        "!player.buff(112048)",
        "target.threat > 100",
        "ShieldBarrier.novaHealing(0)",
        "player.rage > 60",
        "target.range <= 5",
    }},
    -- shield_barrier,if=incoming_damage_1500ms>health.max*0.3|rage>rage.max-20
    {"112048",{
        "ActiveMitigationSelector.pqivalue = 1",
        "player.mitigation = 3",
        "!player.buff(112048)",
        "target.threat > 100",
        "ShieldBarrier.novaHealing(0)",
        "player.rage > 60",
        "target.range <= 5",
    }},    
    -- shield_wall,if=incoming_damage_2500ms>health.max*0.6
    {"871",{
        "target.threat > 100",
        "ShieldWall.novaHealing(0)",
        "target.range <= 5",
    }},
    -- Leap
    {"6544",{
        "Leap.pqikeybind", 
    },"ground"},
    --[[ run_action_list,name=dps_cds,if=buff.vengeance.value>health.max*0.20
    -- run_action_list,name=normal_rotation]]
    -- Cleave 
    {"845",{ -- Rage OverFlow Non-Glyphed
        "player.rage > 90",
        "@CML.IsGlyphed(58098,false)", -- Glyph of Unending Rage
        "player.aoe = 2",
        "target.range <= 5",
    }},    
    {"845",{ -- Rage OverFlow Glyphed
        "player.rage > 110",
        "@CML.IsGlyphed(58098,true)", -- Glyph of Unending Rage
        "player.aoe = 2",
        "target.range <= 5",
    }},      
    -- heroic_strike,if=buff.ultimatum.up|buff.glyph_incite.up
    {"78",{ -- Ultimatum
        "player.buff(122510)", 
        "target.range <= 5",
    }}, 
    {"78",{ -- Incite
        "player.buff(122016)",
        "target.range <= 5",
    }},  
    {"78",{ -- Rage OverFlow Non-Glyphed
        "player.aoe = 1",
        "player.rage > 90",
        "@CML.IsGlyphed(58098,false)", -- Glyph of Unending Rage
        "target.range <= 5",
    }}, 
    {"78",{ -- Rage OverFlow Glyphed
        "player.aoe = 1",
        "player.rage > 110",
        "@CML.IsGlyphed(58098,true)", -- Glyph of Unending Rage
        "target.range <= 5",
    }},     
    -- dps_cds=avatar,if=enabled
    {"107574",{ -- On CD
        "player.spell(107574).exists",
        "Avatar.pqicheck",
        "Avatar.pqivalue = 2",
        "target.range <= 5",
        "player.spell(107574).exists"
    }},
    {"107574",{ -- On ActiveCooldowns 
        "player.spell(107574).exists",
        "Avatar.pqicheck",
        "Avatar.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "target.range <= 5",
    }},
    -- dps_cds+=/bloodbath,if=enabled
    {"12292",{
        "player.spell(12292).exists",
        "target.range <= 5",
    }},
    -- dps_cds+=/blood_fury
    {"20572",{ -- On CD
        "player.spell(20572).exists",
        "Racials.pqicheck",
        "Racials.pqivalue = 2",
    }},
    {"20572",{ -- On ActiveCooldowns
        "player.spell(20572).exists",
        "Racials.pqicheck",
        "Racials.pqivalue = 1",
        "macros(ActiveCooldowns)",
    }},
    -- dps_cds+=/berserking
    {"26297",{ -- On CD
        "player.spell(26297).exists",
        "Racials.pqicheck",
        "Racials.pqivalue = 2",
    }},
    {"26297",{ -- On ActiveCooldowns
        "player.spell(26297).exists",
        "Racials.pqicheck",
        "Racials.pqivalue = 1",
        "macros(ActiveCooldowns)",
    }},
    -- dps_cds+=/arcane_torrent
    -- Lifeblood
    {"121279",{ -- On CD
        "player.spell(121279).exists",
        "ProfessionsCDs.pqicheck",
        "ProfessionsCDs.pqivalue = 2",
        "target.range <= 5",
    }},
    {"121279",{ -- On ActiveCooldowns 
        "player.spell(121279).exists",
        "ProfessionsCDs.pqicheck",
        "ProfessionsCDs.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "target.range <= 5",
    }},
    -- dps_cds+=/dragon_roar,if=enabled
    {"118000",{
        "player.spell(118000).exists",
        "target.range <= 5",
    }},    
    -- dps_cds+=/shattering_throw   
    -- dps_cds+=/skull_banner
    {"114207",{ -- On CD
        "SkullBanner.pqicheck",
        "SkullBanner.pqivalue = 2",
        "target.range <= 5",
    }},
    {"114207",{ -- On ActiveCooldowns 
        "SkullBanner.pqicheck",
        "SkullBanner.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "target.range <= 5",
    }},    
    -- dps_cds+=/recklessness
    {"1719",{ -- On CD
        "Recklessness.pqicheck",
        "Recklessness.pqivalue = 2",
        "target.range <= 5",
    }},
    {"1719",{ -- On ActiveCooldowns 
        "Recklessness.pqicheck",
        "Recklessness.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "spell.exists",
        "target.range <= 5",
    }},
    -- dps_cds+=/storm_bolt,if=enabled
    {"107570",{ -- On CD
        "StormBolt.pqicheck",
        "StormBolt.pqivalue = 2",
        "player.spell(107570).exists",
    }},
    {"107570",{ -- On ActiveCooldowns 
        "StormBolt.pqicheck",
        "StormBolt.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "player.spell(107570).exists",
    }},    
    -- dps_cds+=/shockwave,if=enabled
    {"46968",{
        "player.spell(46968).exists",
        "target.range <= 5",
    }},
    -- dps_cds+=/bladestorm,if=enabled
    {"46924",{
        "player.spell(46924).exists",
        "target.range <= 5",
    }},
    -- dps_cds+=/run_action_list,name=normal_rotation

    -- normal_rotation=shield_slam
    {"23922",{
        "target.range <= 5",
    }},    
    -- normal_rotation+=/revenge
    {"6572",{
        "target.range <= 5",
    }},      
    -- normal_rotation+=/battle_shout,if=rage<=rage.max-20               
    {"6673",{ -- Battle
        "ActiveShouts.pqivalue = 1",
        "player.rage < 80",
    },"player"},
    {"469",{ -- Commanding
        "ActiveShouts.pqivalue = 2",
        "player.rage < 80",
    },"player"},
    -- normal_rotation+=/thunder_clap,
    {"6343",{ -- if=glyph.resonating_power.enabled
        "target.range <= 5",
        "@CML.IsGlyphed(507,true)",
    }},
    {"6343",{ -- AoE
        "target.range <= 5",
        "player.aoe = 2"
    }},
    {"6343",{ -- if=target.debuff.weakened_blows.down
        "target.range <= 5",
        "!target.debuff(115798)",
    }},
    -- normal_rotation+=/demoralizing_shout
    {"1160",{
        "target.range <= 5",
    }},    
    -- normal_rotation+=/impending_victory,if=enabled
    {"103840",{
        "target.range <= 5",
        "player.spell(103840).exists",
    }},     
    -- normal_rotation+=/victory_rush,if=!talent.impending_victory.enabled
    {"34428",{
        "target.range <= 5",
    }}, 
    -- normal_rotation+=/devastate
    {"20243",{
        "target.range <= 5",
    }}, 
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
