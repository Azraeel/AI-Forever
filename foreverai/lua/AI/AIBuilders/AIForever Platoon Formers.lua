BuilderGroup {
    BuilderGroupName = 'AIForever Platoon Builder',
    BuildersType = 'PlatoonFormBuilder', -- A PlatoonFormBuilder is for builder groups of units.
    Builder {
        BuilderName = 'AIForever LandAttack Default',
        PlatoonTemplate = 'AIForever LandAttack Default', 
        Priority = 100,
        InstanceCount = 40,
        BuilderType = 'Any',
        BuilderData = {
            NeverGuardBases = true,
            NeverGuardEngineers = false,
            UseFormation = 'GrowthFormation',
        },        
        BuilderConditions = { },
    },

    Builder {
        BuilderName = 'AIForever LandAttack Small',
        PlatoonTemplate = 'AIForever LandAttack Small', 
        Priority = 101,
        InstanceCount = 50,
        BuilderType = 'Any',
        BuilderData = {
            NeverGuardBases = true,
            NeverGuardEngineers = false,
            UseFormation = 'AttackFormation',
        },        
        BuilderConditions = { },
    },

    Builder {
        BuilderName = 'AIForever LandAttack Medium',
        PlatoonTemplate = 'AIForever LandAttack Medium', 
        Priority = 102,
        InstanceCount = 60,
        BuilderType = 'Any',
        BuilderData = {
            NeverGuardBases = true,
            NeverGuardEngineers = false,
            UseFormation = 'AttackFormation',
        },        
        BuilderConditions = { },
    },

    Builder {
        BuilderName = 'AIForever LandAttack Large',
        PlatoonTemplate = 'AIForever LandAttack Large', 
        Priority = 103,
        InstanceCount = 70,
        BuilderType = 'Any',
        BuilderData = {
            NeverGuardBases = true,
            NeverGuardEngineers = false,
            UseFormation = 'AttackFormation',
        },        
        BuilderConditions = { },
    },

    Builder {
        BuilderName = 'AIForever Air Attack',
        PlatoonTemplate = 'BomberAttack',
        Priority = 100,
        InstanceCount = 2,
        BuilderType = 'Any',        
        BuilderConditions = { },
    },

    Builder {
        BuilderName = 'AIForever Air Intercept',
        PlatoonTemplate = 'AntiAirHunt',
        Priority = 100,
        InstanceCount = 200,
        BuilderType = 'Any',     
        BuilderConditions = { },
    },
}