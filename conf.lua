LEVELWIDTH = 22
LEVELHEIGHT = 22
TILEWIDTH = 16
TILEHEIGHT = 16
WINWIDTH = LEVELWIDTH * TILEWIDTH * 2
WINHEIGHT = (LEVELHEIGHT + 3) * TILEHEIGHT * 2
AMOUNTOFLEVELS = 3
ENERGIZERDURATION = 10
LIFEINTERVAL = 10000
DEADSPEED = 100
TOPMARGIN = TILEWIDTH * 2

GHOSTSCORES = {
   200,
   400,
   800,
   1600
}

-- Fruits values
FRUITSCORES = {
   {"cherry", 100},
   {"strawberry", 300},
   {"peach", 500},
   {"apple", 700},
   {"grapes", 1000},
   {"galaxian", 2000},
   {"bell", 3000},
   {"key", 5000}
}

function love.conf(t)
   -- The name of the save directory
   t.identity = nil
   -- Search files in source directory before save directory
   t.appendidentity = false
   t.version = "11.0"
   -- Attach a console (Windows only)
   t.console = false
   -- Enable the accelerometer on iOS and Android by exposing it as a Joystick
   t.accelerometerjoystick = false
   -- True to save files (and read from the save directory) in external storage on Android 
   t.externalstorage = false
   -- Enable gamma-correct rendering, when supported by the system 
   t.gammacorrect = false

   -- Keep background music playing when opening LOVE (iOS and Android only)
   t.audio.mixwithsystem = true
   
   t.window.title = "Pac-Man"         
   t.window.icon = nil                 
   t.window.width = WINWIDTH
   t.window.height = WINHEIGHT
   t.window.borderless = false         
   t.window.resizable = false          
   t.window.minwidth = WINWIDTH
   t.window.minheight = WINHEIGHT
   t.window.fullscreen = false
   t.window.fullscreentype = "desktop"
   -- Vertical sync mode
   t.window.vsync = 1
   -- The number of samples to use with multi-sampled antialiasing
   t.window.msaa = 0
   -- The number of bits per sample in the depth buffer
   t.window.depth = nil
   -- The number of bits per sample in the stencil buffer
   t.window.stencil = nil
   -- Index of the monitor to show the window in
   t.window.display = 1
   -- Enable high-dpi mode for the window on a Retina display
   t.window.highdpi = false
   -- The x-coordinate of the window's position in the specified display
   t.window.x = nil
   -- The y-coordinate of the window's position in the specified display
   t.window.y = nil
   
   t.modules.audio = true
   t.modules.data = true
   t.modules.event = true
   t.modules.font = true
   t.modules.graphics = true
   t.modules.image = true
   t.modules.joystick = false
   t.modules.keyboard = true
   t.modules.math = true
   t.modules.mouse = false
   t.modules.physics = false
   t.modules.sound = true
   t.modules.system = true
   t.modules.thread = true
   t.modules.timer = true
   t.modules.touch = false
   t.modules.video = false
   t.modules.window = true
end
