-- Thanks to Boomkin for some codes ideas. Also thanks to FriedChicken for Maintaining this profile.
ProbablyEngine.rotation.register_custom(102, "FriedChicken Moonkin", {
	{"TaMere","@CML.PQIConfing()"},
	{"TaMere","@CML.Status()"},
	{"pause","@CML.CombatCheck()"}, -- Combat Check/Pause
    {"Cooldowns","@CML.Cooldowns()"},

	-- Mark of the Wild
	{"1126","!player.hasaura(1)"},
	 -- Rebirth
    { "20484", {
       "@CML.Rebirth()"
    }},
	-- Pause Rotation - Bear Form
	{"pause","player.seal = 1"},
	-- Pause Rotation - Cat Form
	{"pause","player.seal = 3"},
	-- Pause Rotation - Travel Form
	{"pause","player.seal = 4"},
	-- Moonkin Form
	{"24858",{"player.seal != 5","player.seal != 6"}},
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
	-- Nature Swiftness
	{"132158","HealingTouch.novaHealing(0)"},
	-- Healing Touch
	{"5185",{
		"player.buff(132158)",
		"HealingTouch.novaHealing(0)",
	}},
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
		-- jade_serpent_potion,if=buff.bloodlust.react|target.time_to_die<=40|buff.celestial_alignment.up
--[[{"#76093",{
        "DPSPotiononHeroism.pqicheck",
        "@CML.DPSPotion(76093)",
    }}, ]]
    -- incarnation,if=talent.incarnation.enabled&(buff.lunar_eclipse.up|buff.solar_eclipse.up) 
	{"102560",{ -- On CD
		"talent(11)",
        "Incarnation.coolvalue = 2",
        "player.buff(112071)", 
	}},  
	{"102560",{ -- On ActiveCooldowns 
		"talent(11)",
        "Incarnation.coolvalue = 1",
        "macros(ActiveCooldowns)",
        "player.buff(112071)",
	}},
	-- celestial_alignment,if=(!buff.lunar_eclipse.up&!buff.solar_eclipse.up)&(buff.chosen_of_elune.up|!talent.incarnation.enabled|cooldown.incarnation.remains>10)
	{"112071",{ -- On CD
        "CelestialAlignment.coolvalue = 2",
		"@CML.NotEclipse()",
	}},  
	{"112071",{ -- On ActiveCooldowns 
        "CelestialAlignment.coolvalue = 1",
        "macros(ActiveCooldowns)",
		"@CML.NotEclipse()",
	}},
    -- Mirror Images
	{"110621","player.spell(110621).exists"}, 
	-- Force of Nature
	{"106737",{
		"player.spell(106737).exists",
		"player.buff(16886)",
		"player.spell(106737).charges >= 1",
	}},
	-- starfall,if=!buff.starfall.up
	{"48505",{
		"!player.buff(48505)"
	}},
	-- wild_mushroom_detonate,moving=0,if=buff.wild_mushroom.stack>0&buff.solar_eclipse.up
	{"88747",{
		"PlaceSchrooms.pqikeybind", 
	},"ground"},
	{"88751",{
		"DetonateSchrooms.pqikeybind",
	}},
	-- natures_vigil,if=talent.natures_vigil.enabled

	-- starsurge,if=buff.shooting_stars.react&
	{"78674",{
		"player.buff(93400)",
	}},
	-- moonfire,cycle_targets=1,if=buff.lunar_eclipse.up&(remains<(buff.natures_grace.remains-2+2*set_bonus.tier14_4pc_caster))
	{"8921",{ 
  		"!target.debuff(8921)",
  		"player.buff(48518)",
  		"target.isinfront",
  		"@CML.StopDotsCheck('target')",
 	},"target"},
 	{"8921",{
  		"player.aoe = 2 ", 
  		"player.buff(48518)",
  		"8921.multidot(1)",
 	}},
	-- sunfire,cycle_targets=1,if=buff.solar_eclipse.up&(remains<(buff.natures_grace.remains-2+2*set_bonus.tier14_4pc_caster))
	{"93402",{ 
		"!target.debuff(93402)",
		"player.buff(48517)",
		"target.isinfront",
		"@CML.StopDotsCheck('target')",
	},"target"},
 	{"93402",{
  		"player.aoe = 2 ", 
  		"player.buff(48517)",
  		"93402.multidot(1)",
 	}},
	-- hurricane,if=active_enemies>4&buff.solar_eclipse.up&buff.natures_grace.up 
	{"16914",{
  		 "player.aoe = 2 ", 
		 "player.buff(48517)",
		 "player.buff(16886)",
		 "16914.automouse(Hurricane)",
	},"ground"},
	-- moonfire,cycle_targets=1,if=active_enemies<5&(remains<(buff.natures_grace.remains-2+2*set_bonus.tier14_4pc_caster))
	{"8921",{ 
		"!target.debuff(8921)",
		"target.isinfront",
		"@CML.StopDotsCheck('target')",
	},"target"},
 	{"8921",{
  		"player.aoe = 2 ", 
  		"8921.multidot(1)",
 	}},
	-- sunfire,cycle_targets=1,if=active_enemies<5&(remains<(buff.natures_grace.remains-2+2*set_bonus.tier14_4pc_caster))
	{"93402",{ 
		"!target.debuff(93402)",
		"target.isinfront",
		"@CML.StopDotsCheck('target')",
	},"target"},
 	{"93402",{
  		"player.aoe = 2 ", 
  		"93402.multidot(1)",
 	}},
	-- moonfire,cycle_targets=1,if=buff.lunar_eclipse.up&ticks_remain<2
	{"8921",{ 
		"target.debuff(8921).duration < 2",
		"player.buff(48518)",
		"target.isinfront",
		"@CML.StopDotsCheck('target')",
	},"target"},
 	{"8921",{
  		"player.aoe = 2 ",
		"player.buff(48518)", 
  		"8921.multidot(2)",
 	}},
	-- sunfire,cycle_targets=1,if=buff.solar_eclipse.up&ticks_remain<2
	{"93402",{ 
		"target.debuff(93402).duration < 2",
		"player.buff(48517)",
		"target.isinfront",
		"@CML.StopDotsCheck('target')",
	},"target"},
 	{"93402",{
  		"player.aoe = 2 ",
		"player.buff(48517)", 
  		"93402.multidot(2)",
 	}},
	-- natures_swiftness,if=talent.dream_of_cenarius.enabled
	{"132158",{
		"player.spell(108373).exists",
		"!player.buff(145151)",
		"player.mana > 25",
	}},
	 -- healing_touch,if=talent.dream_of_cenarius.enabled&!buff.dream_of_cenarius.up&mana.pct>25
	{"5185",{
		"player.spell(108373).exists",
		"player.spell(5185).exists",
		"!player.buff(145151)",
		"player.mana > 25",
	},"player"},
	-- starsurge,if=cooldown_react
	{"78674","!player.moving"},	
	-- starfire,if=buff.celestial_alignment.up&cast_time<buff.celestial_alignment.remains
	{"2912",{
		"!player.moving",
		"player.buff(112071)",
		"player.spell(2912).quickcast",
		"@CML.StopCasting()",
	}},
	-- wrath,if=buff.celestial_alignment.up&cast_time<buff.celestial_alignment.remains
	{"5176",{
		"!player.moving",
		"player.buff(112071)",
		"player.spell(5176).quickcast",
		"@CML.StopCasting()",
	}},	
	-- starfire,if=eclipse_dir=1|(eclipse_dir=0&eclipse>0)
	{"2912",{
		"!player.moving",
		"player.balance.sun",
		"@CML.StopCasting()",
	}},
	-- wrath,if=eclipse_dir=-1|(eclipse_dir=0&eclipse<=0)
	{"5176",{
		"!player.moving",
		"player.balance.moon",
		"@CML.StopCasting()",
	}},
	-- moonfire,moving=1,cycle_targets=1,if=ticks_remain<2
	{"8921",{ 
		"target.debuff(8921).duration < 2",
		"player.moving",
		"target.isinfront",
		"@CML.StopDotsCheck('target')",
	},"target"},
 	{"8921",{
  		"player.aoe = 2 ", 
		"player.moving",
  		"8921.multidot(2)",
 	}},
	-- sunfire,moving=1,cycle_targets=1,if=ticks_remain<2
	{"93402",{ 
		"target.debuff(93402).duration < 2",
		"player.moving",
		"target.isinfront",
		"@CML.StopDotsCheck('target')",
	},"target"},
 	{"93402",{
  		"player.aoe = 2 ", 
		"player.moving",
  		"93402.multidot(2)",
 	}},
	-- wild_mushroom,moving=1,if=buff.wild_mushroom.stack<buff.wild_mushroom.max_stack

	-- moonfire,moving=1,if=buff.lunar_eclipse.up
	{"8921",{ 
		"player.buff(48518)",
		"player.moving",
		"target.isinfront",
		"@CML.StopDotsCheck('target')",
	},"target"},
 	{"8921",{
  		"player.aoe = 2 ",
		"player.buff(48518)", 
		"player.moving",
  		"8921.multidot(1)",
 	}},
	-- sunfire,moving=1
	{"93402",{ 
		"player.moving",
		"target.isinfront",
		"@CML.StopDotsCheck('target')",
	},"target"},
 	{"93402",{
  		"player.aoe = 2 ", 
		"player.moving",
  		"93402.multidot(1)",
 	}},
},
{
	{"TaMere","@CML.PQIConfing()"},{"TaMere","@CML.Status()"},{"pause","@CML.CombatCheck()"}, -- Combat Check/Pause
	-- Mark of the Wild
	{"1126",{ 
        "!player.hasaura(1)", -- Does not have Buff
    },"player"},
	-- Rejuvenation 
	{"774",{"@CML.IsGlyphed(937,false)","!player.seal = 1","!player.seal = 2","!player.seal = 3","!player.seal = 4","!player.seal = 6","!player.buff(774)","Rejuvenation.novaHealing(0)"}},
	{"774",{"@CML.IsGlyphed(937,true)","!player.seal = 1","!player.seal = 2","!player.seal = 3","!player.seal = 4","!player.seal = 7","!player.buff(774)","Rejuvenation.novaHealing(0)"}},	
})