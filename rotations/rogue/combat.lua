-- Rotation Wrtitten and maintained by Skorp05. Thanks a lot for the great work!
ProbablyEngine.rotation.register_custom(260, "Mystic Rogue(Combat)", {
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
	 {"57934",{
     "TricksoftheTrade.pqicheck",
     "@CML.TOTT()"
    }},  
 	{"!/targetenemy [noharm]", { "!target.alive", "!target.enemy", "!target.exists", }},

	--- Interrupt Stuff
    {"InettruptMyAss",{ "@CML.Interrupts()" }},

 	-- Gloves
    {"#gloves",{ -- On CD
    "ProfessionsCDs.coolvalue = 2",
    "target.exists",
    }},  
    {"#gloves",{ -- On ActiveCooldowns
    "macros(ActiveCooldowns)",
    "ProfessionsCDs.coolvalue = 1",
    "target.exists",
    }}, 
	-- Preparation
 	{ "14185", { -- On ActiveCooldowns
    "@CML.ActiveCooldowns()",
    "Preparation.coolvalue = 1",
 	"!player.buff(1856)",
 	"player.spell(1856).cooldown >= 60"
 	}},
  	{ "14185", { -- On CD
    "Preparation.coolvalue = 2",
 	"!player.buff(1856)",
 	"player.spell(1856).cooldown >= 60"
 	}},	
 	-- Vanish
 	{ "1856", { -- On ActiveCooldowns
    "@CML.ActiveCooldowns()",
    "Vanish.coolvalue = 1",
 	"!player.buff(13750)",
 	"player.energy >= 60",
 	"player.combopoints < 4"
 	}},
 	{ "1856", { -- On CD
    "Vanish.coolvalue = 2",
 	"!player.buff(13750)",
 	"player.energy >= 60",
 	"player.combopoints < 4"
 	}},
 	-- Killing Spree
 	{ "51690", { -- On ActiveCooldowns
    "@CML.ActiveCooldowns()",
    "KillingSpree.coolvalue = 1",
 	"player.energy <= 45",
 	"!player.buff(13750)",
 	"!player.buff(96228)",
 	"!player.buff(121471)",
 	}}, 
 	{ "51690", { -- On CD
    "KillingSpree.coolvalue = 2",
 	"player.energy <= 45",
 	"!player.buff(13750)",
 	"!player.buff(96228)",
 	"!player.buff(121471)",
 	}},		
 	-- Shadow Blades
 	{ "121471", { -- On ActiveCooldowns
    "@CML.ActiveCooldowns()",
    "ShadowBlades.coolvalue = 1",
 	"player.energy <= 35"
 	}},
 	{ "121471", { -- On CD
    "ShadowBlades.coolvalue = 2",
 	"player.energy <= 35"
 	}}, 
 	-- Adrenaline Rush
 	{ "13750", { -- On ActiveCooldowns
    "@CML.ActiveCooldowns()",
    "AdrenalineRush.coolvalue = 1",
 	"player.buff(121471)"
 	}},
 	{ "13750", { -- On CD
    "AdrenalineRush.coolvalue = 2",
 	"player.buff(121471)"
 	}}, 		
 	--- AOE Stuff 	
  {"WATCHTHIS","@CML.BladeFlurry()"}, -- BladeFlurry
 	{"121411", { -- CRIMSON TEMPEST
 	"player.aoe = 2",
 	"player.combopoints = 5",
	"target.debuff(121411).duration <= 2",
 	}},
 	{"51723", { -- FAN OF KNIFE
	"player.aoe = 2",
	"player.combopoints < 5" 
 	}}, 

	-- Single Rotation Stuff
 	{ "8676", "player.combopoints < 5" }, -- AMBUSH
 	{ "84617", "!target.debuff(84617)" }, -- REVEALING STRIKE
 	{ "84617", "target.debuff(84617).duration <= 2" }, -- REVEALING STRIKE
 	{ "1752", { "!player.spell(114015).exists", "player.combopoints < 5" }}, -- SINISTER STRIKE
 	{ "1752", { "player.spell(114015).exists", "player.buff(115189).count <= 4" }}, -- SINISTER STRIKE
 	{ "1752", { "player.spell(114015).exists", "player.combopoints < 5" }}, -- SINISTER STRIKE
 	{"137619", { -- MARKED FOR DEATH
	"player.spell(137619).exists",
	"player.combopoints = 0",
 	}}, 
 	{ "5171", { -- SLICE AND DICE
	"player.buff(5171).duration <= 4",
	"player.combopoints = 5" 
 	}},
 	{ "5171", { -- SLICE AND DICE
	"player.buff(5171).duration <= 2",
	"player.combopoints >= 2" 
	}},
	{ "1943", { -- RUPTURE
 	"target.debuff(1943).duration <= 4",
 	"player.combopoints = 5",
 	"player.aoe = 1",
 	}},   
 	{ "1943", { -- RUPTURE
 	"target.debuff(1943).duration <= 2",
 	"player.combopoints >= 3",
 	"player.aoe = 1"
 	}},
 	{ "2098", { -- EVISCERATE
 	"!player.spell(114015).exists",
 	"player.combopoints = 5"
 	}}, 
  	{ "2098", { -- EVISCERATE
    "player.spell(114015).exists",
    "player.buff(115189).count >= 4",
    "player.combopoints = 5"
    }},
 	{ "73981", "@Mystic.Redirect()"}, -- REDIRECT
}, 
--------------------------------------------------Out of Combat-------------------------------------------- 
{
 	{"STARTING","@CML.PQIConfing()"},
 	{"STARTING","@CML.Status()"},
 	{"!/targetenemy [noharm]", { "!target.alive" }}, 
 	{"8676", { "target.exists" }, "target"},  -- AMBUSH
 	{"pause","@CML.CombatCheck()"},
 	-- Lethal
	{"2823",{"LethalPoison.pqivalue = 1","!player.buff(2823)",},"player"},
	{"8679",{"LethalPoison.pqivalue = 2","!player.buff(8679)",},"player"},	
	-- Non-Lethal
	{"3408",{"NonLethalPoison.pqivalue = 1","!player.buff(3408)",},"player"},	
	{"5761",{"NonLethalPoison.pqivalue = 2","!player.buff(5761)",},"player"},	
	{"108211",{"NonLethalPoison.pqivalue = 3","!player.buff(108211)",},"player"},	
	{"108215",{"NonLethalPoison.pqivalue = 4","!player.buff(108215)",},"player"},
	 	{ "1752", { -- SinisterStrike
 	}, "target" },
	 	{"Stealth","@CML.Restealth()"},
		  {"WATCHTHIS","@CML.BladeFlurry()"}, -- BladeFlurry
})