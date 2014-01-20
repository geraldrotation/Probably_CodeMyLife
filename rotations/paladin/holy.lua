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
    {"20217",{"!player.hasaura(1)","ActiveBlessings.pqivalue = 1"},"player"},
    -- Blessing of Might
    {"19740",{"!player.hasaura(8)","ActiveBlessings.pqivalue = 2"},"player"},
    -- Seal of Insight                                               
    {"20165",{"player.seal != 3"}},   
    -- Lay on Hands 
    {"633",{"@CML.LayOnHands()"}},
    -- Divine Protection  
    { "498",{"player.health <= 75"}}, 
    --Divine Shield
    { "642",{"player.health <= 12 "}},            

    -- Hand of Salvation
    {"1038",{"@CML.HandOfSalvation()"}},
    {"1038",{"macros(HoSalvQueue)"},"mouseover"},
    -- Hand of Purity
    {"114039",{"talent(10)","@CML.HandOfPurity()"}},   
    {"114039",{"talent(10)","macros(HoPurQueue)"},"mouseover"},   
    -- Hand of Protection
    {"1022",{"@CML.HandOfProtection()"}},
    {"1022",{"macros(HoProtQueue)"},"mouseover"},
    -- Hand of Sacrifice
    {"6940",{"@CML.HandOfSacrifice()"}}, 
    {"6940",{"macros(HoSacQueue)"},"mouseover"}, 
    -- Hand of Freedom
    {"1044",{"@CML.HandOfFreedom()"},"player"},
    {"1044",{"macros(HoFreeQueue)"},"mouseover"},

--------------------------------------------------Healing Rotation--------------------------------------
    -- Cleanse
    {"4987","@CML.Dispel()"},
    -- Beacon of Light
    {"53563",{"@CML.BeaconOfLight()"}},
    -- Divine Plea
    {"54428",{"player.mana < 95"}},
    -- Lights Hammer
    {"114158",{"talent(17)","LightsHammer.pqikeybind"},"ground"},
    -- Avenging Wrath
    {"31884",{"AvengingWrath.coolHealing(3)","@CML.ActiveCooldowns()"},nil},
    -- Guardian of Ancient Kings
    {"86669",{"GuardianOfAncientKings.coolHealing(3)","@CML.ActiveCooldowns()"},nil},
    -- Divine Favor
    {"31842",{"GuardianOfAncientKings.coolHealing(3)","@CML.ActiveCooldowns()"},nil},
    -- Holy Avenger
    {"105809",{"Talent(13)","@CML.ActiveCooldowns()"},nil},

    -- Eternal Flame on raid
    {"114163",{"talent(8)","@CML.EternalFlame()"}},
    -- Word of Glory on raid
    {"85673",{"!talent(8)","player.holypower >= 3","WordOfGlory.novaHealing(1)"}},  
    -- Holy Shock
    {"20473",{"HolyShock.novaHealing(1)"}},


    --CML_StayOfExecution()    

    -- Sacred Shield
    {"20925",{"talent(9)","spell.charges(20925) > 0","SacredShield.novaHealing(1)"}},
    -- Selfless Healer
   {"19750",{"talent(7)","player.buff(114250).count = 3","SelflessHealer.novaHealing(1)"}},
    -- Holy Prism                                                                     
    {"114165",{"HolyPrism.novaHealing(1)","@CML.IsInFront(nNova[1].target, 3)"}}, 
    -- Flash of Light
    {"82326",{"!1.novaBuff(53563)","FlashOfLight.novaHealing(1)"}},   
    {"82326",{"!2.novaBuff(53563)","FlashOfLight.novaHealing(2)"}}, 
    -- Flash of Light
    {"82326",{"1.novaBuff(53563)","FlashOfLight.novaHealing(1)",}},              
    -- Divine Light
    {"82326",{"!1.novaBuff(53563)","DivineLight.novaHealing(1)"}},
    {"82326",{"!2.novaBuff(53563)","DivineLight.novaHealing(2)"}},
    {"82326",{"1.novaBuff(53563)","macros(ActiveHealing)","DivineLight.novaHealing(1)"}},    
    -- Divine Light tricked
    {"82326",{"1.novaBuff(53563)","HolyLight.novaHealing(1)"}},     
    -- Holy Radiance
    {"82327",{"HolyRadiance.novaAoEHealing10(3)"}},   
    -- Light of Dawn
    {"85222",{"LightOfDawn.novaAoEHealing30(1)"}},
    -- Holy Light
    {"635",{"HolyLight.novaHealing(1)","!1.novaBuff(53563)"}}, 
    {"635",{"!2.novaBuff(53563)","HolyLight.novaHealing(2)"}},   
    -- Hammer of the Righteous
    {"53595",{"macros(ActiveDPS)","@CML.Melee(true)","player.aoe != 1"},"target"},
    -- Crusader Strike
    {"35395",{"target.canattack","macros(ActiveDPS)","@CML.Melee(true)"},"target"},
    -- Judgment
    {"20271","macros(ActiveDPS)"},
    -- Holy Shock
    {"20473","macros(ActiveDPS)"}, 
    -- Hammer of Wrath 
    {"24275",{"macros(ActiveDPS)","target.health <= 20"}},
    -- Denounce
    {"2812","macros(ActiveDPS)"}, 
}, 
--------------------------------------------------Out of Combat-------------------------------------------- 
{ 
    -- PQI Globals 
    {"TaMere","@CML.PQIConfing()"},
    -- Player Status
    {"TaMere","@CML.Status()"},
    {"pause","@CML.CombatCheck()"},
    -- Blessing of Kings                
    {"20217",{"!player.hasaura(1)","ActiveBlessings.pqivalue = 1",},"player"},
    -- Blessing of Might
    {"19740",{"!player.hasaura(8)","ActiveBlessings.pqivalue = 2"},"player"},
    -- Seal of Insight                                               
    {"20165",{"player.seal != 3"}},
    -- Sacred Shield
    {"20925",{"spell.charges(20925) > 0","talent(9)","SacredShield.novaHealing(1)"}},
    -- Eternal Flame or raid
    {"114163",{"talent(8)","@CML.EternalFlame()"}},
    -- Holy Shock
    {"20473",{"ShockMode.pqivalue = 1","HolyShock.novaHealing(1)"}},
    -- Divine Light
    {"82326",{"macros(ActiveHealing)","DivineLight.novaHealing(1)"}},     
    -- Holy Light
    {"635",{"HolyLight.novaHealing(1)"}}, 
    -- Lights Hammer
    {"114158",{"talent(17)","LightsHammer.pqikeybind"},"ground"},
}) 

-- /dump ProbablyEngine.dsl.get("debuff.duration")("target","8921")
