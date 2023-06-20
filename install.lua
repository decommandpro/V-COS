if fs.getFreeSpace("") < 700000 then
    fs.delete(shell.getRunningProgram())
    os.reboot()
end
fs.makeDir("/.home")
for i, v in pairs(fs.list("")) do
    if (v ~= shell.getRunningProgram()) and (v ~= ".home") then
        fs.copy(v, "/.home/" .. v)
        pcall(function() fs.delete(v) end)
    end
end
fs.delete("/.home/rom/programs/shell.lua")
local file
local req
file = fs.open("/.home/rom/programs/shell.lua", "w")
repeat
    req = http.get("https://raw.githubusercontent.com/decommandpro/V-COS/main/shell.lua")
until req
file.write(req.readAll())
file.close()
file = fs.open("/.virtualise.lua", "w")
repeat
    req = http.get("https://raw.githubusercontent.com/decommandpro/V-COS/main/.virtualise.lua")
until req
file.write(req.readAll())
file.close()
file = fs.open("/startup.lua", "w")
repeat
    req = http.get("https://raw.githubusercontent.com/decommandpro/V-COS/main/startup.lua")
until req
file.write(req.readAll())
file.close()
fs.delete(shell.getRunningProgram())
os.reboot()