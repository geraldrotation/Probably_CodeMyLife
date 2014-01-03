ProbablyEngine.rotation.register_custom(70, "CodeMyLife Retribution", {  
--------------------------------------------------Defensive-------------------------------------------- 
    {"TaMere","@CML.PQIConfing()"},{"TaMere","@CML.Status()"},{"pause","@CML.CombatCheck()"}, -- Combat Check/Pause
    {"642","queuecast(642)","player"}, -- Divine Shield Queue
    {"105593",{"talent(4)","queuecast(105593)"},"target"}, -- Fist of Justice Queue 
    {"853","queuecast(853)","target"}, -- Hammer of Justice Queue
    {"115750","queuecast(115750)","target"}, -- Blinding Light Queue
    {"114157",{"talent(18)","queuecast(114157)"},"target"}, -- Execution Sentence Queue
    {"114158",{"talent(17)","queuecast(114158)"},"ground"}, -- Light's Hammer Queue     
    -- Blessing of Kings                
    {"20217",{ 
        "!player.hasaura(1)",
        "ActiveBlessings.pqivalue = 1",
    },"player"},
    -- Blessing of Might
    {"19740",{ 
        "!player.hasaura(8)",
        "ActiveBlessings.pqivalue = 2",
    },"player"},
    -- Auto Seals
    {"31801",{ -- Seal of Truth -- During AoE mode 1-2
        "player.aoe != 3",
        "ActiveSeals.pqivalue = 1",
        "player.seal != 1",
    }},
    {"20154",{ -- Seal of Righteousness -- During AoE mode 3
        "player.aoe = 3",
        "ActiveSeals.pqivalue = 1",
        "player.seal != 2",
    }}, 
    -- Specific Seals
    {"31801",{ -- Seal of Truth 
        "ActiveSeals.pqivalue = 2",
        "player.seal != 1",
    }},      
    {"20165",{ -- Seal of Insight
        "ActiveSeals.pqivalue = 3",
        "player.seal != 4",
    }},
    {"20154",{ -- Seal of Righteousness
        "ActiveSeals.pqivalue = 4",
        "player.seal != 2",
    }}, 
    {"20164",{ -- Seal of Justice 
        "ActiveSeals.pqivalue = 5",
        "player.seal != 3",
    }},
    -- Solo Seals
    {"20165",{ -- Seal of Insight 
        "DivineProtection.novaHealing(0)",
        "ActiveSeals.pqivalue = 6",
        "player.seal != 4",
    }},
    {"20154",{ -- Seal of Righteousness -- During AoE mode 3
        "!DivineProtection.novaHealing(0)",
        "player.aoe = 3",
        "ActiveSeals.pqivalue = 6",
        "player.seal != 2",
    }},     
    {"31801",{ -- Seal of Truth -- During AoE mode 1-2
        "!DivineProtection.novaHealing(0)",
        "player.aoe != 3",
        "ActiveSeals.pqivalue = 6",
        "player.seal != 1",
    }},
    -- Lay on Hands 
    {"633",{
        "@CML.LayOnHands()",
    }}, 
    -- Divine Protection                                                                         
    {"498",{
        "DivineProtection.pqicheck", 
        "DivineProtection.novaHealing(0)", 
    }},               
    -- Healthstone   
    {"#5512",{
        "@CML.HealthStone()",
        "Healthstone.novaHealing(0)",
    }},                                                                     
    -- Eternal Flame on me                                                                 
    {"114163",{
        "talent(8)",
        "!player.buff(114163)",
        "player.holypower >= 3",
        "player.buff(132403).count >= 4",
        "SelfFlame.novaHealing(0)",
    },"player"}, -- On Me
    -- Eternal Flame or raid
    {"114163",{
        "macros(ActiveHealing)",
        "talent(8)",
        "player.holypower >= 3",
        "!1.novaBuff(114163)",
        "WordOfGlory.novaHealing(1)",
    }},
    -- Word of Glory on me
    {"85673",{
        "!talent(8)",
        "player.holypower >= 3",
        "WordOfGlory.novaHealing(0)",
    },"player"},  
    -- Word of Glory on raid
    {"85673",{
        "macros(ActiveHealing)",
        "!talent(8)",
        "player.holypower >= 3",
        "SelfFlame.novaHealing(1)",
    }},
    -- Selfless Healer on me
    {"19750",{
        "talent(7)",
        "player.buff(114250).count = 3",
        "SelflessHealer.novaHealing(0)",
    }}, 
    -- Selfless Healer
   {"19750",{
        "macros(ActiveHealing)",
        "talent(7)",
        "player.buff(114250).count = 3",
        "SelflessHealer.novaHealing(1)",
    }}, 
    -- Hand of Salvation
    {"1038",{ -- Auto
        "@CML.HandOfSalvation()",
    }},
    {"1038",{ -- Queued
        "macros(HoSalvQueue)",
    },"mouseover"},
    -- Hand of Purity
    {"114039",{ -- Auto
        "talent(10)",
        "@CML.HandOfPurity()",
    }},   
    {"114039",{ -- Queued
        "talent(10)",
        "macros(HoPurQueue)",
    },"mouseover"},   
    -- Hand of Protection
    {"1022",{ -- Auto
        "@CML.HandOfProtection()",
    }},
    {"1022",{ -- Queued
        "macros(HoProtQueue)",
    },"mouseover"},
    -- Hand of Sacrifice
    {"6940",{ -- Auto
        "@CML.HandOfSacrifice()",
    }}, 
    {"6940",{ -- Queued
        "macros(HoSacQueue)",
    },"mouseover"}, 
    -- Hand of Freedom
    {"1044",{ -- Auto
        "@CML.HandOfFreedom()",
    },"player"},
    {"1044",{ -- Queued
        "macros(HoFreeQueue)",
    },"mouseover"},

    -- rebuke
    {{ 
            {"96231"},-- Rebuke
        }, "modifier.interrupts" 
    }, 
    -- mogu_power_potion,if=(buff.bloodlust.react|(buff.ancient_power.up&buff.avenging_wrath.up)|target.time_to_die<=40)
    -- auto_attack
    -- inquisition,if=(buff.inquisition.down|buff.inquisition.remains<=2)&(holy_power>=3|target.time_to_die<holy_power*20|buff.divine_purpose.react)
    { "84963", {
        "player.buff(84963).duration < 2",
        "player.holypower > 2",
    }},
    -- avenging_wrath,if=buff.inquisition.up
    {"31884",{ -- On ActiveCooldowns
        "player.buff(84963)",
        "AvengingWrath.pqivalue = 1",
        "@CML.ActiveCooldowns()",
        "@CML.Melee(true)",
        "player.holypower <= 2",
    }},
    {"31884",{ -- On CD
        "player.buff(84963)",
        "AvengingWrath.pqivalue = 2",
        "@CML.Melee(true)",
        "player.holypower <= 2",
    }},    
    -- guardian_of_ancient_kings,if=buff.inquisition.up
    {"86698",{ -- On ActiveCooldowns
        "player.buff(84963)",
        "GuardianOfAncientKings.pqivalue = 1",
        "@CML.ActiveCooldowns()",
        "@CML.Melee(true)",
        "player.holypower <= 2",
    }},
    {"86698",{ -- On CD
        "player.buff(84963)",
        "GuardianOfAncientKings.pqivalue = 2",
        "@CML.Melee(true)",
        "player.holypower <= 2",
    }},    
    -- holy_avenger,if=talent.holy_avenger.enabled&(buff.inquisition.up&holy_power<=2)
    {"105809",{ -- On ActiveCooldowns
        "talent(13)",
        "player.buff(84963)",
        "HolyAvenger.pqivalue = 1",
        "@CML.ActiveCooldowns()",
        "@CML.Melee(true)",
        "player.holypower <= 2",
    }},
    {"105809",{ -- On CD
        "talent(13)",
        "player.buff(84963)",
        "HolyAvenger.pqivalue = 2",
        "@CML.Melee(true)",
        "player.holypower <= 2",
    }},
    -- use_item,name=gauntlets_of_winged_triumph,if=buff.inquisition.up&(buff.ancient_power.down|buff.ancient_power.stack=12)
    -- Gloves  
    {"#gloves",{ -- On CD
        "player.buff(84963)",
        "SynapseSprings.pqivalue = 2",
        "@CML.Melee(true)",
    }},  
    {"#gloves",{ -- On ActiveCooldowns
        "player.buff(84963)",
        "macros(ActiveCooldowns)",
        "SynapseSprings.pqivalue = 1",
        "@CML.Melee(true)",
    }}, 
     -- Trinket1
    {"#trinket1",{ -- On CD
        "player.buff(84963)",
        "Trinkets.pqivalue = 2",
        "@CML.Melee(true)",
    }},
    {"#trinket1",{ -- On ActiveCooldowns
        "player.buff(84963)",
        "Trinkets.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "@CML.Melee(true)",
    }},
     -- Trinket2   
    {"#trinket2",{ -- On CD
        "player.buff(84963)",
        "Trinkets.pqivalue = 2",
        "@CML.Melee(true)",
    }},
    {"#trinket2",{ -- On ActiveCooldowns 
        "player.buff(84963)",
        "Trinkets.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "@CML.Melee(true)",
    }},
    -- blood_fury
    {"20572",{ -- On CD
        "player.buff(84963)",
        "Racials.pqivalue = 2",
        "spell.exists",
        "@CML.Melee(true)",
    }},
    {"20572",{ -- On ActiveCooldowns
        "player.buff(84963)",
        "Racials.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "spell.exists",
        "@CML.Melee(true)",
    }},
    -- berserking
    {"26297",{ -- On CD
        "player.buff(84963)",
        "Racials.pqivalue = 2",
        "spell.exists",
        "@CML.Melee(true)",
    }},
    {"26297",{ -- On ActiveCooldowns
        "player.buff(84963)",
        "Racials.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "spell.exists",
        "@CML.Melee(true)",
    }},
    -- arcane_torrent
    -- execution_sentence,if=talent.execution_sentence.enabled&(buff.inquisition.up&(buff.ancient_power.down|buff.ancient_power.stack=12))
    {"114157",{ -- On CD
        "talent(18)",
        "player.buff(84963)",
        "ExecutionSentence.pqivalue = 2",
    }},
    {"114157",{ -- On ActiveCooldowns
        "talent(18)",
        "player.buff(84963)",
        "ExecutionSentence.pqivalue = 1",
        "macros(ActiveCooldowns)"
    }},    
    -- lights_hammer,if=talent.lights_hammer.enabled&(buff.inquisition.up&(buff.ancient_power.down|buff.ancient_power.stack=12))
    {"114158",{{
        "talent(17)",
        "player.buff(84963)",
        "LightsHammer.pqivalue = 2"
        },{
        "!player.spell(114158).cooldown > 2",
        "@CML.LightsHammer()"
    }},"ground"},  
    {"114158",{
        "talent(17)",
        "player.buff(84963)",
        "LightsHammerKey.pqikeybind"
    },"ground"}, 
    -- divine_storm,if=active_enemies>=2&(holy_power=5|buff.divine_purpose.react|(buff.holy_avenger.up&holy_power>=3))
    {"53385",{ -- holy_power=5
        "player.holypower = 5",
        "player.aoe != 1",
        "@CML.Melee(true)",
    }},
    {"53385",{ -- buff.divine_purpose.react
        "player.buff(86172)",
        "player.aoe != 1",
        "@CML.Melee(true)",
    }},
    {"53385",{ -- buff.holy_avenger.up&holy_power>=3
        "player.buff(105809)",
        "player.holypower >= 3",
        "player.aoe != 1",
        "@CML.Melee(true)",
    }},
    -- divine_storm,if=buff.divine_crusader.react&holy_power=5
    {"53385",{
        "player.holypower = 5",
        "player.buff(144595)",
        "@CML.Melee(true)",
    }}, 
    -- templars_verdict,if=holy_power=5|buff.holy_avenger.up&holy_power>=3
    {"85256",{ -- holy_power=5
        "player.holypower = 5",
        "player.aoe = 1",
        "@CML.Melee(true)",
    }},
    {"85256",{ -- buff.holy_avenger.up&holy_power>=3
        "player.buff(105809)",
        "player.holypower >= 3",
        "player.aoe = 1",
        "@CML.Melee(true)",
    }},
    -- templars_verdict,if=buff.divine_purpose.react&buff.divine_purpose.remains<4
    {"85256",{
        "player.buff(86172)",
        "player.buff(86172).duration < 4",
        "@CML.Melee(true)",
    }},
    -- hammer_of_wrath
    {"24275",{
        "player.buff(31884)",
    }},    
    {"24275",{
        "target.health >= 20",
    }},     
    -- wait,sec=cooldown.hammer_of_wrath.remains,if=cooldown.hammer_of_wrath.remains>0&cooldown.hammer_of_wrath.remains<=0.2
    {"pause",{
        "spell.cooldown(122032) <= 0.5",
        "player.buff(31884,true)",
    }},
    {"pause",{
        "spell.cooldown(122032) <= 0.5",
        "target.health >= 20",
    }},    
    -- divine_storm,if=buff.divine_crusader.react&buff.avenging_wrath.up
    {"53385",{
        "player.buff(144595)", 
        "player.buff(31884)",
        "@CML.Melee(true)",
    }},     
    -- templars_verdict,if=buff.avenging_wrath.up
    {"85256",{
        "player.buff(31884)",
        "@CML.Melee(true)",
    }},    
    -- hammer_of_the_righteous,if=active_enemies>=4
    {"53595",{
        "player.aoe != 1",
        "@CML.Melee(true)",
    }},      
    -- crusader_strike
    {"35395",{
        "player.aoe = 1",
        "@CML.Melee(true)",
    },"target"},
 
    -- wait,sec=cooldown.crusader_strike.remains,if=cooldown.crusader_strike.remains>0&cooldown.crusader_strike.remains<=0.2
    {"pause",{
        "spell.cooldown(31935) <= 0.2",
        "@CML.Melee(true)",
    }},  
    -- exorcism,if=active_enemies>=2&active_enemies<=4&set_bonus.tier15_2pc_melee&glyph.mass_exorcism.enabled
    {"879",{
        "player.spell(122032).cooldown = 0",
        "@CML.IsGlyphed(122028,true)",
        "@CML.Melee(true)",
        "player.aoe = 1",
    }},
    -- judgment
    {"20271"},
    -- wait,sec=cooldown.judgment.remains,if=cooldown.judgment.remains>0&cooldown.judgment.remains<=0.2
    {"pause","spell.cooldown(20271) <= 0.2"},
    -- divine_storm,if=buff.divine_crusader.react
    {"53385",{
        "player.buff(144595)",
        "@CML.Melee(true)",
    }}, 
    -- templars_verdict,if=buff.divine_purpose.react
    {"85256",{
        "player.aoe = 1",
        "player.buff(86172)",
        "@CML.Melee(true)",
    }},
    -- exorcism
    {"879",{
        "@CML.IsGlyphed(122028,false)",
    }},    
    -- wait,sec=cooldown.exorcism.remains,if=cooldown.exorcism.remains>0&cooldown.exorcism.remains<=0.2
    {"pause",{"spell.cooldown(879) <= 0.5","@CML.IsGlyphed(122028,false)"}},
    -- templars_verdict,if=buff.tier15_4pc_melee.up&active_enemies<4
    {"85256",{
        "player.aoe = 1",
        "player.buff(86172)",
        "@CML.Melee(true)",
    }},
    -- divine_storm,if=active_enemies>=2&buff.inquisition.remains>4
    {"53385",{
        "player.aoe = 2",
        "player.buff(53385)",
        "@CML.Melee(true)",
    }},    
    -- templars_verdict,if=buff.inquisition.remains>4
    {"85256",{
        "player.aoe = 1",
        "player.buff(84963).duration > 4",
        "@CML.Melee(true)",
    }},
    -- holy_prism,if=talent.holy_prism.enabled                                                                   
    {"114165",{
        "talent(16)",
        "player.aoe = 1",
    },"target"},     
    -- Holy Prism(AoE) 
    {"114165",{
        "talent(16)",
        "player.aoe != 1",
    },"player"}, 
}, 
--------------------------------------------------Out of Combat-------------------------------------------- 
 { 
    -- PQI Globals 
    {"TaMere","@CML.PQIConfing()"},
    -- Player Status
    {"TaMere","@CML.Status()"}, 
    -- Blessing of Kings                
    {"20217",{ 
        "!player.hasaura(1)",
        "ActiveBlessings.pqivalue = 1",
    },"player"},
    -- Blessing of Might
    {"19740",{ 
        "!player.hasaura(8)",
        "ActiveBlessings.pqivalue = 2",
    },"player"},
    -- Seal of Truth 
    {"31801",{
        "player.aoe = 1",
        "player.seal != 1",
    }},
    -- Seal of Righteousness
    {"20154",{
        "player.aoe == 3",
        "player.seal != 2",
    }},
    -- Sacred Shield
    {"20925",{
        "talent(9)",    
        "SacredShield.novaHealing(0)",
        "player.buff(Sacred Shield).duration < 5",
    }},
}) 
