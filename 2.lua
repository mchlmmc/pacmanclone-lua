player = {
   name = "pacman",
   x = 11,
   y = 13
}

blinky = {
   name = "blinky",
   x = 10,
   y = 11,
   home = {
	  x=2,
	  y=2
   }
}

pinky = {
   name = "pinky",
   x = 11,
   y = 11,
   home = {
	  x=21,
	  y=2
   }
}

inky = {
   name = "inky",
   x = 12,
   y = 11,
   home = {
	  x=2,
	  y=21
   }
}

clyde = {
   name = "clyde",
   x = 13,
   y = 11,
   home = {
	  x=21,
	  y=21
   }   
}

-- The level must not contain any dead ends, for gameplay and
-- because of how the ghost pathfinding works

level = {
   {1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1},
   {1,0,0,0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,0,0,0,1},
   {1,0,1,1,1,0,1,1,1,0,1,1,0,1,1,1,0,1,1,1,0,1},
   {1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1},
   {1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1},
   {1,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,1},
   {1,0,1,1,1,1,1,0,1,0,1,1,0,1,0,1,1,1,1,1,0,1},
   {1,0,1,0,0,0,1,0,1,0,1,1,0,1,0,1,0,0,0,1,0,1},
   {1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1},
   {1,0,1,0,0,0,1,0,1,1,0,0,1,1,0,1,0,0,0,1,0,1},
   {1,0,1,1,0,1,1,0,1,0,0,0,0,1,0,1,1,0,1,1,0,1},
   {1,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,1},
   {1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1},
   {1,1,1,1,1,1,1,0,1,0,1,1,0,1,0,1,1,1,1,1,1,1},
   {1,0,0,0,0,0,0,0,1,0,1,1,0,1,0,0,0,0,0,0,0,1},
   {1,0,1,1,1,0,1,1,1,0,1,1,0,1,1,1,0,1,1,1,0,1},
   {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
   {1,1,1,0,1,1,1,0,1,1,1,1,1,1,0,1,1,1,0,1,1,1},
   {1,0,0,0,0,0,1,0,0,0,1,1,0,0,0,1,0,0,0,0,0,1},
   {1,0,1,1,1,0,1,1,1,0,1,1,0,1,1,1,0,1,1,1,0,1},
   {1,0,0,0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,0,0,0,1},   
   {1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1},   
}

-- The points must only be in accessible places or the game
-- will be impossible

points = {
   {0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0},
   {0,1,1,1,1,1,0,0,0,1,1,1,1,0,0,0,1,1,1,1,1,0},
   {0,1,0,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,0,1,0},
   {0,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,0},
   {0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0},
   {0,0,1,1,1,1,1,1,0,1,1,1,1,0,1,1,1,1,1,1,0,0},
   {0,1,0,0,0,0,0,1,0,1,0,0,1,0,1,0,0,0,0,0,1,0},
   {0,1,0,1,1,1,0,1,0,1,0,0,1,0,1,0,1,1,1,0,1,0},
   {0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0},
   {0,1,0,1,1,1,0,1,0,0,0,0,0,0,1,0,1,1,1,0,1,0},
   {0,1,0,0,1,0,0,1,0,0,0,0,0,0,1,0,0,1,0,0,1,0},
   {0,1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,1,0},
   {0,0,0,0,0,0,0,1,1,1,0,1,1,1,1,0,0,0,0,0,0,0},
   {0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,0,0,0,0,0,0},
   {0,0,1,1,1,1,1,1,0,1,0,0,1,0,1,1,1,1,1,1,0,0},
   {0,1,0,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,0,1,0},
   {0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0},
   {0,0,0,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0,1,0,0,0},
   {0,1,1,1,1,1,0,1,1,1,0,0,1,1,1,0,1,1,1,1,1,0},
   {0,1,0,0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0,0,1,0},
   {0,1,1,1,1,1,0,0,0,1,1,1,1,0,0,0,1,1,1,1,1,0},   
   {0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0},   
}

energizers = {
   {x=2,y=6},
   {x=21,y=6},
   {x=2,y=15},
   {x=21,y=15}
}

ghostwall = {
   x=11,
   y=10
}

fruitspawnpoints = {
   {x=11,y=13},
   {x=12,y=13},
   {x=13,y=13}
}

levelcolor = {
   r = 1,
   g = 0,
   b = 0.34
}

scatterlength = 7
scattertimes = 4
chaselength = 20
speed = 75
blinkyspeed = 40
pinkyspeed = 50
inkyspeed = 45
clydespeed = 47
