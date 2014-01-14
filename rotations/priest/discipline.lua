ProbablyEngine.rotation.register_custom(256, "CodeMyLife Discipline", {  
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
    {"81700",{ -- Archangel
    	"@CML.Evangelism()",
    	"Archangel.novaHealing(1)",
    }},
    {"17",{ -- Power Word Speed 
        "!player.debuff(6788)",
        "PowerWordSpeed.novaHealing(0)",
        "player.moving",
    },"player"},
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
    {"123040",{ -- Mindbender
    	"talent(8)",
    	"ManaFiend.pqiMana(0)",
    },"target"},  
    {"121135",{ -- Cascade
        "talent(16)",
        "Cascade.novaHealing(1)",
    },"player"},  
    {"129250",{ -- Power Word Solace
        "talent(9)",
        "target.isinfront"
    },"target"},
    {"14914",{ -- Holy Fire
        "!talent(9)",
        "target.isinfront",
        "target.canattack",
    },"target"}, --[[
    {"596",{ -- Prayer Of Healing
        "PrayerOfHealing.novaHealing(1)",
    }}, 
    {"2050",{ -- Power Word Shield
        "PowerWordShield.novaHealing(1)",
        "!1.novaDebuff(6788)",
    }},   
    {"47540",{ -- Penance
        "Penance.novaHealing(1)",
    }},       
    {"32546",{ -- Binding Heal
        "BindingHeal.novaHealing(0)",
        "BindingHeal.novaHealing(1)",
    }},
    {"2061",{ -- Flash Heal
        "FlashHeal.novaHealing(1)",
    }},  
    {"2060",{ -- Greater Heal
        "GreaterHeal.novaHealing(1)",
    }},
    {"2050",{ -- Heal
        "Heal.novaHealing(1)",
    }},
]]
    {"47540",{ -- Penance
        "macros(ActiveDPS)",
        "target.isinfront",
        "target.canattack",
    }},   
    {"589",{ -- Shadow Word Pain
        "macros(ActiveDPS)",
        "target.debuff(589).duration < 4",
        "target.isinfront",
        "target.canattack",
    },"target"},
    {"589",{ -- Shadow Word Pain
        "macros(ActiveDPS)",
        "mouseover.debuff(589).duration < 4",
        "mouseover.isinfront",
        "mouseover.canattack",
    },"mouseover"},
    {"585",{ -- Smite
        "macros(ActiveDPS)",
        "!Smite.pqiMana(0)",
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
    {"121135",{ -- Cascade
        "talent(16)",
        "Cascade.novaHealing(3)",
    },"player"}, 
})