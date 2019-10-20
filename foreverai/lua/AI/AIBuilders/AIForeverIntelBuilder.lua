local UCBC = '/lua/editor/UnitCountBuildConditions.lua'
local EBC = '/lua/editor/EconomyBuildConditions.lua'
local IBC = '/lua/editor/InstantBuildConditions.lua'
local TBC = '/lua/editor/ThreatBuildConditions.lua'
local SAI = '/lua/ScenarioPlatoonAI.lua'
local SBC = '/lua/editor/SorianBuildConditions.lua'
local MIBC = '/lua/editor/MiscBuildConditions.lua'

BuilderGroup {
    BuilderGroupName = 'AIForever Intel Builder',
    BuildersType = 'FactoryBuilder',
    Builder {
        BuilderName = 'AIForever Factory Scout Land',
        PlatoonTemplate = 'T1LandScout',
        Priority = 100,
        BuilderConditions = {
        { UCBC, 'HaveLessThanUnitsWithCategory', { 2, categories.LAND * categories.SCOUT } },

        },
        BuilderType = 'All',
    },

    Builder {
        BuilderName = 'AIForever Factory Scout Air',
        PlatoonTemplate = 'T1AirScout',
        Priority = 100,
        BuilderConditions = {
        { UCBC, 'HaveLessThanUnitsWithCategory', { 2, categories.AIR * categories.SCOUT } },

        },
        BuilderType = 'All',
    },

    Builder {
        BuilderName = 'AIForever Radar T1',
        PlatoonTemplate = 'EngineerBuilder',
        Priority = 1000,
        BuilderConditions = {
            { UCBC, 'UnitsLessAtLocation', { 'LocationType', 1, (categories.RADAR + categories.OMNI) * categories.STRUCTURE}},

            { UCBC, 'PoolGreaterAtLocation', { 'LocationType', 0, 'ENGINEER TECH1' }},

            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 1, categories.STRUCTURE * categories.FACTORY * categories.LAND } },

            { MIBC, 'GreaterThanGameTime', { 240 } },
        },
        BuilderType = 'Any',
        BuilderData = {
            Construction = {
                AdjacencyCategory = categories.STRUCTURE * categories.ENERGYPRODUCTION,
                AdjacencyDistance = 50,
                BuildStructures = {
                    'T1Radar',
                },
                Location = 'LocationType',
            }
        }
    },

    Builder {
        BuilderName = 'RNGAI T1 Radar Upgrade',
        PlatoonTemplate = 'T1RadarUpgrade',
        Priority = 600,
        BuilderConditions = {
            { UCBC, 'HaveLessThanUnitsWithCategory', { 1, categories.OMNI * categories.STRUCTURE }},
            
            { MIBC, 'GreaterThanGameTime', { 480 } },
        },
        BuilderType = 'Any',
    },
}

BuilderGroup {
    BuilderGroupName = 'AIForever ScoutLandFormer',
    BuildersType = 'PlatoonFormBuilder',
    Builder {
        BuilderName = 'AIForever Former Scout',
        PlatoonTemplate = 'T1LandScoutForm',
        Priority = 1000,
        InstanceCount = 3,
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.LAND * categories.SCOUT } },
        },
        LocationType = 'LocationType',
        BuilderType = 'Any',
    },
}

BuilderGroup {
    BuilderGroupName = 'AIForever ScoutAirFormer',
    BuildersType = 'PlatoonFormBuilder',
    Builder {
        BuilderName = 'AIForever Former Scout T1',
        PlatoonTemplate = 'T1AirScoutForm',
        InstanceCount = 2,
        Priority = 900,
        BuilderConditions = {
            { UCBC, 'HaveGreaterThanUnitsWithCategory', { 0, categories.AIR * categories.SCOUT } },
        },
        LocationType = 'LocationType',
        BuilderType = 'Any',
    },
}