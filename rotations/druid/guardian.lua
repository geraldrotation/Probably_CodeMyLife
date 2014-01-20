-- Thanks to NinjaDerp for tips to get started.
ProbablyEngine.rotation.register_custom(104, "CodeMyLife Guardian", {
	{"TaMere","@CML.PQIConfing()"},
    {"TaMere","@CML.Status()"},
    {"pause","@CML.CombatCheck()"}, -- Combat Check/Pause

    -- Renewal
    {"108238",{"player.spell(108238).exists","Renewal.novaHealing(0)"}},
    -- Barkskin
    {"22812","Barkskin.novaHealing(0)"},
    -- Tranquility 
    {"108288",{"player.spell(108288).exists","Tranquility.pqikeybind"}},
    {"740",{"Tranquility.pqikeybind","player.cancelaura"}},
    {"740","Tranquility.pqikeybind"},
	-- Pause Rotation - Other forms/Pause
    {"pause","player.seal = 2"},
	{"pause","player.seal = 3"},
    {"pause","player.seal = 4"},
	-- Bear Form
	{"5487","player.seal != 1"},
    -- Mark of the Wild
    {"1126",{"player.seal != 1","!player.hasaura(1)","!player.seal = 1"}},
	-- Savage Defense
	{"62606",{"!player.buff(132402)","SavageDefense.novaHealing(0)"}},	
	-- Frenzied Regen
	{"22842","FrenziedRegen.novaHealing(0)"},	
	-- Cenarion Ward
	{"102351",{"player.spell(102351).exists","CenarionWard.novaHealing(0)"}},
	{"102351",{"player.spell(102351).exists","CenarionWard.novaHealing(1)"}},	

    {"740","queuecast(740)"}, -- Tranquility
    {"16689","queuecast(16689)"}, -- Nature's Grasp
    {"77761","queuecast(77761)"}, -- Stampeding Roar
    {"102793","queuecast(102793)","ground"}, -- Ursol's Vortex
    {"132469","queuecast(132469)"}, -- Typhoon

    -- Swipe AoE
    {"779",{"player.aoe = 2","target.range <= 5"}},
    -- Fairie Fire if not provided
	{"770",{"target.debuff(113746).count < 3"}},	
    -- Maul
    {"6807",{"target.range <= 5","player.buff(135286)","!modifier.last"}},
    {"6807",{"target.range <= 5","player.rage > 85","!modifier.last"}},
    -- Mangle on CD
    {"33878","target.range <= 5"},
    -- Trash 
    {"77758",{"target.range <= 5","!target.debuff(77758)"}},
    -- Lacerate on CD
    {"33745",{"target.range <= 5"}},
    -- Trash Filler on CD
    {"77758",{"target.range <= 5"}},
    -- Swipe Filler on CD
    {"779",{"target.range <= 5"}},
},
{
	{"TaMere","@CML.PQIConfing()"},
    {"TaMere","@CML.Status()"},
    {"pause","@CML.CombatCheck()"}, -- Combat Check/Pause
	-- Mark of the Wild
	{"1126",{"player.seal != 1","!player.hasaura(1)"},"player"},
    
    -- Rez
    { "20484", {"!player.casting","@CML.Rez()"}},
})