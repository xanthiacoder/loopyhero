-- love-ansi by Joash Chee, updated on 2025
-- A library of ansi functions for Text UI
-- bootstrap template with virtual keyboard
-- monotype font is JetBrainsMonoNL-Regular.ttf
-- font size is 14
-- font width is 8 pixels, font height is 18 pixels
-- screen 1280 x 720 pixels
-- 160 x 40 chars

love.filesystem.setIdentity("loopyhero") -- for R36S file system compatibility

json = require "lib.json"	-- encode / decode table to JSON

-- require all the scene files here
require "scenes.title"
require "scenes.options"
require "scenes.achievements"
require "scenes.credits"
require "scenes.quit"
require "scenes.start"
require "scenes.creation"
require "scenes.equiping"
require "scenes.exploring"
require "scenes.encountering"
require "scenes.exchanging"
require "scenes.enhancing"
require "scenes.looping"

-- define global variables used in all scenes


local itemClass = {
  name = "^Wnothing",
  weight = 0,
  str = 0,
  int = 0,
  dex = 0,
  con = 0,
  cha = 0,
  wis = 0,
  hp  = 0,
  mn  = 0,
  mv  = 0,
  atk = 0,
  dmg = 0,
}

charData = {
  name = "", -- char name
  race = "", -- Aarakocran, Beastkin, Centaur, Drow, Duergar, Dwarf, Elf, Githyanki, Gnoll, Gnome, Goblin, Half Elf, Halfling, Human, Lizard Man, Merfolk, Mindflayer, Ogre, Orc, Pixie, Svirfneblin, Tiefling
  gender = "", -- male / female
  str = 3, -- strength
  maxstr = 18,
  int = 3, -- intelligence
  maxint = 18,
  dex = 3, -- dexterity
  maxdex = 18,
  con = 3, -- constitution
  maxcon = 18,
  cha = 3, -- charisma
  maxcha = 18,
  wis = 3, -- wisdom
  maxwis = 18,
  class = "", -- base class (Apprentice, Bard, Cleric, Druid, Fighter, Mage, or Thief)
  atk = 0, -- attack points
  dmg = 0, -- damage points
  pracs = 0, -- practice points
  trains = 0, -- train points
  hp = 0, -- health
  hpmax = 0,
  mn = 0, -- mana
  mnmax = 0,
  mv = 0, -- movement
  mvmax = 0,
  alignment = 0,
  inclination = 0,
  height = 0,
  weight = 0,
  xp = 0, -- experience points
  xpgain = 100, -- earned experience rate in percentage
  items = 0,
  itemsmax = 0,
  load = 0,
  loadmax = 0,
  wimpy = 0,
  head = itemClass,
  eyes = itemClass,
  ears = itemClass,
  mouth = itemClass,
  neck = itemClass,
  back = itemClass,
  body = itemClass,
  torso = itemClass,
  arms = itemClass,
  leftwrist = itemClass,
  rightwrist = itemClass,
  hands = itemClass,
  leftfinger = itemClass,
  rightfinger = itemClass,
  waist = itemClass,
  legs = itemClass,
  feet = itemClass,
  wield = itemClass,
  held = itemClass,
}

game = {}
game.power = {}
game.tooltip = "love-ansi library, Xanthia Coder 2025 | 1280x720, 160x38 chars, font 14pt - "

game.bgm = {}
game.bgart = {}

game.scene = {}
game.scene.now = "title" -- always start with the title scene
game.scene.previous = "" -- blank indicates game just started

width, height = love.graphics.getDimensions( )
game.width = width
game.height = height

-- create default directories
if love.filesystem.getUserDirectory( ) == "/home/ark/" then
	game.system = "R36S"
	-- user LUA I/O to write
	os.execute("mkdir " .. love.filesystem.getSaveDirectory()) -- OS creation
	os.execute("mkdir " .. love.filesystem.getSaveDirectory() .. "//ui")
	os.execute("mkdir " .. love.filesystem.getSaveDirectory() .. "//ui/default")
	os.execute("mkdir " .. love.filesystem.getSaveDirectory() .. "//autosaves")
  os.execute("mkdir " .. love.filesystem.getSaveDirectory() .. "//char")
else
	game.system = "Others"
	love.filesystem.createDirectory("ui")
	love.filesystem.createDirectory("ui/default")
	love.filesystem.createDirectory("autosaves")
	love.filesystem.createDirectory("char")
end

-- libraries that require the default directories
require "lib.ansi"			-- love-ansi main library


function restoreMainDefaults()

	-- use this function to restore default values

end


-- load autosaves
	if love.filesystem.getInfo( "game-time.txt" ) == nil then -- first run of game
		-- create files for the first time
		game.time = 0
		local f = io.open(love.filesystem.getSaveDirectory().."//game-time.txt", "w+")
		f:write(game.time)
		f:close()

		restoreMainDefaults() -- create defaults for the first time

	else
		-- read existing files
		game.time = love.filesystem.read("game-time.txt")
	end
-- end : load autosaves

-- requires lib.ansi
game.keyboard = {
	show = false,
	done = false,
	prompt = "",
	case = "lower",
	input = "",
	selectx = 1,
	selecty = 1,
}

-- requires lib.ansi
game.list = {
	selected = 1, 		-- index number of selected item
	lastItem = 1,		-- index number of last item on list
	confirm = false, 	-- state of list window
}

game.playerone = {
	hpMax = 100,
	hpNow = 100,
	hpBefore = 100,
}

game.playertwo = {
	hpMax = 100,
	hpNow = 100,
	hpBefore = 100,
}

-- one-time setup of game / app, loading assets
function love.load()
	-- load monospace font, recommended size 13, declared in lib.ansi
	monoFont = love.graphics.newFont("fonts/"..FONT, FONT_SIZE)
	love.graphics.setFont( monoFont )
	love.graphics.setColor( color.brightcyan )
	game.tooltip = game.tooltip .. monoFont:getHeight() .. " height in px"

	-- load all scenes
	titleLoad()
  optionsLoad()
  achievementsLoad()
  creditsLoad()
  quitLoad()
  startLoad()
  creationLoad()
  equipingLoad()
  exploringLoad()
  encounteringLoad()
  exchangingLoad()
  enhancingLoad()
  loopingLoad()

end



-- callback for graceful exit
function love.quit()

end


-- to make game state changes frame-to-frame
function love.update(dt)

	-- run current scene's updates
  if game.scene.previous == "" then
    titleInput()
    titleRun()
    game.scene.previous = "title" -- finish first run on game launch
  elseif game.scene.now == "title" then
		titleUpdate()
	elseif game.scene.now == "options" then
		optionsUpdate()
	elseif game.scene.now == "achievements" then
		achievementsUpdate()
	elseif game.scene.now == "credits" then
		creditsUpdate()
	elseif game.scene.now == "quit" then
		quitUpdate()
	elseif game.scene.now == "start" then
		startUpdate()
	elseif game.scene.now == "creation" then
		creationUpdate()
	elseif game.scene.now == "equiping" then
		equipingUpdate()
	elseif game.scene.now == "exploring" then
		exploringUpdate()
	elseif game.scene.now == "encountering" then
		encounteringUpdate()
	elseif game.scene.now == "exchanging" then
		exchangingUpdate()
	elseif game.scene.now == "enhancing" then
		enhancingUpdate()
  elseif game.scene.now == "looping" then
		loopingUpdate()
  end
end

-- to render game state onto the screen, 60 fps
function love.draw()

	-- display current scene
	if game.scene.now == "title" then
		titleDraw()
	elseif game.scene.now == "options" then
		optionsDraw()
	elseif game.scene.now == "achievements" then
		achievementsDraw()
	elseif game.scene.now == "credits" then
		creditsDraw()
	elseif game.scene.now == "quit" then
		quitDraw()
	elseif game.scene.now == "start" then
		startDraw()
	elseif game.scene.now == "creation" then
		creationDraw()
	elseif game.scene.now == "equiping" then
		equipingDraw()
	elseif game.scene.now == "exploring" then
		exploringDraw()
	elseif game.scene.now == "encountering" then
		encounteringDraw()
	elseif game.scene.now == "exchanging" then
		exchangingDraw()
	elseif game.scene.now == "enhancing" then
		enhancingDraw()
	elseif game.scene.now == "looping" then
		loopingDraw()
	end

	-- show / hide virtual keyboard
	if game.keyboard.show then
		drawKeyboard(game.keyboard.prompt, game.keyboard.case)
	end -- returns game.keyboard.input

	-- display game tooltip
	love.graphics.setColor( color.brightcyan )
	love.graphics.printf(game.tooltip, monoFont, 0, 18*39, game.width, "left")

	-- display power
	game.power.state, game.power.percent, game.power.timeleft = love.system.getPowerInfo( )
	love.graphics.setColor( color.brightcyan )
	love.graphics.printf(tostring(game.power.state) .. " " .. tostring(game.power.percent) .. "%", monoFont, 0, 18*39, game.width, "right") -- show game power

end
