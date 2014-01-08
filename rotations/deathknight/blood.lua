ProbablyEngine.rotation.register_custom(250, "CodeMyLife Blood", {
--------------------------------------------------Defensive-------------------------------------------- 
    {"TaMere","@CML.PQIConfing()"},{"TaMere","@CML.Status()"},{"pause","@CML.CombatCheck()"}, -- Combat Check/Pause
    {"49576","queuecast(49576)","target"}, -- Death Grip
    {"43265","queuecast(43265)","ground"}, -- Death and Decay 
    -- Blood Presence
    {"48263",{
        "player.seal != 1",
    }},
    -- Bone Shield
    { "49222",{
        "!player.buff",
    }},
    -- Anti Magi Shell
    { "48707",{
        "AntiMagicShell.novaHealing(0)",
    }},
    -- Dancing Rune Weapon
    { "49028",{
        "DancingRuneWeapon.novaHealing(0)",
    }},
    -- Conversion
    { "119975",{
        "Conversion.novaHealing(0)",
    }},
    -- Vampiric Blood
    { "55233",{
        "VampiricBlood.novaHealing(0)",
    }},
    -- Icebound Fortitude
    { "48792",{
        "IceboundFortitude.novaHealing(0)",
    }},
    -- Rune Tap
    { "48982",{
        "IceboundFortitude.novaHealing(0)",
    }},
    -- Empower Rune Weapon
    { "47568",{
        "EmpowerRuneWeapon.novaHealing(0)",
    }},

    -- Death Pact Macro
    {"!/cast Raise Dead\n/cast Death Pact",{
        "player.health < 35",
        "player.spell(Death Pact).cooldown",
        "player.spell(Raise Dead).cooldown",
        "player.spell.usable(Death Pact)",
    }},            
    -- Healthstone   
    {"#5512",{
        "@CML.HealthStone()",
        "Healthstone.novaHealing(0)",
    }},   

-------------------------------------Interrupts--------------------------------------
    {{
            { "47528","target.range <= 5" }, -- MindFreeze
            { "47476","player.spell(47528).cooldown"}, -- Strangulate 
            { "47476","target.range > 5"}, -- Strangulate 
        }, "modifier.interrupts"
    }, 

    -- Death and Decay
    {"43265",{
        "DeathAndDecayKey.pqikeybind",
        "player.runes(unholy) > 1",
    },"ground"},
    {"43265",{{
        "DeathAndDecay.pqivalue = 2",
        "player.runes(unholy) > 1",
        },{
        "!player.spell(43265).cooldown > 2",
        "@CML.DeathAndDecay()"
    }},"ground"}, 
    
    -- Blood Tap
    {"45529",{
        "player.buff(114851).count >= 5", -- Blood Charge
        "@CML.CanTap()",
    }},
    -- Outbreak
    {"77575",{
        "!target.debuff(55095)", -- Frost Fever
    }},
    -- Blood Boil
    {"48721",{ 
        "target.debuff(55095)",
        "target.debuff(55095).duration < 4", -- Frost Fever
    }},

    -- Frost Fever
    {"45477",{
        "target.debuff(55095).duration < 4", -- Frost Fever
    }},
    -- Plague Strike
    {"45462",{ 
        "target.debuff(55078).duration < 4", -- Blood Plague
    }},

    -- Rotation
    -- Heart Strike
    {"55050",{
        "player.runes(blood).count >= 1", 
    }},
    -- Death Strike
    {"49998"},
    -- Blood Boil
    {"48721",{
      "player.buff(81141)", -- Crimson Scourge
      "target.range <= 5",
    }},
    {"48721",{
      "player.aoe = 2",
      "target.range <= 5",
    }},
    -- Soul Reaper
    {"114866",{ 
        "target.health < 35", 
    }},
    -- Rune Strike
    {"56815",{
        "target.range <= 5",
    }},
    -- Horn of Winter
    {"57330"},

}, 
--------------------------------------------------Out of Combat-------------------------------------------- 
{ 
    -- PQI Globals 
    {"TaMere","@CML.PQIConfing()"},
    -- Player Status
    {"TaMere","@CML.Status()"}, 
    -- Blood Presence
    {"48263",{
        "player.seal != 1",
    }},
})


