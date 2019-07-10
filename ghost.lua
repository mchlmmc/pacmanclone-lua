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
   local firstx, firsty = getfirst()
   pathgraph[firsty][firstx] = {}
   -- This will recurse until the entire graph is mapped
   createnode(firstx, firsty)
end

function printgraph()
   for x=1, LEVELWIDTH do
	  for y=1, LEVELHEIGHT do
		 if pathgraph[y][x] ~= nil then
			print(x .. "," .. y .. ":")
			for i=1, 4 do
			   if pathgraph[y][x][i] ~= nil then
				  print("[" .. i .. "]: " .. pathgraph[y][x][i])
			   end
			end
		 end
	  end
   end
end

-- Nodes occur at intersections and dead ends
-- Intersections are where two lines meet,
-- Dead ends are where there is only one way: back
function isnode(x, y)   
   local horizontaljoint = false
   local verticaljoint = false
   local endcount = 0
   if level[y][x] == 0 then
	  if x > 1 then
		 if level[y][x-1] == 0 then
			horizontaljoint = true
			endcount = endcount + 1
		 end
	  else
		 endcount = 2
	  end
	  if x < LEVELWIDTH then
		 if level[y][x+1] == 0 then
			horizontaljoint = true
			endcount = endcount + 1
		 end
	  else
		 endcount = 2
	  end
	  if y > 1 then
		 if level[y-1][x] == 0 then
			verticaljoint = true
			endcount = endcount + 1
		 end
	  else
		 endcount = 3
	  end
	  if y < LEVELHEIGHT then
		 if level[y+1][x] == 0 then
			verticaljoint = true
			endcount = endcount + 1
		 end
	  else
		 endcount = 4
	  end
	  if horizontaljoint and verticaljoint then
		 return true
	  end
   end
   return endcount == 1
end

-- End edges at corners, dead ends or intersections
-- Create a new node at these spots if needed
-- Factor in loops
function createedge(x, y, direction)
   local edgelength = 0
   local startx = x
   local starty = y
   if direction == 1 then
	  repeat
		 y = y - 1		 
		 edgelength = edgelength + 1
		 if y < 1 then
			y = LEVELHEIGHT
		 end
	  until isnode(x, y)
	  pathgraph[starty][startx][1] = edgelength
	  if pathgraph[y][x] == nil then
		 pathgraph[y][x] = {}
		 pathgraph[y][x][3] = edgelength
		 createnode(x, y)
	  else
		 pathgraph[y][x][3] = edgelength
	  end
   elseif direction == 2 then
	  repeat
		 x = x + 1		 
		 edgelength = edgelength + 1
		 if x > LEVELWIDTH then
			x = 1
		 end
	  until isnode(x, y)
	  pathgraph[starty][startx][2] = edgelength
	  if pathgraph[y][x] == nil then
		 pathgraph[y][x] = {}
		 pathgraph[y][x][4] = edgelength
		 createnode(x, y)
	  else
		 pathgraph[y][x][4] = edgelength
	  end
   elseif direction == 3 then
	  repeat
		 y = y + 1
		 edgelength = edgelength + 1
		 if y > LEVELHEIGHT then
			y = 1
		 end
	  until isnode(x, y)
	  pathgraph[starty][startx][3] = edgelength
	  if pathgraph[y][x] == nil then
		 pathgraph[y][x] = {}
		 pathgraph[y][x][1] = edgelength
		 createnode(x, y)
	  else
		 pathgraph[y][x][1] = edgelength
	  end
   elseif direction == 4 then
	  repeat
		 x = x - 1
		 edgelength = edgelength + 1
		 if x < 1 then
			x = LEVELWIDTH
		 end
	  until isnode(x, y)
	  pathgraph[starty][startx][4] = edgelength
	  if pathgraph[y][x] == nil then
		 pathgraph[y][x] = {}
		 pathgraph[y][x][2] = edgelength
		 createnode(x, y)
	  else
		 pathgraph[y][x][2] = edgelength
	  end	  
   end
end

function createnode(x, y)
   if y > 1 and level[y - 1][x] == 0 and pathgraph[y][x][1] == nil then
	  createedge(x, y, 1)
   end
   if x < LEVELWIDTH and level[y][x + 1] == 0 and pathgraph[y][x][2] == nil then
	  createedge(x, y, 2)
   end
   if y < LEVELHEIGHT and level[y + 1][x] == 0 and pathgraph[y][x][3] == nil then
	  createedge(x, y, 3)
   end
   if x > 1 and level[y][x - 1] == 0 and pathgraph[y][x][4] == nil then
	  createedge(x, y, 4)
   end
end

-- Allows the pathfinding algorithm to treat the
-- player or ghost's positions as nodes even when
-- they are on edges
function createtempnode(x, y)
   local topy = y - 1
   local topdist = 1
   local verticalalligned = true
   while true do
	  if topy < 1 then
		 topy = LEVELHEIGHT
	  end
	  if pathgraph[topy][x] ~= nil then
		 break
	  elseif level[topy][x] == 1 then
		 verticalalligned = false
		 break
	  end
	  topy = topy - 1
	  topdist = topdist + 1
   end
   local boty = y + 1
   local botdist = 1   
   if verticalalligned then
	  while true do
		 if boty > LEVELHEIGHT then
			boty = 1
		 end
		 if pathgraph[boty][x] ~= nil then
			break
		 elseif level[boty][x] == 1 then
			verticalalligned = false
			break
		 end
		 boty = boty + 1
		 botdist = botdist + 1
	  end
   end
   if verticalalligned then
	  pathgraph[y][x] = {
		 [1] = topdist,
		 [3] = botdist
	  }
	  pathgraph[topy][x][3] = topdist
	  pathgraph[boty][x][1] = botdist
	  return
   end   
   local rightx = x + 1
   local rightdist = 1
   while true do
	  if rightx > LEVELWIDTH then
		 rightx = 1
	  end
	  if pathgraph[y][rightx] ~= nil then
		 break
	  end
	  rightx = rightx + 1
	  rightdist = rightdist + 1
   end
   local leftx = x - 1
   local leftdist = 1
   while true do
	  if leftx < 1 then
		 leftx = LEVELWIDTH
	  end
	  if pathgraph[y][leftx] ~= nil then
		 break
	  end
	  leftx = leftx - 1
	  leftdist = leftdist + 1
   end
   pathgraph[y][x] = {
	  [2] = rightdist,
	  [4] = leftdist
   }
   pathgraph[y][rightx][4] = rightdist
   pathgraph[y][leftx][2] = leftdist
end

function removetempnode(x, y)
   if pathgraph[y][x][1] ~= nil then
	  -- Vertical node
	  local verticallength = pathgraph[y][x][1] + pathgraph[y][x][3]
	  local topy = y - pathgraph[y][x][1]
	  if topy < 1 then
		 topy = LEVELHEIGHT + topy
	  end
	  pathgraph[topy][x][3] = verticallength
	  local boty = y + pathgraph[y][x][3]
	  if boty > LEVELHEIGHT then
		 boty = boty - LEVELHEIGHT
	  end
	  pathgraph[boty][x][1] = verticallength
	  pathgraph[y][x] = nil
   else
	  -- Horizontal node
	  local horizontallength = pathgraph[y][x][2] + pathgraph[y][x][4]
	  local rightx = x + pathgraph[y][x][2]
	  if rightx > LEVELWIDTH then
		 rightx = rightx - LEVELWIDTH
	  end
	  pathgraph[y][rightx][4] = horizontallength
	  local leftx = x - pathgraph[y][x][4]
	  if leftx < 1 then
		 leftx = LEVELWIDTH + leftx
	  end
	  pathgraph[y][leftx][2] = horizontallength
	  pathgraph[y][x] = nil
   end
end

-- Calculating paths based on the graph
function calculateghostdestination(ghost, targetpoint)
   -- Follow the path set for the ghost already
   if calculatedpaths[ghost.name] ~= nil and calculatedpaths[ghost.name].targetpoint.x == targetpoint.x
   and calculatedpaths[ghost.name].targetpoint.y == targetpoint.y then
	  table.remove(calculatedpaths[ghost.name], 1)
	  if #calculatedpaths[ghost.name] == 0 then
		 -- Ghost has reached the destination
		 calculatedpaths[ghost.name] = nil
	  end
	  ghost.destx = calculatedpaths[ghost.name][1].x
	  ghost.desty = calculatedpaths[ghost.name][1].y	  
   else
	  -- The path is not set, calculate it
	  calculateghostpath(ghost, targetpoint)
	  ghost.destx = calculatedpaths[ghost.name][1].x
	  ghost.desty = calculatedpaths[ghost.name][1].y
   end
end

function calculateghostpath(ghost, targetpoint)
   -- If the ghost or target are not on nodes create temporary ones
   -- Ghost must be on a node or between two nodes
   -- Same for the target
   local ghostx = (math.floor(ghost.x / TILEWIDTH) + 1)
   local ghosty = (math.floor(ghost.y / TILEHEIGHT) + 1)
   local tempghostnodecreated = pathgraph[ghosty][ghostx] == nil
   local temptargetnodecreated = pathgraph[targetpoint.y][targetpoint.x] == nil
   if tempghostnodecreated then
	  createtempnode(ghostx, ghosty)
   end
   if temptargetnodecreated then
	  createtempnode(targetpoint.x, targetpoint.y)
   end
   -- Initialize global state shared between pathfinding algorithm components
   visitednodes = {}
   for y=1, LEVELHEIGHT do
	  visitednodes[y] = {}
   end
   visitednodes[ghosty][ghostx] = 0
   endpoint = targetpoint
   pathstack = {
	  steps = 0,
	  nodes = {
		 {
			x = ghostx,
			y = ghosty
		 }
	  }
   }
   calculatebestgraphpath(ghostx, ghosty)
   calculategridgraph(ghost.name, targetpoint)
   if tempghostnodecreated then
	  removetempnode(ghostx, ghosty)
   end
   if temptargetnodecreated then
	  removetempnode(targetpoint.x, targetpoint.y)
   end
end

-- Convert graphpath into step by step path
function calculategridgraph(name, targetpoint)
   calculatedpaths[name] = {}
   calculatedpaths[name].targetpoint = {
	  x = targetpoint.x,
	  y = targetpoint.y
   }
   for i=2, #bestpath do
	  if bestpath[i].dir == 1 then
		 -- Top edge
		 local topy = bestpath[i-1].y - 1
		 for j=1, pathgraph[bestpath[i-1].y][bestpath[i-1].x][1] do
			if topy < 1 then
			   topy = LEVELHEIGHT
			end
			calculatedpaths[name][#calculatedpaths[name] + 1] = {
			   x = bestpath[i-1].x,
			   y = topy
			}
			topy = topy - 1
		 end
	  elseif bestpath[i].dir == 2 then
		 -- Right edge
		 local rightx = bestpath[i-1].x + 1
		 for j=1, pathgraph[bestpath[i-1].y][bestpath[i-1].x][2] do
			if rightx > LEVELWIDTH then
			   rightx = 1
			end
			calculatedpaths[name][#calculatedpaths[name] + 1] = {
			   x = rightx,
			   y = bestpath[i-1].y
			}
			rightx = rightx + 1
		 end
	  elseif bestpath[i].dir == 3 then
		 -- Bottom edge
		 local boty = bestpath[i-1].y + 1
		 for j=1, pathgraph[bestpath[i-1].y][bestpath[i-1].x][3] do
			if boty > LEVELHEIGHT then
			   boty = 1
			end
			calculatedpaths[name][#calculatedpaths[name] + 1] = {
			   x = bestpath[i-1].x,
			   y = boty
			}
			boty = boty + 1
		 end
	  elseif bestpath[i].dir == 4 then
		 -- Left edge
		 local leftx = bestpath[i-1].x - 1
		 for j=1, pathgraph[bestpath[i-1].y][bestpath[i-1].x][4] do
			if leftx < 1 then
			   leftx = LEVELWIDTH
			end
			calculatedpaths[name][#calculatedpaths[name] + 1] = {
			   x = leftx,
			   y = bestpath[i-1].y
			}
			leftx = leftx - 1
		 end		 
	  end	  
   end
end

-- Get the shortest list of graph nodes recursively.
function calculatebestgraphpath(x, y)
   -- If you have been here before and it is not the best, go back.
   if visitednodes[y][x] ~= nil then
	  if pathstack.steps > visitednodes[y][x] then
		 return
	  else
		 visitednodes[y][x] = pathstack.steps
	  end
   end
   -- If at the end then save the new best path
   if x == endpoint.x and y == endpoint.y then
	  bestpath = {}
	  for i=1, #pathstack.nodes do
		 bestpath[i] = {
			x = pathstack.nodes[i].x,
			y = pathstack.nodes[i].y,
			dir = pathstack.nodes[i].dir
		 }
	  end
	  return
   end
   -- Set the visitednodes in these directions
   -- Continue trying all combinations
   if pathgraph[y][x][1] ~= nil then
	  pathstack.steps = pathstack.steps + pathgraph[y][x][1]
	  local topy = y - pathgraph[y][x][1]
	  if topy < 1 then
		 topy = topy + LEVELHEIGHT
	  end
	  pathstack.nodes[#pathstack.nodes + 1] = {
		 x = x,
		 y = topy,
		 dir = 1
	  }
	  if visitednodes[topy][x] == nil or pathstack.steps < visitednodes[topy][x] then
		 visitednodes[topy][x] = pathstack.steps
	  end
	  calculatebestgraphpath(x, topy)
	  pathstack.nodes[#pathstack.nodes] = nil
	  pathstack.steps = pathstack.steps - pathgraph[y][x][1]
   end
   if pathgraph[y][x][2] ~= nil then
	  pathstack.steps = pathstack.steps + pathgraph[y][x][2]
	  local rightx = x + pathgraph[y][x][2]
	  if rightx > LEVELWIDTH then
		 rightx = rightx - LEVELWIDTH
	  end
	  pathstack.nodes[#pathstack.nodes + 1] = {	  
		 x = rightx,
		 y = y,
		 dir = 2
	  }
	  if visitednodes[y][rightx] == nil or pathstack.steps < visitednodes[y][rightx] then	  
		 visitednodes[y][rightx] = pathstack.steps
	  end
	  calculatebestgraphpath(rightx, y)
	  pathstack.nodes[#pathstack.nodes] = nil
	  pathstack.steps = pathstack.steps - pathgraph[y][x][2]
   end
   if pathgraph[y][x][3] ~= nil then
	  pathstack.steps = pathstack.steps + pathgraph[y][x][3]
	  local boty = y + pathgraph[y][x][3]
	  if boty > LEVELHEIGHT then
		 boty = boty - LEVELHEIGHT
	  end
	  pathstack.nodes[#pathstack.nodes + 1] = {	  
		 x = x,
		 y = boty,
		 dir = 3
	  }
	  if visitednodes[boty][x] == nil or pathstack.steps < visitednodes[boty][x] then	  
		 visitednodes[boty][x] = pathstack.steps
	  end
	  calculatebestgraphpath(x, boty)
	  pathstack.nodes[#pathstack.nodes] = nil
	  pathstack.steps = pathstack.steps - pathgraph[y][x][3]
   end
   if pathgraph[y][x][4] ~= nil then
	  pathstack.steps = pathstack.steps + pathgraph[y][x][4]
	  local leftx = x - pathgraph[y][x][4]
	  if leftx < 1 then
		 leftx = leftx + LEVELWIDTH
	  end
	  pathstack.nodes[#pathstack.nodes + 1] = {
		 x = leftx,
		 y = y,
		 dir = 4
	  }
	  if visitednodes[y][leftx] == nil or pathstack.steps < visitednodes[y][leftx] then
		 visitednodes[y][leftx] = pathstack.steps
	  end
	  calculatebestgraphpath(leftx, y)
	  pathstack.nodes[#pathstack.nodes] = nil
	  pathstack.steps = pathstack.steps - pathgraph[y][x][4]
   end
end

function moveghosttopoint(ghost, targetpoint)
   if ghost.x == (targetpoint.x - 1) * TILEWIDTH
   and ghost.y == (targetpoint.y - 1) * TILEHEIGHT then
	  -- No need to move if the ghost is already there
	  ghost.resting = true
	  return
   elseif ghost.resting then
	  -- Get the next destination if the ghost is at the previous one
	  calculateghostdestination(ghost, targetpoint)
	  -- Wrapping destinations	  
	  if ghost.y == 0 and ghost.desty == LEVELHEIGHT then
		 ghost.desty = 0
	  elseif ghost.x == (LEVELWIDTH * TILEWIDTH) - TILEWIDTH and ghost.destx == 1 then
		 ghost.destx = LEVELWIDTH + 1
	  elseif ghost.y == (LEVELHEIGHT * TILEHEIGHT) - TILEHEIGHT and ghost.desty == 1 then
		 ghost.desty = LEVELHEIGHT + 1
	  elseif ghost.x == 0 and ghost.destx == LEVELWIDTH then
		 ghost.destx = 0
	  end
	  ghost.resting = false
   end
   -- Animate and move the ghost
   -- Right is the default
   local ghostdirection = "right"
   local prevspeed = ghost.speed
   if ghost.state == "dead" then
	  ghost.speed = DEADSPEED
   end
   if (ghost.destx - 1) * TILEWIDTH > ghost.x then
	  ghostdirection = "right"
	  ghost.x = ghost.x + (globaldt * ghost.speed)
	  if ghost.x > (ghost.destx - 1) * TILEWIDTH then
		 ghost.x = (ghost.destx - 1) * TILEWIDTH
		 ghost.resting = true
		 ghost.crossing = false
		 ghost.sprite.paused = true
	  end
   elseif (ghost.destx - 1) * TILEWIDTH < ghost.x then
	  ghostdirection = "left"
	  ghost.x = ghost.x - (globaldt * ghost.speed)
	  if ghost.x < (ghost.destx - 1) * TILEWIDTH then
		 ghost.x = (ghost.destx - 1) * TILEWIDTH
		 ghost.resting = true
		 ghost.crossing = false
		 ghost.sprite.paused = true
	  end
   elseif (ghost.desty - 1) * TILEHEIGHT > ghost.y then
	  ghostdirection = "down"
	  ghost.y = ghost.y + (globaldt * ghost.speed)
	  if ghost.y > (ghost.desty - 1) * TILEHEIGHT then
		 ghost.y = (ghost.desty - 1) * TILEHEIGHT
		 ghost.resting = true
		 ghost.crossing = false
		 ghost.sprite.paused = true
	  end
   elseif (ghost.desty - 1) * TILEHEIGHT < ghost.y then
	  ghostdirection = "up"
	  ghost.y = ghost.y - (globaldt * ghost.speed)
	  if ghost.y < (ghost.desty - 1) * TILEHEIGHT then
		 ghost.y = (ghost.desty - 1) * TILEHEIGHT
		 ghost.resting = true
		 ghost.crossing = false
		 ghost.sprite.paused = true
	  end
   end
   if not ghost.resting then
	  if player.state == "energized" then
		 if ghost.state == "dead" then
			setanimation(ghost, "dead-move-" .. ghostdirection)
		 else
			if energizertimer < (ENERGIZERDURATION / 1.5) then
			   setanimation(ghost, "ghost-scared")
			else
			   setanimation(ghost, "ghost-flash")
			end
		 end
	  else
		 setanimation(ghost, ghost.name .. "-move-" .. ghostdirection)
	  end
   end
   ghost.speed = prevspeed
   -- Wrapping around the map
   if not ghost.crossing then
	  if ghost.x < 0 then
		 ghost.destx = LEVELWIDTH
		 ghost.x = (TILEWIDTH * LEVELWIDTH) + TILEWIDTH
		 ghost.crossing = true
		 ghost.resting = false
	  elseif ghost.x > (TILEWIDTH * LEVELWIDTH) - TILEWIDTH then
		 ghost.destx = 1
		 ghost.x = -TILEWIDTH
		 ghost.crossing = true
		 ghost.resting = false
	  elseif ghost.y < 0 then
		 ghost.desty = LEVELHEIGHT
		 ghost.y = (TILEHEIGHT * LEVELHEIGHT) + TILEHEIGHT
		 ghost.crossing = true
		 ghost.resting = false
	  elseif ghost.y > (TILEHEIGHT * LEVELHEIGHT) - TILEHEIGHT then
		 ghost.desty = 1
		 ghost.y = -TILEHEIGHT
		 ghost.crossing = true
		 ghost.resting = false		 
	  end
   end
end

function controlghosts()
   if player.state == "energized" then
	  ghostenergizedai()
   else

	  if ghostaicycle == "chase" then
		 ghostchaseai()
	  else
		 ghostscatterai()
	  end
   end
end

function moveghostrandom(ghost)
   if ghostrandomtargets[ghost.name] == nil
	  or (ghost.x == (ghostrandomtargets[ghost.name].x - 1) * TILEWIDTH
		  and ghost.y == (ghostrandomtargets[ghost.name].y - 1) * TILEHEIGHT) then
	  repeat
		 ghostrandomtargets[ghost.name] = {
			x = math.random(LEVELWIDTH),
			y = math.random(LEVELHEIGHT)
		 }
	  until level[ghostrandomtargets[ghost.name].y][ghostrandomtargets[ghost.name].x] == 0
		 and not isghostwall(ghostrandomtargets[ghost.name].x, ghostrandomtargets[ghost.name].y)
		 and (ghost.x ~= (ghostrandomtargets[ghost.name].x - 1) * TILEWIDTH
				 or ghost.y ~= (ghostrandomtargets[ghost.name].y - 1) * TILEHEIGHT)
   end
   moveghosttopoint(ghost, ghostrandomtargets[ghost.name])
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
   moveghosttopoint(blinky, blinky.corner)
   moveghosttopoint(pinky, pinky.corner)
   moveghosttopoint(inky, inky.corner)
   moveghosttopoint(clyde, clyde.corner)   
end

function ghostchaseai()
   -- Blinky just moves toward the player
   local playerx = player.destx
   if playerx > LEVELWIDTH then
	  playerx = 1
   elseif playerx < 1 then
	  playerx = LEVELWIDTH
   end
   local playery = player.desty
   if playery > LEVELHEIGHT then
	  playery = 1
   elseif playery < 1 then
	  playery = LEVELHEIGHT
   end
   moveghosttopoint(blinky, {x=playerx,y=playery})
   -- Pinky tries to cut off the player
   if #calculatedpaths["blinky"] >= 2 then
	  local blinkydirection = calculatedpaths["blinky"][#calculatedpaths["blinky"] - 1]
	  local pinkytarget = nil
	  if playery > 1 and not iswall(playerx, playery - 1)
	  and (playery - 1 ~= blinkydirection.y or playerx ~= blinkydirection.x) then
		 pinkytarget = {
			x = playerx,
			y = playery - 1
		 }
	  elseif playerx < LEVELWIDTH and not iswall(playerx + 1, playery)
	  and (playery ~= blinkydirection.y or playerx + 1 ~= blinkydirection.x) then
		 pinkytarget = {
			x = playerx + 1,
			y = playery
		 }
	  elseif playery < LEVELHEIGHT and not iswall(playerx, playery + 1)
	  and (playery + 1 ~= blinkydirection.y or playerx ~= blinkydirection.x) then
		 pinkytarget = {
			x = playerx,
			y = playery + 1
		 }
	  elseif playerx > 1 and not iswall(playerx - 1, playery)
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
   -- Move clyde if the player is in his(?) corner of the map
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
