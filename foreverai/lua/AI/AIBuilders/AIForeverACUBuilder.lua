local UCBC = '/lua/editor/UnitCountBuildConditions.lua'
local EBC = '/lua/editor/EconomyBuildConditions.lua'
local IBC = '/lua/editor/InstantBuildConditions.lua'
local TBC = '/lua/editor/ThreatBuildConditions.lua'
local SAI = '/lua/ScenarioPlatoonAI.lua'
local SBC = '/lua/editor/SorianBuildConditions.lua'

BuilderGroup {
    BuilderGroupName = 'AIForeverCommanderBuilder', 
    BuildersType = 'EngineerBuilder', -- The kind of builder this is.  One of 'EngineerBuilder', 'PlatoonFormBuilder', or 'FactoryBuilder'.

    Builder {
        BuilderName = 'AIForever Initial Commander BO', 
        PlatoonTemplate = 'CommanderBuilder', -- Specify what platoon template to use, see the PlatoonTemplates folder.
        Priority = 1000, -- Make this super high priority.  The AI chooses the highest priority builder currently available.
        BuilderConditions = { 
                { IBC, 'NotPreBuilt', {}}, -- Only run this if the base isn't pre-built.
            },
        InstantCheck = true,
        BuilderType = 'Any',
        PlatoonAddFunctions = { {SAI, 'BuildOnce'}, }, -- Flag this builder to be only run once.
        BuilderData = {
            Construction = {
                BaseTemplateFile = '/mods/foreverai/lua/AI/AIBuilders/ACUBaseTemplate.lua',
                BaseTemplate = 'ACUBaseTemplate',
                BuildStructures = { -- The buildings to make
                    'T1LandFactory',
                    'T1Resource',
                    'T1Resource',
                    'T1EnergyProduction',
                    'T1EnergyProduction',
                    'T1EnergyProduction',
                    'T1LandFactory',
                    'T1EnergyProduction',
                    'T1EnergyProduction',
                    'T1AirFactory',
                }
            }
        }
    },
}