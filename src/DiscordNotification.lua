-- DO NOT TOUCH BELOW THIS LINE. THERE IS A CONFIG FILE WITH THE ELEMENTS YOU CAN CUSTOMIZE/CHANGE
-- NAO ALTERE ABAIXO DESSA LINHA. EXISTE UM ARQUIVO DE CONFIGURAÇÃO COM OS ELEMENTOS QUE VOCÊ PODE CONSTUMIZAR/ALTERAR


-- DEPENDENCIES
-- DEPENDENCIAS
local socket = require("socket.http")
local ltn12 = require("ltn12")
package.path = package.path .. ";" .. Engine.getScriptsDirectory() .. "\\?.lua"
local config = require("DiscordNotificationConfig")


-- LOADING MESSAGE
-- MENSAGEM DE CARREGAMENTO
Client.showMessage("Discord Notification carregado!")

-- VARIABLES DEFINITION
-- DEFINIÇÃO DAS VARIÁVEIS
local levelUpSkills = config.Messages.LevelUpEnabled
local levelUpMessage = config.Messages.SkillUpEnabled
local deathMessage = config.Messages.DeathEnabled
local lootMessage = config.Messages.LootEnabled

-- TYPE OF ITEMS TO IDENTIFY: 0 - OFF | 1 - ALL (RARE AND VERY RARE) | 2 - RARE | 3 - VERY RARE
-- TIPO DOS ITEMS PARA IDENTIFICAR: 0 - DESLIGADO | 1 - TODOS (RAROS E MUITO RAROS) | 2 - RARO | 3 - MUITO RARO
local lootItemsType = config.HUD.LootTypeSelected

local notificationMenuIcon = config.HUD.NotificationMenuIcon
local notificationMenuhudX, notificationMenuhudY = config.HUD.NotificationMenuhudX, config.HUD.NotificationMenuhudY
local notificationMenuLabelDeltaX, notificationMenuLabelDeltaY = 30, 10
local hudNotificationMenu, hudNotificationMenuTexto
local notificationMenuOpen = false

local levelUpIcon = config.HUD.LevelUpIcon
local levelUpDeltaX, levelUpDeltaY = 15, 30
local levelUpLabelDeltaX, levelUpLabelDeltaY = 30, 7
local hudLevelUp, hudLevelUpText

local skillUpIcon = config.HUD.SkillUpIcon
local skillUpDeltaX, skillUpDeltaY = 15, 60
local skillUpLabelDeltaX, skillUpLabelDeltaY = 30, 7
local hudSkillUp, hudSkillUpText

local deathIcon = config.HUD.DeathIcon
local deathDeltaX, deathDeltaY = 15, 90
local deathLabelDeltaX, deathLabelDeltaY = 30, 7
local hudDeath, hudDeathText

local lootIcon = config.HUD.LootItemIcon
local lootDeltaX, lootDeltaY = 15, 120
local lootLabelDeltaX, lootLabelDeltaY = 30, 7
local hudLoot, hudLootText

local lastHitBy = ""
local lastHitpointValue = 0;
local bossName = ""

-- FUNCTIONS TO UPDATE CONFIG FILE
-- FUNÇÕES PARA ATUALIZAR O ARQUIVO DE CONFIGURAÇÃO 
function OpenFile(path, mode)
    local file = io.open(path, mode)
    if not file then
        error("\nError trying to open the file.\nErro ao tentar abrir o arquivo.\n", path)
    end

    return file
end

function UpdateConfigFile(property, newValeu)
    local path = Engine.getScriptsDirectory() .. "/DiscordNotificationConfig.lua"
    local file = OpenFile(path, "r")

    local fileContent = file:read("*all")
    file:close()

    local updatedFileContent

    if property == "LevelUpEnabled" or property == "SkillUpEnabled" or property == "DeathEnabled" or property == "LootEnabled" then
        local currentValue = fileContent:match(property .. " = (%a+)")
        updatedFileContent = fileContent:gsub(property .. " = " .. currentValue, property .. " = " .. tostring(newValeu))
    end

    if property == "NotificationMenuhudX" or property == "NotificationMenuhudY" or property == "LootTypeSelected" then
        local currentValue = fileContent:match(property .. " = (%d+)")
        updatedFileContent = fileContent:gsub(property .. " = " .. currentValue, property .. " = " .. newValeu)
    end
    
    if updatedFileContent then
        file = OpenFile(path, "w")
        file:write(updatedFileContent)
        file:close()
    end
end

-- FUNCTION TO UPPERCASE FIRST CHAR OF A STRING
-- FUNÇÃO PARA ALTERAR O PRIMEIRO CHAR DE UMA STRING PARA MAIÚSCULO
function FirstToUpper(str)
    return (str:gsub("(%l)(%w+)", function(a,b) return string.upper(a)..b end))
end

-- FUNCTIONS TO GENERATE THE DISCORD MESSAGES AND SEND THEM
-- FUNÇÕES PARA GERAR AS MENSAGES DO DISCORD E ENVIÁ-LAS
function CheckLevelUp()
    local message = GenerateLevelUpMessage()
    SendMessageToDiscord(message)
end

function CheckSkillUp(skill)
    local message = GenerateSkillUpMessage(skill)
    SendMessageToDiscord(message)
end

function CheckDeath()
    local message = GenerateDeathMessage()
    SendMessageToDiscord(message)
end

function CheckLoot(itemList)
    --Remove unecessary characters from string
    itemList = itemList:gsub("{%d+|", ""):gsub("}", ""):gsub("%.", ""):gsub(" %b()", "")
    local discordItemList = ""
    local items = {}
    for word in string.gmatch(itemList, '([^,]+)') do
        local item = word:gsub("^a ", ""):gsub("^ a ", ""):gsub("^an ", ""):gsub("^ an ", ""):gsub("^ ", ""):gsub("^%d+ ", "")
        table.insert(items, item)
    end
    if items then
        table.sort(items)
    end
    for k , item in pairs(items) do
        if lootItemsType == 1 then

            local itemFound = false
            if config.ItemsVeryRare[item] then
                discordItemList = discordItemList .. config.Discord.LootItemEmoji .. config.ItemsVeryRare[item] .. "\n"
                itemFound = true
            end
            if itemFound == false and config.ItemsRare[item]then
                discordItemList = discordItemList .. config.Discord.LootItemEmoji ..config.ItemsRare[item] .. "\n"
            end

        elseif lootItemsType == 2 then

            if config.ItemsRare[item] then
                discordItemList = discordItemList .. config.Discord.LootItemEmoji ..config.ItemsRare[item] .. "\n"
            end

        elseif  lootItemsType == 3 then

            if config.ItemsVeryRare[item] then
                discordItemList = discordItemList .. config.Discord.LootItemEmoji .. config.ItemsVeryRare[item] .. "\n"
            end

        end
    end

    if discordItemList == "" then return end
    local message = GenerateLootMessage(discordItemList)
    SendMessageToDiscord(message)
end

function GenerateLevelUpMessage()
    local vocacaoEnum = Creature(Player.getId()):getVocation()
    local vocacaoNome = ""
    local vocacaoEmoji = ""

    if vocacaoEnum == 1 then 
        vocacaoNome = "Elite Knight"
        vocacaoEmoji = config.Discord.KnightEmoji
    elseif vocacaoEnum == 2 then
        vocacaoNome = "Royal Paladin"
        vocacaoEmoji = config.Discord.PaladinEmoji
    elseif vocacaoEnum == 3 then
        vocacaoNome = "Master Sorcerer"
        vocacaoEmoji = config.Discord.SorcererEmoji
    elseif vocacaoEnum == 4 then
        vocacaoNome = "Elder Druid"
        vocacaoEmoji = config.Discord.DruidEmoji
    elseif vocacaoEnum == 0 then
        vocacaoNome = "n00b"
    end
    
    local embedField1 = {
        name = "Vocacao",
        value = vocacaoEmoji .. vocacaoNome,
        inline = true
    }

    local currentLevel = Player.getLevel()
    local embedField2 = {
        name = "Nivel atual",
        value = ""..currentLevel.."",
        inline = true
    }

    local title = ReplaceTagsInMessage(config.Discord.TitleMessageLevel)
    local description = ReplaceTagsInMessage(config.Discord.DescMessageLevel)
    local embed = {
        title = title,
        description = description,
        color = config.Discord.DiscordEmbedColor.LevelUp,
        fields = {
            embedField1, embedField2
        },
        attachments = {}
    }

    local message = {
        content = "",
        embeds = {
            embed
        }
    }

    local jsonString = JSON.encode(message)

    return jsonString
end

function GenerateSkillUpMessage(skill)
    
    local skillsList = Player.getSkills()
    local skillName = FirstToUpper(skill)
    local skillEmoji = ""
    local skillLevel = 0

    if skill == "fist fighting" then
        skillEmoji = config.Discord.FistEmoji
        skillLevel = skillsList.fist
    elseif skill == "axe fighting" then
        skillEmoji = config.Discord.AxeEmoji
        skillLevel = skillsList.axe
    elseif skill == "club fighting" then
        skillEmoji = config.Discord.ClubEmoji
        skillLevel = skillsList.club
    elseif skill == "sword fighting" then
        skillEmoji = config.Discord.SwordEmoji
        skillLevel = skillsList.sword
    elseif skill == "distance fighting" then
        skillEmoji = config.Discord.DistanceEmoji
        skillLevel = skillsList.distance
    elseif skill == "shielding" then
        skillEmoji = config.Discord.ShieldEmoji
        skillLevel = skillsList.shield
    elseif skill == "fishing" then
        skillEmoji = config.Discord.FishingEmoji
        skillLevel = skillsList.fishing
    elseif skill == "magic" then
        skillEmoji = config.Discord.MagicEmoji
        skillLevel = skillsList.magic
    end
    
    local embedField1 = {
        name = "Skill",
        value = skillEmoji .. skillName,
        inline = true
    }

    local embedField2 = {
        name = "Nivel atual",
        value = ""..skillLevel.."",
        inline = true
    }

    local title = ReplaceTagsInMessage(config.Discord.TitleMessageSkill)
    local description = ReplaceTagsInMessage(config.Discord.DescMessageSkill)
    local embed = {
        title = title,
        description = description,
        color = config.Discord.DiscordEmbedColor.SkillUp,
        fields = {
            embedField1, embedField2
        },
        attachments = {}
    }

    local message = {
        content = "",
        embeds = {
            embed
        }
    }

    local jsonString = JSON.encode(message)

    return jsonString
end

function GenerateDeathMessage()
    local vocacaoEnum = Creature(Player.getId()):getVocation()
    local vocacaoNome = ""
    local vocacaoEmoji = ""

    if vocacaoEnum == 1 then 
        vocacaoNome = "Elite Knight"
        vocacaoEmoji = config.Discord.KnightEmoji
    elseif vocacaoEnum == 2 then
        vocacaoNome = "Royal Paladin"
        vocacaoEmoji = config.Discord.PaladinEmoji
    elseif vocacaoEnum == 3 then
        vocacaoNome = "Master Sorcerer"
        vocacaoEmoji = config.Discord.SorcererEmoji
    elseif vocacaoEnum == 4 then
        vocacaoNome = "Elder Druid"
        vocacaoEmoji = config.Discord.DruidEmoji
    elseif vocacaoEnum == 0 then
        vocacaoNome = "n00b"
    end
    
    local embedField1 = {
        name = "Vocacao",
        value = vocacaoEmoji .. vocacaoNome,
        inline = true
    }

    local currentLevel = Player.getLevel()
    local embedField2 = {
        name = "Nivel atual",
        value = ""..currentLevel.."",
        inline = true
    }
    lastHitBy = FirstToUpper(lastHitBy)
    local title = ReplaceTagsInMessage(config.Discord.TitleMessageDeath)
    local description = ReplaceTagsInMessage(config.Discord.DescMessageDeath)
    local embed = {
        title = title,
        description = description,
        color = config.Discord.DiscordEmbedColor.Death,
        fields = {
            embedField1, embedField2
        },
        attachments = {}
    }

    local message = {
        content = "",
        embeds = {
            embed
        }
    }

    local jsonString = JSON.encode(message)

    return jsonString
end

function GenerateLootMessage(itemList)

    local embedField1 = {
        name = "Itens",
        value = itemList,
        inline = true
    }

    local title = ReplaceTagsInMessage(config.Discord.TitleMessageLoot)
    local description = ReplaceTagsInMessage(config.Discord.DescMessageLoot)
    local embed = {
        title = title,
        description = description,
        color = config.Discord.DiscordEmbedColor.BossLoot,
        fields = {
            embedField1
        },
        attachments = {}
    }

    local message = {
        content = "",
        embeds = {
            embed
        }
    }

    local jsonString = JSON.encode(message)

    return jsonString
end

function ReplaceTagsInMessage(message)

    for k , v in pairs(config.MessageTags) do
        if k == "PlayerName" then
            local playerName = FirstToUpper(Player.getName())
            message = string.gsub(message,v, "**" .. playerName .. "**")
        elseif k == "CreatureName" then
            message = string.gsub(message,v, "**" .. lastHitBy .. "**")
        elseif k == "DamageTaken" then
            message = string.gsub(message,v, "**" .. lastHitpointValue .. "**")
        elseif k == "BossName" then
            message = string.gsub(message,v, "**" .. bossName .. "**")
        end
    end
    return message
end

function SendMessageToDiscord(message)
    local response = {}
    local _, status, headers = socket.request {
        url = config.Discord.WebhookUrl,
        method = "POST",
        source = ltn12.source.string(message),
        sink = ltn12.sink.table(response),
        headers = {
            ["content-length"] = string.len(message),
            ["Content-Type"] = "application/json",
        }
    }
    
    if status ~= 200 and status ~= 204 then
        print("HTTP request failed. Status code:", status)
    end
end

function OnTextEvent(messageData)
    --print(JSON.encode(messageData))
    if messageData.messageType == Enums.MessageTypes.MESSAGE_LOOT then
        if lootMessage then
            local bossStringName,_, _, _, lootItems = string.match(messageData.text, config.Messages.BossDropPattern)
            if bossStringName and lootItems then
                bossName = bossStringName
                CheckLoot(lootItems)
            end
        end
    elseif messageData.messageType == Enums.MessageTypes.MESSAGE_DAMAGE_RECEIVED then
        local hitpointValue, discart1, discart2, discart3, discart4, creatureFullName, discart5, discart6, discart7 = string.match(messageData.text, config.Messages.LastHitByPattern)
        if creatureFullName and hitpointValue then
            lastHitBy = creatureFullName
            lastHitpointValue = hitpointValue
        end
    elseif messageData.messageType == Enums.MessageTypes.MESSAGE_EVENT_ADVANCE then
        local textMatch = false

        if deathMessage == true and messageData.text == config.Messages.DeathPattern then
            textMatch = true
            CheckDeath()
        end

        if levelUpSkills == true and textMatch == false then
            local oldLevel, newLevel = string.match(messageData.text, config.Messages.LevelUpPattern)

            if oldLevel and newLevel then
                textMatch = true
                CheckLevelUp()
            end
        end

        if levelUpMessage == true and textMatch == false then
            local skill, skillSingleName, discart2, discart3, newLevel = string.match(messageData.text, config.Messages.SkillUpPattern)

            if skill and newLevel then
                textMatch = true
                CheckSkillUp(skill)
            end
        end
        
    end
end

-- FUNCTIONS RELATED TO THE HUD
-- FUNÇÕES RELACIONADAS A HUD
function GetLootItemText()
    local lootItemText = config.HUD.LootItemText

    if lootMessage and lootItemsType <= #config.HUD.LootTypes then
        lootItemText = lootItemText .. config.HUD.LootTypes[lootItemsType]
    end
    return lootItemText
end

function ToogleLevelUpTextColor()
    if levelUpSkills == true then
        hudLevelUpText:setColor(config.HUD.ItemColorActive[1], config.HUD.ItemColorActive[2], config.HUD.ItemColorActive[3])
    else
        hudLevelUpText:setColor(config.HUD.ItemColorInactive[1], config.HUD.ItemColorInactive[2], config.HUD.ItemColorInactive[3])
    end
end

function ToogleSkillUpTextColor()
    if levelUpMessage == true then
        hudSkillUpText:setColor(config.HUD.ItemColorActive[1], config.HUD.ItemColorActive[2], config.HUD.ItemColorActive[3])
    else
        hudSkillUpText:setColor(config.HUD.ItemColorInactive[1], config.HUD.ItemColorInactive[2], config.HUD.ItemColorInactive[3])
    end
end

function ToogleDeathTextColor()
    if deathMessage == true then
        hudDeathText:setColor(config.HUD.ItemColorActive[1], config.HUD.ItemColorActive[2], config.HUD.ItemColorActive[3])
    else
        hudDeathText:setColor(config.HUD.ItemColorInactive[1], config.HUD.ItemColorInactive[2], config.HUD.ItemColorInactive[3])
    end
end

function ToogleLootTextColor()
    if lootMessage == true then
        hudLootText:setColor(config.HUD.ItemColorActive[1], config.HUD.ItemColorActive[2], config.HUD.ItemColorActive[3])
    else
        hudLootText:setColor(config.HUD.ItemColorInactive[1], config.HUD.ItemColorInactive[2], config.HUD.ItemColorInactive[3])
    end
end

function OpenNotificationMenu()
    notificationMenuOpen = not notificationMenuOpen
    if notificationMenuOpen == true then
        hudNotificationMenuTexto:setColor(config.HUD.MenuColorOpened[1], config.HUD.MenuColorOpened[2], config.HUD.MenuColorOpened[3])
        hudLevelUp:show()
        hudLevelUpText:show()
        hudSkillUp:show()
        hudSkillUpText:show()
        hudDeath:show()
        hudDeathText:show()
        hudLoot:show()
        hudLootText:show()
    else
        hudNotificationMenuTexto:setColor(config.HUD.MenuColorClosed[1], config.HUD.MenuColorClosed[2], config.HUD.MenuColorClosed[3])
        hudLevelUp:hide()
        hudLevelUpText:hide()
        hudSkillUp:hide()
        hudSkillUpText:hide()
        hudDeath:hide()
        hudDeathText:hide()
        hudLoot:hide()
        hudLootText:hide()
    end
end

function ToggleLevelUpNotification()
    levelUpSkills = not levelUpSkills
    ToogleLevelUpTextColor()
    UpdateConfigFile("LevelUpEnabled", levelUpSkills)
end

function ToggleSkillUpNotification()
    levelUpMessage = not levelUpMessage
    ToogleSkillUpTextColor()
    UpdateConfigFile("SkillUpEnabled", levelUpMessage)
end

function ToogleDeathNotification()
    deathMessage = not deathMessage
    ToogleDeathTextColor()
    UpdateConfigFile("DeathEnabled", deathMessage)
end

function ToogleLootNotification()
    if lootItemsType >= 3  or lootItemsType < 0 then
        lootItemsType = 0
        lootMessage = false
    else
        lootItemsType = lootItemsType + 1
        lootMessage = true
    end
    hudLootText:setText(GetLootItemText())
    ToogleLootTextColor()
    UpdateConfigFile("LootEnabled", lootMessage)
    UpdateConfigFile("LootTypeSelected", lootItemsType)
end

-- NOTIFICATIONS MENU DEFINITION
-- DEFINICAO DO MENU DE NOTIFICACOES
hudNotificationMenu = HUD.new(notificationMenuhudX, notificationMenuhudY, notificationMenuIcon, true)
hudNotificationMenu:setDraggable(true)
hudNotificationMenu:setCallback(OpenNotificationMenu)
hudNotificationMenu:setScale(config.HUD.NotificationIconScale)

hudNotificationMenuTexto = HUD.new(notificationMenuhudX + notificationMenuLabelDeltaX, notificationMenuhudY + notificationMenuLabelDeltaY, config.HUD.NotificationMenuText, true)
hudNotificationMenuTexto:setColor(config.HUD.MenuColorClosed[1], config.HUD.MenuColorClosed[2], config.HUD.MenuColorClosed[3])
hudNotificationMenuTexto:setFontSize(config.HUD.NotificationMenuTextSize)
hudNotificationMenuTexto:setDraggable(false)
hudNotificationMenuTexto:setCallback(OpenNotificationMenu)

-- LEVEL UP ITEM MENU DEFINITION
-- DEFINICAO DO ITEM DE MENU LEVEL UP
hudLevelUp = HUD.new(notificationMenuhudX + levelUpDeltaX, notificationMenuhudY + levelUpDeltaY, levelUpIcon, true)
hudLevelUp:setDraggable(false)
hudLevelUp:setCallback(ToggleLevelUpNotification)
hudLevelUp:setScale(config.HUD.LevelUpIconScale)
hudLevelUp:hide()

hudLevelUpText = HUD.new(notificationMenuhudX + levelUpDeltaX + levelUpLabelDeltaX, notificationMenuhudY + levelUpDeltaY + levelUpLabelDeltaY, config.HUD.LevelUpItemText, true)
ToogleLevelUpTextColor()
hudLevelUpText:setFontSize(config.HUD.LevelUpItemTextSize)
hudLevelUpText:setDraggable(false)
hudLevelUpText:setCallback(ToggleLevelUpNotification)
hudLevelUpText:hide()

-- SKILL UP ITEM MENU DEFINITION
-- DEFINICAO DO ITEM DE MENU SKILL UP
hudSkillUp = HUD.new(notificationMenuhudX + skillUpDeltaX, notificationMenuhudY + skillUpDeltaY, skillUpIcon, true)
hudSkillUp:setDraggable(false)
hudSkillUp:setCallback(ToggleSkillUpNotification)
hudSkillUp:setScale(config.HUD.SkillUpIconScale)
hudSkillUp:hide()

hudSkillUpText = HUD.new(notificationMenuhudX + skillUpDeltaX + skillUpLabelDeltaX, notificationMenuhudY + skillUpDeltaY + skillUpLabelDeltaY, config.HUD.SkillUpItemText, true)
ToogleSkillUpTextColor()
hudSkillUpText:setFontSize(config.HUD.SkillUpItemTextSize)
hudSkillUpText:setDraggable(false)
hudSkillUpText:setCallback(ToggleSkillUpNotification)
hudSkillUpText:hide()

-- PLAYER DEATH ITEM MENU DEFINITION
-- DEFINICAO DO ITEM DE MENU DE MORTES
hudDeath = HUD.new(notificationMenuhudX + deathDeltaX, notificationMenuhudY + deathDeltaY, deathIcon, true)
hudDeath:setDraggable(false)
hudDeath:setCallback(ToogleDeathNotification)
hudDeath:setScale(config.HUD.DeathIconScale)
hudDeath:hide()

hudDeathText = HUD.new(notificationMenuhudX + deathDeltaX + deathLabelDeltaX, notificationMenuhudY + deathDeltaY + deathLabelDeltaY, config.HUD.DeathItemText, true)
ToogleDeathTextColor()
hudDeathText:setFontSize(config.HUD.DeathItemTextSize)
hudDeathText:setDraggable(false)
hudDeathText:setCallback(ToogleDeathNotification)
hudDeathText:hide()

-- BOSS LOOT ITEM MENU DEFINITION
-- DEFINICAO DO ITEM DE MENU DE LOOT THE BOSS
hudLoot = HUD.new(notificationMenuhudX + lootDeltaX, notificationMenuhudY + lootDeltaY, lootIcon, true)
hudLoot:setDraggable(false)
hudLoot:setCallback(ToogleLootNotification)
hudLoot:setScale(config.HUD.LootItemScale)
hudLoot:hide()

hudLootText = HUD.new(notificationMenuhudX + lootDeltaX + lootLabelDeltaX, notificationMenuhudY + lootDeltaY + lootLabelDeltaY, GetLootItemText(), true)
ToogleLootTextColor()
hudLootText:setFontSize(config.HUD.LootItemTextSize)
hudLootText:setDraggable(false)
hudLootText:setCallback(ToogleLootNotification)
hudLootText:hide()

-- This wait is important to avoid HUD bugs because the getPos function takes a while to return the updated position of HUD elements.
-- Esse wait eh importante pra nao bugar a hud, pq getPos demora um pouco pra nao retornar 0,0
wait(300)

-- TIMER TO UPDATE HUD POSITION WHEN CHANGED
-- TIMER PARA ATUALIZAR A POSICAO DA HUD QUANDO ALTERADA
Timer("hudsPositions", function()
    local iconPos = hudNotificationMenu:getPos()

    if iconPos ~= nil and (iconPos.x ~= notificationMenuhudX or iconPos.y ~= notificationMenuhudY) then
        notificationMenuhudX = iconPos.x
        notificationMenuhudY = iconPos.y
        hudNotificationMenu:setPos(notificationMenuhudX, notificationMenuhudY)
        hudNotificationMenuTexto:setPos(notificationMenuhudX + notificationMenuLabelDeltaX, notificationMenuhudY + notificationMenuLabelDeltaY)
        hudLevelUp:setPos(notificationMenuhudX + levelUpDeltaX, notificationMenuhudY + levelUpDeltaY)
        hudLevelUpText:setPos(notificationMenuhudX + levelUpDeltaX + levelUpLabelDeltaX, notificationMenuhudY + levelUpDeltaY + levelUpLabelDeltaY)
        hudSkillUp:setPos(notificationMenuhudX + skillUpDeltaX, notificationMenuhudY + skillUpDeltaY)
        hudSkillUpText:setPos(notificationMenuhudX + skillUpDeltaX + skillUpLabelDeltaX, notificationMenuhudY + skillUpDeltaY + skillUpLabelDeltaY)
        hudDeath:setPos(notificationMenuhudX + deathDeltaX, notificationMenuhudY + deathDeltaY)
        hudDeathText:setPos(notificationMenuhudX + deathDeltaX + deathLabelDeltaX, notificationMenuhudY + deathDeltaY + deathLabelDeltaY)
        hudLoot:setPos(notificationMenuhudX + lootDeltaX, notificationMenuhudY + lootDeltaY)
        hudLootText:setPos(notificationMenuhudX + lootDeltaX + lootLabelDeltaX, notificationMenuhudY + lootDeltaY + lootLabelDeltaY)
        UpdateConfigFile("NotificationMenuhudX", notificationMenuhudX)
        UpdateConfigFile("NotificationMenuhudY", notificationMenuhudY)
    end
end, 1000)

-- ADDING THE CALLBACK TO THE TEXT MESSAGE EVENT TO SEND THE DISCORD MESSAGES
-- ADICIONANDO O CALLBACK DO EVENTO THE TEXT MESSAGE PARA ENVIAR AS MENSAGENS DO DISCORD
Game.registerEvent(Game.Events.TEXT_MESSAGE, OnTextEvent)
