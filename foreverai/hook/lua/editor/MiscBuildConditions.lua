

-- ##############################################################################################################
-- # function: ReclaimablesInArea = BuildCondition   doc = "Please work function docs."
-- #
-- # parameter 0: string   aiBrain     = "default_brain"
-- # parameter 1: string   locType     = "MAIN"
-- #
-- ##############################################################################################################
function ReclaimablesInArea(aiBrain, locType)
    if aiBrain:GetEconomyStoredRatio('MASS') > .9 then
        return false
    end
    
    if aiBrain:GetEconomyStoredRatio('ENERGY') > .9 then
        return false
    end
    
    local ents = AIUtils.AIGetReclaimablesAroundLocation( aiBrain, locType )
    if ents and table.getn(ents) > 0 then
        --LOG('Engineer Reclaim condition returned true')
        return true
    end
    
    return false
end