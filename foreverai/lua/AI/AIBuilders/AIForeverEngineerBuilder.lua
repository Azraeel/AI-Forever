local UCBC = '/lua/editor/UnitCountBuildConditions.lua'
local EBC = '/lua/editor/EconomyBuildConditions.lua'
local IBC = '/lua/editor/InstantBuildConditions.lua'
local TBC = '/lua/editor/ThreatBuildConditions.lua'
local SAI = '/lua/ScenarioPlatoonAI.lua'
local SBC = '/lua/editor/SorianBuildConditions.lua'
local MIBC = '/lua/editor/MiscBuildConditions.lua'


BuilderGroup {
    BuilderGroupName = 'AIForever Engineer Builder',
    BuildersType = 'FactoryBuilder',
    Builder {
        BuilderName = 'AIForever Factory Engineer',
        PlatoonTemplate = 'T1BuildEngineer',
        Priority = 1000, -- Top factory priority
        BuilderConditions = {
            { UCBC, 'PoolLessAtLocation', { 'LocationType', 1, categories.MOBILE * categories.ENGINEER * categories.TECH1 } },

            { UCBC, 'LocationFactoriesBuildingLess', { 'LocationType', 2, categories.MOBILE * categories.ENGINEER * categories.TECH1} },
        },
        BuilderType = 'All',
    },
}

BuilderGroup {
    BuilderGroupName = 'AIForever Reclaim Builders',
    BuildersType = 'EngineerBuilder',
    Builder {
        BuilderName = 'AIForever Engineer Reclaim T1', 
        PlatoonTemplate = 'T1EngineerReclaimer',
        PlatoonAIPlan = 'ReclaimAI',
        Priority = 1100,
        InstanceCount = 3,
        BuilderConditions = {
                { MIBC, 'ReclaimablesInArea', { 'LocationType', }},

                { EBC, 'LessThanEconStorageRatio', { 0.50, 1}},

            },
        BuilderData = {
            LocationType = 'LocationType',
        },
        BuilderType = 'Any',
    },
}