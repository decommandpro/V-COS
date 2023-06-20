fs.makeDir("/.home")
for i, v in pairs(fs.list("")) do
    if (v ~= shell.getRunningProgram()) and (v ~= ".home") then
        fs.copy(v, "/.home/" .. v)
    end
end
