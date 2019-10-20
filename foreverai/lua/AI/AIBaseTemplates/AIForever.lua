--[[
    File    :   /lua/AI/AIBaseTemplates/MicroAI.lua
    Author  :   SoftNoob
    Summary :
        Lists AIs to be included into the lobby, see /lua/AI/CustomAIs_v2/SorianAI.lua for another example.
        Loaded in by /lua/ui/lobby/aitypes.lua, this loads all lua files in /lua/AI/CustomAIs_v2/
]]

BaseBuilderTemplate {
    BaseTemplateName = 'AIForever',
    Builders = {
        'AIForeverCommanderBuilder',
        'AIForever Intel Builder',

        -----------------------------
        -----------------------------
        -- Economy -- 
        -----------------------------
        -----------------------------

        'AIForever Reclaim Builders',
        'AIForever Mass Builder',
        'AIForever ExtractorUpgrades',
        'AIForever Energy Builder',
        'AIForever Mass Storage Builder',

        -----------------------------
        -----------------------------
        -- Factory Builders -- 
        -----------------------------
        -----------------------------

        'AIForever Engineer Builder',
        'AIForever Factory Builder',
        'AIForever Land Builder',
        'AIForever Air Builder',

        -----------------------------
        -----------------------------
        -- Platoon Formers -- 
        -----------------------------
        -----------------------------

        'AIForever Platoon Builder',
        'AIForever ScoutAirFormer',
        'AIForever ScoutLandFormer',
    },
    NonCheatBuilders = {
    },
    BaseSettings = { },
    ExpansionFunction = function(aiBrain, location, markerType)
        return 0
    end,
    
    FirstBaseFunction = function(aiBrain)
        local per = ScenarioInfo.ArmySetup[aiBrain.Name].AIPersonality
        if per == 'foreverai' or per == 'foreveraicheat' then
            return 1000, 'ForeverAI'
        end
        return -1
    end,
}