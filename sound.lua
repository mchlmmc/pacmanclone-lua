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

function playsound(soundname)
   for name, val in pairs(sounds) do
	  if sounds[soundname].layer == val.layer and name ~= soundsname and sounds[soundname].priority > val.priority then
		 val.source:setVolume(0)
	  end
   end
   love.audio.play(sounds[soundname].source)
   sounds[soundname].ended = false
end

function stopsound(soundname)
   love.audio.stop(sounds[soundname].source)
   sounds[soundname].ended = true
end

function stopallsounds()
   for _, val in pairs(sounds) do
	  love.audio.stop(val.source)
	  val.ended = true
   end
end

function controlsounds()
   -- Unmute sounds if blocking sounds have stopped
   local layerpriorities = {}
   for name, val in pairs(sounds) do
	  if val.ended == false and val.source:isPlaying() == false then
		 for nameb, valb in pairs(sounds) do
			if val.layer == valb.layer and name ~= nameb and val.priority > valb.priority then
			   valb.source:setVolume(1)
			end
		 end
	  end
   end
end
