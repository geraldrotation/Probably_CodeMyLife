ProbablyEngine.rotation.register_custom(257, "CodeMyLife Holy", {  
--------------------------------------------------Defensive-------------------------------------------- 
    {"TaMere","@CML.PQIConfing()"},
    {"TaMere","@CML.Status()"},
    {"pause","@CML.CombatCheck()"}, -- Combat Check/Pause

    {"21562",{ -- Fortitude 
        "!player.hasaura(2)",
        "Fortitude.pqicheck",
    },"player"},
    {"17",{ -- Bubble Machine 
        "@CML.BubbleMachine()",
    }},
    {"17",{ -- Power Word Speed 
        "!player.debuff(6788)",
        "PowerWordSpeed.novaHealing(0)",
        "player.moving",
    },"player"},
    {"588",{ -- Inner Fire
        "!player.buff(588)",
    }},
    {"81208",{ -- Chakra
        "player.aoe = 1",
        "!player.buff(81208)",
    }},  
    {"81206",{ -- AoE Chakra
        "player.aoe = 2",
        "!player.buff(81206)",
    }},        
    {"33076",{ -- Prayer of Mending
        "PrayerOfMending.novaHealing(1)",
    }},     
    {"19236",{ -- Desperate Prayer
        "DesperatePrayer.novaHealing(0)",
    },nil}, 
    {"108968",{ -- Void Shift
    	"player.health >= 95",
    	"player.spell(19236).cooldown < 2",
        "VoidShift.novaHealing(1)",
    }}, 
    {"47788",{ -- Guardian Spirit
        "GuardianSpirit.novaHealing(1)",
    }},     
    {"586",{ -- Fade
--    	"iamtarget",
        "Fade.novaHealing(0)",
    }},          
    -- Healthstone   
    {"#5512",{
        "@CML.HealthStone()",
        "Healthstone.novaHealing(0)",
    }},   
    {"527","@CML.Dispel()"},    
    {"528",{ -- Dispel Magic
        "@CML.DispelThis('target')",
    },"target"},


    {"126135","queuecast(126135)","ground"}, -- Lightwell
    {"88685","queuecast(88685)","ground"}, -- Holy Word Sanctuary
    {"108921","queuecast(108921)","ground"}, -- Psyfiend
    {"64843","queuecast(64843)"}, -- Divine Hymn
    {"64901","queuecast(64901)"}, -- Hymn of Hope
    {"8122","queuecast(8122)"}, -- Psychic Scream
    {"48045","queuecast(48045)"}, -- Mind Sear
    {"73325","queuecast(73325)"}, -- Leap of Faith
    {"9484","queuecast(9484)"}, -- Shackle Undead
    {"32375","queuecast(32375)"}, -- Mass Dispel
    {"6346","queuecast(6346)"}, -- Fear Ward


    {"123040",{ -- Mindbender
    	"talent(8)",
    	"ManaFiend.pqiMana(0)",
        "target.exists",
    },"target"},  
    {"121135",{ -- Cascade
        "talent(16)",
        "Cascade.novaHealing(3)",
    },"player"},  
    {"88684",{ -- Chackra Serenity
        "player.buff(81208)",
        "macros(ActiveHealing)",
        "Serenity.novaTank(1)",
    }},     
    {"139",{ -- Renew if moving
        "player.moving",
        "macros(ActiveHealing)",
        "!1.novaBuff(139)",
        "Renew.novaHealing(1)",
    }},  
    {"17",{ -- Power Word Shield
        "macros(ActiveHealing)",
        "!1.novaDebuff(6788)",
        "PowerWordShield.novaHealing(1)",
    }},       
    {"139",{ -- Renew
        "macros(ActiveHealing)",
        "!1.novaBuff(139)",
        "Renew.novaHealing(1)",
    }},  
    {"32546",{ -- Binding Heal
        "macros(ActiveHealing)",
        "@CML.BindingHeal()",
    }},
    {"2061",{ -- Flash Heal
        "macros(ActiveHealing)",
        "FlashHeal.novaHealing(1)",
    }},  
    {"596",{ -- Prayer Of Healing
        "PrayerOfHealing.novaHealing(3)",
    }},    
    {"2060",{ -- Greater Heal
        "macros(ActiveHealing)",
        "GreaterHeal.novaHealing(1)",
    }},
    {"2050",{ -- Heal
        "macros(ActiveHealing)",
        "Heal.novaHealing(1)",
    }},
    {"14914",{ -- Holy Fire
        "macros(ActiveDPS)",
        "!talent(9)",
        "target.isinfront",
        "target.canattack",
    },"target"},
    {"585",{ -- Smite
        "macros(ActiveDPS)",
        "target.isinfront",
        "target.canattack",
    },"target"},    
},
{	
    {"TaMere","@CML.PQIConfing()"},
    {"TaMere","@CML.Status()"},
    {"pause","@CML.CombatCheck()"}, -- Combat Check/Pause
    {"21562",{ -- Fortitude 
        "!player.hasaura(2)",
        "Fortitude.pqivalue = 1",
    },"player"},
    {"17",{ -- Power Word Speed 
        "!player.debuff(6788)",
        "PowerWordSpeed.novaHealing(0)",
        "player.moving",
    },"player"},    
    {"73413",{ -- Inner Will
        "ActiveInnerWill.pqicheck",
        "@CML.Will(2)",
        "!player.buff(73413)"
    },"player"},
    {"588",{ -- Inner Fire
        "ActiveInnerWill.pqicheck",
        "@CML.Will(1)",
        "!player.buff(588)"
    },"player"},
    {"588",{ -- Inner Fire
        "!ActiveInnerWill.pqicheck",
        "!player.buff(588)"
    },"player"}, 
    {"81208",{ -- Chakra
        "!player.buff(81208)",
    }},    
    {"527",{ -- Purify
        "@CML.Purify()",
    }},    
    {"88684",{ -- Chackra Serenity
        "player.buff(81208)",
        "macros(ActiveHealing)",
        "Serenity.novaTank(1)",
    }},           
    {"121135",{ -- Cascade
        "talent(16)",
        "Cascade.novaHealing(3)",
    },"player"},  
    {"139",{ -- Renew if moving
        "macros(ActiveHealing)",
        "1.novaBuff(139).duration < 2",
        "Renew.novaHealing(1)",
        "player.moving",
    }},     
    {"596",{ -- Prayer Of Healing
        "macros(ActiveHealing)",
        "PrayerOfHealing.novaHealing(3)",
    }},        
    {"139",{ -- Renew
        "macros(ActiveHealing)",
        "1.novaBuff(139).duration < 2",
        "Renew.novaHealing(1)",
    }}, 
    {"32546",{ -- Binding Heal
        "macros(ActiveHealing)",
        "BindingHeal.novaHealing(0)",
        "BindingHeal.novaHealing(1)",
    }},
    {"2050",{ -- Heal
        "macros(ActiveHealing)",
        "Heal.novaHealing(1)",
    }},
    {"17",{ -- Power Word Shield
        "macros(ActiveHealing)",
        "!1.novaDebuff(6788)",
        "PowerWordShield.novaHealing(1)",
    }},
})