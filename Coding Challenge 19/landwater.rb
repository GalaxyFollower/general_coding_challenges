#Example input:
#M = "land"
#o = "water"
#world = [[o,o,o,o,o,o,o,o,o,o,o],
#         [o,o,o,o,M,M,o,o,o,o,o],
#         [o,o,o,o,o,o,o,o,M,M,o],
#         [o,o,o,M,o,o,o,o,o,M,o],
#         [o,o,o,M,o,M,M,o,o,o,o],
#         [o,o,o,o,M,M,M,M,o,o,o],
#         [o,o,o,M,M,M,M,M,M,M,o],
#         [o,o,o,M,M,o,M,M,M,o,o],
#         [o,o,o,o,o,o,M,M,o,o,o],
#         [o,M,o,o,o,M,o,o,o,o,o],
#         [o,o,o,o,o,o,o,o,o,o,o]]
#x=5
#y=5

def findsize world, x, y
    if world[y][x] ==  "land"
        size = 1
        world[y][x] = "counted land"
        else
        return 0
    end
    
    offset=[[-1,1,0,0,-1,1,-1,1],[0,0,-1,1,-1,1,1,-1]]
    8.times do |i|
        xnew=x+offset[1][i]
        ynew=y+offset[2][i]
        size = size + findsize(world, x-1, y-1)
    end
    size
end
