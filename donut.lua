local shades = {
    [0] = '.',
    ',',
    '-',
    '~',
    ':',
    ';',
    '=',
    '!',
    '*',
    '#',
    '$',
    '@'
}
local A, B = 1, 1
local b, z = {}, {}

io.write('\x1b[2J')
while true do
    for k = 0, 1759 do
        if k % 80 == 0 then
            b[k] = '\n'
        else
            b[k] = ' '
        end
        z[k] = 0
    end
    local cA, sA, cB, sB = math.cos(A), math.sin(A), math.cos(B), math.sin(B)
    for j = 0, 6.28, 0.07 do
        local ct, st = math.cos(j), math.sin(j)
        for i = 0, 6.28, 0.02 do
            local sp, cp = math.sin(i), math.cos(i)
            local h = ct + 2
            local D = 1 / (sp * h * sA + st * cA + 5)
            local t = sp * h * cA - st * sA
            local x, y = math.floor(40 + 30 * D * (cp * h * cB - t * sB)),
                math.floor(12 + 15 * D * (cp * h * sB + t * cB))
            local o = x + 80 * y
            if y < 22 and y > 0 and x > 0 and x < 80 and D > z[o] then
                z[o] = D
                local N = math.floor(8 * ((st * sA - sp * ct * cA) * cB - sp * ct * sA - st * cA - cp * ct * sB))
                b[o] = shades[math.max(N, 0)]
            end
        end
    end
    io.write("\x1b[H", table.concat(b))
    A = A + 0.04
    B = B + 0.02
end
