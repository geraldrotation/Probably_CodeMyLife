ProbablyEngine.rotation.register_custom(71, "CodeMyLife Arms", {  
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
    -- Impending Victory
    {"103840",{
        "player.spell(103840).exists",
        "ImpendingVictoryRush.novaHealing(0)",
    },"target"},
    {"34428",{
        "!player.spell(103840).exists",
        "ImpendingVictoryRush.novaHealing(0)",
        "target.health <= 20",
    },"target"},   
    -- Healthstone   
    {"#5512",{
        "@CML.HealthStone()",
        "Healthstone.novaHealing(0)",
    }},   
--------------------------------------------------Interrupts-------------------------------------------- 
    {{
            {"6552","target.range <= 5"}, -- Pummel
            { "23920",{ -- Spell Reflect
                "player.spell(6552).cooldown",
            }},
            { "23920",{ -- Spell Reflect
                "target.range > 4",
            }},            
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
        "player.rage < 85",
        "target.range <= 5",
    }},
    -- shield_wall,if=incoming_damage_2500ms>health.max*0.6
    {"871",{
        "ShieldWall.novaHealing(0)",
    }},
    -- Die By The Sword
    {"118038",{
        "DieByTheSword.novaHealing(0)",
    }},
    -- Leap
    {"6544",{
        "Leap.pqikeybind", 
    },"ground"},
    --[[ run_action_list,name=dps_cds,if=buff.vengeance.value>health.max*0.20
    -- run_action_list,name=normal_rotation]]

    -- auto_attack
    -- mogu_power_potion,if=(target.health.pct<20&buff.recklessness.up)|buff.bloodlust.react|target.time_to_die<=25
    -- recklessness,if=!talent.bloodbath.enabled&((cooldown.colossus_smash.remains<2|debuff.colossus_smash.remains>=5)&(target.time_to_die>(192*buff.cooldown_reduction.value)|target.health.pct<20))|buff.bloodbath.up&(target.time_to_die>(192*buff.cooldown_reduction.value)|target.health.pct<20)|target.time_to_die<=12
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
    -- avatar,if=enabled&(buff.recklessness.up|target.time_to_die<=25)
    {"107574",{ -- On CD
        "player.spell(107574).exists",
        "Avatar.pqicheck",
        "Avatar.pqivalue = 2",
        "target.range <= 5",
        "player.spell(107574).exists",
    }},
    {"107574",{ -- On ActiveCooldowns 
        "player.spell(107574).exists",
        "Avatar.pqicheck",
        "Avatar.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "target.range <= 5",
    }},
    -- skull_banner,if=buff.skull_banner.down&(((cooldown.colossus_smash.remains<2|debuff.colossus_smash.remains>=5)&target.time_to_die>192&buff.cooldown_reduction.up)|buff.recklessness.up)
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
    -- use_item,slot=hands,if=!talent.bloodbath.enabled&debuff.colossus_smash.up|buff.bloodbath.up
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
    -- Gloves  
    {"#gloves",{ -- On CD
        "SynapseSprings.pqivalue = 2",
        "pet.exists",
        "target.exists",
    }},  
    {"#gloves",{ -- On ActiveCooldowns
        "macros(ActiveCooldowns)",
        "SynapseSprings.pqivalue = 1",
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
    -- blood_fury,if=buff.cooldown_reduction.down&(buff.bloodbath.up|(!talent.bloodbath.enabled&debuff.colossus_smash.up))|buff.cooldown_reduction.up&buff.recklessness.up
    {"20572",{ -- On CD
        "Racials.pqicheck",
        "Racials.pqivalue = 2",
        "spell.exists",
    }},
    {"20572",{ -- On ActiveCooldowns
        "Racials.pqicheck",
        "Racials.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "spell.exists",
    }},
    -- berserking,if=buff.cooldown_reduction.down&(buff.bloodbath.up|(!talent.bloodbath.enabled&debuff.colossus_smash.up))|buff.cooldown_reduction.up&buff.recklessness.up
    {"26297",{ -- On CD
        "Racials.pqicheck",
        "Racials.pqivalue = 2",
        "spell.exists",
    }},
    {"26297",{ -- On ActiveCooldowns
        "Racials.pqicheck",
        "Racials.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "spell.exists",
    }}, 
    -- arcane_torrent,if=buff.cooldown_reduction.down&(buff.bloodbath.up|(!talent.bloodbath.enabled&debuff.colossus_smash.up))|buff.cooldown_reduction.up&buff.recklessness.up
    -- bloodbath,if=enabled&|target.time_to_die<=20
    {"12292",{ -- debuff.colossus_smash.up
        "target.debuff(86346).duration > 4",
        "player.spell(12292).exists",
        "target.range <= 5",
    }},
    {"12292",{ -- cooldown.colossus_smash.remains<4
        "target.debuff(86346).cooldown < 4",
        "player.spell(12292).exists",
        "target.range <= 5",
    }},  
    -- berserker_rage,if=buff.enrage.remains<0.5
    {"18499",{
        "player.buff(12880).duration < 0.5",
        "player.rage < 85",
        "target.range <= 5",
    }},
    -- heroic_leap,if=debuff.colossus_smash.up

    -- run_action_list,name=aoe,if=active_enemies>=2
    -- run_action_list,name=single_target,if=active_enemies<2
    -- stance,choose=berserker,damage_taken=150000,swap=20

--[[Single]]
    -- heroic_strike,if=rage>115|(debuff.colossus_smash.up&rage>60&set_bonus.tier16_2pc_melee)
    {"78",{ -- rage>115
        "player.aoe = 1",
        "player.rage > 115", 
        "@CML.IsGlyphed(58098,true)", -- Glyph of Unending Rage
        "target.range <= 5",
    }}, 
    {"78",{ -- rage>95&!glyph_of_unending_rage
        "player.aoe = 1",
        "player.rage > 95", 
        "@CML.IsGlyphed(58098,false)", -- Glyph of Unending Rage
        "target.range <= 5",
    }},    
    {"78",{ -- (debuff.colossus_smash.up&rage>60&set_bonus.tier16_2pc_melee)
        "player.aoe = 1",
        "player.rage > 60", 
        "target.debuff(86346)",
        "target.range <= 5",
    }},  
    {"78",{ -- Rage OverFlow
        "player.aoe = 1",
        "player.rage > 80",
        "target.range <= 5",
        "player.aoe = 1",
    }}, 
    -- mortal_strike,if=dot.deep_wounds.remains<1.0|buff.enrage.down|rage<10
    {"12294",{ -- dot.deep_wounds.remains<1.0
        "player.aoe = 1",
        "target.debuff(115767).duration < 1",
        "target.range <= 5",
    }},  
    {"12294",{ -- buff.enrage.down
        "player.aoe = 1",
        "target.debuff(115767).duration < 1",
        "target.range <= 5",
    }},  
    {"12294",{ -- rage<10
        "player.aoe = 1",
        "player.rage < 10",
        "target.range <= 5",
    }},        
    -- colossus_smash,if=debuff.colossus_smash.remains<1.0
    {"86346",{
        "player.aoe = 1",
        "target.debuff(86346).duration < 0.7",
        "target.range <= 5",
    }}, 
    -- mortal_strike
    {"12294",{
        "player.aoe = 1",
        "target.range <= 5",
    }},     
    -- storm_bolt,if=enabled&debuff.colossus_smash.up
    {"107570",{ -- On CD
        "player.aoe = 1",
        "player.spell(107570).exists",
        "target.debuff(86346).duration > 1",
        "StormBolt.pqicheck",
        "StormBolt.pqivalue = 2",
    }},
    {"107570",{ -- On ActiveCooldowns 
        "player.aoe = 1",
        "player.spell(107570).exists",
        "target.debuff(86346).duration > 1",
        "StormBolt.pqicheck",
        "StormBolt.pqivalue = 1",
        "macros(ActiveCooldowns)",
    }},
    -- dragon_roar,if=enabled&debuff.colossus_smash.down
    {"118000",{
        "player.aoe = 1",
        "player.spell(118000).exists",
        "!target.debuff(86346)",
        "target.range <= 5",
    }},  
    -- execute,if=buff.sudden_execute.down|buff.taste_for_blood.down|rage>90|target.time_to_die<12
    {"5308",{
        "player.aoe = 1",
        "player.buff(52437)",
        "!player.buff(60503)",
        "player.rage > 80",
        "target.range <= 5",
    }},
    -- slam,if=target.health.pct>=20&(stat.crit>25000|buff.recklessness.up)
    {"1464",{
        "player.aoe = 1",
        "target.debuff(86346)",
        "target.range <= 5",
    }},
    {"1464",{
        "player.aoe = 1",
        "player.buff(1719)",
        "target.range <= 5",
    }},    
    -- overpower,if=target.health.pct>=20&rage<100|buff.sudden_execute.up
    {"7384",{
        "player.aoe = 1",
        "player.buff(60503)",
        "target.range <= 5",
    }},
    -- slam,if=target.health.pct>=20
    {"1464",{
        "player.aoe = 1",
        "player.rage > 85",
        "target.range <= 5",
    }},    
    -- battle_shout
    {"6673",{ -- Battle
        "player.aoe = 1",
        "ActiveShouts.pqivalue = 1",
        "player.rage < 80",
    },"player"},
    {"469",{ -- Commanding
        "player.aoe = 1",
        "ActiveShouts.pqivalue = 2",
        "player.rage < 80",
    },"player"},
    -- heroic_throw
     {"57755",{
        "player.aoe = 1",
        "target.range <= 30",
    }},     
--[[MultiTarget]]
    -- sweeping strikes
     {"12328",{
        "!player.buff(12328)",
        "player.aoe = 2",
        "target.range <= 5",
    }},    
    -- cleave,if=rage>110&active_enemies<=4
     {"845",{ -- rage>110
        "player.aoe = 2",
        "player.rage > 110", 
        "@CML.IsGlyphed(58098,true)", -- Glyph of Unending Rage
        "target.range <= 5",
    }}, 
    {"845",{ -- rage>90&!glyph_of_unending_rage
        "player.aoe = 2",
        "player.rage > 90", 
        "@CML.IsGlyphed(58098,false)", -- Glyph of Unending Rage
        "target.range <= 5",
    }},  
    -- bladestorm,if=enabled&(buff.bloodbath.up|!talent.bloodbath.enabled)
    {"46924",{
        "player.aoe = 2",
        "player.spell(46924).exists",
        "target.range <= 5",
    }},
    -- dragon_roar,if=enabled&debuff.colossus_smash.down
    {"118000",{
        "player.aoe = 2",
        "player.spell(118000).exists",
        "!target.debuff(86346)",
        "target.range <= 5",
    }},      
    -- colossus_smash,if=debuff.colossus_smash.remains<1
    {"86346",{
        "player.aoe = 2",
        "target.debuff(86346).duration < 1",
        "target.range <= 5",
    }},     
    -- thunder_clap,target=2,if=dot.deep_wounds.attack_power*1.1<stat.attack_power
    {"6343",{ 
        "player.aoe = 2",
        "target.debuff(115767).duration <= 1",
        "target.range <= 5",
    }},    
    -- mortal_strike,if=active_enemies=2|rage<50
    {"12294",{
        "player.aoe = 2",
        "target.range <= 5",
        "player.rage < 80",
    }},      
    -- execute,if=buff.sudden_execute.down&active_enemies=2
    {"5308",{
        "player.aoe = 2",
        "player.buff(52437)",
        "target.range <= 5",
    }},   
    -- slam,if=buff.sweeping_strikes.up&debuff.colossus_smash.up
    {"1464",{
        "player.aoe = 2",
        "player.buff(12328)",
        "target.debuff(86346)",
        "target.range <= 5",
    }},       
    -- overpower,if=active_enemies=2
    {"7384",{
        "player.aoe = 2",
        "player.buff(60503)",
        "target.range <= 5",
    }},    
    -- slam,if=buff.sweeping_strikes.up
    {"1464",{
        "player.aoe = 2",
        "player.buff(12328)",
        "target.range <= 5",
    }},     
    -- battle_shout
    {"6673",{ -- Battle
        "player.aoe = 2",
        "ActiveShouts.pqivalue = 1",
        "player.rage < 80",
    },"player"},
    {"469",{ -- Commanding
        "player.aoe = 2",
        "ActiveShouts.pqivalue = 2",
        "player.rage < 80",
    },"player"},
--[[ 
-- Deep Wounds Target Debuff 115767
-- Colossus Smash Target Debuff 86346
-- Sudden Death Player Buff 52437
-- Taste For Blood Player Buff 60503

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
