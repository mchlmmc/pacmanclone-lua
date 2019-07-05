require("conf")

-- Game state
levelnum = 1
levelcount = 2
lives = 3
score = 0
currentfruit = 1
nextlife = LIFEINTERVAL

sounds = {
   ["game-start"] = {
	  priority = 1,
	  blocking = false,	  
	  looping = false,
	  layer = "all"
   },
   ["munch"] = {
	  priority = 1,
	  blocking = true,	  
	  looping = false,
	  layer = "munch"
   },
   ["energizer"] = {
	  priority = 2,
	  blocking = true,	  
	  looping = true,
	  layer = "munch"
   },
   ["eat-fruit"] = {
	  priority = 1,
	  blocking = false,	  
	  looping = false,
	  layer = "fruit"
   },
   ["eat-ghost"] = {
	  priority = 1,
	  blocking = false,	  
	  looping = false,
	  layer = "eat-ghost"
   },
   ["retreating"] = {
	  priority = 3,
	  blocking = true,
	  looping = false,
	  layer = "munch"
   },         
   ["death"] = {
	  priority = 1,
	  blocking = false,	  
	  looping = false,
	  layer = "all"
   }      
}

-- Frames are in the format x, y, w, h
-- Framelength of 0 means no animation
animations = {
   ["pacman-ball"] = {
	  framelength = 0,
	  frames = {
		 {TILEWIDTH * 2, 0, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["pacman-move-right"] = {
	  framelength = 0.075,
	  frames = {
		 {0, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH, 0, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["pacman-move-left"] = {
	  framelength = 0.075,
	  frames = {
		 {0, TILEHEIGHT, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH, TILEHEIGHT, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["pacman-move-up"] = {
	  framelength = 0.075,
	  frames = {
		 {0, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["pacman-move-down"] = {
	  framelength = 0.075,
	  frames = {
		 {0, TILEHEIGHT * 3, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH, TILEHEIGHT * 3, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["pacman-death"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 3, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 4, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 5, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 6, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 7, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 8, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 9, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 10, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 11, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 12, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 13, 0, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 10, TILEHEIGHT, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["energizer-oscillate"] = {
	  framelength = 0.075,
	  frames = {
		 {TILEWIDTH * 7, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 8, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 9, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 10, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 11, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 10, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 9, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 8, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 7, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["blinky-move-right"] = {
	  framelength = 0.1,
	  frames = {
		 {0, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["blinky-move-left"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 2, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 3, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["blinky-move-up"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 4, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 5, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["blinky-move-down"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 6, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 7, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["pinky-move-right"] = {
	  framelength = 0.1,
	  frames = {
		 {0, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["pinky-move-left"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 2, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 3, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["pinky-move-up"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 4, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 5, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["pinky-move-down"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 6, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 7, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["inky-move-right"] = {
	  framelength = 0.1,
	  frames = {
		 {0, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["inky-move-left"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 2, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 3, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["inky-move-up"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 4, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 5, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["inky-move-down"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 6, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 7, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["clyde-move-right"] = {
	  framelength = 0.1,
	  frames = {
		 {0, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["clyde-move-left"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 2, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 3, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["clyde-move-up"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 4, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 5, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["clyde-move-down"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 6, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 7, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT}
	  }
   },         
   ["ghost-scared"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 2, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 3, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["ghost-flash"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 2, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 5, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 3, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT},
		 {TILEWIDTH * 4, TILEHEIGHT * 2, TILEWIDTH, TILEHEIGHT}
	  }
   },   
   ["dead-move-right"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 2, TILEHEIGHT * 3, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["dead-move-left"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 3, TILEHEIGHT * 3, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["dead-move-up"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 4, TILEHEIGHT * 3, TILEWIDTH, TILEHEIGHT}
	  }
   },
   ["dead-move-down"] = {
	  framelength = 0.1,
	  frames = {
		 {TILEWIDTH * 5, TILEHEIGHT * 3, TILEWIDTH, TILEHEIGHT}
	  }
   }   
}

function playsound(soundname)
   for name, val in pairs(sounds) do
	  if sounds[soundname].layer == val.layer and name ~= soundsname then
		 if val.source:isPlaying() and val.blocking and sounds[soundname].priority < val.priority then
			return
		 elseif sounds[soundname].blocking then
			love.audio.stop(val.source)			
		 end
	  end
   end
   love.audio.play(sounds[soundname].source)
end

function updatescore(newscore)
   score = newscore
   if score > nextlife and lives <= 8 then
	  lives = lives + 1
	  nextlife = nextlife + LIFEINTERVAL
   end
end

function setanimation(character, animation)
   character.sprite.paused = false
   if character.sprite.animation ~= animation then
	  character.sprite.animation = animation
	  character.sprite.time = 0
	  character.sprite.frame = 1
   end
end

function iswall(x, y)
   if level[y] == nil then
	  return false
   end
   return level[y][x] == 1
end

function isghostwall(x, y)
   return ghostwall.y == y and (ghostwall.x == x or ghostwall.x + 1 == x)
end

function spawnfruit()
   -- Spawn fruit on one of the three fruit spawn points
   for i=1, #fruitspawnpoints do
	  local fruitonspot = false
	  for j=1, #fruits do
		 if fruits[j].x == fruitspawnpoints[i].x and fruits[j].y == fruitspawnpoints[i].y then
			fruitonspot = true
			break
		 end
	  end
	  if not fruitonspot and not (player.destx == fruitspawnpoints[i].x and player.desty == fruitspawnpoints[i].y) then
		 -- Clear point on spot to make way for fruit
		 if points[fruitspawnpoints[i].y][fruitspawnpoints[i].x] == 1 then
			dotseaten = dotseaten + 1
			points[fruitspawnpoints[i].y][fruitspawnpoints[i].x] = 0
		 end
		 fruits[#fruits + 1] = {
			name=FRUITVALUES[currentfruit][1],
			x=fruitspawnpoints[i].x,
			y=fruitspawnpoints[i].y,
			time=0
		 }
		 break
	  end
   end
end

function calculateghostdestination(ghost, targetpoint)
   ::checkset::
   local ghosty = math.floor(ghost.y / 16) + 1
   local ghostx = math.floor(ghost.x / 16) + 1
   -- Follow the path set for the ghost already
   if calculatedpaths[ghost.name] ~= nil and calculatedpaths[ghost.name].targetpoint.x == targetpoint.x and
	  calculatedpaths[ghost.name].targetpoint.y == targetpoint.y then
	  table.remove(calculatedpaths[ghost.name].nodes, 1)
	  if #calculatedpaths[ghost.name].nodes == 0 then
		 -- Ghost has reached the destination
		 calculatedpaths[ghost.name] = nil
	  end
	  ghost.destx = calculatedpaths[ghost.name].nodes[1].x
	  ghost.desty = calculatedpaths[ghost.name].nodes[1].y
	  return
   end
   -- If the ghost or target are not on nodes create temporary ones
   -- Ghost must be on a node or between two nodes
   -- Same for the target
   local tempghostnodecreated = pathgraph[ghosty][ghostx] == nil
   local temptargetnodecreated = pathgraph[targetpoint.y][targetpoint.x] == nil
   if tempghostnodecreated then
	  createtempnode(ghostx, ghosty)
   end
   if temptargetnodecreated then
	  createtempnode(targetpoint.x, targetpoint.y)
   end
   bestpossible = false
   bestpath = {
	  steps = math.huge
   }
   pathstack = {
	  steps = 0,
	  nodes = {
		 {
			x = ghostx,
			y = ghosty,
			edges = pathgraph[ghosty][ghostx].edges
		 }
	  }
   }
   calctimes = 0
   calculatebestpath(targetpoint)
   calculatedpaths[ghost.name] = {
	  targetpoint = targetpoint,
	  nodes = bestpath.nodes
   }
   if tempghostnodecreated then
	  removetempnode(ghostx, ghosty)
   end
   if temptargetnodecreated then
	  removetempnode(targetpoint.x, targetpoint.y)
   end
   -- Path is set, follow it by returning to the beginning of this function
   goto checkset
end

function calculatebestpath(endnode)
   -- Go back if the best is found or path is less efficient
   if bestpossible or pathstack.steps >= bestpath.steps then
	  return
   end
   -- Go back if the path is going in circles
   for i=1, #pathstack.nodes - 1 do
	  if pathstack.nodes[i].x == pathstack.nodes[#pathstack.nodes].x
	  and pathstack.nodes[i].y == pathstack.nodes[#pathstack.nodes].y then
		 return
	  end
   end
   -- Avoid the banned point as well
   if bannedpoint ~= nil and pathstack.nodes[#pathstack.nodes].x == bannedpoint.x and
	  pathstack.nodes[#pathstack.nodes].y == bannedpoint.y then
	  return
   end
   -- Reached the end   
   if pathstack.nodes[#pathstack.nodes].x == endnode.x
   and pathstack.nodes[#pathstack.nodes].y == endnode.y then
	  -- Best possible path	  
	  if pathstack.steps == 0 then
		 bestpossible = true
	  end
	  -- Save the path	  
	  if pathstack.steps < bestpath.steps or bestpossible then
		 bestpath = {
			nodes = {},
			steps = pathstack.steps
		 }
		 for i=1, #pathstack.nodes do
			bestpath.nodes[i] = {
			   x = pathstack.nodes[i].x,
			   y = pathstack.nodes[i].y
			}
		 end
		 return
	  end
   end
   -- Try nodes closer to the end first
   local trydirtable = {
	  trytopnode,
	  tryrightnode,
	  trybotnode,
	  tryleftnode
   }
   local diffy = endnode.y - pathstack.nodes[#pathstack.nodes].y
   local diffx = endnode.x - pathstack.nodes[#pathstack.nodes].x
   if diffy < 0 and math.abs(diffy) >= math.abs(diffx) then
	  trytopnode(endnode)
	  trydirtable[1] = nil
	  diffy = 0
   end
   if diffx > 0 and math.abs(diffx) >= math.abs(diffy) then
	  tryrightnode(endnode)
	  trydirtable[2] = nil
	  diffx = 0
   end
   if diffy > 0 and math.abs(diffy) >= math.abs(diffx) then
	  trybotnode(endnode)
	  trydirtable[3] = nil
	  diffy = 0
   end
   if diffx < 0 and math.abs(diffx) >= math.abs(diffy)  then
	  tryleftnode(endnode)
	  trydirtable[4] = nil
   end
   for i=1, #trydirtable do
	  if trydirtable[i] ~= nil then
		 trydirtable[i](endnode)
	  end
   end
end

function trytopnode(endnode)
   if pathstack.nodes[#pathstack.nodes].edges[1] == nil then
	  return
   end
   local thisnode = pathstack.nodes[#pathstack.nodes]
   -- Add spots between nodes to pathstack
   local nexty = thisnode.y
   for i=1, thisnode.edges[1] do
	  nexty = nexty - 1
	  if nexty < 1 then
		 nexty = LEVELHEIGHT
	  end
	  pathstack.nodes[#pathstack.nodes + 1] = {
		 x = thisnode.x,
		 y = nexty
	  }
	  pathstack.steps = pathstack.steps + 1
   end
   -- Add edges to new node to pathstack
   pathstack.nodes[#pathstack.nodes].edges =
	  pathgraph[pathstack.nodes[#pathstack.nodes].y][pathstack.nodes[#pathstack.nodes].x].edges
   -- Recurse
   calculatebestpath(endnode)
   -- Remove steps added to path
   for i=1, thisnode.edges[1] do
	  pathstack.nodes[#pathstack.nodes] = nil
	  pathstack.steps = pathstack.steps - 1
   end
end

function tryrightnode(endnode)
   if pathstack.nodes[#pathstack.nodes].edges[2] == nil then
	  return
   end
   local thisnode = pathstack.nodes[#pathstack.nodes]
   -- Add spots between nodes to pathstack
   local nextx = thisnode.x
   for i=1, thisnode.edges[2] do
	  nextx = nextx + 1
	  if nextx > LEVELWIDTH then
		 nextx = 1
	  end
	  pathstack.nodes[#pathstack.nodes + 1] = {
		 x = nextx,
		 y = thisnode.y
	  }
	  pathstack.steps = pathstack.steps + 1
   end
   -- Add edges to new node to pathstack
   pathstack.nodes[#pathstack.nodes].edges =
	  pathgraph[pathstack.nodes[#pathstack.nodes].y][pathstack.nodes[#pathstack.nodes].x].edges
   -- Recurse
   calculatebestpath(endnode)
   -- Remove steps added to path
   for i=1, thisnode.edges[2] do
	  pathstack.nodes[#pathstack.nodes] = nil
	  pathstack.steps = pathstack.steps - 1
   end
end

function trybotnode(endnode)
   if pathstack.nodes[#pathstack.nodes].edges[3] == nil then
	  return
   end
   local thisnode = pathstack.nodes[#pathstack.nodes]
   -- Add spots between nodes to pathstack
   local nexty = thisnode.y
   for i=1, thisnode.edges[3] do
	  nexty = nexty + 1
	  if nexty > LEVELHEIGHT then
		 nexty = 1
	  end
	  pathstack.nodes[#pathstack.nodes + 1] = {
		 x = thisnode.x,
		 y = nexty
	  }
	  pathstack.steps = pathstack.steps + 1
   end
   -- Add edges to new node to pathstack
   pathstack.nodes[#pathstack.nodes].edges =
	  pathgraph[pathstack.nodes[#pathstack.nodes].y][pathstack.nodes[#pathstack.nodes].x].edges
   -- Recurse
   calculatebestpath(endnode)
   -- Remove steps added to path
   for i=1, thisnode.edges[3] do
	  pathstack.nodes[#pathstack.nodes] = nil
	  pathstack.steps = pathstack.steps - 1
   end
end

function tryleftnode(endnode)
   if pathstack.nodes[#pathstack.nodes].edges[4] == nil then
	  return
   end
   local thisnode = pathstack.nodes[#pathstack.nodes]
   -- Add spots between nodes to pathstack
   local nextx = thisnode.x
   for i=1, thisnode.edges[4] do
	  nextx = nextx - 1
	  if nextx < 1 then
		 nextx = LEVELWIDTH
	  end
	  pathstack.nodes[#pathstack.nodes + 1] = {
		 x = nextx,
		 y = thisnode.y
	  }
	  pathstack.steps = pathstack.steps + 1
   end
   -- Add edges to new node to pathstack
   pathstack.nodes[#pathstack.nodes].edges =
	  pathgraph[pathstack.nodes[#pathstack.nodes].y][pathstack.nodes[#pathstack.nodes].x].edges
   -- Recurse
   calculatebestpath(endnode)
   -- Remove steps added to path
   for i=1, thisnode.edges[4] do
	  pathstack.nodes[#pathstack.nodes] = nil
	  pathstack.steps = pathstack.steps - 1
   end
end

function createtempnode(x, y)
   local topdist = 1
   local topy = y-1
   while true do
	  if topy < 1 then
		 topy = LEVELHEIGHT
	  end
	  if iswall(x, topy) then
		 break
	  end
	  if pathgraph[topy][x] ~= nil then
		 -- Find bottom
		 local botdist = 1
		 local boty = y + 1
		 while true do
			if boty > LEVELHEIGHT then
			   boty = 1
			end
			if iswall(x, boty) == 1 then
			   break
			end
			if pathgraph[boty][x] ~= nil then
			   pathgraph[y][x] = {
				  x = x,
				  y = y,
				  edges = {
					 [1] = topdist,
					 [3] = botdist
				  }
			   }
			   pathgraph[topy][x].edges[3] = topdist
			   pathgraph[boty][x].edges[1] = botdist
			   return
			end
			boty = boty + 1
			botdist = botdist + 1
			-- Stop infinite loops
			if botdist > LEVELHEIGHT then
			   break
			end
		 end
	  end
	  topy = topy - 1
	  topdist = topdist + 1
	  -- Stop infinite loops
	  if topdist > LEVELHEIGHT then
		 break
	  end
   end
   local leftdist = 1
   local leftx = x-1
   -- Don't bother checking for level collisions because since the
   -- edge is not vertical it must be horizontal. Same for infinite
   -- loops.
   while true do
	  if leftx < 1 then
		 leftx = LEVELWIDTH
	  end
	  if pathgraph[y][leftx] ~= nil then
		 -- Find right
		 local rightdist = 1
		 local rightx = x + 1
		 while true do
			if rightx > LEVELWIDTH then
			   rightx = 1
			end
			if pathgraph[y][rightx] ~= nil then
			   pathgraph[y][x] = {
				  x = x,
				  y = y,
				  edges = {
					 [2] = rightdist,
					 [4] = leftdist
				  }
			   }
			   pathgraph[y][rightx].edges[4] = rightdist
			   pathgraph[y][leftx].edges[2] = leftdist
			   return
			end
			rightdist = rightdist + 1
			rightx = rightx + 1
		 end
	  end
	  leftdist = leftdist + 1
	  leftx = leftx - 1
   end
end

function removetempnode(x, y)
   if pathgraph[y][x].edges[1] ~= nil then
	  -- Vertical node
	  local verticallength = pathgraph[y][x].edges[1] + pathgraph[y][x].edges[3]
	  local topy = y - pathgraph[y][x].edges[1]
	  if topy < 1 then
		 topy = LEVELHEIGHT + topy
	  end	  
	  pathgraph[topy][x].edges[3] = verticallength
	  local boty = y + pathgraph[y][x].edges[3]
	  if boty > LEVELHEIGHT then
		 boty = boty - LEVELHEIGHT
	  end
	  pathgraph[boty][x].edges[1] = verticallength
	  pathgraph[y][x] = nil
   else
	  -- Horizontal node
	  local horizontallength = pathgraph[y][x].edges[2] + pathgraph[y][x].edges[4]
	  local rightx = x + pathgraph[y][x].edges[2]
	  if rightx > LEVELWIDTH then
		 rightx = rightx - LEVELWIDTH
	  end
	  pathgraph[y][rightx].edges[4] = horizontallength
	  local leftx = x - pathgraph[y][x].edges[4]
	  if leftx < 1 then
		 leftx = LEVELWIDTH + leftx
	  end
	  pathgraph[y][leftx].edges[2] = horizontallength
	  pathgraph[y][x] = nil
   end
end

function moveghosttopoint(ghost, targetpoint)
   if ghost.resting and (ghost.x ~= ((targetpoint.x - 1) *  16)
						 or ghost.y ~= ((targetpoint.y - 1) * 16)) then
	  calculateghostdestination(ghost, targetpoint)	
	  ghost.resting = false
   end
   -- Wrapping destinations
   local ghosty = math.floor(ghost.y / 16) + 1
   local ghostx = math.floor(ghost.x / 16) + 1
   if ghosty == 1 and ghost.desty == LEVELHEIGHT then
	  ghost.desty = 0
   elseif ghostx == LEVELWIDTH and ghost.destx == 1 then
	  ghost.destx = LEVELWIDTH + 1
   elseif ghosty == LEVELHEIGHT and ghost.desty == 1 then
	  ghost.desty = LEVELHEIGHT + 1
   elseif ghostx == 1 and ghost.destx == LEVELWIDTH then
	  ghost.destx = 0
   end
   local prevspeed = ghost.speed
   if ghost.state == "dead" then
	  ghost.speed = DEADSPEED
   end
   if not ghost.resting then
	  if (ghost.destx - 1) * 16 > ghost.x then
		 if player.state == "energized" then
			if ghost.state == "dead" then
			   setanimation(ghost, "dead-move-right")
			else
			   if energizertime < (ENERGIZERDURATION / 1.5) then
				  setanimation(ghost, "ghost-scared")
			   else
				  setanimation(ghost, "ghost-flash")
			   end
			end
		 else			
			setanimation(ghost, ghost.name .. "-move-right")
		 end
		 ghost.x = ghost.x + (globaldt * ghost.speed)
		 if ghost.x > (ghost.destx - 1) * 16 then
			ghost.x = (ghost.destx - 1) * 16
			ghost.resting = true
			ghost.crossing = false
			ghost.sprite.paused = true
		 end
	  elseif (ghost.destx - 1) * 16 < ghost.x then
		 if player.state == "energized" then
			if ghost.state == "dead" then
			   setanimation(ghost, "dead-move-left")
			else
			   if energizertime < (ENERGIZERDURATION / 1.5) then
				  setanimation(ghost, "ghost-scared")
			   else
				  setanimation(ghost, "ghost-flash")
			   end
			end
		 else
			setanimation(ghost, ghost.name .. "-move-left")
		 end
		 ghost.x = ghost.x - (globaldt * ghost.speed)
		 if ghost.x < (ghost.destx - 1) * 16 then
			ghost.x = (ghost.destx - 1) * 16
			ghost.resting = true
			ghost.crossing = false
			ghost.sprite.paused = true
		 end
	  elseif (ghost.desty - 1) * 16 > ghost.y then
		 if player.state == "energized" then
			if ghost.state == "dead" then
			   setanimation(ghost, "dead-move-down")
			else
			   if energizertime < (ENERGIZERDURATION / 1.5) then
				  setanimation(ghost, "ghost-scared")
			   else
				  setanimation(ghost, "ghost-flash")
			   end
			end
		 else
			setanimation(ghost, ghost.name .. "-move-down")
		 end
		 ghost.y = ghost.y + (globaldt * ghost.speed)
		 if ghost.y > (ghost.desty - 1) * 16 then
			ghost.y = (ghost.desty - 1) * 16
			ghost.resting = true
			ghost.crossing = false
			ghost.sprite.paused = true
		 end
	  elseif (ghost.desty - 1) * 16 < ghost.y then
		 if player.state == "energized" then
			if ghost.state == "dead" then
			   setanimation(ghost, "dead-move-up")
			else
			   if energizertime < (ENERGIZERDURATION / 1.5) then
				  setanimation(ghost, "ghost-scared")
			   else
				  setanimation(ghost, "ghost-flash")
			   end
			end
		 else
			setanimation(ghost, ghost.name .. "-move-up")
		 end
		 ghost.y = ghost.y - (globaldt * ghost.speed)
		 if ghost.y < (ghost.desty - 1) * 16 then
			ghost.y = (ghost.desty - 1) * 16
			ghost.resting = true
			ghost.crossing = false
			ghost.sprite.paused = true
		 end		 
	  end
   end
   ghost.speed = prevspeed
   -- Wrapping around the map
   if not ghost.crossing then
	  if ghost.x < 0 then
		 ghost.destx = LEVELWIDTH
		 ghost.x = (16 * LEVELWIDTH) + 16
		 ghost.crossing = true
		 ghost.resting = false
	  elseif ghost.x > (16 * LEVELWIDTH) - 16 then
		 ghost.destx = 1
		 ghost.x = -16
		 ghost.crossing = true
		 ghost.resting = false
	  elseif ghost.y < 0 then
		 ghost.desty = LEVELHEIGHT
		 ghost.y = (16 * LEVELHEIGHT) + 16
		 ghost.crossing = true
		 ghost.resting = false
	  elseif ghost.y > (16 * LEVELHEIGHT) - 16 then
		 ghost.desty = 1
		 ghost.y = -16
		 ghost.crossing = true
		 ghost.resting = false		 
	  end
   end
end

function love.load()
   -- Random numbers
   math.randomseed(os.time())
   -- Sounds
   for name, val in pairs(sounds) do
	  val.source = love.audio.newSource("sounds/" .. name .. ".wav", "static")
	  val.source:setLooping(val.looping)
   end
   -- Graphics
   love.graphics.setDefaultFilter("nearest", "nearest")   
   -- Load the image assets
   spritesheet = love.graphics.newImage("spritesheet.png")
   images = {
	  {"cherry", TILEWIDTH * 2, TILEHEIGHT, TILEWIDTH, TILEHEIGHT},
	  {"strawberry", TILEWIDTH * 3, TILEHEIGHT, TILEWIDTH, TILEHEIGHT},
	  {"peach", TILEWIDTH * 4, TILEHEIGHT, TILEWIDTH, TILEHEIGHT},
	  {"apple", TILEWIDTH * 5, TILEHEIGHT, TILEWIDTH, TILEHEIGHT},
	  {"grapes", TILEWIDTH * 6, TILEHEIGHT, TILEWIDTH, TILEHEIGHT},
	  {"galaxian", TILEWIDTH * 7, TILEHEIGHT, TILEWIDTH, TILEHEIGHT},
	  {"bell", TILEWIDTH * 8, TILEHEIGHT, TILEWIDTH, TILEHEIGHT},
	  {"key", TILEWIDTH * 9, TILEHEIGHT, TILEWIDTH, TILEHEIGHT},
	  {"life", TILEWIDTH * 6, TILEHEIGHT * 2, 13, 13},
	  {"dot", TILEWIDTH * 8, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT},
	  {"topcap", TILEWIDTH * 9, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT},
	  {"rightcap", TILEWIDTH * 10, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT},
	  {"bottomcap", TILEWIDTH * 11, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT},
	  {"leftcap", TILEWIDTH * 12, TILEHEIGHT * 4, TILEWIDTH, TILEHEIGHT},
	  {"bottomrightblock", TILEWIDTH * 8, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT},
	  {"bottomleftblock", TILEWIDTH * 9, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT},
	  {"toprightblock", TILEWIDTH * 10, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT},
	  {"topleftblock", TILEWIDTH * 11, TILEHEIGHT * 5, TILEWIDTH, TILEHEIGHT},
	  {"bottomright", TILEWIDTH * 8, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT},
	  {"bottomleft", TILEWIDTH * 9, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT},
	  {"topright", TILEWIDTH * 10, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT},
	  {"topleft", TILEWIDTH * 11, TILEHEIGHT * 6, TILEWIDTH, TILEHEIGHT},
	  {"topline", TILEWIDTH * 8, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT},
	  {"bottomline", TILEWIDTH * 8, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT},
	  {"bottomline", TILEWIDTH * 9, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT},
	  {"leftline", TILEWIDTH * 10, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT},
	  {"rightline", TILEWIDTH * 11, TILEHEIGHT * 7, TILEWIDTH, TILEHEIGHT}	  
   }
   -- Load the quads
   for i=1, #images do
	  images[images[i][1]] = love.graphics.newQuad(images[i][2],
												   images[i][3],
												   images[i][4],
												   images[i][5],
												   spritesheet:getDimensions())
   end   
   -- Transform the animations to quads
   for name, animation in pairs(animations) do
	  for i=1, #animation.frames do
		 animations[name].frames[i] = love.graphics.newQuad(animation.frames[i][1],
															animation.frames[i][2],
															animation.frames[i][3],
															animation.frames[i][4],
															spritesheet:getDimensions())
	  end
   end
   -- Font   
   love.graphics.setFont(love.graphics.newFont("emulogic.ttf", 16))
   -- Initialize level
   loadlevel(levelnum)
end

function loadlevel(n)
   -- Play the start sound
   love.audio.play(sounds["game-start"].source)
   if levelnum == n then
	  package.loaded[tostring(n)] = nil
   end
   require(tostring(n))
   -- Game state
   started = false
   ended = false
   startedtime = 0
   endedtime = 0
   dotseaten = 0
   ghostseaten = 0
   energizertime = 0
   levelnum = n
   -- Dots
   dotcount = 0
   for y=1, LEVELHEIGHT do
	  for x=1, LEVELWIDTH do
		 if points[y][x] == 1 then
			dotcount = dotcount + 1
		 end
	  end
   end
   -- Initialize background   
   levelbackground = {
	  rendered = false,
	  canvas = love.graphics.newCanvas(16 * LEVELWIDTH, 16 * LEVELHEIGHT)
   }
   -- Objects
   for i=1, #energizers do
	  energizers[i].sprite = {}
	  setanimation(energizers[i], "energizer-oscillate")
   end
   fruits = {}
   -- Characters
   createcharacter(player)
   createcharacter(blinky)
   createcharacter(pinky)
   createcharacter(inky)
   createcharacter(clyde)
   blinky.speed = blinkyspeed
   pinky.speed = pinkyspeed
   inky.speed = inkyspeed
   clyde.speed = clydespeed
   player.sprite.animation = "pacman-ball"
   -- Generate pathfinding graph for the map
   generatepathgraph()
   calculatedpaths = {}
   -- For ghost AI
   randomtargets = {}
   ghostaicycle = "chase" --> General ghost ai
   ghostaitime = 0
   ghostscattertimes = 0
end

function createcharacter(character)
   character.startpoint = {
	  x = character.x,
	  y = character.y
   }
   character.destx = character.x
   character.desty = character.y
   character.x = (character.destx - 1) * 16
   character.y = (character.desty - 1) * 16
   character.resting = true
   character.crossing = false
   character.state = "normal"
   character.sprite = {
	  time = 0,
	  frame = 1,
	  paused = true,
	  animation = character.name .. "-move-right"
   }
end

-- Top edge is 1, right edge is 2, bottom edge is 3, left edge is 4

function isnode(x, y)   
   local horizontaljoint = false
   local verticaljoint = false
   if level[y][x] == 0 then
	  if x > 1 and level[y][x-1] == 0 then
		 horizontaljoint = true
	  elseif x < LEVELWIDTH and level[y][x+1] == 0 then
		 horizontaljoint = true
	  end
	  if y > 1 and level[y-1][x] == 0 then
		 verticaljoint = true
	  elseif y < LEVELHEIGHT and level[y+1][x] == 0 then
		 verticaljoint = true
	  end
	  if horizontaljoint and verticaljoint then
		 return true
	  end
   end
   return false
end

function generatepathgraph()
   -- Create the first node to begin mapping from
   pathgraph = {}
   for y=1, LEVELHEIGHT do
	  pathgraph[y] = {}
   end
   local getfirst = function ()
	  for x=1, LEVELWIDTH do
		 for y=1, LEVELHEIGHT do
			if isnode(x,y) then
			   return x, y
			end
		 end
	  end
   end
   firstx, firsty = getfirst()
   pathgraph[firsty][firstx] = {
	  x = firstx,
	  y = firsty,
	  edges = {}
   }
   getgraphedges(pathgraph[firsty][firstx])
   -- Recurse until the entire graph is mapped
   recursemappath(pathgraph[firsty][firstx])
end

function recursemappath(node)
   -- Top direction
   if node.edges[1] == "unmapped" then
	  local edgelength = 0
	  for y=node.y-1, 1, -1 do
		 edgelength = edgelength + 1
		 -- Don't repeat node recursions
		 if pathgraph[y][node.x] ~= nil then
			node.edges[1] = edgelength
			pathgraph[y][node.x].edges[3] = edgelength
			break
		 end
		 -- Corners
		 if level[y][node.x] == 1 then
			node.edges[1] = edgelength - 1
			pathgraph[y + 1][node.x] = {
			   x = node.x,
			   y = y + 1,
			   edges = {
				  [3] = edgelength - 1
			   }
			}
			getgraphedges(pathgraph[y + 1][node.x])
			recursemappath(pathgraph[y + 1][node.x])
			break
		 end
		 -- Loops
		 if y == 1 and level[LEVELHEIGHT][node.x] == 0 then
			local nexty = LEVELHEIGHT - 1
			while level[nexty][node.x] == 0 and not isnode(node.x, nexty) do
			   nexty = nexty - 1
			end
			edgelength = (LEVELHEIGHT - nexty) + edgelength + 1
			node.edges[1] = edgelength
			if pathgraph[nexty][node.x] == nil then
			   pathgraph[nexty][node.x] = {
				  x = node.x,
				  y = nexty,
				  edges = {
					 [3] = edgelength
				  }
			   }
			   getgraphedges(pathgraph[nexty][node.x])
			   recursemappath(pathgraph[nexty][node.x])
			else
			   pathgraph[nexty][node.x].edges[3] = edgelength
			end
			break
		 end
		 -- New nodes
		 if isnode(node.x, y) then
			node.edges[1] = edgelength
			-- Patch in node
			pathgraph[y][node.x] = {
			   x = node.x,
			   y = y,
			   edges = {
				  [3] = edgelength
			   }
			}
			getgraphedges(pathgraph[y][node.x])
			recursemappath(pathgraph[y][node.x])
			break
		 end
	  end
   end
   if node.edges[2] == "unmapped" then
	  local edgelength = 0
	  for x=node.x+1, LEVELWIDTH do
		 edgelength = edgelength + 1
		 -- Don't repeat node recursions
		 if pathgraph[node.y][x] ~= nil then
			node.edges[2] = edgelength
			pathgraph[node.y][x].edges[4] = edgelength
			break
		 end
		 -- Corners
		 if level[node.y][x] == 1 then
			node.edges[2] = edgelength - 1
			pathgraph[node.y][x - 1] = {
			   x = x - 1,
			   y = node.y,
			   edges = {
				  [4] = edgelength - 1
			   }
			}
			getgraphedges(pathgraph[node.y][x - 1])
			recursemappath(pathgraph[node.y][x - 1])
			break
		 end
		 -- Loops
		 if x == LEVELWIDTH and level[node.y][LEVELWIDTH] == 0 then
			local nextx = 1
			while level[node.y][nextx] == 0 and not isnode(nextx, node.y) do
			   nextx = nextx + 1
			end
			edgelength = nextx + edgelength
			node.edges[2] = edgelength
			if pathgraph[node.y][nextx] == nil then
			   pathgraph[node.y][nextx] = {
				  x = nextx,
				  y = node.y,
				  edges = {
					 [4] = edgelength
				  }
			   }
			   getgraphedges(pathgraph[node.y][nextx])
			   recursemappath(pathgraph[node.y][nextx])
			else
			   pathgraph[node.y][nextx].edges[4] = edgelength
			end
			break
		 end
		 -- New nodes
		 if isnode(x, node.y) then
			node.edges[2] = edgelength
			-- Patch in node
			pathgraph[node.y][x] = {
			   x = x,
			   y = node.y,
			   edges = {
				  [4] = edgelength
			   }
			}
			getgraphedges(pathgraph[node.y][x])
			recursemappath(pathgraph[node.y][x])
			break
		 end
	  end
   end
   if node.edges[3] == "unmapped" then
	  local edgelength = 0
	  for y=node.y+1, LEVELHEIGHT do
		 edgelength = edgelength + 1
		 -- Don't repeat node recursions
		 if pathgraph[y][node.x] ~= nil then
			node.edges[3] = edgelength
			pathgraph[y][node.x].edges[1] = edgelength
			break
		 end
		 -- Corners
		 if level[y][node.x] == 1 then
			node.edges[3] = edgelength - 1
			pathgraph[y - 1][node.x] = {
			   x = node.x,
			   y = y - 1,
			   edges = {
				  [1] = edgelength - 1
			   }
			}
			getgraphedges(pathgraph[y - 1][node.x])
			recursemappath(pathgraph[y - 1][node.x])			
			break
		 end
		 -- Loops
		 if y == LEVELHEIGHT and level[1][node.x] == 0 then
			local nexty = 1
			while level[nexty][node.x] == 0 and not isnode(node.x, nexty) do
			   nexty = nexty + 1
			end
			edgelength = nexty + edgelength
			node.edges[3] = edgelength
			if pathgraph[nexty][node.x] == nil then
 			   pathgraph[nexty][node.x] = {
				  x = node.x,
				  y = nexty,
				  edges = {
					 [1] = edgelength
				  }
			   }
			   getgraphedges(pathgraph[nexty][node.x])
			   recursemappath(pathgraph[nexty][node.x])
			else
			   pathgraph[nexty][node.x].edges[1] = edgelength
			end
			break
		 end
		 -- New nodes
		 if isnode(node.x, y) then
			node.edges[3] = edgelength
			-- Patch in node
			pathgraph[y][node.x] = {
			   x = node.x,
			   y = y,
			   edges = {
				  [1] = edgelength
			   }
			}
			getgraphedges(pathgraph[y][node.x])
			recursemappath(pathgraph[y][node.x])
			break
		 end
	  end
   end
   if node.edges[4] == "unmapped" then
	  local edgelength = 0
	  for x=node.x-1, 1, -1 do
		 edgelength = edgelength + 1
		 -- Don't repeat node recursions
		 if pathgraph[node.y][x] ~= nil then
			node.edges[4] = edgelength
			pathgraph[node.y][x].edges[2] = edgelength
			break
		 end
		 -- Corners
		 if level[node.y][x] == 1 then
			node.edges[4] = edgelength - 1
			pathgraph[node.y][x + 1] = {
			   x = x + 1,
			   y = node.y,
			   edges = {
				  [2] = edgelength - 1
			   }
			}
			getgraphedges(pathgraph[node.y][x + 1])
			recursemappath(pathgraph[node.y][x + 1])
			break
		 end
		 -- Loops
		 if x == 1 and level[node.y][1] == 0 then
			local nextx = LEVELWIDTH
			while level[node.y][nextx] == 0 and not isnode(nextx, node.y) do
			   nextx = nextx - 1
			end
			edgelength = (LEVELWIDTH - nextx) + edgelength + 1
			node.edges[4] = edgelength
			if pathgraph[node.y][nextx] == nil then
			   pathgraph[node.y][nextx] = {
				  x = nextx,
				  y = node.y,
				  edges = {
					 [4] = edgelength
				  }
			   }
			   getgraphedges(pathgraph[node.y][nextx])
			   recursemappath(pathgraph[node.y][nextx])
			else
			   pathgraph[node.y][nextx].edges[2] = edgelength
			end
			break
		 end
		 -- New nodes
		 if isnode(x, node.y) then
			-- Patch in node
			pathgraph[node.y][x] = {
			   x = x,
			   y = node.y,
			   edges = {
				  [2] = edgelength
			   }
			}
			node.edges[4] = edgelength
			getgraphedges(pathgraph[node.y][x])
			recursemappath(pathgraph[node.y][x])
			break
		 end
	  end
   end   
end

function getgraphedges(node)
   if node.edges[1] == nil and node.y > 1 and level[node.y-1][node.x] == 0 then
	  node.edges[1] = "unmapped"
   end
   if node.edges[2] == nil and node.x < LEVELWIDTH and level[node.y][node.x+1] == 0 then
	  node.edges[2] = "unmapped"
   end
   if node.edges[3] == nil and node.y < LEVELHEIGHT and level[node.y+1][node.x] == 0 then
	  node.edges[3] = "unmapped"
   end   
   if node.edges[4] == nil and node.x > 1 and level[node.y][node.x-1] == 0 then
	  node.edges[4] = "unmapped"
   end
end

function love.update(dt)
   -- Make dt global   
   globaldt = dt
   -- End of the game
   if levelnum < 1 then
	  return
   end
   -- Spawning and dying
   if startedtime < 5 then
	  startedtime = startedtime + dt
	  if startedtime > 4 then
		 started = true
	  else
		 return
	  end
   end
   if ended then
	  endedtime = endedtime + dt
	  if endedtime > 1.35 then
		 player.sprite.paused = true
	  end
	  if endedtime > 4 then
		 lives = lives - 1
		 if lives <= 0 then
			levelnum = -1
		 else
			loadlevel(levelnum)
		 end
	  end
	  return
   end
   -- Player controls
   if player.resting then
	  if love.keyboard.isDown("d") then
		 setanimation(player, "pacman-move-right")
		 if not iswall(player.destx + 1, player.desty) and not isghostwall(player.destx + 1, player.desty) then
			player.destx = player.destx + 1
			player.resting = false
		 end
	  elseif love.keyboard.isDown("a") then
		 setanimation(player, "pacman-move-left")
		 if not iswall(player.destx - 1, player.desty) and not isghostwall(player.destx - 1, player.desty) then
			player.destx = player.destx - 1 
			player.resting = false
		 end
	  elseif love.keyboard.isDown("w") then
		 setanimation(player, "pacman-move-up")		 
		 if not iswall(player.destx, player.desty - 1) and not isghostwall(player.destx, player.desty - 1) then
			player.desty = player.desty - 1
			player.resting = false
		 end
	  elseif love.keyboard.isDown("s") then
		 setanimation(player, "pacman-move-down")
		 if not iswall(player.destx, player.desty + 1) and not isghostwall(player.destx, player.desty + 1) then
			player.desty = player.desty + 1
			player.resting = false
		 end
	  elseif player.resting then
		 -- Stop the animation if the player is running into a wall
		 player.sprite.paused = true
	  end
   end
   if not player.resting then
	  if (player.destx - 1) * 16 > player.x then
		 player.x = player.x + (dt * speed)
		 if player.x > (player.destx - 1) * 16 then
			player.x = (player.destx - 1) * 16
			player.resting = true
			player.crossing = false
			player.sprite.paused = true
		 end
	  elseif (player.destx - 1) * 16 < player.x then
		 player.x = player.x - (dt * speed)
		 if player.x < (player.destx - 1) * 16 then
			player.x = (player.destx - 1) * 16
			player.resting = true
			player.crossing = false
			player.sprite.paused = true
		 end
	  elseif (player.desty - 1) * 16 > player.y then
		 player.y = player.y + (dt * speed)
		 if player.y > (player.desty - 1) * 16 then
			player.y = (player.desty - 1) * 16
			player.resting = true
			player.crossing = false
			player.sprite.paused = true
		 end
	  elseif (player.desty - 1) * 16 < player.y then
		 player.y = player.y - (dt * speed)
		 if player.y < (player.desty - 1) * 16 then
			player.y = (player.desty - 1) * 16
			player.resting = true
			player.crossing = false
			player.sprite.paused = true
		 end		 
	  end
   end
   -- Wrapping around the map
   if not player.crossing then
	  if player.x < 0 then
		 player.destx = LEVELWIDTH
		 player.x = (16 * LEVELWIDTH) + 16
		 player.crossing = true
		 player.resting = false
	  elseif player.x > (16 * LEVELWIDTH) - 16 then
		 player.destx = 1
		 player.x = -16
		 player.crossing = true
		 player.resting = false
	  elseif player.y < 0 then
		 player.desty = LEVELHEIGHT
		 player.y = (16 * LEVELHEIGHT) + 16
		 player.crossing = true
		 player.resting = false
	  elseif player.y > (16 * LEVELHEIGHT) - 16 then
		 player.desty = 1
		 player.y = -16
		 player.crossing = true
		 player.resting = false		 
	  end
   end
   -- Only interact with map if actually on map
   if not player.crossing then
	  -- Pick up points
	  if points[math.floor((player.y/16)+0.5) + 1][math.floor((player.x/16)+0.5) + 1] == 1 then
		 points[math.floor((player.y/16)+0.5) + 1][math.floor((player.x/16)+0.5) + 1] = 0
		 updatescore(score + 10)
		 -- Play mucnh sound
		 playsound("munch")
		 dotseaten = dotseaten + 1
		 if dotseaten >= dotcount then
			if levelnum >= levelcount then
			   levelnum = -2
			   return
			else
			   loadlevel(levelnum + 1)
			end
		 elseif dotseaten == 70 or dotseaten == 170 then
			-- Spawn in fruit
			spawnfruit()
			currentfruit = currentfruit + 1
			if currentfruit > #FRUITVALUES then
			   currentfruit = 1
			end
		 end
	  end
	  -- Pick up energizers
	  for i=1, #energizers do
		 -- Distance of 14 with pythagorean theorem
		 if math.sqrt(math.pow(math.abs(((energizers[i].x - 1) * 16) - player.x), 2)
					  + math.pow(math.abs(((energizers[i].y - 1) * 16) - player.y), 2)) < 14 then
			playsound("energizer")
			updatescore(score + 50)
			player.state = "energized"
			ghostseaten = 0
			energizertime = 0
			table.remove(energizers, i)
			break
		 end
	  end
	  -- Fruit logic
	  for i=1, #fruits do
		 -- Distance of 14 with pythagorean theorem
		 if math.sqrt(math.pow(math.abs(((fruits[i].x - 1) * 16) - player.x), 2)
					  + math.pow(math.abs(((fruits[i].y - 1) * 16) - player.y), 2)) < 14 then
			-- Find value of fruit eaten
			playsound("eat-fruit")
			for j=1, #FRUITVALUES do
			   if FRUITVALUES[j][1] == fruits[i].name then
				  updatescore(score + FRUITVALUES[j][2])
				  break
			   end
			end
			table.remove(fruits, i)
			break
		 end
		 -- Fruit decay
		 fruits[i].time = fruits[i].time + dt
		 if fruits[i].time > 10 then
			table.remove(fruits, i)
			break		 
		 end
	  end
   end
   -- Update energizer
   if player.state == "energized" then
	  energizertime = energizertime + dt
	  if energizertime > ENERGIZERDURATION then
		 player.state = "normal"
		 blinky.state = "normal"
		 setanimation(blinky, "blinky-move-down")
		 pinky.state = "normal"
		 setanimation(pinky, "pinky-move-down")
		 inky.state = "normal"
		 setanimation(inky, "inky-move-down")
		 clyde.state = "normal"
		 setanimation(clyde, "clyde-move-down")
		 energizertime = 0
		 love.audio.stop(sounds["energizer"].source)
	  end
   end
   -- Touching ghosts
   checktouchghost(blinky)
   checktouchghost(inky)
   checktouchghost(pinky)
   checktouchghost(clyde)
   if not started or ended then
	  return
   end
   -- Ghost AI
   if player.state == "energized" then
	  ghostenergizedai()
	  return
   end
   if ghostscattertimes < scattertimes then
	  ghostaitime = ghostaitime + dt
   end
   if ghostaicycle == "chase" and ghostaitime > chaselength then
	  ghostaitime = 0
	  ghostaicycle = "scatter"
   elseif ghostaicycle == "scatter" and ghostaitime > scatterlength then
	  ghostaitime = 0
	  ghostaicycle = "chase"
	  ghostscattertimes = ghostscattertimes + 1
   end
   if ghostaicycle == "chase" then
	  ghostchaseai()
   else
	  ghostscatterai()
   end
end

function checktouchghost(ghost)
   if not ((ghost.x > player.x + 16)
		 or (ghost.x + 16 < player.x)
		 or (ghost.y > player.y + 16)
         or (ghost.y + 16 < player.y))
   and ghost.state ~= "dead" then
	  if player.state == "energized" then
		 ghost.state = "dead"
		 ghostseaten = ghostseaten + 1
		 playsound("eat-ghost")
		 playsound("retreating")		 
		 updatescore(score + GHOSTPOINTS[ghostseaten])
	  else
		 blinky.sprite.paused = true
		 pinky.sprite.paused = true
		 inky.sprite.paused = true
		 clyde.sprite.paused = true
		 setanimation(player, "pacman-death")
		 playsound("death")
		 ended = true
	  end
   end
end

function moveghostrandom(ghost)
   if randomtargets[ghost.name] == nil
   or (ghost.destx == randomtargets[ghost.name].x and ghost.desty == randomtargets[ghost.name].y) then
	  repeat
		 randomtargets[ghost.name] = {
			x = math.random(LEVELWIDTH),
			y = math.random(LEVELHEIGHT)
		 }
	  until level[randomtargets[ghost.name].y][randomtargets[ghost.name].x] == 0 and
		 not isghostwall(x, y)
   end
   moveghosttopoint(ghost, randomtargets[ghost.name])
end

function ghostenergizedai()
   if blinky.state == "dead" then
	  moveghosttopoint(blinky, blinky.startpoint)
   else
	  moveghostrandom(blinky)
   end
   if pinky.state == "dead" then
	  moveghosttopoint(pinky, pinky.startpoint)
   else
	  moveghostrandom(pinky)
   end
   if inky.state == "dead" then
	  moveghosttopoint(inky, inky.startpoint)
   else
	  moveghostrandom(inky)
   end
   if clyde.state == "dead" then
	  moveghosttopoint(clyde, clyde.startpoint)
   else
	  moveghostrandom(clyde)
   end   
end

function ghostscatterai()
   moveghosttopoint(blinky, {x=blinky.home.x,y=blinky.home.y})
   moveghosttopoint(pinky, {x=pinky.home.x,y=pinky.home.y})
   moveghosttopoint(inky, {x=inky.home.x,y=inky.home.y})
   moveghosttopoint(clyde, {x=clyde.home.x,y=clyde.home.y})   
end

function ghostchaseai()
   -- Blinky just moves toward the player
   local playerx = player.destx
   if playerx > LEVELWIDTH then
	  playerx = 1
   elseif playerx < 0 then
	  playerx = LEVELWIDTH
   end
   local playery = player.desty
   if playery > LEVELHEIGHT then
	  playery = 1
   elseif playery < 0 then
	  playery = LEVELHEIGHT
   end
   
   moveghosttopoint(blinky, {x=playerx,y=playery})
   -- Pinky tries to cut off the player
   if #calculatedpaths["blinky"].nodes >= 2 then
	  local blinkydirection = calculatedpaths["blinky"].nodes[#calculatedpaths["blinky"].nodes - 1]
	  local pinkytarget = nil
	  if not iswall(playerx, playery - 1)
	  and (playery - 1 ~= blinkydirection.y or playerx ~= blinkydirection.x) then
		 pinkytarget = {
			x = playerx,
			y = playery - 1
		 }
	  elseif not iswall(playerx + 1, playery)
	  and (playery ~= blinkydirection.y or playerx + 1 ~= blinkydirection.x) then
		 pinkytarget = {
			x = playerx + 1,
			y = playery
		 }
	  elseif not iswall(playerx, playery + 1)
	  and (playery + 1 ~= blinkydirection.y or playerx ~= blinkydirection.x) then
		 pinkytarget = {
			x = playerx,
			y = playery + 1
		 }
	  elseif not iswall(playerx - 1, playery)
	  and (playery ~= blinkydirection.y or playerx - 1 ~= blinkydirection.x) then
		 pinkytarget = {
			x = playerx - 1,
			y = playery
		 }
	  else
		 pinkytarget = {
			x = playerx,
			y = playery
		 }
	  end
	  moveghosttopoint(pinky, pinkytarget)
   else
	  moveghosttopoint(pinky, {x=playerx,y=playery})
   end
   -- Inky moves at random
   moveghostrandom(inky)
   -- Clyde runs from the player (mostly)
   if clydetarget == nil then
	  clydetarget = {
			x = clyde.destx,
			y = clyde.desty
	  }
   end  
   while level[clydetarget.y][clydetarget.x] == 1
	  or (math.abs(clydetarget.x - playerx) < (LEVELWIDTH / 2) and
			 math.abs(clydetarget.y - playery) < (LEVELHEIGHT / 2))
   or isghostwall(clydetarget.x, clydetarget.y) do
	  clydetarget = {
		 x = math.random(LEVELWIDTH),
		 y = math.random(LEVELHEIGHT)
	  }
   end
   moveghosttopoint(clyde, clydetarget)
end

function renderbackground()
   love.graphics.setCanvas(levelbackground.canvas)
   local specialmaps = {
	  {
		 "leftcap",
		 {{0,0,2},
			{0,1,1},
			{0,0,2}}
	  },      
	  {
		 "topcap", 
		 {{0,0,0},
			{0,1,0},
			{2,1,2}}
	  },
	  {
		 "rightcap",
		 {{2,0,0},
			{1,1,0},
			{2,0,0}}
	  },
	  {
		 "bottomcap",
		 {{2,1,2},
			{0,1,0},
			{0,0,0}}
	  }
   }
   local cornermaps = {
	  {
		 "bottomright",
		 {{2,1,2},
			{1,1,0},
			{2,0,0}}
	  },      
	  {
		 "bottomleft", 
		 {{2,1,2},
			{0,1,1},
			{0,0,2}}
	  },
	  {
		 "topright",
		 {{2,0,0},
			{1,1,0},
			{2,1,2}}
	  },
	  {
		 "topleft",
		 {{0,0,2},
			{0,1,1},
			{2,1,2}}
	  }
   }
   local junctionmaps = {
	  {
		 "topright",
		 {{2,1,0},
			{2,1,1},
			{2,2,2}}
	  },      
	  {
		 "topleft", 
		 {{0,1,2},
			{1,1,2},
			{2,2,2}}
	  },
	  {
		 "bottomright",
		 {{2,2,2},
			{2,1,1},
			{2,1,0}}
	  },
	  {
		 "bottomleft",
		 {{2,2,2},
			{1,1,2},
			{0,1,2}}
	  }
   }   
   local oppositecorner = {["topleft"]="bottomright",["bottomright"]="topleft",["bottomleft"]="topright",["topright"]="bottomleft"}
   
   local gridmatches = function (a, b)
	  for j=1, 3 do
		 for k=1, 3 do
			if a[j][k] ~= b[j][k] then
			   return false
			end
		 end
	  end
	  return true
   end

   local cornermatches = function (a, b)
	  local opt = false
	  for j=1, 3 do
		 for k=1, 3 do
			if a[j][k] ~= b[j][k] then
			   if b[j][k] == 2 or a[j][k] == 2 then
				  if a[j][k] == 1 or b[j][k] == 1 then
					 opt = true
				  end
			   else
				  return false
			   end
			end
		 end
	  end
	  return true, opt
   end   

   local drawcell = function (x, y)
	  if level[y][x] == 0 then
		 return
	  end
	  local grid = {
		 {0,0,0},
		 {0,1,0},
		 {0,0,0}
	  }
	  -- Top
	  if y >= 2 and x >= 2 and level[y-1][x-1] == 1 then grid[1][1] = 1 end
	  if y >= 2 and level[y-1][x] == 1 then grid[1][2] = 1 end
	  if y >= 2 and x <= (LEVELWIDTH-1) and level[y-1][x+1] == 1 then grid[1][3] = 1 end
	  -- Bottom
	  if y <= (LEVELHEIGHT-1) and x >= 2 and level[y+1][x-1] == 1 then grid[3][1] = 1 end
	  if y <= (LEVELHEIGHT-1) and level[y+1][x] == 1 then grid[3][2] = 1 end
	  if y <= (LEVELHEIGHT-1) and x <= (LEVELWIDTH-1) and level[y+1][x+1] == 1 then grid[3][3] = 1 end
	  -- Left
	  if x >= 2 and level[y][x-1] == 1 then grid[2][1] = 1 end
	  -- Right
	  if x <= (LEVELWIDTH-1) and level[y][x+1] == 1 then grid[2][3] = 1 end
	  -- Empty and dot special cases
	  if gridmatches(grid, {{0,0,0},{0,1,0},{0,0,0}}) then
		 love.graphics.draw(spritesheet, images["dot"], (x-1) * 16, (y-1) * 16)
		 return
	  end
	  if gridmatches(grid, {{1,1,1},{1,1,1},{1,1,1}}) then
		 return
	  end
	  -- Caps special cases
	  for i=1, #specialmaps do
		 if cornermatches(grid, specialmaps[i][2]) then
			love.graphics.draw(spritesheet, images[specialmaps[i][1]], (x-1) * 16, (y-1) * 16)
			return
		 end
	  end
	  -- Corners
	  for i=1, #cornermaps do
		 local match, opt = cornermatches(grid, cornermaps[i][2])
		 if match then
			love.graphics.draw(spritesheet, images[cornermaps[i][1] .. "block"], (x-1) * 16, (y-1) * 16)
			if not opt then
			   love.graphics.draw(spritesheet, images[oppositecorner[cornermaps[i][1]]], (x-1) * 16, (y-1) * 16)
			end
			return
		 end
	  end
	  -- Junctions
	  for i=1, #junctionmaps do
		 if cornermatches(grid, junctionmaps[i][2]) then
			love.graphics.draw(spritesheet, images[junctionmaps[i][1]], (x-1) * 16, (y-1) * 16)
		 end
	  end	  
	  -- Lines
	  if grid[2][1] == 0 then
		 love.graphics.draw(spritesheet, images["leftline"], (x-1) * 16, (y-1) * 16)
	  end
	  if grid[2][3] == 0 then
		 love.graphics.draw(spritesheet, images["rightline"], (x-1) * 16, (y-1) * 16)
	  end
	  if grid[1][2] == 0 then
		 love.graphics.draw(spritesheet, images["topline"], (x-1) * 16, (y-1) * 16)
	  end
	  if grid[3][2] == 0 then
		 love.graphics.draw(spritesheet, images["bottomline"], (x-1) * 16, (y-1) * 16)
	  end
   end
   
   for x=1, LEVELWIDTH do
	  for y=1, LEVELHEIGHT do
		 drawcell(x, y)
	  end
   end
   love.graphics.setCanvas()
end

function drawsprite(x, y, sprite)
   -- Update sprite
   if sprite.paused == false and animations[sprite.animation].framelength ~= 0 then
	  sprite.time = sprite.time + globaldt
	  if sprite.time > animations[sprite.animation].framelength then
		 sprite.time = 0
		 sprite.frame = sprite.frame + 1
		 if sprite.frame > #animations[sprite.animation].frames then
			sprite.frame = 1
		 end
	  end
   end
   love.graphics.draw(spritesheet, animations[sprite.animation].frames[sprite.frame],
					  x * 2, (y * 2) + (16 * 4), 0, 2, 2)
   -- Handle character walking over bounds, draw two sprites to loop around
   if x < 0 then
	  love.graphics.draw(spritesheet, animations[sprite.animation].frames[sprite.frame],
						 ((LEVELWIDTH * 16) + x) * 2, (y * 2) + (16 * 4), 0, 2, 2)
   elseif x + 16 > (LEVELWIDTH * 16) then
	  love.graphics.draw(spritesheet, animations[sprite.animation].frames[sprite.frame],
						 (x - ((LEVELWIDTH * 16) + 16)) * 2, (y * 2) + (16 * 4), 0, 2, 2)
   elseif y < 0 then
	  love.graphics.draw(spritesheet, animations[sprite.animation].frames[sprite.frame],
						 x * 2, (((LEVELHEIGHT * 16) + y) * 2) + (16 * 4), 0, 2, 2)
   elseif y + 16 > (LEVELHEIGHT * 16) then
	  love.graphics.draw(spritesheet, animations[sprite.animation].frames[sprite.frame],
						 x * 2, ((y - ((LEVELHEIGHT * 16) + 16)) * 2) + (16 * 4), 0, 2, 2)
   end
end

function drawui()
   -- Black backgrounds for UI
   love.graphics.setColor(0, 0, 0, 1)
   love.graphics.rectangle("fill", 0, 0, LEVELWIDTH * 16 * 2, 16 * 4)
   love.graphics.rectangle("fill", 0, (LEVELHEIGHT * 16 * 2) + (16 * 4), LEVELWIDTH * 16 * 2, 16 * 2)   
   love.graphics.setColor(1, 1, 1, 1)
   -- Score
   love.graphics.print("SCORE", 16 * 4, 16 * 2)   
   love.graphics.print(string.format("%08d", score), 16 * 4, 16 * 3)
   -- Level
   love.graphics.print("LEVEL " .. levelnum, 16 * 32, 16 * 3)
   -- Lives
   for i=1, lives do
	  love.graphics.draw(spritesheet, images["life"], (16 * 4) + (13 * 2 * (i - 1)),
						 (LEVELHEIGHT * 16 * 2) + (16 * 4), 0, 2, 2)
   end
   -- Started time
   if startedtime < 2 then
	  love.graphics.printf("READY", 0, (LEVELHEIGHT * 16 * 2) + (16 * 4), LEVELWIDTH * 16 * 2, "center")
   elseif startedtime < 4 then
	  love.graphics.printf("SET", 0, (LEVELHEIGHT * 16 * 2) + (16 * 4), LEVELWIDTH * 16 * 2, "center")
   elseif startedtime < 5 then
	  love.graphics.printf("GO!", 0, (LEVELHEIGHT * 16 * 2) + (16 * 4), LEVELWIDTH * 16 * 2, "center")
   end
   -- Fruit
   local fruitindex = currentfruit
   for i=1, 3 do
	  love.graphics.draw(spritesheet, images[FRUITVALUES[fruitindex][1]],
						 (16 * 17 * 2) + (16 * 2 * (i - 1)),
						 (LEVELHEIGHT * 16 * 2) + (16 * 4), 0, 2, 2)
	  fruitindex = fruitindex + 1
	  if fruitindex > #FRUITVALUES then
		 fruitindex = 1
	  end
   end
end

function drawpoints()
   for x=1, LEVELWIDTH do
	  for y=1, LEVELHEIGHT do
		 if points[y][x] == 1 then
			love.graphics.rectangle("fill", (((x - 1) * 16) + 7) * 2, (((y - 1) * 16) + 7 + (16 * 2)) * 2, 4, 4)
		 end
	  end
   end
end

function love.draw()
   if levelnum < 0 then
	  drawscorescreen()
   else
	  drawgame()
   end
end

function drawscorescreen()
   if levelnum == -1 then
	  love.graphics.printf("GAME OVER", 0, LEVELHEIGHT * 16, LEVELWIDTH * 16 * 2, "center")
   else
	  love.graphics.printf("YOU WIN", 0, LEVELHEIGHT * 16, LEVELWIDTH * 16 * 2, "center")
   end
end

function drawgame()
   -- Draw background
   love.graphics.setColor(levelcolor.r, levelcolor.g, levelcolor.b, 1)
   if not levelbackground.rendered then
	  renderbackground()
   end
   love.graphics.clear()
   love.graphics.setColor(1, 1, 1, 1)
   love.graphics.draw(levelbackground.canvas, 0, 16 * 4, 0, 2, 2)
   -- Draw ghost wall
   love.graphics.rectangle("fill", (((ghostwall.x - 1) * 16) - 4) * 2, ((ghostwall.y - 1) * 16 + (16 * 2) + 7) * 2, 20 * 2 * 2, 2 * 2)
   -- Draw point orbs
   drawpoints()
   -- Draw mega points
   for i=1, #energizers do
	  drawsprite((energizers[i].x - 1) * 16, (energizers[i].y - 1) * 16, energizers[i].sprite)
   end
   -- Draw fruit
   for i=1, #fruits do
	  love.graphics.draw(spritesheet, images[fruits[i].name],
						 (fruits[i].x - 1) * 16 * 2, (((fruits[i].y - 1) * 16) + (16 * 2)) * 2, 0, 2, 2)
   end   
   -- Draw characters
   drawsprite(player.x, player.y, player.sprite)
   drawsprite(blinky.x, blinky.y, blinky.sprite)
   drawsprite(pinky.x, pinky.y, pinky.sprite)
   drawsprite(inky.x, inky.y, inky.sprite)
   drawsprite(clyde.x, clyde.y, clyde.sprite)   
   -- Draw UI on top with black rectangle background
   drawui()
   -- Draw pathfinding graph
--[[   love.graphics.setLineStyle("rough")
   love.graphics.setLineWidth(4)
   for x=1, LEVELWIDTH do
	  for y=1, LEVELHEIGHT do
		 if pathgraph[y][x] ~= nil then
			love.graphics.rectangle("fill", (pathgraph[y][x].x - 1) * 16 * 2,
									((pathgraph[y][x].y - 1) * 16 + (16 * 2)) * 2, 16 * 2, 16 * 2)
			if pathgraph[y][x].edges[1] ~= nil then
			   love.graphics.line(((pathgraph[y][x].x - 1) * 16 * 2) + (8 * 2),
				  (((pathgraph[y][x].y - 1) * 16 + (16 * 2)) * 2) + (8 * 2),
				  (((pathgraph[y][x].x - 1) * 16) * 2) + (8 * 2),
				  (((pathgraph[y][x].y - pathgraph[y][x].edges[1] - 1) * 16 + (16 * 2)) * 2) + (8 * 2))
			end
			if pathgraph[y][x].edges[2] ~= nil then
			   love.graphics.line(((pathgraph[y][x].x - 1) * 16 * 2) + (8 * 2),
				  (((pathgraph[y][x].y - 1) * 16 + (16 * 2)) * 2) + (8 * 2),
				  ((pathgraph[y][x].x + pathgraph[y][x].edges[2] - 1) * 16 * 2) + (8 * 2),
				  (((pathgraph[y][x].y - 1) * 16 + (16 * 2)) * 2) + (8 * 2))
			end
		 end
	  end
   end]]
end
