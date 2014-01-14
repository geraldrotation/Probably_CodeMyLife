-- Rotation Wrtitten and maintained by Skorp05. Thanks a lot for the great work!
ProbablyEngine.rotation.register_custom(261, "Mystic Rogue(Subtlety)", {
	--- Random Stuff
 	{"STARTING","@CML.PQIConfing()"},
 	{"STARTING","@CML.Status()"},
 	{"pause","@CML.CombatCheck()"},
	{"Cooldowns","@CML.Cooldowns()"},	
 	-- Lethal
	{"2823",{"LethalPoison.pqivalue = 1","!player.buff(2823)",},"player"},
	{"8679",{"LethalPoison.pqivalue = 2","!player.buff(8679)",},"player"},	
	-- Non-Lethal
	{"3408",{"NonLethalPoison.pqivalue = 1","!player.buff(3408)",},"player"},	
	{"5761",{"NonLethalPoison.pqivalue = 2","!player.buff(5761)",},"player"},	
	{"108211",{"NonLethalPoison.pqivalue = 3","!player.buff(108211)",},"player"},	
	{"108215",{"NonLethalPoison.pqivalue = 4","!player.buff(108215)",},"player"}, 
	-- Feint
 	{"1966",{
 		"Feint.novaHealing(0)",
 		"!player.buff(1966)",
 	}},
 	-- Recuperate
 	{"73651",{
 		"Recuperate.novaHealing(0)",
 		"!player.buff(73651)",
 	}},             
    -- Healthstone   
    {"#5512",{
        "@CML.HealthStone()",
        "Healthstone.novaHealing(0)",
    }}, 
	
 	{"!/targetenemy [noharm]", { "!target.alive", "!target.enemy", "!target.exists", }},

	 {"57934",{
     "TricksoftheTrade.pqicheck",
     "@CML.TOTT()"
    }},  
	
--- Interrupt Stuff
    {"InettruptMyAss",{ "@CML.Interrupts()" }},
   
	--- Cooldown Stuff
	-- Premeditation
 	{ "14183" , { -- On ActiveCooldowns
        "@CML.ActiveCooldowns()",
        "Premeditation.coolvalue = 1",
 	}},
	-- Premeditation	
 	{ "14183" ,  -- On CD
        "Premeditation.coolvalue = 2"
 	}, 
 	-- Gloves
 	{ "#gloves", { -- On ActiveCooldowns
        "@CML.ActiveCooldowns()",
	    "ProfessionsCDs.coolvalue = 1",
 	}},
 	-- Gloves	
 	{ "#gloves", "ProfessionsCDs.coolvalue = 2"--ON CD
	},
	-- Preparation
 	{ "14185", { -- On ActiveCooldowns
        "@CML.ActiveCooldowns()",
        "Preparation.coolvalue = 1",
 		"!player.buff(1856)",
 		"player.spell(1856).cooldown >= 60"
 	}},
	-- Preparation	
  	{ "14185", { -- On CD
        "Preparation.coolvalue = 2",
 		"!player.buff(1856)",
 		"player.spell(1856).cooldown >= 60"
 	}},	
 	-- Shadow Dance
 	{ "51713", { -- On ActiveCooldowns
        "@CML.ActiveCooldowns()",
        "ShadowDance.coolvalue = 1",
 		"target.range <= 5",
 		"player.energy >= 30"
 	}},
 	-- Shadow Dance	
 	{ "51713", { -- On CD
        "ShadowDance.coolvalue = 2",
 		"target.range <= 5",
 		"player.energy >= 30"
 	}}, 	
 	-- Vanish
 	{ "1856", { -- On ActiveCooldowns
        "@CML.ActiveCooldowns()",
        "Vanish.coolvalue = 1",
 		"!target.debuff(Find Weakness)",
 		"player.energy >= 40",
 		"player.combopoints >= 2",
 		"!player.buff(1856)",
 	}},
 	-- Vanish	
 	{ "1856", { -- On CD
        "Vanish.coolvalue = 2",
 		"!target.debuff(Find Weakness)",
 		"player.energy >= 40",
 		"player.combopoints >= 2",
 		"!player.buff(1856)",
 	}},
 	-- Shadow Blades
 	{ "121471", { -- On ActiveCooldowns
        "@CML.ActiveCooldowns()",
        "ShadowBlades.coolvalue = 1",
 		"player.energy <= 35"
 	}},
 	-- Shadow Blades	
 	{ "121471", { -- On CD
        "ShadowBlades.coolvalue = 2",
 		"player.energy <= 35"
 	}}, 	
 	--- AOE Stuff
 	{ "121411", { -- Crimson Tempest
 		"player.aoe = 2", 
 		"player.combopoints = 5", 
 		"target.debuff(Crimson Tempest).duration <= 2" 
 	}},
 	{ "51723",  -- Fan of Knives
 		"player.aoe = 2" 
 	},

	--- Single Rotation Stuff
 	{ "Slice and Dice", { 
 		"player.buff(Slice and Dice).duration < 4",
 		"player.combopoints = 5" 
 	}},
 	{ "Slice and Dice", { 
 		"player.buff(Slice and Dice).duration < 2",
 		"player.combopoints >= 2" 
 	}},
 	{ "Rupture", {
 		"target.debuff(Garrote).duration < 4",
 		"!target.debuff(Garrote)",
 		"target.debuff(Rupture).duration < 4",
 		"player.combopoints = 5",
 	}},
 	{ "Rupture", {
 		"!target.debuff(Garrote)",
 		"target.debuff(Rupture).duration < 2",
 		"player.combopoints >= 2",
 	}},
 	{ "Eviscerate", {
 		"player.buff(115189).count >= 4",
 		"target.debuff(Garrote)",
 		"player.buff(Slice and Dice)",
-- 		"player.combopoints = 5",
 	}},
 	{ "Eviscerate", {
 		"player.buff(115189).count >= 4",
 		"target.debuff(Rupture)",
 		"player.buff(Slice and Dice)",
-- 		"player.combopoints = 5",
 	}},
 	{ "Eviscerate",{  "!player.spell(114015).exists","player.combopoints = 5" }}, 

 	{ "Ambush", "player.buff(Sleight of Hand)" },
	{ "Ambush",{"player.buff(51713)","player.buff(115189).count < 5"}},
 	{ "Ambush", { "player.spell(114015).exists", "player.buff(115189).count < 5" }},
 	{ "Ambush", { "!player.spell(114015).exists", "player.combopoints < 5" }},
 	{ "Hemorrhage", "!target.debuff(Hemorrhage)" },
 
-- 	{ "Backstab", { "talent(18)", "player.behind", "player.buff(115189).count < 4", "player.energy >= 69", "!player.buff(51713)"}},
-- 	{ "Backstab", { "!talent(18)", "player.behind", "player.combopoints < 5", "player.energy >= 69", "!player.buff(51713)" }},
 	{ "Backstab", { "talent(18)", "player.behind", "player.buff(115189).count < 4", "!player.buff(51713)"}},
 	{ "Backstab", { "!talent(18)", "player.behind", "player.combopoints < 5", "!player.buff(51713)" }},

 	{{
 		{ "Fan of Knives", "modifier.multitarget" },
 		{ "Hemorrhage", "!player.behind" },
 	}, "player.combopoints < 5" },
 
 	{ "73981", "@Mystic.Redirect()"}, -- REDIRECT
},
	--Out of Combat Stuff
{ 
 	{"STARTING","@CML.PQIConfing()"},
 	{"STARTING","@CML.Status()"},
 	{"!/targetenemy [noharm]", { "!target.alive" }},
 	-- Lethal
	{"2823",{"LethalPoison.pqivalue = 1","!player.buff(2823)",},"player"},
	{"8679",{"LethalPoison.pqivalue = 2","!player.buff(8679)",},"player"},	
	-- Non-Lethal
	{"3408",{"NonLethalPoison.pqivalue = 1","!player.buff(3408)",},"player"},	
	{"5761",{"NonLethalPoison.pqivalue = 2","!player.buff(5761)",},"player"},	
	{"108211",{"NonLethalPoison.pqivalue = 3","!player.buff(108211)",},"player"},	
	{"108215",{"NonLethalPoison.pqivalue = 4","!player.buff(108215)",},"player"},
	-- Premeditation
 	{ "14183" , { -- On ActiveCooldowns
        "@CML.ActiveCooldowns()",
        "Premeditation.coolvalue = 1",
 	}},
 	{ "14183" , { -- On CD
        "Premeditation.coolvalue = 2",
 	}}, 
 	{ "Garrote", {
	"!talent(10)",
 	"!target.debuff(Rupture)"
 	}, "target" },
	{ "Rupture", {
    "target.debuff(Rupture)"
    }, "target" },
   {"Ambush","!talent(10)"},
	 	{ "Backstab", {
 	}, "target" },
	{"Stealth","@CML.Restealth()"},	
})