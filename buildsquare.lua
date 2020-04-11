robot = require("robot")
sides = require("sides")
local shell = require("shell")

local args, options = shell.parse(...)

function goToEdge()
    -- go forward until air is below the robot, then go down one block,
    -- then turnRight() until solid block in front.
    while robot.detectDown() do
        if not robot.forward() then
            return false
        end
    end
    return true
end

function turnUntilSolidInFront()
    for i = 0,3,1 do
        if robot.detect() then
            return true
        end
        robot.turnLeft()
    end
    return false
end

function buildSquare()
    edges = 0
    robot.turnRight()
    robot.place(sides.front)
    -- It is possible that robot.back() always works, if the initial block
    -- was placed to an edge. To prevent this endless loop, we count
    -- the number of edges crossed since one round only includes 4 edges
    while robot.back() and edges < 5 do
        robot.place(sides.front)
        robot.turnLeft()
        if not robot.detect() then
            -- go around edge
            robot.forward()
            robot.turnRight()
            robot.turnRight()
            robot.place(sides.front)
            robot.turnLeft()
            edges = edges + 1
        end
        robot.turnRight()
    end

    -- finished round
    robot.turnLeft()
    robot.back()
    robot.place()
end

io.write("Finding edge...\n")

if not goToEdge() then
    io.write("Could not find edge\n")
    return
end

robot.down()

if not turnUntilSolidInFront() then
    io.write("Could not find solid\n")
    return
end

rounds = 1
if #args > 0 then
    rounds = tonumber(args[1])
end

io.write("Starting to build, " .. rounds .. " rounds\n")

for i = 1,rounds,1 do
    io.write(i .. ". round...\n")
    buildSquare()
end

io.write("finished!\n")
