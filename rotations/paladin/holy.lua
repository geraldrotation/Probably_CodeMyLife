ProbablyEngine.rotation.register_custom(65, "CodeMyLife Holy", {  
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
        "!player.hasaura(1)", -- Does not have Buff
        "ActiveBlessings.pqivalue = 1", -- PQI selection set to 1
    },"player"},
    -- Blessing of Might
    {"19740",{ 
        "!player.hasaura(8)", -- Does not have Buff
        "ActiveBlessings.pqivalue = 2", -- PQI selection set to 2
    },"player"},
    -- Seal of Insight                                               
    {"20165",{
        "player.seal != 3", -- Does not have Seal
    }},   
    -- Lay on Hands 
    {"633",{
        "@CML.LayOnHands()", -- (library.lua)
    }},
    -- Divine Protection  
    { "498",{
        "player.health <= 55",
    }}, 
    --Divine Shield
    { "642",{
        "player.health <= 12 ",
    }},            
    -- Healthstone   
    {"#5512",{
        "@CML.HealthStone()",
        "Healthstone.novaHealing(0)",
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
--------------------------------------------------Interrupts-------------------------------------------- 
    {"96231",{
        "modifier.interrupt",
        "!player.casting",
        "target.range <= 5",
    }}, 
--------------------------------------------------Healing Rotation--------------------------------------
    -- Cleanse
    {"4987","@CML.Dispel()"},
    -- Beacon of Light
    {"53563",{
        "@CML.BeaconOfLight()",
    }},
    -- Divine Plea
    {"54428",{
        "player.mana < 95",
    }},
    -- Lights Hammer
    {"114158",{
        "talent(17)", -- Have Talent
        "LightsHammer.pqikeybind", 
    },"ground"},
    -- Avenging Wrath
    {"31884",{
        "AvengingWrath.novaHealing(3)",
        "@CML.ActiveCooldowns()",
    },nil},
    -- Guardian of Ancient Kings
    {"86669",{
        "GuardianOfAncientKings.novaHealing(3)",
        "@CML.ActiveCooldowns()",
    },nil},
    -- Divine Favor
    {"31842",{
        "GuardianOfAncientKings.novaHealing(3)",
        "@CML.ActiveCooldowns()",
    },nil},
    -- Holy Avenger
    {"105809",{
        "Talent(13)",
        "@CML.ActiveCooldowns()",
    },nil},
    -- Gloves  
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

--[[CML_GiftOfTheNaaru()
    CML_HolyPrism()]]
    -- Eternal Flame or raid
    {"114163",{
        "macros(ActiveHealing)", -- Healing ON
        "talent(8)", -- Have Talent
        "@CML.EternalFlame()",
    }},
    -- Word of Glory on raid
    {"85673",{
        "macros(ActiveHealing)", -- Healing ON
        "!talent(8)", -- Don't have Talent
        "player.holypower >= 3", -- Have >= 3 Holy Power
        "WordOfGlory.novaHealing(1)", -- Health under PQI Word Of Glory
    }},  
    -- Holy Shock
    {"20473",{
        "macros(ActiveHealing)", -- Healing ON
        "HolyShock.novaHealing(1)", -- Health under PQI Value
    }},


    --CML_StayOfExecution()    

    -- Sacred Shield
    {"20925",{
        "talent(9)", -- Have Talent 
        "spell.charges(20925) > 0",       
        "SacredShield.novaHealing(1)", -- Health under PQI Sacred Shield  
    }},

    -- Selfless Healer
   {"19750",{
        "macros(ActiveHealing)", -- Healing ON
        "talent(7)", -- Have Talent
        "player.buff(114250).count = 3", -- Player have 3 charges of Selfless healer
        "SelflessHealer.novaHealing(1)", -- Health under PQI Value
    }},
    -- Holy Prism                                                                     
    {"114165",{
        "HolyPrism.novaHealing(1)", -- Have Talent
        "@CML.IsInFront(nNova[1].target, 3)",
    }}, 
    -- Flash of Light
    {"82326",{
        "macros(ActiveHealing)", -- Healing ON
        "!1.novaBuff(53563)", -- Target does not have the beacon.
        "FlashOfLight.novaHealing(1)", -- Health under PQI Value
    }},   
    -- Flash of Light
    {"82326",{
        "macros(ActiveHealing)", -- Healing ON
        "!2.novaBuff(53563)", -- Target does not have the beacon.
        "FlashOfLight.novaHealing(2)", -- Health under PQI Value
    }}, 
    -- Flash of Light
    {"82326",{
        "macros(ActiveHealing)", -- Healing ON
        "1.novaBuff(53563)", -- Target have the beacon.
        "FlashOfLight.novaHealing(1)", -- Health under PQI Value
    }},              
    -- Divine Light
    {"82326",{
        "macros(ActiveHealing)", -- Healing ON
        "!1.novaBuff(53563)", -- Target does not have the beacon.
        "DivineLight.novaHealing(1)", -- Health under PQI Value
    },},
    -- Divine Light
    {"82326",{
        "macros(ActiveHealing)", -- Healing ON
        "!2.novaBuff(53563)", -- Target does not have the beacon.
        "DivineLight.novaHealing(2)", -- Health under PQI Value
    },},
    -- Divine Light
    {"82326",{
        "1.novaBuff(53563)", -- Target have the beacon.
        "macros(ActiveHealing)", -- Healing ON
        "DivineLight.novaHealing(1)", -- Health under PQI Value
    },},    
    -- Divine Light tricked
    {"82326",{
        "macros(ActiveHealing)", -- Healing ON
        "1.novaBuff(53563)", -- Target have the beacon.
        "HolyLight.novaHealing(1)", -- Health under PQI Value
    },},     
    -- Holy Radiance
    {"82327",{
        "macros(ActiveHealing)", -- Healing ON
        "HolyRadiance.novaAoEHealing10(1)", -- Health under PQI value 
    }},   
    -- Light of Dawn
    {"85222",{
        "macros(ActiveHealing)", -- Healing ON
        "LightOfDawn.novaAoEHealing30(1)", -- Health under PQI Value
    }},
    -- Holy Light
    {"635",{
        "macros(ActiveHealing)", -- Healing ON
        "HolyLight.novaHealing(1)", -- Health under PQI Value
        "!1.novaBuff(53563)", -- Target does not have the beacon.
    },}, 
    -- Holy Light
    {"635",{
        "macros(ActiveHealing)", -- Healing ON
        "!2.novaBuff(53563)", -- Target does not have the beacon.
        "HolyLight.novaHealing(2)", -- Health under PQI Value
    },},   
    -- Hammer of the Righteous
    {"53595",{
        "macros(ActiveDPS)", -- DPS Active
        "@CML.Melee(true)", -- Melee Range
        "player.aoe != 1", -- macros["AoE"] == 2 or 3(library.lua)
    },"target"},
    -- Crusader Strike
    {"35395",{
        "target.canattack",
        "macros(ActiveDPS)", -- DPS Active
        "@CML.Melee(true)", -- Melee Range
    },"target"},
    -- Judgment
    {"20271","macros(ActiveDPS)"},
    -- Holy Shock
    {"20473","macros(ActiveDPS)"}, 
    -- Hammer of Wrath 
    {"24275",{
        "macros(ActiveDPS)", -- DPS Active
        "target.health <= 20", -- Target Health Equal or under 20
    },},
    -- Denounce
    {"2812","macros(ActiveDPS)"}, 
}, 
--------------------------------------------------Out of Combat-------------------------------------------- 
{ 
    -- PQI Globals 
    {"TaMere","@CML.PQIConfing()"},
    -- Player Status
    {"TaMere","@CML.Status()"}, 
    {"pause","Pause.pqikeybind"},
    {"!/focus [target=focus]","Focus.pqikeybind"},
    -- Blessing of Kings                
    {"20217",{ 
        "!player.hasaura(1)", -- Does not have Buff
        "ActiveBlessings.pqivalue = 1", -- PQI selection set to 1
    },"player"},
    -- Blessing of Might
    {"19740",{ 
        "!player.hasaura(8)", -- Does not have Buff
        "ActiveBlessings.pqivalue = 2", -- PQI selection set to 2
    },"player"},
    -- Seal of Insight                                               
    {"20165",{
        "player.seal != 3", -- Does not have Seal
    }},
    -- Sacred Shield
    {"20925",{
        "spell.charges(20925) > 0",
        "talent(9)", -- Have Talent        
        "SacredShield.novaHealing(1)", -- Health under PQI Sacred Shield
    }},
    -- Eternal Flame or raid
    {"114163",{
        "macros(ActiveHealing)", -- Healing ON
        "talent(8)", -- Have Talent
        "@CML.EternalFlame()",
    }},
    -- Holy Shock
    {"20473",{
        "ShockMode.pqivalue = 1", -- Shock Mode set to 1(5 HP)
        "macros(ActiveHealing)", -- Healing ON
        "HolyShock.novaHealing(1)", -- Health under PQI Value
    }},
    -- Divine Light
    {"82326",{
        "macros(ActiveHealing)", -- Healing ON
        "DivineLight.novaHealing(1)", -- Health under PQI Value
    }},     
    -- Holy Light
    {"635",{
        "macros(ActiveHealing)", -- Healing ON
        "HolyLight.novaHealing(1)", -- Health under PQI Value
    }}, 
    -- Lights Hammer
    {"114158",{
        "talent(17)", -- Have Talent
        "LightsHammer.pqikeybind", 
    },"ground"},
}) 

-- /dump ProbablyEngine.dsl.get("debuff.duration")("target","8921")
