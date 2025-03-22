-- all the different inputs for each scene, in functions

--[[
wimpy monster
aggressive monster
unmodified monster
aggressive wimpy monster

gain 152 xp
sub issue item drop

]]

local mobData = {
  --      name,                     hp,  level,  def,  atk,    dam,  xp, coins,
  [1]  = {"a level 1 monster",       20,      1,    5,   12,     2, 150,    2 },
  [2]  = {"a level 2 monster",       25,      2,    5,   13,     2, 150,    4 },
  [3]  = {"a level 3 monster",       30,      3,    7,   14,     3, 150,    6 },
  [4]  = {"a level 4 monster",       40,      4,    7,   15,     4, 150,    8 },
  [5]  = {"a level 5 monster",       47,      5,    9,   16,     4, 150,   10 },
  [6]  = {"a level 6 monster",       54,      6,    9,   17,     5, 150,   12 },
  [7]  = {"a level 7 monster",       61,      7,   11,   18,     6, 150,   14 },
  [8]  = {"a level 8 monster",       68,      8,   11,   19,     6, 150,   16 },
  [9]  = {"a level 9 monster",       76,      9,   13,   20,     7, 150,   18 },
  [10] = {"a level 10 monster",      84,     10,   13,   21,     8, 150,   20 },
  [11] = {"a level 11 monster",      92,     11,   15,   22,     9, 150,   22 },
  [12] = {"a level 12 monster",     100,     12,   15,   23,    10, 150,   24 },
  [13] = {"a level 13 monster",     109,     13,   17,   24,    10, 150,   26 },
  [14] = {"a level 14 monster",     118,     14,   17,   25,    11, 150,   28 },
  [15] = {"a level 15 monster",     127,     15,   19,   26,    12, 150,   30 },
  [16] = {"a level 16 monster",     136,     16,   19,   27,    13, 150,   32 },
  [17] = {"a level 17 monster",     145,     17,   21,   28,    14, 150,   34 },
  [18] = {"a level 18 monster",     155,     18,   21,   29,    15, 150,   36 },
  [19] = {"a level 19 monster",     165,     19,   23,   30,    16, 150,   38 },
  [20] = {"a level 20 monster",     175,     20,   23,   31,    17, 150,   40 },
  [21] = {"a level 21 monster",     185,     21,   25,   32,    18, 150,   42 },
  [22] = {"a level 22 monster",     200,     22,   25,   33,    20, 150,   44 },
  [23] = {"a level 23 monster",     215,     23,   27,   34,    21, 150,   46 },
  [24] = {"a level 24 monster",     230,     24,   27,   35,    23, 150,   48 },
  [25] = {"a level 25 monster",     245,     25,   29,   36,    24, 150,   50 },
  [26] = {"a level 26 monster",     260,     26,   29,   37,    26, 150,   52 },
  [27] = {"a level 27 monster",     275,     27,   31,   38,    27, 150,   54 },
  [28] = {"a level 28 monster",     290,     28,   31,   39,    29, 150,   56 },
  [29] = {"a level 29 monster",     320,     29,   33,   40,    32, 150,   58 },
  [30] = {"a level 30 monster",     340,     30,   33,   41,    34, 150,   60 },
  [31] = {"a level 31 monster",     360,     31,   35,   42,    36, 150,   62 },
}

local tick = 0 -- timing for attacks

local mobFighting = {}

function encounteringLoad()
	-- all the one-time things that need to load for title scene
  game.bgm.encountering = love.audio.newSource("bgm/Encountering-DanaRoskvist.ogg", "stream")
  game.bgm.encountering:setLooping(true)
  punch = {
	[1] = love.audio.newSource("sfx/punch1.ogg", "static"),
	[2] = love.audio.newSource("sfx/punch2.ogg", "static"),
	[3] = love.audio.newSource("sfx/punch3.ogg", "static"),
	[4] = love.audio.newSource("sfx/punch4.ogg", "static"),
	[5] = love.audio.newSource("sfx/punch5.ogg", "static"),
	[6] = love.audio.newSource("sfx/punch6.ogg", "static"),
	[7] = love.audio.newSource("sfx/punch7.ogg", "static"),
  }
  levelup = love.audio.newSource("sfx/levelgain.ogg", "static")
  groan = love.audio.newSource("sfx/groan.ogg", "static")

  death = {
    [1] = love.audio.newSource("sfx/death1.ogg", "static"),
    [2] = love.audio.newSource("sfx/death2.ogg", "static"),
    [3] = love.audio.newSource("sfx/death3.ogg", "static"),
    [4] = love.audio.newSource("sfx/death4.ogg", "static"),
    [5] = love.audio.newSource("sfx/death5.ogg", "static"),
    [6] = love.audio.newSource("sfx/death6.ogg", "static"),
    [7] = love.audio.newSource("sfx/death7.ogg", "static"),
    }

end -- titleLoad()

function encounteringInput()
	-- this scene's input mapping
	function love.keypressed(key, scancode, isrepeat)
		if key == "return" then
			fullscreen = not fullscreen
			love.window.setFullscreen(fullscreen, "exclusive")
		end

    -- for switching scenes
		if key == "escape" then
      charData.scene = "encountering"
      saveData()
			game.scene.now = "title"
			game.scene.previous = "encountering"
      titleInput()
			titleRun()
		end

    if key == "e" or key == "E" then
      saveData()
			game.scene.now = "exchanging"
			game.scene.previous = "encountering"
      exchangingInput()
			exchangingRun()
		end

    if key == "f" or key == "F" then
      charData.xp = charData.xp - (charData.level*10)
      saveData()
			game.scene.now = "exploring"
			game.scene.previous = "encountering"
      exploringInput()
			exploringRun()
		end


	end
end -- titleInput


local heroAtk = 0
local heroDam = 0

function encounteringRun()
	-- anything to run on scene load
  local i = 0

  loadData()
  charData.scene = "encountering"
  heroAtk = charData.str + charData.atk
  heroDam = (math.ceil(charData.str/6) + charData.dmg)*charData.level
  heroDef = math.ceil(charData.dex/4)

  for i = 1,8 do
    mobFighting[i] = mobData[charData.enemy][i]
  end

  mobAtk = mobFighting[5]
  mobDam = mobFighting[6]

  if game.bgm.encountering:isPlaying() then
    -- do stuff
  else
    love.audio.stop( )
    game.bgm.encountering:play()
  end
end -- titleRun

function encounteringUpdate(dt)
	-- this scene's updates
  tick = tick + dt
  if tick >= 3 then -- perform roughly every second

    charData.playtime = charData.playtime + 3

    if love.math.random(heroAtk) > mobFighting[4] and mobFighting[2] > 0 then
      mobFighting[2] = mobFighting[2]-(love.math.random(heroDam))
      punch[love.math.random(1,7)]:play()
    end

    if love.math.random(mobAtk) > heroDef and charData.hp > 0 then
      charData.hp = charData.hp - (love.math.random(mobDam))
      punch[love.math.random(1,7)]:play()
    end

    if mobFighting[2] <= 0 then
      -- victory for hero
      charData.xp = charData.xp + math.ceil(mobFighting[7]*(charData.xpgain/100)*(charData.enemy/charData.level))
      if charData.xp > xptnl[charData.level] then
        levelup:play()
        charData.level = charData.level + 1
        charData.trains = charData.trains + 1
      end
      charData.coins = charData.coins + mobFighting[8]
      charData.scene = "exploring"
      charData.enemy = 0
      saveData()
      game.scene.now = "exploring"
      game.scene.previous = "encountering"
      exploringInput()
      exploringRun()
    end

    if charData.hp < 0 then
      -- loss for hero
      groan:play()
      charData.hp = 0
      charData.xp = charData.xp - mobFighting[7]
      charData.scene = "exploring"
      charData.enemy = 0
      saveData()
      game.scene.now = "exploring"
      game.scene.previous = "encountering"
      exploringInput()
      exploringRun()
      end

    tick = 0
  end
end -- titleUpdate

function encounteringDraw()
	-- this scene's draws

	-- fill full window with background color
	love.graphics.setColor( color.darkgrey )
	love.graphics.rectangle("fill", 0, 0, width, height)


  drawTextColor(" ^w[^yF^w] FLEE! ^w[^yE^w] Go to ^yE^wxchanging  ^w[^yescape^w] Return to menu ", 50, 40, 60, color.black)

  -- standard HUD for 5E
  drawTextColor("^y"..charData.name, 0, 0, 16, color.black)
  drawTextColor("^WLevel ^y"..charData.level.." ", 16, 0, 9, color.black)
  drawTextColor("^c"..areaData[charData.location][1].." ",25, 0, 20, color.black)
  drawTextColor("^y"..charData.coins.." ^Wcoins ",45, 0, 12, color.black)
  drawTextColor("^y"..charData.items.."^W/"..charData.itemsmax.." items ",57, 0, 14, color.black)
  drawTextColor("^y"..charData.load.."^W/"..charData.loadmax.." load ",71, 0, 14, color.black)
  drawTextColor(" ^WPlaytime: ^y"..charData.playtime, 85, 0, 20, color.black)
  drawText("XP: "..charData.xp.."/"..xptnl[charData.level], 0, 1, 80, color.black, color.brightyellow, charData.xp, xptnl[charData.level])


  -- encounter HUD
  drawText("HP: "..charData.hp.."/"..charData.hpmax, 40, 4, 38, color.white, color.brightred, charData.hp, charData.hpmax)
  drawText("Mob HP: "..mobFighting[2].."/"..mobData[charData.enemy][2], 82, 4, 38, color.white, color.brightred, mobFighting[2], mobData[charData.enemy][2])

end -- titleDraw
