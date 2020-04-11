robot = require("robot")
sides = require("sides")
local shell = require("shell")

local args, options = shell.parse(...)

-- Interesting API calls
-- robot.inventorySize(): number
-- robot.space([slot: number]): number
-- robot.select()
-- left-click:
--   robotobot.swing([side: number, [sneaky:boolean]]): boolean[, string]
-- right-click:
--   robot.use([side: number[, sneaky: boolean[, duration: number]]]): boolean[, string]
-- robot.place([side: number[, sneaky: boolean]]): boolean[, string]

function goToEdge()
    -- go forward until air is below the robot
    -- then go down one block
    -- then turnRight() until solid block in front
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

result = goToEdge()
if not result then
    io.write("could not find edge")
    return
end

robot.down()

if not turnUntilSolidInFront() then
    io.write("could not find solid")
    return
end

-- turnRight
-- placeFront
-- back
-- turnLeft
-- detect
--

function buildRound()
    robot.turnRight()
    robot.place(sides.front)
    while robot.back() do
        robot.place(sides.front)
        robot.turnLeft()
        if not robot.detect() then
            -- go around edge
            robot.forward()
            robot.turnRight()
            robot.turnRight()
            robot.place(sides.front)
            robot.turnLeft()
        end
        robot.turnRight()
    end

    -- finished round
    robot.turnLeft()
    robot.back()
    robot.place()
end

rounds = 1
if #args > 0 then
    rounds = args[1]
end

for i = 1,rounds,1 do
    buildRound()
end

io.write("finished!")
