--[[
    File    :   /lua/AI/AIBaseTemplates/EconomyBuildConditions.lua
    Author  :   relentless
    Summary :
        Economy Build Conditions
]]

------

function GreaterThanEconStorageRatio(aiBrain, mStorageRatio, eStorageRatio)
    local econ = AIUtils.AIGetEconomyNumbers(aiBrain)
    -- If a paragon is present and we not stall mass or energy, return true
    if aiBrain.HasParagon and econ.MassStorageRatio >= 0.01 and econ.EnergyStorageRatio >= 0.01 then
        return true
    elseif econ.MassStorageRatio >= mStorageRatio and econ.EnergyStorageRatio >= eStorageRatio then
        return true
    end
    return false
end

function GreaterThanEconStorageRatio(aiBrain, mStorageRatio, eStorageRatio)
    local econ = AIUtils.AIGetEconomyNumbers(aiBrain)
    if (econ.MassStorageRatio >= mStorageRatio and econ.EnergyStorageRatio >= eStorageRatio) then
        LOG('GreaterThanEconStorageRatio returns true')
        return true
    end
    LOG('GreaterThanEconStorageRatio returns false')
    return false
end

------

function GreaterThanEconTrend(aiBrain, MassTrend, EnergyTrend)
    local econ = AIUtils.AIGetEconomyNumbers(aiBrain)
    -- If a paragon is present and we have at least a neutral m+e trend, return true
    LOG('Current Econ Trends M E: ', econ.MassTrend, econ.EnergyTrend)
    if aiBrain.HasParagon and econ.MassTrend >= 0 and econ.EnergyTrend >= 0 then
        return true
    elseif econ.MassTrend >= MassTrend and econ.EnergyTrend >= EnergyTrend then
        return true
    end
    return false
end

function GreaterThanEconIncome(aiBrain, MassIncome, EnergyIncome)
    -- If a paragon is present, return true
    if aiBrain.HasParagon then
        return true
    end
    local econ = AIUtils.AIGetEconomyNumbers(aiBrain)
    if (econ.MassIncome >= MassIncome and econ.EnergyIncome >= EnergyIncome) then
        return true
    end
    return false
end

function GreaterThanEconEfficiencyOverTime(aiBrain, MassEfficiency, EnergyEfficiency)
    local econ = AIUtils.AIGetEconomyNumbers(aiBrain)
    LOG('Mass Wanted :'..MassEfficiency..'Actual :'..econ.MassEfficiencyOverTime..'Energy Wanted :'..EnergyEfficiency..'Actual :'..econ.EnergyEfficiencyOverTime)
    if (econ.MassEfficiencyOverTime >= MassEfficiency and econ.EnergyEfficiencyOverTime >= EnergyEfficiency) then
        LOG('GreaterThanEconEfficiencyOverTime Returned True')
        return true
    end
    LOG('GreaterThanEconEfficiencyOverTime Returned False')
    return false
end

function GreaterThanMassIncomeToFactory(aiBrain, t1Drain, t2Drain, t3Drain)
    local econTime = aiBrain:GetEconomyOverTime()
    
    -- T1 Test
    local testCat = categories.TECH1 * categories.FACTORY
    local unitCount = aiBrain:GetCurrentUnits( testCat )
    -- Find units of this type being built or about to be built
    unitCount = unitCount + aiBrain:GetEngineerManagerUnitsBeingBuilt(testCat)
    
    local massTotal = unitCount * t1Drain

    -- T2 Test
    testCat = categories.TECH2 * categories.FACTORY
    unitCount = aiBrain:GetCurrentUnits( testCat )
    
    massTotal = massTotal + ( unitCount * t2Drain )
    
    -- T3 Test
    testCat = categories.TECH3 * categories.FACTORY
    unitCount = aiBrain:GetCurrentUnits( testCat )

    massTotal = massTotal + ( unitCount * t3Drain )    
    
    if not CompareBody( (econTime.MassIncome * 10), massTotal, '>' ) then
        LOG('Mass income to factory is false')
        return false
    end
    LOG('Mass income to factory is true')
    return true
end

