local Config = {}

-- DO NOT CHANGE THE MESSAGETAGS CONFIGURATION
Config.MessageTags = {
    PlayerName = "|playerName|",
    CreatureName = "|creatureName|",
    DamageTaken = "|damageTaken|",
    BossName = "|bossName|" -- ONLY FOR BOSS LOOT MESSAGES
}

Config.Discord = {
    WebhookUrl = "YOUR_WEBHOOK_URL_HERE",
    FistEmoji = ":punch: ",
    AxeEmoji = ":axe: ",
    ClubEmoji = ":hammer: ",
    SwordEmoji = ":crossed_swords: ",
    DistanceEmoji = ":bow_and_arrow: ",
    ShieldEmoji = ":shield: ",
    FishingEmoji = ":fishing_pole_and_fish: ",
    MagicEmoji = ":magic_wand: ",
    LootItemEmoji = ":dollar: ",
    TitleMessageSkill = "|playerName| upou nivel de skill!",
    DescMessageSkill = "",
    KnightEmoji = "<a:Sanguine_Razor:1171812568931766302> ",
    PaladinEmoji = "<a:Sanguine_Crossbow:1171812549772193833> ",
    SorcererEmoji = "<a:Sanguine_Coil:1171812537449324595> ",
    DruidEmoji = "<a:Sanguine_Rod:1171812578629001247> ",
    TitleMessageLevel = ":tada: |playerName| upou de nivel!",
    DescMessageLevel = "",
    TitleMessageDeath = ":coffin: |playerName| morreu!",
    DescMessageDeath = "|playerName| recebeu |damageTaken| de dano de |creatureName| e morreu!",
    TitleMessageLoot = ":moneybag: |playerName| matou |bossName|!",
    DescMessageLoot = "|playerName| dropou os seguintes itens de |bossName|:",
    DiscordEmbedColor = {
        LevelUp = 5832630,
        Death = 14696271,
        BossLoot = 16759040,
        SkillUp = 5928418,
    }
}

Config.HUD = {
    NotificationMenuText = "Notificacoes",
    NotificationMenuTextSize = 7,
    NotificationMenuIcon = 31364,
    NotificationMenuhudX = 106,
    NotificationMenuhudY = 30,
    NotificationIconScale = 0.9,
    LevelUpItemText = "Level Up",
    LevelUpItemTextSize = 7,
    LevelUpIcon = 43946,
    LevelUpIconScale = 0.8,
    SkillUpItemText = "Skill Up",
    SkillUpItemTextSize = 7,
    SkillUpIcon = 43950,
    SkillUpIconScale = 0.8,
    DeathItemText = "Death",
    DeathItemTextSize = 7,
    DeathIcon = 43947,
    DeathIconScale = 0.8,
    LootItemText = "Boss Loot",
    LootItemTextSize = 7,
    LootItemIcon = 43948,
    LootItemScale = 0.8,
    LootTypes = {" (Todos)", " (Raros)", " (Muito Raros)"},
    LootTypeSelected = 1,
    ItemColorActive = {51, 255, 51},
    ItemColorInactive = {255, 77, 77},
    MenuColorOpened = {179, 255, 179},
    MenuColorClosed = {255, 255, 255}
}

Config.Messages = {
    LevelUpPattern = "You advanced from Level (%d+) to Level (%d+).",
    SkillUpPattern = "You advanced to ((%a+)(%s*)(%a*)) level (%d+).",
    DeathPattern = "You are dead.",
    LastHitByPattern = "You lose (%d+) (%a+) due to an attack by ((%a+)(%s)((%a+)(%s*)(%a*))).",
    BossDropPattern = "The following items dropped by ((%a+)(%s*)(%a*)) are available in your reward chest: (.+)",
    LevelUpEnabled = true,
    SkillUpEnabled = true,
    DeathEnabled = true,
    LootEnabled = true,
}

-- List of Very Rare Items
Config.ItemsVeryRare = {
    ["alchemist's boots"]= "Alchemist's Boots",
    ["alchemist's notepad"]= "Alchemist's Notepad",
    ["alicorn headguard"]= "Alicorn Headguard",
    ["alicorn quiver"]= "Alicorn Quiver",
    ["alicorn ring"]= "Alicorn Ring",
    ["alptramun's toothbrush"]= "Alptramun's Toothbrush",
    ["antler-horn helmet"]= "Antler-Horn Helmet",
    ["arboreal crown"]= "Arboreal Crown",
    ["arboreal ring"]= "Arboreal Ring",
    ["arboreal tome"]= "Arboreal Tome",
    ["arcane dragon robe"]= "Arcane Dragon Robe",
    ["arcanomancer folio"]= "Arcanomancer Folio",
    ["arcanomancer regalia"]= "Arcanomancer Regalia",
    ["arcanomancer sigil"]= "Arcanomancer Sigil",
    ["bag you covet"]= "Bag You Covet",
    ["bag you desire"]= "Bag You Desire",
    ["bast legs"]= "Bast Legs",
    ["biscuit barrier"]= "Biscuit Barrier",
    ["blue and golden cordon"]= "Blue and Golden Cordon",
    ["blue gem"]= "Blue Gem",
    ["boots of haste"]= "Boots of Haste",
    ["bow of cataclysm"]= "Bow of Cataclysm",
    ["broken iks cuirass"]= "Broken Iks Cuirass",
    ["broken iks faulds"]= "Broken Iks Faulds",
    ["broken iks headpiece"]= "Broken Iks Headpiece",
    ["broken iks sandals"]= "Broken Iks Sandals",
    ["broken iks spear"]= "Broken Iks Spear",
    ["broken macuahuitl"]= "Broken Macuahuitl",
    ["butcher's axe"]= "Butcher's Axe",
    ["candle stump"]= "Candle Stump",
    ["candy necklace"]= "Candy Necklace",
    ["candy-coated quiver"]= "Candy-Coated Quiver",
    ["cobra axe"]= "Cobra Axe",
    ["cobra boots"]= "Cobra Boots",
    ["cobra club"]= "Cobra Club",
    ["cobra crossbow"]= "Cobra Crossbow",
    ["cobra hood"]= "Cobra Hood",
    ["cobra rod"]= "Cobra Rod",
    ["cobra sword"]= "Cobra Sword",
    ["cobra wand"]= "Cobra Wand",
    ["cocoa grimoire"]= "Cocoa Grimoire",
    ["crackling egg"]= "Crackling Egg",
    ["creamy grimoire"]= "Creamy Grimoire",
    ["crude wood planks"]= "Crude Wood Planks",
    ["crystalline armor"]= "Crystalline Armor",
    ["curl of hair"]= "Curl of Hair",
    ["dauntless dragon scale armor"]= "Dauntless Dragon Scale Armor",
    ["dawnfire pantaloons"]= "Dawnfire Pantaloons",
    ["dawnfire sherwani"]= "Dawnfire Sherwani",
    ["demonbone"]= "Demonbone",
    ["demonic tapestry"]= "Demonic Tapestry",
    ["demonwing axe"]= "Demonwing Axe",
    ["devourer core"]= "Devourer Core",
    ["dragon lance"]= "Dragon Lance",
    ["dragon scale helmet"]= "Dragon Scale Helmet",
    ["dream shroud"]= "Dream Shroud",
    ["dream warden claw"]= "Dream Warden Claw",
    ["earthborn titan armor"]= "Earthborn Titan Armor",
    ["eldritch bow"]= "Eldritch Bow",
    ["eldritch breeches"]= "Eldritch Breeches",
    ["eldritch claymore"]= "Eldritch Claymore",
    ["eldritch cowl"]= "Eldritch Cowl",
    ["eldritch crystal"]= "Eldritch Crystal",
    ["eldritch cuirass"]= "Eldritch Cuirass",
    ["eldritch folio"]= "Eldritch Folio",
    ["eldritch greataxe"]= "Eldritch Greataxe",
    ["eldritch hood"]= "Eldritch Hood",
    ["eldritch quiver"]= "Eldritch Quiver",
    ["eldritch rod"]= "Eldritch Rod",
    ["eldritch shield"]= "Eldritch Shield",
    ["eldritch tome"]= "Eldritch Tome",
    ["eldritch wand"]= "Eldritch Wand",
    ["eldritch warmace"]= "Eldritch Warmace",
    ["elemental spikes"]= "Elemental Spikes",
    ["enchanted theurgic amulet"]= "Enchanted Theurgic Amulet",
    ["enchanted turtle amulet"]= "Enchanted Turtle Amulet",
    ["epaulette"]= "Epaulette",
    ["executioner"]= "Executioner",
    ["exotic amulet"]= "Exotic Amulet",
    ["exotic legs"]= "Exotic Legs",
    ["eye-embroidered veil"]= "Eye-Embroidered Veil",
    ["fabulous legs"]= "Fabulous Legs",
    ["falcon battleaxe"]= "Falcon Battleaxe",
    ["falcon bow"]= "Falcon Bow",
    ["falcon coif"]= "Falcon Coif",
    ["falcon greaves"]= "Falcon Greaves",
    ["falcon longsword"]= "Falcon Longsword",
    ["falcon mace"]= "Falcon Mace",
    ["falcon plate"]= "Falcon Plate",
    ["falcon rod"]= "Falcon Rod",
    ["falcon shield"]= "Falcon Shield",
    ["falcon wand"]= "Falcon Wand",
    ["feedbag"]= "Feedbag",
    ["ferumbras' hat"]= "Ferumbras' Hat",
    ["feverbloom boots"]= "Feverbloom Boots",
    ["final judgement"]= "Final Judgement",
    ["fireborn giant armor"]= "Fireborn Giant Armor",
    ["foxtail"]= "Foxtail",
    ["frostflower boots"]= "Frostflower Boots",
    ["galea mortis"]= "Galea Mortis",
    ["ghost backpack"]= "Ghost Backpack",
    ["ghost claw"]= "Ghost Claw",
    ["giant emerald"]= "Giant Emerald",
    ["giant sword"]= "Giant Sword",
    ["gilded eldritch bow"]= "Gilded Eldritch Bow",
    ["gilded eldritch claymore"]= "Gilded Eldritch Claymore",
    ["gilded eldritch greataxe"]= "Gilded Eldritch Greataxe",
    ["gilded eldritch rod"]= "Gilded Eldritch Rod",
    ["gilded eldritch wand"]= "Gilded Eldritch Wand",
    ["gilded eldritch warmace"]= "Gilded Eldritch Warmace",
    ["gnome armor"]= "Gnome Armor",
    ["golden bell"]= "Golden Bell",
    ["golden bijou"]= "Golden Bijou",
    ["golden boots"]= "Golden Boots",
    ["golden cotton reel"]= "Golden Cotton Reel",
    ["golden horseshoe"]= "Golden Horseshoe",
    ["great axe"]= "Great Axe",
    ["great shield"]= "Great Shield",
    ["hammer of prophecy"]= "Hammer of Prophecy",
    ["herald's insignia"]= "Herald's Insignia",
    ["herald's wings"]= "Herald's Wings",
    ["horseshoe"]= "Horseshoe",
    ["ice hatchet"]= "Ice Hatchet",
    ["idol of tukh"]= "Idol of Tukh",
    ["jungle bow"]= "Jungle Bow",
    ["jungle flail"]= "Jungle Flail",
    ["jungle quiver"]= "Jungle Quiver",
    ["jungle rod"]= "Jungle Rod",
    ["lavos armor"]= "Lavos Armor",
    ["library ticket"]= "Library Ticket",
    ["lightning legs"]= "Lightning Legs",
    ["lion amulet"]= "Lion Amulet",
    ["lion axe"]= "Lion Axe",
    ["lion hammer"]= "Lion Hammer",
    ["lion longbow"]= "Lion Longbow",
    ["lion longsword"]= "Lion Longsword",
    ["lion plate"]= "Lion Plate",
    ["lion rod"]= "Lion Rod",
    ["lion shield"]= "Lion Shield",
    ["lion spangenhelm"]= "Lion Spangenhelm",
    ["lion spellbook"]= "Lion Spellbook",
    ["lion wand"]= "Lion Wand",
    ["lucky pig"]= "Lucky Pig",
    ["make-do boots"]= "Make-do Boots",
    ["makeshift boots"]= "Makeshift Boots",
    ["megasylvan sapling"]= "Megasylvan Sapling",
    ["menacing egg"]= "Menacing Egg",
    ["midnight sarong"]= "Midnight Sarong",
    ["midnight tunic"]= "Midnight Tunic",
    ["mutant bone boots"]= "Mutant Bone Boots",
    ["mutant bone kilt"]= "Mutant Bone Kilt",
    ["mutated skin armor"]= "Mutated Skin Armor",
    ["mutated skin legs"]= "Mutated Skin Legs",
    ["mysterious scroll"]= "Mysterious Scroll",
    ["mystical dragon robe"]= "Mystical Dragon Robe",
    ["naga axe"]= "Naga Axe",
    ["naga club"]= "Naga Club",
    ["naga crossbow"]= "Naga Crossbow",
    ["naga quiver"]= "Naga Quiver",
    ["naga rod"]= "Naga Rod",
    ["naga sword"]= "Naga Sword",
    ["naga wand"]= "Naga Wand",
    ["nightmare horn"]= "Nightmare Horn",
    ["old royal diary"]= "Old Royal Diary",
    ["orc leather"]= "Orc Leather",
    ["orc trophy"]= "Orc Trophy",
    ["pair of dreamwalkers"]= "Pair of Dreamwalkers",
    ["pair of nightmare boots"]= "Pair of Nightmare Boots",
    ["peppermint backpack"]= "Peppermint Backpack",
    ["percht broom"]= "Percht Broom",
    ["percht handkerchief"]= "Percht Handkerchief",
    ["percht queen's frozen heart"]= "Percht Queen's Frozen Heart",
    ["phantasmal axe"]= "Phantasmal Axe",
    ["piggy bank"]= "Piggy Bank",
    ["plan for a makeshift armour"]= "Plan for a Makeshift Armour",
    ["plushie of tentugly"]= "Plushie of Tentugly",
    ["psychedelic tapestry"]= "Psychedelic Tapestry",
    ["purple tendril lantern"]= "Purple Tendril Lantern",
    ["rainbow necklace"]= "Rainbow Necklace",
    ["raw watermelon tourmaline"]= "Raw Watermelon Tourmaline",
    ["red silk flower"]= "Red Silk Flower",
    ["ring of souls"]= "Ring of Souls",
    ["robe of the underworld"]= "Robe of the Underworld",
    ["royal tapestry"]= "Royal Tapestry",
    ["ruthless axe"]= "Ruthless Axe",
    ["scrubbing brush"]= "Scrubbing Brush",
    ["sea horse figurine"]= "Sea Horse Figurine",
    ["shadow cowl"]= "Shadow Cowl",
    ["shield of corruption"]= "Shield of Corruption",
    ["silver token"]= "Silver Token",
    ["skull helmet"]= "Skull Helmet",
    ["skullcracker armor"]= "Skullcracker Armor",
    ["small ladybug"]= "Small Ladybug",
    ["snake god's sceptre"]= "Snake God's Sceptre",
    ["soap"]= "Soap",
    ["soul stone"]= "Soul Stone",
    ["soulful legs"]= "Soulful Legs",
    ["spellbook of dark mysteries"]= "Spellbook of Dark Mysteries",
    ["spellscroll of prophecies"]= "Spellscroll of Prophecies",
    ["spiritthorn armor"]= "Spiritthorn Armor",
    ["spiritthorn helmet"]= "Spiritthorn Helmet",
    ["spiritthorn ring"]= "Spiritthorn Ring",
    ["spiritual horseshoe"]= "Spiritual Horseshoe",
    ["spooky hood"]= "Spooky Hood",
    ["stitched mutant hide legs"]= "Stitched Mutant Hide Legs",
    ["stoic iks boots"]= "Stoic Iks Boots",
    ["stoic iks casque"]= "Stoic Iks Casque",
    ["stoic iks chestplate"]= "Stoic Iks Chestplate",
    ["stoic iks cuirass"]= "Stoic Iks Cuirass",
    ["stoic iks culet"]= "Stoic Iks Culet",
    ["stoic iks faulds"]= "Stoic Iks Faulds",
    ["stoic iks headpiece"]= "Stoic Iks Headpiece",
    ["stoic iks sandals"]= "Stoic Iks Sandals",
    ["sturdy book"]= "Sturdy Book",
    ["sun medal"]= "Sun Medal",
    ["sunray emblem"]= "Sunray Emblem",
    ["swamplair armor"]= "Swamplair Armor",
    ["tagralt blade"]= "Tagralt Blade",
    ["tagralt-inlaid scabbard"]= "Tagralt-Inlaid Scabbard",
    ["tentacle of tentugly"]= "Tentacle of Tentugly",
    ["tentugly's eye"]= "Tentugly's Eye",
    ["tentugly's jaws"]= "Tentugly's Jaws",
    ["terra hood"]= "Terra Hood",
    ["terra legs"]= "Terra Legs",
    ["the calamity"]= "The Calamity",
    ["the cobra amulet"]= "The Cobra Amulet",
    ["the crown of the percht queen"]= "The Crown of the Percht Queen",
    ["the stomper"]= "The Stomper",
    ["tinged pot"]= "Tinged Pot",
    ["toga mortis"]= "Toga Mortis",
    ["umbral master axe"]= "Umbral Master Axe",
    ["umbral master bow"]= "Umbral Master Bow",
    ["umbral master chopper"]= "Umbral Master Chopper",
    ["umbral master crossbow"]= "Umbral Master Crossbow",
    ["umbral master hammer"]= "Umbral Master Hammer",
    ["umbral master mace"]= "Umbral Master Mace",
    ["umbral master slayer"]= "Umbral Master Slayer",
    ["umbral master spellbook"]= "Umbral Master Spellbook",
    ["umbral masterblade"]= "Umbral Masterblade",
    ["unerring dragon scale armor"]= "Unerring Dragon Scale Armor",
    ["voltage armor"]= "Voltage Armor",
    ["wand of dimensions"]= "Wand of Dimensions",
    ["white gem"]= "White Gem",
    ["winged backpack"]= "Winged Backpack",
    ["winged boots"]= "Winged Boots",
    ["wolf backpack"]= "Wolf Backpack",
    ["writhing brain"]= "Writhing Brain",
    ["writhing heart"]= "Writhing Heart"
}

-- List of Rare Items
Config.ItemsRare = {
    ["abyss hammer"] =  "Abyss Hammer",
    ["alloy legs"] =  "Alloy Legs",
    ["amber axe"] =  "Amber Axe",
    ["amber bludgeon"] =  "Amber Bludgeon",
    ["amber bow"] =  "Amber Bow",
    ["amber crossbow"] =  "Amber Crossbow",
    ["amber cudgel"] =  "Amber Cudgel",
    ["amber greataxe"] =  "Amber Greataxe",
    ["amber rod"] =  "Amber Rod",
    ["amber sabre"] =  "Amber Sabre",
    ["amber slayer"] =  "Amber Slayer",
    ["amber staff"] =  "Amber Staff",
    ["amber wand"] =  "Amber Wand",
    ["amulet of loss"] =  "Amulet of Loss",
    ["arcane staff"] =  "Arcane Staff",
    ["assassin dagger"] =  "Assassin Dagger",
    ["assassin star"] =  "Assassin Star",
    ["astral glyph"] =  "Astral Glyph",
    ["astral source"] =  "Astral Source",
    ["bakragore's amalgamation"] =  "Bakragore's Amalgamation",
    ["bar of gold"] =  "Bar of Gold",
    ["bear skin"] =  "Bear Skin",
    ["behemoth trophy"] =  "Behemoth Trophy",
    ["berserker"] =  "Berserker",
    ["black pearl"] =  "Black Pearl",
    ["blister ring"] =  "Blister Ring",
    ["blood of the mountain charm"] =  "Blood of the Mountain Charm",
    ["blue robe"] =  "Blue Robe",
    ["bonebreaker"] =  "Bonebreaker",
    ["book backpack"] =  "Book Backpack",
    ["boots of haste"] =  "Boots of Haste",
    ["bracelet of strengthening"] =  "Bracelet of Strengthening",
    ["brain in a jar"] =  "Brain in a Jar",
    ["brainstealer's brain"] =  "Brainstealer's Brain",
    ["brainstealer's brainwave"] =  "Brainstealer's Brainwave",
    ["brainstealer's tissue"] =  "Brainstealer's Tissue",
    ["broken mitmah chestplate"] =  "Broken Mitmah Chestplate",
    ["candle stump"] =  "Candle Stump",
    ["chagorz igneous obsidian"] =  "Chagorz Igneous Obsidian",
    ["chaos mace"] =  "Chaos Mace",
    ["cobra crown"] =  "Cobra Crown",
    ["collar of blue plasma"] =  "Collar of Blue Plasma",
    ["collar of green plasma"] =  "Collar of Green Plasma",
    ["collar of red plasma"] =  "Collar of Red Plasma",
    ["composite hornbow"] =  "Composite Hornbow",
    ["coral brooch"] =  "Coral Brooch",
    ["cream cake"] =  "Cream Cake",
    ["crunor idol"] =  "Crunor Idol",
    ["crusader helmet"] =  "Crusader Helmet",
    ["crystal coin"] =  "Crystal Coin",
    ["crystal mace"] =  "Crystal Mace",
    ["crystal of power"] =  "Crystal of Power",
    ["crystal ring"] =  "Crystal Ring",
    ["crystalline armor"] =  "Crystalline Armor",
    ["crystallized blood"] =  "Crystallized Blood",
    ["damaged armor plates"] =  "Damaged Armor Plates",
    ["dark bell"] =  "Dark Bell",
    ["dark whispers"] =  "Dark Whispers",
    ["darklight figurine"] =  "Darklight Figurine",
    ["death gaze"] =  "Death Gaze",
    ["decorative ribbon"] =  "Decorative Ribbon",
    ["deer trophy"] =  "Deer Trophy",
    ["demon shield"] =  "Demon Shield",
    ["demonbone"] =  "Demonbone",
    ["demonbone amulet"] =  "Demonbone Amulet",
    ["demonrage sword"] =  "Demonrage Sword",
    ["demonwing axe"] =  "Demonwing Axe",
    ["depth scutum"] =  "Depth Scutum",
    ["diabolic skull"] =  "Diabolic Skull",
    ["drachaku"] =  "Drachaku",
    ["dragon crown"] =  "Dragon Crown",
    ["dragon figurine"] =  "Dragon Figurine",
    ["dragon scale mail"] =  "Dragon Scale Mail",
    ["dragon shield"] =  "Dragon Shield",
    ["dreaded cleaver"] =  "Dreaded Cleaver",
    ["dream blossom staff"] =  "Dream Blossom Staff",
    ["dream warden mask"] =  "Dream Warden Mask",
    ["ectoplasmic shield"] =  "Ectoplasmic Shield",
    ["elven legs"] =  "Elven Legs",
    ["elven mail"] =  "Elven Mail",
    ["embrace of nature"] =  "Embrace of Nature",
    ["enchanted pendulet"] =  "Enchanted Pendulet",
    ["enchanted sleep shawl"] =  "Enchanted Sleep Shawl",
    ["enchanted theurgic amulet"] =  "Enchanted Theurgic Amulet",
    ["energized limb"] =  "Energized Limb",
    ["epaulette"] =  "Epaulette",
    ["exalted seal"] =  "Exalted Seal",
    ["executioner"] =  "Executioner",
    ["eye of the chasm"] =  "Eye of the Chasm",
    ["eye pod"] =  "Eye Pod",
    ["fabulous legs"] =  "Fabulous Legs",
    ["falcon bow"] =  "Falcon Bow",
    ["falcon circlet"] =  "Falcon Circlet",
    ["falcon coif"] =  "Falcon Coif",
    ["falcon rod"] =  "Falcon Rod",
    ["falcon wand"] =  "Falcon Wand",
    ["fiery horseshoe"] =  "Fiery Horseshoe",
    ["fiery tear"] =  "Fiery Tear",
    ["figurine of cruelty"] =  "Figurine of Cruelty",
    ["figurine of greed"] =  "Figurine of Greed",
    ["figurine of hatred"] =  "Figurine of Hatred",
    ["figurine of malice"] =  "Figurine of Malice",
    ["figurine of megalomania"] =  "Figurine of Megalomania",
    ["figurine of spite"] =  "Figurine of Spite",
    ["firefighting axe"] =  "Firefighting Axe",
    ["fist on a stick"] =  "Fist on a Stick",
    ["flames of the percht queen"] =  "Flames of the Percht Queen",
    ["fly agaric"] =  "Fly Agaric",
    ["folded rift carpet"] =  "Folded Rift Carpet",
    ["forbidden tome"] =  "Forbidden Tome",
    ["frozen chain"] =  "Frozen Chain",
    ["frozen claw"] =  "Frozen Claw",
    ["ghost chestplate"] =  "Ghost Chestplate",
    ["giant amethyst"] =  "Giant Amethyst",
    ["giant emerald"] =  "Giant Emerald",
    ["giant ruby"] =  "Giant Ruby",
    ["giant sapphire"] =  "Giant Sapphire",
    ["giant shimmering pearl"] =  "Giant Shimmering Pearl",
    ["giant topaz"] =  "Giant Topaz",
    ["glacier robe"] =  "Glacier Robe",
    ["gnome shield"] =  "Gnome Shield",
    ["gnome sword"] =  "Gnome Sword",
    ["gold ingot"] =  "Gold Ingot",
    ["gold nugget"] =  "Gold Nugget",
    ["gold ring"] =  "Gold Ring",
    ["gold token"] =  "Gold Token",
    ["gold-scaled sentinel"] =  "Gold-Scaled Sentinel",
    ["golden armor"] =  "Golden Armor",
    ["golden cheese wedge"] =  "Golden Cheese Wedge",
    ["golden dustbin"] =  "Golden Dustbin",
    ["golden hyaena pendant"] =  "Golden Hyaena Pendant",
    ["golden legs"] =  "Golden Legs",
    ["golden mask"] =  "Golden Mask",
    ["golden skull"] =  "Golden Skull",
    ["golden talon"] =  "Golden Talon",
    ["great axe"] =  "Great Axe",
    ["great shield"] =  "Great Shield",
    ["greed's arm"] =  "Greed's Arm",
    ["green gem"] =  "Green Gem",
    ["guardian axe"] =  "Guardian Axe",
    ["hailstorm rod"] =  "Hailstorm Rod",
    ["havoc blade"] =  "Havoc Blade",
    ["heavy mace"] =  "Heavy Mace",
    ["ice shield"] =  "Ice Shield",
    ["icicle"] =  "Icicle",
    ["impaler"] =  "Impaler",
    ["ivory comb"] =  "Ivory Comb",
    ["jade hammer"] =  "Jade Hammer",
    ["jade hat"] =  "Jade Hat",
    ["jagged sickle"] =  "Jagged Sickle",
    ["jewel case"] =  "Jewel Case",
    ["key to knowledge"] =  "Key to Knowledge",
    ["knight armor"] =  "Knight Armor",
    ["knight legs"] =  "Knight Legs",
    ["lightning legs"] =  "Lightning Legs",
    ["living armor"] =  "Living Armor",
    ["living vine bow"] =  "Living Vine Bow",
    ["luminescent crystal pickaxe"] =  "Luminescent Crystal Pickaxe",
    ["magic plate armor"] =  "Magic Plate Armor",
    ["magma coat"] =  "Magma Coat",
    ["magma legs"] =  "Magma Legs",
    ["maimer"] =  "Maimer",
    ["mallet head"] =  "Mallet Head",
    ["mastermind shield"] =  "Mastermind Shield",
    ["maxilla maximus"] =  "Maxilla Maximus",
    ["maxxenius head"] =  "Maxxenius Head",
    ["medal of valiance"] =  "Medal of Valiance",
    ["megalomania's essence"] =  "Megalomania's Essence",
    ["megalomania's skull"] =  "Megalomania's Skull",
    ["mercenary sword"] =  "Mercenary Sword",
    ["metal spats"] =  "Metal Spats",
    ["moonstone"] =  "Moonstone",
    ["mortal mace"] =  "Mortal Mace",
    ["muck rod"] =  "Muck Rod",
    ["murcion's mycelium"] =  "Murcion's Mycelium",
    ["necrotic rod"] =  "Necrotic Rod",
    ["nightmare beacon"] =  "Nightmare Beacon",
    ["nightmare hook"] =  "Nightmare Hook",
    ["noble amulet"] =  "Noble Amulet",
    ["noble axe"] =  "Noble Axe",
    ["noble cape"] =  "Noble Cape",
    ["obsidian truncheon"] =  "Obsidian Truncheon",
    ["ominous book"] =  "Ominous Book",
    ["one of timira's many heads"] =  "One of Timira's Many Heads",
    ["onyx flail"] =  "Onyx Flail",
    ["oriental shoes"] =  "Oriental Shoes",
    ["ornate crossbow"] =  "Ornate Crossbow",
    ["ornate locket"] =  "Ornate Locket",
    ["ornate tome"] =  "Ornate Tome",
    ["pair of nightmare boots"] =  "Pair of Nightmare Boots",
    ["part of a rune"] =  "Part of a Rune",
    ["pastry dragon"] =  "Pastry Dragon",
    ["patch of fine cloth"] =  "Patch of Fine Cloth",
    ["percht skull"] =  "Percht Skull",
    ["phantasmal axe"] =  "Phantasmal Axe",
    ["phoenix shield"] =  "Phoenix Shield",
    ["piece of timira's sensors"] =  "Piece of Timira's Sensors",
    ["plan for a makeshift armour"] =  "Plan for a Makeshift Armour",
    ["pomegranate"] =  "Pomegranate",
    ["portable flame"] =  "Portable Flame",
    ["purple tendril lantern"] =  "Purple Tendril Lantern",
    ["putrefactive figurine"] =  "Putrefactive Figurine",
    ["rainbow quartz"] =  "Rainbow Quartz",
    ["ravager's axe"] =  "Ravager's Axe",
    ["raw watermelon tourmaline"] =  "Raw Watermelon Tourmaline",
    ["red gem"] =  "Red Gem",
    ["resizer"] =  "Resizer",
    ["rift tapestry"] =  "Rift Tapestry",
    ["ring of blue plasma"] =  "Ring of Blue Plasma",
    ["ring of green plasma"] =  "Ring of Green Plasma",
    ["ring of red plasma"] =  "Ring of Red Plasma",
    ["ring of souls"] =  "Ring of Souls",
    ["ring of temptation"] =  "Ring of Temptation",
    ["ring of the sky"] =  "Ring of the Sky",
    ["rotten heart"] =  "Rotten Heart",
    ["ruby necklace"] =  "Ruby Necklace",
    ["runed sword"] =  "Runed Sword",
    ["sacred tree amulet"] =  "Sacred Tree Amulet",
    ["sai"] =  "Sai",
    ["scorpion sceptre"] =  "Scorpion Sceptre",
    ["sea horse figurine"] =  "Sea Horse Figurine",
    ["shoulder plate"] =  "Shoulder Plate",
    ["signet ring"] =  "Signet Ring",
    ["silver token"] =  "Silver Token",
    ["sinister book"] =  "Sinister Book",
    ["skull helmet"] =  "Skull Helmet",
    ["skullcracker armor"] =  "Skullcracker Armor",
    ["skullcrusher"] =  "Skullcrusher",
    ["small sapphire"] =  "Small Sapphire",
    ["smoldering eye"] =  "Smoldering Eye",
    ["soul stone"] =  "Soul Stone",
    ["soulforged lantern"] =  "Soulforged Lantern",
    ["soulful legs"] =  "Soulful Legs",
    ["spectral horseshoe"] =  "Spectral Horseshoe",
    ["spectral scrap of cloth"] =  "Spectral Scrap of Cloth",
    ["spellbook of dark mysteries"] =  "Spellbook of Dark Mysteries",
    ["spellbook of mind control"] =  "Spellbook of Mind Control",
    ["spellbook of warding"] =  "Spellbook of Warding",
    ["spellweaver's robe"] =  "Spellweaver's Robe",
    ["spiked squelcher"] =  "Spiked Squelcher",
    ["spirit container"] =  "Spirit Container",
    ["spirit guide"] =  "Spirit Guide",
    ["splintered mitmah gem"] =  "Splintered Mitmah Gem",
    ["steel boots"] =  "Steel Boots",
    ["stone skin amulet"] =  "Stone Skin Amulet",
    ["strange inedible fruit"] =  "Strange Inedible Fruit",
    ["sturdy book"] =  "Sturdy Book",
    ["sulphurous demonbone"] =  "Sulphurous Demonbone",
    ["summerblade"] =  "Summerblade",
    ["terra amulet"] =  "Terra Amulet",
    ["terra helmet"] =  "Terra Helmet",
    ["terra legs"] =  "Terra Legs",
    ["terra mantle"] =  "Terra Mantle",
    ["terra rod"] =  "Terra Rod",
    ["thaian sword"] =  "Thaian Sword",
    ["the skull of a beast"] =  "The Skull of a Beast",
    ["throwing axe"] =  "Throwing Axe",
    ["tiara"] =  "Tiara",
    ["tiara of power"] =  "Tiara of Power",
    ["titan axe"] =  "Titan Axe",
    ["token of love"] =  "Token of Love",
    ["trophy of feroxa"] =  "Trophy of Feroxa",
    ["turquoise tendril lantern"] =  "Turquoise Tendril Lantern",
    ["umbral axe"] =  "Umbral Axe",
    ["umbral blade"] =  "Umbral Blade",
    ["umbral bow"] =  "Umbral Bow",
    ["umbral chopper"] =  "Umbral Chopper",
    ["umbral crossbow"] =  "Umbral Crossbow",
    ["umbral hammer"] =  "Umbral Hammer",
    ["umbral mace"] =  "Umbral Mace",
    ["umbral slayer"] =  "Umbral Slayer",
    ["umbral spellbook"] =  "Umbral Spellbook",
    ["underworld rod"] =  "Underworld Rod",
    ["unholy book"] =  "Unholy Book",
    ["unicorn figurine"] =  "Unicorn Figurine",
    ["unliving demonbone"] =  "Unliving Demonbone",
    ["urmahlullu's mane"] =  "Urmahlullu's Mane",
    ["urmahlullu's paw"] =  "Urmahlullu's Paw",
    ["urmahlullu's tail"] =  "Urmahlullu's Tail",
    ["velvet mantle"] =  "Velvet Mantle",
    ["vemiath's infused basalt"] =  "Vemiath's Infused Basalt",
    ["vial of hatred"] =  "Vial of Hatred",
    ["violet gem"] =  "Violet Gem",
    ["void boots"] =  "Void Boots",
    ["voltage armor"] =  "Voltage Armor",
    ["wand of everblazing"] =  "Wand of Everblazing",
    ["watermelon tourmaline"] =  "Watermelon Tourmaline",
    ["werebadger trophy"] =  "Werebadger Trophy",
    ["werebear trophy"] =  "Werebear Trophy",
    ["wereboar trophy"] =  "Wereboar Trophy",
    ["werefox trophy"] =  "Werefox Trophy",
    ["werehyaena trophy"] =  "Werehyaena Trophy",
    ["werewolf helmet"] =  "Werewolf Helmet",
    ["white gem"] =  "White Gem",
    ["white pearl"] =  "White Pearl",
    ["winterblade"] = "Winterblade",
    ["wolf backpack"] =  "Wolf Backpack"
}

return Config