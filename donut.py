from math import sin, cos

A, B = 1, 1

print('\x1b[2J', end='')
while True:
    b, z = bytearray(b' ') * 1760, [0] * 1760
    cA, sA, cB, sB = cos(A), sin(A), cos(B), sin(B)
    j = 0
    while j < 6.28:
        ct, st = cos(j), sin(j)
        i = 0
        while i < 6.28:
            sp, cp = sin(i), cos(i)
            h = ct + 2
            D = 1 / (sp * h * sA + st * cA + 5)
            t = sp * h * cA - st * sA
            x, y = int(40 + 30 * D * (cp * h * cB - t * sB)
                       ), int(12 + 15 * D * (cp * h * sB + t * cB))
            o = x + 80 * y
            if y < 22 and y > 0 and x > 0 and x < 80 and D > z[o]:
                z[o] = D
                N = int(8 * ((st * sA - sp * ct * cA) * cB -
                             sp * ct * sA - st * cA - cp * ct * sB))
                b[o] = b'.,-~:;=!*#$@'[max(N, 0)]
            i += 0.02
        j += 0.07
    print('\x1b[H', end='')
    print(''.join(chr(b[k]) if k % 80 != 0 else '\n' for k in range(1761)))
    A += 0.04
    B += 0.02
