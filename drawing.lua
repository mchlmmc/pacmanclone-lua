-- Images are sections of the atlas texture in the format of
-- name, x, y, w, h
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

-- Frames are in the format x, y, w, h
-- A framelength of 0 means no animation
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

function setanimation(character, animation)
   character.sprite.paused = false
   if character.sprite.animation ~= animation then
	  character.sprite.animation = animation
	  character.sprite.timer = 0
	  character.sprite.frame = 1
   end
end

function drawimage(quad, x, y)
   love.graphics.draw(spritesheet, quad, x * 2, y * 2, 0, 2, 2)
end

function drawrectangle(x, y, w, h)
   love.graphics.rectangle("fill", x * 2, y * 2, w * 2, h * 2)
end

function drawsprite(x, y, sprite)
   -- Update sprite
   if not sprite.paused and animations[sprite.animation].framelength ~= 0 then
	  sprite.timer = sprite.timer + globaldt
	  if sprite.timer > animations[sprite.animation].framelength then
		 sprite.timer = 0
		 sprite.frame = sprite.frame + 1
		 if sprite.frame > #animations[sprite.animation].frames then
			sprite.frame = 1
		 end
	  end
   end
   drawimage(animations[sprite.animation].frames[sprite.frame], x, y + TOPMARGIN)
   -- Handle character walking over bounds, draw two sprites to loop around
   if x < 0 then
	  drawimage(animations[sprite.animation].frames[sprite.frame], (LEVELWIDTH * TILEWIDTH) + x, y + TOPMARGIN)
   elseif x + TILEWIDTH > LEVELWIDTH * TILEWIDTH then
	  drawimage(animations[sprite.animation].frames[sprite.frame],
						 x - ((LEVELWIDTH * TILEWIDTH) + TILEWIDTH), y + TOPMARGIN)
   elseif y < 0 then
	  drawimage(animations[sprite.animation].frames[sprite.frame],
						 x, (LEVELHEIGHT * TILEHEIGHT) + y + TOPMARGIN)
   elseif y + TILEHEIGHT > LEVELHEIGHT * TILEHEIGHT then
	  drawimage(animations[sprite.animation].frames[sprite.frame],
						 x, y - ((LEVELHEIGHT * TILEHEIGHT) + TILEHEIGHT) + TOPMARGIN)
   end
end

-- The points in the game don't need a sprite since they are simple 2x2 squares
function drawpoints()
   for x=1, LEVELWIDTH do
	  for y=1, LEVELHEIGHT do
		 if points[y][x] == 1 then
			drawrectangle(((x - 1) * TILEWIDTH) + 7, ((y - 1) * TILEHEIGHT) + TOPMARGIN + 7, 2, 2)
		 end
	  end
   end
end

function drawgame()
   love.graphics.clear()
   -- Draw background   
   love.graphics.setColor(levelcolor.r, levelcolor.g, levelcolor.b, 1)
   love.graphics.draw(levelbackground, 0, TOPMARGIN * 2, 0, 2, 2)
   love.graphics.setColor(1, 1, 1, 1)
   -- Draw ghost wall
   drawrectangle(((ghostwall.x - 1) * TILEWIDTH) - 4, (ghostwall.y - 1) * TILEHEIGHT + TOPMARGIN + 7, 40, 2)
   -- Draw point orbs
   drawpoints()
   -- Draw energizers
   for i=1, #energizers do
	  drawsprite((energizers[i].x - 1) * TILEWIDTH, (energizers[i].y - 1) * TILEHEIGHT, energizers[i].sprite)
   end
   -- Draw fruit
   for i=1, #fruits do
	  drawimage(images[fruits[i].name], (fruits[i].x - 1) * TILEWIDTH, ((fruits[i].y - 1) * TILEHEIGHT) + TOPMARGIN)
   end   
   -- Draw characters
   drawsprite(player.x, player.y, player.sprite)
   drawsprite(blinky.x, blinky.y, blinky.sprite)
   drawsprite(pinky.x, pinky.y, pinky.sprite)
   drawsprite(inky.x, inky.y, inky.sprite)
   drawsprite(clyde.x, clyde.y, clyde.sprite)   
   -- Draw UI on top with black rectangle background
   drawui()
end

function drawscorescreen()
   if currentlevel == -1 then
	  love.graphics.printf("GAME OVER", 0, (LEVELHEIGHT * TILEHEIGHT) + TOPMARGIN, LEVELWIDTH * TILEWIDTH * 2, "center")
   else
	  love.graphics.printf("YOU WIN", 0, (LEVELHEIGHT * TILEHEIGHT) + TOPMARGIN, LEVELWIDTH * TILEWIDTH * 2, "center")
   end
end

-- In-game UI
function drawui()
   -- Black backgrounds for UI
   love.graphics.setColor(0, 0, 0, 1)
   drawrectangle(0, 0, LEVELWIDTH * TILEWIDTH, TOPMARGIN)
   drawrectangle(0, (LEVELHEIGHT * TILEHEIGHT) + TOPMARGIN, LEVELWIDTH * TILEWIDTH, TILEHEIGHT)   
   love.graphics.setColor(1, 1, 1, 1)
   -- Score
   love.graphics.printf("SCORE", 0, TILEHEIGHT, LEVELWIDTH * TILEWIDTH, "center")   
   love.graphics.printf(string.format("%08d", score), 0, TILEHEIGHT * 2, LEVELWIDTH * TILEWIDTH, "center")
   -- Level
   love.graphics.printf("LEVEL " .. currentlevel, LEVELWIDTH * TILEWIDTH, TILEHEIGHT * 2, LEVELWIDTH * TILEWIDTH, "center")
   -- Lives
   for i=1, amountoflives do
	  drawimage(images["life"], (TILEWIDTH * 2) + (13 * (i - 1)), (LEVELHEIGHT * TILEHEIGHT) + TOPMARGIN)
   end
   -- Ready, Set, Go! at beginning
   if spawnanimationtimer < 2 then
	  love.graphics.printf("READY", 0, ((LEVELHEIGHT * TILEWIDTH) + TOPMARGIN) * 2, LEVELWIDTH * TILEWIDTH * 2, "center")
   elseif spawnanimationtimer < 4 then
	  love.graphics.printf("SET", 0, ((LEVELHEIGHT * TILEWIDTH) + TOPMARGIN) * 2, LEVELWIDTH * TILEWIDTH * 2, "center")
   elseif spawnanimationtimer < 5 then
	  love.graphics.printf("GO!", 0, ((LEVELHEIGHT * TILEWIDTH) + TOPMARGIN) * 2, LEVELWIDTH * TILEWIDTH * 2, "center")
   end
   -- Fruit
   local fruitindex = currentfruit
   for i=1, 3 do
	  drawimage(images[FRUITSCORES[fruitindex][1]], ((LEVELWIDTH - 5) * TILEWIDTH) + (TILEWIDTH * (i - 1)),
				(LEVELHEIGHT * TILEHEIGHT) + TOPMARGIN)
	  fruitindex = fruitindex + 1
	  if fruitindex > #FRUITSCORES then
		 fruitindex = 1
	  end
   end
end

function renderbackground()
   levelbackground = love.graphics.newCanvas(TILEWIDTH * LEVELWIDTH, TILEHEIGHT * LEVELHEIGHT)
   love.graphics.setCanvas(levelbackground)
   local solidcase = {
	  {1,1,1},
	  {1,1,1},
	  {1,1,1}
   }
   local specialcases = {
	  {
		 "dot",
		 {
			{0,0,0},
			{0,1,0},
			{0,0,0}
		 }
	  },      	  
	  {
		 "leftcap",
		 {
			{0,0,2},
			{0,1,1},
			{0,0,2}
		 }
	  },      
	  {
		 "topcap", 
		 {
			{0,0,0},
			{0,1,0},
			{2,1,2}
		 }
	  },
	  {
		 "rightcap",
		 {
			{2,0,0},
			{1,1,0},
			{2,0,0}
		 }
	  },
	  {
		 "bottomcap",
		 {
			{2,1,2},
			{0,1,0},
			{0,0,0}
		 }
	  }
   }
   local normalcases = {
	  {
		 "bottomrightblock",
		 optionaltile = "topleft",
		 {
			{3,1,2},
			{1,1,0},
			{2,0,0}
		 }
	  },      
	  {
		 "bottomleftblock",
		 optionaltile = "topright",
		 {
			{2,1,3},
			{0,1,1},
			{0,0,2}
		 }
	  },
	  {
		 "toprightblock",
		 optionaltile = "bottomleft",
		 {
			{2,0,0},
			{1,1,0},
			{3,1,2}
		 }
	  },
	  {
		 "topleftblock",
		 optionaltile = "bottomright",
		 {
			{0,0,2},
			{0,1,1},
			{2,1,3}
		 }
	  },	  
	  {
		 "bottomright",
		 {
			{2,2,2},
			{2,1,1},
			{2,1,0}
		 }
	  },
	  {
		 "bottomleft",
		 {
			{2,2,2},
			{1,1,2},
			{0,1,2}
		 }
	  },
	  {
		 "topright",
		 {
			{2,1,0},
			{2,1,1},
			{2,2,2}
		 }
	  },      
	  {
		 "topleft",
		 {
			{0,1,2},
			{1,1,2},
			{2,2,2}
		 }
	  },
	  {
		 "topline",
		 {
			{2,0,2},
			{1,1,1},
			{2,2,2}
		 }
	  },
	  {
		 "bottomline",
		 {
			{2,2,2},
			{1,1,1},
			{2,0,2}
		 }
	  },
	  {
		 "leftline",
		 {
			{2,1,2},
			{0,1,2},
			{2,1,2}
		 }
	  },
	  {
		 "rightline",
		 {
			{2,1,2},
			{2,1,0},
			{2,1,2}
		 }
	  }
   }

   local grid = nil

   -- Check if a grid matches a case
   local gridmatchescase = function (case)
	  local optionaltiles = false
	  for y=1, 3 do
		 for x=1, 3 do
			if grid[y][x] ~= case[y][x] and case[y][x] ~= 2 then
			   if case[y][x] == 3 and grid[y][x] == 0 then
				  optionaltiles = true
			   elseif case[y][x] == 1 or case[y][x] == 0 then
				  return false
			   end
			end
		 end
	  end
	  return true, optionaltiles
   end   

   local rendertile = function (x, y)
	  if level[y][x] == 0 then
		 return
	  end
	  grid = {
		 {0,0,0},
		 {0,1,0},
		 {0,0,0}
	  }
	  -- Set top row
	  if y >= 2 and x >= 2 and level[y-1][x-1] == 1 then grid[1][1] = 1 end
	  if y >= 2 and level[y-1][x] == 1 then grid[1][2] = 1 end
	  if y >= 2 and x <= (LEVELWIDTH-1) and level[y-1][x+1] == 1 then grid[1][3] = 1 end
	  -- Set bottom row
	  if y <= (LEVELHEIGHT-1) and x >= 2 and level[y+1][x-1] == 1 then grid[3][1] = 1 end
	  if y <= (LEVELHEIGHT-1) and level[y+1][x] == 1 then grid[3][2] = 1 end
	  if y <= (LEVELHEIGHT-1) and x <= (LEVELWIDTH-1) and level[y+1][x+1] == 1 then grid[3][3] = 1 end
	  -- Set left side
	  if x >= 2 and level[y][x-1] == 1 then grid[2][1] = 1 end
	  -- Set right side
	  if x <= (LEVELWIDTH-1) and level[y][x+1] == 1 then grid[2][3] = 1 end
	  -- Solid special case
	  if gridmatchescase(solidcase) then
		 return
	  end
	  -- Other special cases
	  for i=1, #specialcases do
		 if gridmatchescase(specialcases[i][2]) then
			love.graphics.draw(spritesheet, images[specialcases[i][1]], (x-1) * TILEWIDTH, (y-1) * TILEHEIGHT)
			return
		 end
	  end
	  -- Normal cases
	  for i=1, #normalcases do
		 local casematch, drawoptionaltile = gridmatchescase(normalcases[i][2])
		 if casematch then
			love.graphics.draw(spritesheet, images[normalcases[i][1]], (x-1) * TILEWIDTH, (y-1) * TILEHEIGHT)
			if drawoptionaltile then
			   love.graphics.draw(spritesheet, images[normalcases[i].optionaltile], (x-1) * TILEWIDTH, (y-1) * TILEHEIGHT)
			end
		 end
	  end
   end
   
   for x=1, LEVELWIDTH do
	  for y=1, LEVELHEIGHT do
		 rendertile(x, y)
	  end
   end
   love.graphics.setCanvas()
end
