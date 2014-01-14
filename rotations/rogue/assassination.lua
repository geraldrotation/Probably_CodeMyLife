-- Rotation Wrtitten and maintained by Skorp05. Thanks a lot for the great work!
ProbablyEngine.rotation.register_custom(259, "Mystic Rogue(Assassination)", {
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
 	{ "#gloves", { -- On ActiveCooldowns
        "@CML.ActiveCooldowns()",
        "ProfessionsCD.coolvalue = 1",
 		"!player.buff(13750)",
 		"player.buff(121471)"
	}},
	 	-- Gloves
 	{ "#gloves", { -- On CD
        "ProfessionsCD.coolvalue = 2", 
        "!player.buff(13750)",
 		"player.buff(121471)"
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
 	-- Shadow Blades
 	{ "121471", { -- On ActiveCooldowns
        "@CML.ActiveCooldowns()",
        "ShadowBlades.coolvalue = 1",
		"target.range <= 5",
		"target.debuff(Rupture).duration > 2"
 	}},
 	{ "121471", { -- On CD
        "ShadowBlades.coolvalue = 2",
		"target.range <= 5",
		"target.debuff(Rupture).duration > 2"
 	}}, 
 	-- Vendetta
 	{ "1856", { -- On ActiveCooldowns
        "@CML.ActiveCooldowns()",
        "Vendetta.coolvalue = 1",
		"target.range <= 5",
		"target.debuff(Rupture).duration > 2"
 	}},
 	{ "1856", { -- On CD
        "Vendetta.coolvalue = 2",
		"target.range <= 5",
		"target.debuff(Rupture).duration > 2"
 	}},		
 	-- Vanish
 	{ "1856", { -- On ActiveCooldowns
        "@CML.ActiveCooldowns()",
        "Vanish.coolvalue = 1",
		"player.energy < 60",
		"!player.buff(Shadow Blades)",
		"player.buff(Envenom).duration < 1",
		"target.debuff(Rupture).duration > 2",
 	}},
 	{ "1856", { -- On CD
        "Vanish.coolvalue = 2",
		"player.energy < 60",
		"!player.buff(Shadow Blades)",
		"player.buff(Envenom).duration < 1",
		"target.debuff(Rupture).duration > 2",
 	}},		
 	{"137619", { -- MARKED FOR DEATH
		"player.spell(137619).exists",
		"player.combopoints = 0",
		"target.range <= 5"
 	}}, 
 	--- AOE Stuff
 	{"121411", { -- CRIMSON TEMPEST
 		"player.aoe = 2",
 		"player.combopoints = 5",
 		"target.debuff(121411).duration <= 2",
 	}},
	{ "51723", { -- FAN OF KNIFE
		"modifier.multitarget" , 
		"player.combopoints < 5" 
	}},
 
	-- Rotation Stuff
	{ "Slice and Dice", { "!Player.buff(Slice and Dice)", "player.combopoints >= 2" }},
	{ "Rupture", { 
		"!target.debuff(Rupture)",
		"player.combopoints >= 3"
	}},

	{ "Rupture", {
		"target.debuff(Rupture).duration <= 4",
		"player.combopoints = 5",
	}},

	{ "Rupture", { 
		"target.debuff(Rupture).duration <= 2",
		"player.combopoints > 0"
	}},

	{ "Envenom", (function() return canENV("Player","Target") end)},

	  
	{ "Dispatch", {
		"!target.debuff(Sap)",
		"!target.debuff(Blind)",
		"player.buff(Blindside)"
	}},

	{ "Mutilate", {
		"!target.debuff(Sap)",
		"!target.debuff(Blind)",
		"target.health > 35",
		"player.spell(114015).exists",
		"player.buff(115189).count < 3"
	}},

	{ "Mutilate", {
		"!target.debuff(Sap)",
		"!target.debuff(Blind)",
		"target.health > 35",
		"player.combopoints < 5"
	}},
	 { "Dispatch", {
		"!target.debuff(Sap)",
		"!target.debuff(Blind)",
		"target.health < 35", 
		"player.spell(114015).exists", 
		"player.buff(115189).count < 3" 
	}},

	{ "Dispatch", {
		"!target.debuff(Sap)",
		"!target.debuff(Blind)",
		"target.health < 35",
		"player.combopoints < 5"
	}},
	{ "73981", "@Mystic.Redirect()"}, -- REDIRECT

}, 
--------------------------------------------------Out of Combat-------------------------------------------- 
{ 
	{"STARTING","@CML.PQIConfing()"}, -- LOADINGCONFIG
	{"STARTING","@CML.Status()"}, -- Player Status 	
	-- Lethal
	{"2823",{"LethalPoison.pqivalue = 1","!player.buff(2823)",},"player"},
	{"8679",{"LethalPoison.pqivalue = 2","!player.buff(8679)",},"player"},	
	-- Non-Lethal
	{"3408",{"NonLethalPoison.pqivalue = 1","!player.buff(3408)",},"player"},	
	{"5761",{"NonLethalPoison.pqivalue = 2","!player.buff(5761)",},"player"},	
	{"108211",{"NonLethalPoison.pqivalue = 3","!player.buff(108211)",},"player"},	
	{"108215",{"NonLethalPoison.pqivalue = 4","!player.buff(108215)",},"player"},
 	{ "1784", { "player.buff(105697)", "target.exists" }}, --- AUTO STEALTH on PREPOT

	{ "Mutilate", {
	 	"target.health > 35",
	 	"!target.debuff(Sap)",
	 	"!target.debuff(Blind)",
	 	"player.combopoints < 5"
	}, "target" },
 
--- { "Stealth", "!player.buff(Stealth)" },

})