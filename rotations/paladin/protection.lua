ProbablyEngine.rotation.register_custom(66, "CodeMyLife Protection", {     
--------------------------------------------------Defensive-------------------------------------------- 
    {"TaMere","@CML.PQIConfing()"},{"TaMere","@CML.Status()"},{"pause","@CML.CombatCheck()"}, -- Combat Check/Pause
    {"642","queuecast(642)","player"}, -- Divine Shield Queue
    {"105593",{"talent(4)","queuecast(105593)"},"target"}, -- Fist of Justice Queue 
    {"853","queuecast(853)","target"}, -- Hammer of Justice Queue
    {"115750","queuecast(115750)","target"}, -- Blinding Light Queue
    {"114157",{"talent(18)","queuecast(114157)"},"target"}, -- Execution Sentence Queue

    -- Blessing of Kings                
    {"20217",{"!player.hasaura(1)","ActiveBlessings.pqivalue = 1"},"player"},
    -- Blessing of Might
    {"19740",{"!player.hasaura(8)","ActiveBlessings.pqivalue = 2"},"player"},
    -- Righteous Fury                  
    {"25780",{"!player.buff","RighteousFury.pqicheck"},"player"},
    -- Seal of Insight                                               
    {"20165",{"player.seal != 3"}},
    -- Shield Of The Righteous 
    {"53600",{"!modifier.last","player.sotr","53600.multiTarget"}}, 
    -- Lay on Hands 
    {"633",{"@CML.LayOnHands()"}},
    -- Ardent Defender
    {"31850",{"ArdentDefender.novaHealing(0)"}},
    -- Divine Protection                                                                         
    {"498",{"DivineProtection.novaHealing(0)"}},                              
    -- Guardian Of Ancient Kings                                                    
    {"86659",{"GuardianOfAncientKings.novaHealing(0)","!player.buff(86659)"}},
    -- ChopChop   
    {"#90175",{"!target.enemy","@CML.ChopChop()"}},      
     
    -- Eternal Flame                                                                
    {"114163",{"talent(8)","@CML.SelfFlame()"}},
    {"114163",{"macros(ActiveHealing)","talent(8)","player.holypower >= 3","!1.novaBuff(114163)","WordOfGlory.novaHealing(1)"}},
    -- Word of Glory
    {"85673",{"macros(ActiveHealing)","!talent(8)","player.holypower >= 3","WordOfGlory.novaHealing(0)"}},
    {"85673",{"!talent(8)","player.holypower >= 3","WordOfGlory.novaHealing(0)"}},
    -- Selfless Healer
   {"19750",{"talent(7)", "player.buff(114250).count = 3","SelflessHealer.novaHealing(1)"}}, 
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
    ----------------------------------------------Interrupts-------------------------------------------- 
    {{
            { "31935" }, -- Avenger's Shield
            { "96231", "player.spell(96231).cooldown" }, -- Rebuke 
        }, "modifier.interrupts"
    }, 
    --------------------------------------------------DPS Rotation-------------------------------------------- 
    -- Light's Hammer
    {"114158",{"talent(17)","LightsHammer.pqivalue = 2","!player.spell(114158).cooldown > 2","@CML.LightsHammer()"},"ground"},  
    {"114158",{"talent(17)","LightsHammerKey.pqikeybind"},"ground"}, 
    {"114158",{"talent(17)","queuecast(114158)"},"ground"},
    -- Glyphed Consecration
    {"116467",{"@CML.IsGlyphed(54928,true)","GlyphedConsecrationKey.pqikeybind","!player.spell(116467).cooldown > 1","@CML.GlyphedConsecration()"},"ground"}, 
    -- Avenger's Shield
    {"31935",{"player.buff(85416)","31935.multiTarget"}},
    -- Hammer of the Righteous
    {"53595",{"player.aoe = 2","53595.multiTarget"}},
    -- Crusader Strike
    {"35395",{"35395.multiTarget"}},
    -- Pause for Crusader
    {"pause",{"player.spell(35395).cooldown <= 0.6"}},
    -- Judgment
    {"20271","20271.multiTarget(360)"},
    -- Pause for Judgment/Crusader Procs
    {"pause","player.spell(20271).cooldown <= 0.6"},{"pause","player.buff(85416)"},
    -- Sacred Shield
    {"20925",{"talent(9)","@CML.SacredShield(1)"}},
     -- Holy Prism                                                                     
    {"114165",{"talent(16)","player.aoe = 1","114165.multiTarget"}},     
    -- Holy Prism(AoE) 
    {"114165",{"talent(16)","player.aoe != 1"},"player"},    
    -- Gloves  
    {"#gloves",{"modifier.cooldowns","@CML.Execution()"}},
    -- Execution Sentence
    {"114157",{"talent(18)","@CML.Execution()"}},
    -- Avenger's Shield
    {"31935","31935.multiTarget"},
    -- Hammer of Wrath                                        
    {"24275","24275.multiTarget(20)"},
    -- Auto Glyphed Consecration
    {"116467",{"@CML.IsGlyphed(54928,true)","GlyphedConsecration.pqivalue = 2","!player.spell(116467).cooldown > 1","@CML.GlyphedConsecration()"},"ground"},  
    -- Consecration
    {"26573",{"@CML.IsGlyphed(54928,false)","@CML.Consecration()","35395.multiTarget(360)"}},    
    {"116467",{"@CML.IsGlyphed(54928,true)","queuecast(116467)"},"ground"}, -- Consecration Glyphed Queue 

    -- Holy Wrath EDIT:Logic taken from Consecration <== by pve
    {"119072",{"@CML.HolyWrath()","119072.multiTarget(360)"}}, 
    -- Sacred Shield
    {"20925",{"talent(9)","@CML.SacredShield(2)"},"player"} 
}, 
--------------------------------------------------Out of Combat-------------------------------------------- 
{  
    -- PQI Globals 
    {"TaMere","@CML.PQIConfing()"},
    -- Player Status
    {"TaMere","@CML.Status()"},    
    -- ChopChop   
    {"#90175",{"target.enemy","@CML.ChopChop()"}},    
    -- Blessing of Kings                
    {"20217",{"!player.hasaura(1)","ActiveBlessings.pqivalue = 1"},"player"},
    -- Blessing of Might
    {"19740",{"!player.hasaura(8)","ActiveBlessings.pqivalue = 2"},"player"},
    -- Righteous Fury                  
    {"25780",{"!player.buff","RighteousFury.pqicheck"},"player"},
    -- Seal of Insight                                               
    {"20165",{"player.seal != 3"}},
    -- Sacred Shield
    {"20925",{"talent(9)","@CML.SacredShield(1)"}},
    -- Lights Hammer
    {"114158",{"talent(17)","LightsHammerKey.pqikeybind"},"ground"}, 
    -- Glyphed Consecration
    {"116467",{"@CML.IsGlyphed(54928,true)","GlyphedConsecrationKey.pqikeybind"},"ground"}, 

}) 