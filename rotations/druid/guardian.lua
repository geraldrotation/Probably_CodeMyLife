-- Thanks to NinjaDerp for tips to get started.
ProbablyEngine.rotation.register_custom(104, "CodeMyLife Guardian", {
	{"TaMere","@CML.PQIConfing()"},{"TaMere","@CML.Status()"},{"pause","@CML.CombatCheck()"}, -- Combat Check/Pause
	-- Mark of the Wild
	{"1126",{
		"!player.hasaura(1)",
		"!player.seal = 1",
	}},
	-- Pause Rotation - Cat Form
	{"pause","player.seal = 3"},
	-- Bear Form
	{"5487","player.seal != 1"},
	-- Tranquility 
	{"108288",{ -- Heart of the Wild
  		"player.spell(108288).exists",
  		"Tranquility.pqikeybind",
 	}},
 	{"740","Tranquility.pqikeybind"},
	-- Barkskin
	{"22812","Barkskin.novaHealing(0)"},
	-- Savage Defense
	{"62606",{
	"!player.buff(132402)",
	"SavageDefense.novaHealing(0)",
	}},	
	-- Frenzied Regen
	{"22842","FrenziedRegen.novaHealing(0)"},	
	-- Renewal
	{"108238",{
		"player.spell(108238).exists",
		"Renewal.novaHealing(0)",
	}},
	-- Rejuvenation 
	{"774",{
		"macros(ActiveHealing)",
		"!player.buff(774)",
		"Rejuvenation.novaHealing(0)",
	}},
	-- Cenarion Ward
	{"102351",{ 
		"player.spell(102351).exists",
		"CenarionWard.novaHealing(0)",
	}},
	{"102351",{ 
		"player.spell(102351).exists",
		"CenarionWard.novaHealing(1)",
	}},	            
    -- Healthstone   
    {"#5512",{
        "@CML.HealthStone()",
        "Healthstone.novaHealing(0)",
    }},   
    {"#gloves",{ -- Gloves  -- On CD
        "ProfessionsCDs.pqivalue = 2",
        "target.exists",
    }}, 
    {"#gloves",{ -- Gloves  -- On ActiveCooldowns
        "ProfessionsCDs.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "target.exists",
    }}, 
    {"#trinket1",{ -- Trinket1  -- On CD
        "Trinkets.pqivalue = 2",
        "pet.exists",
        "target.exists",
    }},
    {"#trinket1",{ -- Trinket1 -- On ActiveCooldowns
        "Trinkets.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "pet.exists",
        "target.exists",
    }},
    {"#trinket2",{ -- Trinket2    -- On CD
        "Trinkets.pqivalue = 2",
        "pet.exists",
        "target.exists",
    }},
    {"#trinket2",{ -- Trinket2  -- On ActiveCooldowns 
        "Trinkets.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "pet.exists",
        "target.exists",
    }},
    -- Bloodfury
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
    -- Berserking
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
   -- Lifeblood
    {"121279",{ -- On CD
        "player.spell(121279).exists",
        "ProfessionsCDs.pqicheck",
        "ProfessionsCDs.pqivalue = 2",
    }},
    {"121279",{ -- On ActiveCooldowns 
        "player.spell(121279).exists",
        "ProfessionsCDs.pqicheck",
        "ProfessionsCDs.pqivalue = 1",
        "macros(ActiveCooldowns)",
    }},

    -- Fairie Fire if not provided
	{"770",{
		"!target.debuff(113746).cound < 3",
	}},	
    -- Mangle on CD
    {"33878"},
    -- Trash 
    {"77758",{ -- Single to keep up buff
    	"!target.debuff(77758)",
    }},
    {"77758",{ -- AoE
    	"player.aoe = 2",
    }},
    -- Lacerate on CD
    {"33745","player.aoe = 1"},
    -- Maul if Procs and low Health
    {"6807",{
    	"player.buff(135286)",
    	"ToothAndClaw.novaHealing(0)",
    }},
    -- Maul if too much rage
    {"6807",{
    	"player.rage > 85",
    }},
},
{
	{"TaMere","@CML.PQIConfing()"},{"TaMere","@CML.Status()"},{"pause","@CML.CombatCheck()"}, -- Combat Check/Pause
	-- Mark of the Wild
	{"1126",{ 
        "!player.hasaura(1)", -- Does not have Buff
    },"player"},
})