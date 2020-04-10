local shell = require("shell")

local args, options = shell.parse(...)

if #args < 1 then
    io.write("Usage: github <repo_file> [<filename>]")
    io.write("Downloads a file from the github.com/mikenoethiger/opencomputers repository.")
    return
end

repo_url = "https://raw.githubusercontent.com/mikenoethiger/opencomputers/master/"

function prog_url(prog_name)
    return repo_url .. prog_name
end

local filename = ""
if #args > 1 then
    filename = " " .. args[2]
end

result = shell.execute("wget -f " .. prog_url(args[1]) .. filename)
print(result)
