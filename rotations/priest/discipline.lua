ProbablyEngine.rotation.register_custom(256, "CodeMyLife Discipline", {  
    {"TaMere","@CML.PQIConfing()"},
    {"TaMere","@CML.Status()"},
    {"pause","@CML.CombatCheck()"}, -- Combat Check/Pause
	              
    {"21562",{ -- Fortitude 
        "!player.hasaura(2)",
        "Fortitude.pqicheck",
    },"player"},
    {"81700",{ -- Archangel
    	"@CML.Evangelism()",
    	"Archangel.novaHealing(1)",
    }},
    {"588",{ -- Inner Fire
        "!player.buff(588)",
    }},
    {"33076",{ -- Prayer of Mending
        "PrayerOfMending.novaHealing(1)",
    }},     
    {"19236",{ -- Desperate Prayer
        "DesperatePrayer.novaHealing(0)",
    }}, 
    {"108968",{ -- Void Shift
    	"player.health >= 95",
    	"player.spell(19236).cooldown < 2",
        "VoidShift.novaHealing(1)",
    }}, 
    {"586",{ -- Fade
--    	"iamtarget",
        "Fade.novaHealing(0)",
    }}, 
    {"121135",{ -- Cascade
    	"talent(16)",
        "Fade.novaHealing(0)",
    }},            
    -- Healthstone   
    {"#5512",{
        "@CML.HealthStone()",
        "Healthstone.novaHealing(0)",
    }},   
    {"527",{ -- Purify
        "@CML.Purify()",
    }},    
    {"528",{ -- Dispel Magic
        "@CML.DispelThis('target')",
    },"target"},
    {"528",{ -- Dispel Magic
        "@CML.DispelThis('target')",
    },"target"},
    {"123040",{ -- Mindbender
    	"talent(8)",
    	"ManaFiend.pqiMana(0)",
    },"target"},   

    {"129250",{ -- Power Word Solace
    	"talent(9)",
    },"target"},
    {"14914",{ -- Holy Fire
    	"!talent(9)",
    },"target"},
    {"585",{ -- Smite
        "!Smite.pqiMana(0)",
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
})