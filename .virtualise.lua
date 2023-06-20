term.clear()
term.setCursorPos(1, 1)

local complete = fs.complete
local list = fs.list
local exists = fs.exists
local isDir = fs.isDir
local open = fs.open
local makeDir = fs.makeDir
local delete = fs.delete
local move = fs.move
local copy = fs.copy
local getSize = fs.getSize
local getFreeSpace = fs.getFreeSpace
local find = fs.find



fs.complete = function(...)
    local a, b = ...

    if not string.sub(b, 1, 6) == "/.home" then
        b = "/.home" .. b
    end

    if string.sub(a, 1, 1) == "/" then
        if not string.sub(a, 1, 6) == "/.home" then
            a = "/.home" .. a
        end
    end


    return complete(a, b, select(3, ...))
end

fs.list = function(a)
    --print(debug.getinfo(2).source)
    --print(debug.getinfo(2).linedefined)
    if not ((string.sub(a, 1, 6) == "/.home") or (string.sub(a, 1, 5) == ".home")) then
        if string.sub(a, 1, 1) == "/" then
            return list("/.home" .. a)
        else
            return list("/.home/" .. a)
        end
    end
    return list(a)
end

fs.exists = function(a)
    if not ((string.sub(a, 1, 6) == "/.home") or (string.sub(a, 1, 5) == ".home")) then
        if string.sub(a, 1, 1) == "/" then
            return exists("/.home" .. a)
        else
            return exists("/.home/" .. a)
        end
    end
    return exists(a)
end

fs.isDir = function(a)
    if not ((string.sub(a, 1, 6) == "/.home") or (string.sub(a, 1, 5) == ".home")) then
        if string.sub(a, 1, 1) == "/" then
            return isDir("/.home" .. a)
        else
            return isDir("/.home/" .. a)
        end
    end
    return isDir(a)
end

fs.open = function(a, b)
    if not ((string.sub(a, 1, 6) == "/.home") or (string.sub(a, 1, 5) == ".home")) then
        if string.sub(a, 1, 1) == "/" then
            return open("/.home" .. a, b)
        else
            return open("/.home/" .. a, b)
        end
    end
    return open(a, b)
end

fs.makeDir = function(a)
    if not ((string.sub(a, 1, 6) == "/.home") or (string.sub(a, 1, 5) == ".home")) then
        if string.sub(a, 1, 1) == "/" then
            return makeDir("/.home" .. a)
        else
            return makeDir("/.home/" .. a)
        end
    end
    return makeDir(a)
end

fs.delete = function(a)
    if not ((string.sub(a, 1, 6) == "/.home") or (string.sub(a, 1, 5) == ".home")) then
        if string.sub(a, 1, 1) == "/" then
            return delete("/.home" .. a)
        else
            return delete("/.home/" .. a)
        end
    end
    return delete(a)
end

fs.move = function(a, b)
    if not ((string.sub(a, 1, 6) == "/.home") or (string.sub(a, 1, 5) == ".home")) then
        if string.sub(a, 1, 1) == "/" then
            a = "/.home" .. a
        else
            a = "/.home/" .. a
        end
    end
    if not ((string.sub(b, 1, 6) == "/.home") or (string.sub(b, 1, 5) == ".home")) then
        if string.sub(b, 1, 1) == "/" then
            b = "/.home" .. b
        else
            b = "/.home/" .. b
        end
    end
    print(a, b)
    return move(a, b)
end

fs.copy = function(a, b)
    if not ((string.sub(a, 1, 6) == "/.home") or (string.sub(a, 1, 5) == ".home")) then
        if string.sub(a, 1, 1) == "/" then
            a = "/.home" .. a
        else
            a = "/.home/" .. a
        end
    end
    if not ((string.sub(b, 1, 6) == "/.home") or (string.sub(b, 1, 5) == ".home")) then
        if string.sub(b, 1, 1) == "/" then
            b = "/.home" .. b
        else
            b = "/.home/" .. b
        end
    end
    return copy(a, b)
end

fs.find = function(a)
    if not ((string.sub(a, 1, 6) == "/.home") or (string.sub(a, 1, 5) == ".home")) then
        if string.sub(a, 1, 1) == "/" then
            return find("/.home" .. a)
        else
            return find("/.home/" .. a)
        end
    end
    return find(a)
end

--print(fs.list("")[1])
local function activateShell()
    require("/rom/programs/shell")
    shell.run("shutdown")
end

local function payload()
    
end



parallel.waitForAll(payload, activateShell)