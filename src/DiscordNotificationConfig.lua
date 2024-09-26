local Config = {}

Config.MessageTags = {
    PlayerName = "|playerName|",
    CreatureName = "|creatureName|",
    DamageTaken = "|damageTaken|"
}

Config.Discord = {
    WebhookUrl = "https://discord.com/api/webhooks/1281796046401437760/JMGcigfF7Gi2wt24ujAZrD8ODRnGDCXxS_pPvvx3AiPN450Vw3UzDkUYvJ0Ep9vpdWTH",
    FistEmoji = ":punch: ",
    AxeEmoji = ":axe: ",
    ClubEmoji = ":hammer: ",
    SwordEmoji = ":crossed_swords: ",
    DistanceEmoji = ":bow_and_arrow: ",
    ShieldEmoji = ":shield: ",
    FishingEmoji = ":fishing_pole_and_fish: ",
    MagicEmoji = ":magic_wand: ",
    TitleMessageSkill = "|playerName| upou nivel de skill!",
    DescMessageSkill = "",
    KnightEmoji = "<a:Sanguine_Razor:1171812568931766302> ",
    PaladinEmoji = "<a:Sanguine_Crossbow:1171812549772193833> ",
    SorcererEmoji = "<a:Sanguine_Coil:1171812537449324595> ",
    DruidEmoji = "<a:Sanguine_Rod:1171812578629001247> ",
    TitleMessageLevel = "|playerName| upou de nivel!",
    DescMessageLevel = "",
    TitleMessageDeath = "|playerName| morreu!",
    DescMessageDeath = "|playerName| recebeu |damageTaken| de dano de |creatureName| e morreu!",
    DiscordEmbedColor = 5832630
}

Config.HUD = {
    NotificationMenuText = "Notificacoes",
    NotificationMenuTextSize = 7,
    NotificationMenuIcon = 31364,
    NotificationMenuhudX = 117,
    NotificationMenuhudY = 38,
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
    LevelUpEnabled = true,
    SkillUpEnabled = false,
    DeathEnabled = true
}

return Config