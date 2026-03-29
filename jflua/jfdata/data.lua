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

function data.clone(original, seen)
    if type(original) ~= "table" then
        return original
    end

    if seen and seen[original] then
        return seen[original] -- handle circular references
    end

    local copy = {}
    seen = seen or {}
    seen[original] = copy

    for k, v in pairs(original) do
        copy[deepCopy(k, seen)] = deepCopy(v, seen)
    end

    return setmetatable(copy, getmetatable(original))
end



-- RETURN DATA
return data
