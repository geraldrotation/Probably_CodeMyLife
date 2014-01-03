ProbablyEngine.rotation.register_custom(105, "Repaired Restoration", {
	{"TaMere","@CML.PQIConfing()"},{"TaMere","@CML.Status()"},{"pause","@CML.CombatCheck()"}, -- Combat Check/Pause
	-- Mark of the Wild
	{"1126","!player.hasaura(1)"},
	-- Pause Rotation - Bear Form
	{"pause","player.seal = 1"},
	-- Pause Rotation - Cat Form
	{"pause","player.seal = 3"},

	-- Tranquility 
	{"108288",{ -- Heart of the Wild
  		"player.spell(108288).exists",
  		"Tranquility.pqikeybind",
 	}},
 	{"740","Tranquility.pqikeybind"}, -- Tranquility
	-- innervate
	{"29166","player.mana < 50"},
	-- Barkskin
	{"22812","Barkskin.novaHealing(0)"},
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
	{"Cenarion Ward",{ 
		"player.spell(108238).exists",
		"player.health <= 75",
	}},
    -- Healthstone   
    {"#5512",{
        "@CML.HealthStone()",
    }},  
	-- use_item,slot=hands,if=buff.celestial_alignment.up|cooldown.celestial_alignment.remains>30
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
   	-- Berserking
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
   -- Lifeblood
    {"121279",{ -- On CD
        "ProfessionsCDs.pqicheck",
        "ProfessionsCDs.pqivalue = 2",
        "spell.exists",
    }},
    {"121279",{ -- On ActiveCooldowns 
        "ProfessionsCDs.pqicheck",
        "ProfessionsCDs.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "spell.exists",
    }},









},
{
	{"TaMere","@CML.PQIConfing()"},{"TaMere","@CML.Status()"},{"pause","@CML.CombatCheck()"}, -- Combat Check/Pause
	-- Mark of the Wild
	{"1126",{ 
        "!player.hasaura(1)", -- Does not have Buff
    },"player"},
	-- Rejuvenation 
	{"774",{
		"!player.buff(774)",
		"Rejuvenation.novaHealing(0)",
	}},






})