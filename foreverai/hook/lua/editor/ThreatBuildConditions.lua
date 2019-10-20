--[[
    File    :   /lua/AI/AIBaseTemplates/ThreatBuildConditions.lua
    Author  :   relentless
    Summary :
        Threat Build Conditions
]]

function EnemyThreatGreaterThanValueAtBase(aiBrain, locationType, threatValue, threatType, rings, builder)
    local testRings = rings or 10
    currentThreat = aiBrain:GetThreatAtPosition( aiBrain.BuilderManagers[locationType].FactoryManager:GetLocationCoords(), testRings, true, threatType or 'Overall' )
    --LOG('Threat Value Detected :'..currentThreat..'Threat Value Desired'..threatValue)
    if currentThreat > threatValue then
        --LOG('EnemyThreatGreaterThanValueAtBase returning true for : ', builder)
        return true
    end
    --LOG('EnemyThreatGreaterThanValueAtBase returning false for : ', builder)
    return false
end