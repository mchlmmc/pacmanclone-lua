require("conf")
require("sound")
require("drawing")
require("ghost")

-- Game state
currentlevel = 1
currentfruit = 1
amountoflives = 3
score = 0
nextlifescore = LIFEINTERVAL

-- Utility functions

function updatescore(newscore)
   score = newscore
   if score > nextlifescore and amountoflives < 8 then
	  amountoflives = amountoflives + 1
	  nextlifescore = nextlifescore + LIFEINTERVAL
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

function checktilescollide(x1, y1, x2, y2)
   -- The -1 assures that they are actually in contact and not just adjacent
   return not ((x1 > x2 + TILEWIDTH - 1) or (x1 + TILEWIDTH - 1 < x2) or (y1 > y2 + TILEHEIGHT - 1) or (y1 + TILEHEIGHT - 1 < y2))
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
			amountofpointsseaten = amountofpointsseaten + 1
			points[fruitspawnpoints[i].y][fruitspawnpoints[i].x] = 0
		 end
		 fruits[#fruits + 1] = {
			name=FRUITSCORES[currentfruit][1],
			x=fruitspawnpoints[i].x,
			y=fruitspawnpoints[i].y,
			timer=0
		 }
		 break
	  end
   end
end

function createcharacter(character)
   character.startpoint = {
	  x = character.x,
	  y = character.y
   }
   character.destx = character.x
   character.desty = character.y
   character.x = (character.destx - 1) * TILEWIDTH
   character.y = (character.desty - 1) * TILEHEIGHT
   character.resting = true
   character.crossing = false
   character.state = "normal"
   character.sprite = {
	  timer = 0,
	  frame = 1,
	  paused = true,
	  animation = character.name .. "-move-right"
   }
end

function checkghostcollision(ghost)
   if checktilescollide(ghost.x, ghost.y, player.x, player.y) and ghost.state ~= "dead" then
	  if player.state == "energized" then
		 ghost.state = "dead"
		 amountofghostseaten = amountofghostseaten + 1
		 updatescore(score + GHOSTSCORES[amountofghostseaten])
		 playsound("eat-ghost")
		 playsound("retreating")
	  else
		 blinky.sprite.paused = true
		 pinky.sprite.paused = true
		 inky.sprite.paused = true
		 clyde.sprite.paused = true
		 player.state = "dead"
		 setanimation(player, "pacman-death")
		 playsound("death")
	  end
   end
end

function loadlevel(leveltoload)
   -- Import level data
   if currentlevel == leveltoload then
	  package.loaded[tostring(leveltoload)] = nil
   end
   require(tostring(leveltoload))
   -- Game state
   spawnanimationtimer = 0
   deathanimationtimer = 0
   energizertimer = 0
   amountofpointseaten = 0
   amountofghostseaten = 0
   currentlevel = leveltoload
   -- Count the points
   amountofpoints = 0
   for y=1, LEVELHEIGHT do
	  for x=1, LEVELWIDTH do
		 if points[y][x] == 1 then
			amountofpoints = amountofpoints + 1
		 end
	  end
   end
   -- For the ghost AI
   ghostaicycle = "chase"
   ghostaicycletimer = 0
   ghostrandomtargets = {}   
   amountofghostscatters = 0
   -- Create game objects
   for i=1, #energizers do
	  energizers[i].sprite = {}
	  setanimation(energizers[i], "energizer-oscillate")
   end
   fruits = {}
   -- Create game characters
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
   player.state = "spawning"
   -- Prerender background
   renderbackground()
   -- Generate pathfinding graph for the map
   generatepathgraph()
   calculatedpaths = {}
   -- Play the start sound
   stopallsounds()
   playsound("game-start")
end

function controlplayer()
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
	  if (player.destx - 1) * TILEWIDTH > player.x then
		 player.x = player.x + (globaldt * playerspeed)
		 if player.x > (player.destx - 1) * TILEWIDTH then
			player.x = (player.destx - 1) * TILEWIDTH
			player.resting = true
			player.crossing = false
			player.sprite.paused = true
		 end
	  elseif (player.destx - 1) * TILEWIDTH < player.x then
		 player.x = player.x - (globaldt * playerspeed)
		 if player.x < (player.destx - 1) * TILEWIDTH then
			player.x = (player.destx - 1) * TILEWIDTH
			player.resting = true
			player.crossing = false
			player.sprite.paused = true
		 end
	  elseif (player.desty - 1) * TILEHEIGHT > player.y then
		 player.y = player.y + (globaldt * playerspeed)
		 if player.y > (player.desty - 1) * TILEHEIGHT then
			player.y = (player.desty - 1) * TILEHEIGHT
			player.resting = true
			player.crossing = false
			player.sprite.paused = true
		 end
	  elseif (player.desty - 1) * TILEHEIGHT < player.y then
		 player.y = player.y - (globaldt * playerspeed)
		 if player.y < (player.desty - 1) * TILEHEIGHT then
			player.y = (player.desty - 1) * TILEHEIGHT
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
		 player.x = (TILEWIDTH * LEVELWIDTH) + TILEWIDTH
		 player.crossing = true
		 player.resting = false
	  elseif player.x > (TILEWIDTH * LEVELWIDTH) - TILEWIDTH then
		 player.destx = 1
		 player.x = -TILEWIDTH
		 player.crossing = true
		 player.resting = false
	  elseif player.y < 0 then
		 player.desty = LEVELHEIGHT
		 player.y = (TILEHEIGHT * LEVELHEIGHT) + TILEHEIGHT
		 player.crossing = true
		 player.resting = false
	  elseif player.y > (TILEHEIGHT * LEVELHEIGHT) - TILEHEIGHT then
		 player.desty = 1
		 player.y = -TILEHEIGHT
		 player.crossing = true
		 player.resting = false		 
	  end
   end
end

function love.load()
   -- Keep the image sharp
   love.graphics.setDefaultFilter("nearest", "nearest")
   -- Use retro font
   love.graphics.setFont(love.graphics.newFont("emulogic.ttf", TILEWIDTH))
   -- Make the pseudorandom numbers unique
   math.randomseed(os.time())
   -- Sounds
   for name, val in pairs(sounds) do
	  val.source = love.audio.newSource("sounds/" .. name .. ".wav", "static")
	  val.source:setLooping(val.looping)
	  val.ended = true
   end
   -- Load the image assets
   spritesheet = love.graphics.newImage("spritesheet.png")
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
   -- Initialize first level
   loadlevel(currentlevel)
end

function love.update(dt)
   -- Make dt global   
   globaldt = dt
   if currentlevel < 1 then
	  return
   end
   -- Update sounds
   controlsounds()
   -- Spawning and dying
   if spawnanimationtimer < 5 then
	  spawnanimationtimer = spawnanimationtimer + dt
	  if spawnanimationtimer > 4 then
		 player.state = "normal"
	  else
		 return
	  end
   end
   if player.state == "spawning" then
	  return
   elseif player.state == "dead" then
	  deathanimationtimer = deathanimationtimer + dt
	  if player.sprite.frame == #animations[player.sprite.animation].frames then
		 player.sprite.paused = true
	  end
	  if deathanimationtimer > 4 then
		 amountoflives = amountoflives - 1
		 if amountoflives <= 0 then
			currentlevel = -1
			stopallsounds()
		 else
			loadlevel(currentlevel)
		 end
	  end
	  return
   end
   -- Update energizer
   if player.state == "energized" then
	  energizertimer = energizertimer + dt
	  if energizertimer > ENERGIZERDURATION then
		 player.state = "normal"
		 blinky.state = "normal"
		 setanimation(blinky, "blinky-move-down")
		 pinky.state = "normal"
		 setanimation(pinky, "pinky-move-down")
		 inky.state = "normal"
		 setanimation(inky, "inky-move-down")
		 clyde.state = "normal"
		 setanimation(clyde, "clyde-move-down")
		 energizertimer = 0
		 love.audio.stop(sounds["energizer"].source)
	  end
   end
   -- Cycle ghost AI
   if amountofghostscatters < maximumscattertimes then
	  ghostaicycletimer = ghostaicycletimer + dt
   end
   if ghostaicycle == "chase" and ghostaicycletimer > chaseduration then
	  ghostaicycletimer = 0
	  ghostaicycle = "scatter"
   elseif ghostaicycle == "scatter" and ghostaicycletimer > scatterduration then
	  ghostaicycletimer = 0
	  ghostaicycle = "chase"
	  amountofghostscatters = amountofghostscatters + 1
   end
   -- Fruit decay
   for i=1, #fruits do
	  fruits[i].timer = fruits[i].timer + dt
	  if fruits[i].timer > 10 then
		 table.remove(fruits, i)
		 break
	  end
   end
   -- Control player and ghhosts
   controlplayer()
   controlghosts()   
   -- Check collisions with game objects
   if not player.crossing then
	  -- Pick up points
	  -- Adding 0.5 is to round the player position to the level grid
	  if points[math.floor((player.y / TILEHEIGHT) + 0.5) + 1][math.floor((player.x / TILEWIDTH) + 0.5) + 1] == 1 then
		 points[math.floor((player.y / TILEHEIGHT) + 0.5) + 1][math.floor((player.x / TILEWIDTH) + 0.5) + 1] = 0
		 updatescore(score + 10)
		 amountofpointseaten = amountofpointseaten + 1
		 playsound("munch")
		 if amountofpointseaten >= amountofpoints then
			if currentlevel >= AMOUNTOFLEVELS then
			   currentlevel = -2
			   stopallsounds()
			   return
			else
			   loadlevel(currentlevel + 1)
			end
		 elseif amountofpointseaten == FRUITAWARDPOINTSA or amountofpointseaten == FRUITAWARDSPOINTSB then
			-- Spawn in fruit
			spawnfruit()
			currentfruit = currentfruit + 1
			if currentfruit > #FRUITSCORES then
			   currentfruit = 1
			end
		 end
	  end
	  -- Pick up energizers
	  for i=1, #energizers do
		 if checktilescollide(player.x, player.y, (energizers[i].x - 1) * TILEWIDTH, (energizers[i].y - 1) * TILEHEIGHT) then
			updatescore(score + 50)
			playsound("energizer")
			player.state = "energized"
			amountofghostseaten = 0
			energizertimer = 0
			table.remove(energizers, i)
			break
		 end
	  end
	  -- Pick up fruits
	  for i=1, #fruits do
		 if checktilescollide(player.x, player.y, (fruits[i].x - 1) * TILEWIDTH, (fruits[i].y - 1) * TILEHEIGHT) then
			-- Find value of fruit eaten
			playsound("eat-fruit")
			for j=1, #FRUITSCORES do
			   if FRUITSCORES[j][1] == fruits[i].name then
				  updatescore(score + FRUITSCORES[j][2])
				  break
			   end
			end
			table.remove(fruits, i)
			break
		 end
	  end
	  -- Touching ghosts
	  checkghostcollision(blinky)
	  checkghostcollision(inky)
	  checkghostcollision(pinky)
	  checkghostcollision(clyde)
   end   
end

function love.draw()
   if currentlevel < 0 then
	  drawscorescreen()
   else
	  drawgame()
   end
end
