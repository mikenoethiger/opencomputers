local shell = require("shell")

local args, options = shell.parse(...)

if #args < 1 then
    io.write("Usage: github <program> [<filename>]\n")
    io.write("Downloads a program from the github.com/mikenoethiger/opencomputers repository.\n")
    return
end

repo_url = "https://raw.githubusercontent.com/mikenoethiger/opencomputers/master/"

function prog_url(prog_name)
    return repo_url .. prog_name
end

local filename = ""
local url = prog_url(args[1])

if not string.find(url, ".lua$") then
    url = url .. ".lua"
end
if #args > 1 then
    filename = " " .. args[2]
end

result = shell.execute("wget -f " .. prog_url(args[1]) .. filename)
