local UCBC = '/lua/editor/UnitCountBuildConditions.lua'
local EBC = '/lua/editor/EconomyBuildConditions.lua'
local IBC = '/lua/editor/InstantBuildConditions.lua'
local TBC = '/lua/editor/ThreatBuildConditions.lua'
local SAI = '/lua/ScenarioPlatoonAI.lua'
local SBC = '/lua/editor/SorianBuildConditions.lua'

    
BuilderGroup {
    BuilderGroupName = 'AIForever Air Builder',
    BuildersType = 'FactoryBuilder',
    Builder {
        BuilderName = 'AIForever Factory Bomber',
        PlatoonTemplate = 'T1AirBomber',
        Priority = 90,
        BuilderConditions = {
            { EBC, 'GreaterThanEconStorageRatio', { 0.0, 0.7}},
        },
        BuilderType = 'Air',
    },
    Builder {
        BuilderName = 'AIForever Factory Intie',
        PlatoonTemplate = 'T1AirFighter',
        Priority = 90,
        BuilderConditions = {
            { EBC, 'GreaterThanEconStorageRatio', { 0.0, 0.5}},
        },
        BuilderType = 'Air',
    },
}
