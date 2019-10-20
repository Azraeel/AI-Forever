local UCBC = '/lua/editor/UnitCountBuildConditions.lua'
local EBC = '/lua/editor/EconomyBuildConditions.lua'
local IBC = '/lua/editor/InstantBuildConditions.lua'
local TBC = '/lua/editor/ThreatBuildConditions.lua'
local SAI = '/lua/ScenarioPlatoonAI.lua'
local SBC = '/lua/editor/SorianBuildConditions.lua'

    
BuilderGroup {
    BuilderGroupName = 'AIForever Land Builder',
    BuildersType = 'FactoryBuilder',
    Builder {
        BuilderName = 'AIForever Factory Tank',
        PlatoonTemplate = 'T1LandDFTank',
        Priority = 80,
        BuilderConditions = {
            { UCBC, 'HaveUnitRatio', { 0.65, categories.LAND * categories.DIRECTFIRE * categories.MOBILE,
                                       '<=', categories.LAND * categories.MOBILE - categories.ENGINEER } }, -- Don't make tanks if we have lots of them.
        },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'AIForever Factory Artillery',
        PlatoonTemplate = 'T1LandArtillery',
        Priority = 70,
        BuilderConditions = { },
        BuilderType = 'All',
    },
    Builder {
        BuilderName = 'AIForever Factory AntiAir',
        PlatoonTemplate = 'T1LandAA',
        Priority = 69,
        BuilderConditions = {
            { UCBC, 'HaveUnitRatio', { 0.25, categories.LAND * categories.ANTIAIR * categories.MOBILE,
                                       '<', categories.LAND  * categories.MOBILE - categories.ENGINEER } },
        },
        BuilderType = 'All',
    },
}