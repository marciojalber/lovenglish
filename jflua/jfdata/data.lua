-- DEFINE DATA
local data = {}



-- METHODS
function data.contains(value, tbl)
    for _, v in pairs(tbl) do
        if v == value then
            return true
        end
    end
    
    return false
end



-- RETURN DATA
return data
