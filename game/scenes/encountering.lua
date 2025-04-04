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

    if key == "f" or key == "F" then
      charData.xp = charData.xp - (charData.level*10)
      charData.fled = charData.fled + 1
      saveData()
			game.scene.now = "exploring"
			game.scene.previous = "encountering"
      exploringInput()
			exploringRun()
		end

    -- drink hp potion [Z X C]
    if (key == "z" or key == "Z") and charData.smallhppot ~= 0 and charData.hp < charData.hpmax then
      if charData.drankpots == nil then charData.drankpots = 0 end
      charData.drankpots = charData.drankpots + 1
      charData.smallhppot = charData.smallhppot - 1
      charData.items = charData.items - 1
      charData.hp = charData.hp + 10
      if charData.hp > charData.hpmax then charData.hp = charData.hpmax end
      gulp:stop()
      gulp:play()
    end
    if (key == "x" or key == "X") and charData.medhppot ~= 0 and charData.hp < charData.hpmax then
      if charData.drankpots == nil then charData.drankpots = 0 end
      charData.drankpots = charData.drankpots + 1
      charData.medhppot = charData.medhppot - 1
      charData.items = charData.items - 1
      charData.hp = charData.hp + 30
      if charData.hp > charData.hpmax then charData.hp = charData.hpmax end
      gulp:stop()
      gulp:play()
    end
    if (key == "c" or key == "C") and charData.largehppot ~= 0 and charData.hp < charData.hpmax then
      if charData.drankpots == nil then charData.drankpots = 0 end
      charData.drankpots = charData.drankpots + 1
      charData.largehppot = charData.largehppot - 1
      charData.items = charData.items - 1
      charData.hp = charData.hp + 50
      if charData.hp > charData.hpmax then charData.hp = charData.hpmax end
      gulp:stop()
      gulp:play()
    end


	end
end -- titleInput


local heroAtk = 0
local heroDam = 0

function encounteringRun()
	-- anything to run on scene load
  local i = 0
  game.message = ""
  loadData()
  if charData.enemy > charData.level then
    if charData.foughthigher == nil then charData.foughthigher = 0 end
    charData.foughthigher = charData.foughthigher + 1
  end
  charData.levelup = false
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

  if tick >=2 and tick < 3 then
    game.message = ""
  end

  if tick >= 3 then -- perform roughly every second

    charData.playtime = charData.playtime + 3

    if love.math.random(heroAtk) > mobFighting[4] and mobFighting[2] > 0 then
      mobFighting[2] = mobFighting[2]-(love.math.random(heroDam))
      punch[love.math.random(1,7)]:play()
      game.message = game.message .. "^wYou ^gHIT! "
    else
      game.message = game.message .. "^wYou ^rMISS! "
    end

    if love.math.random(mobAtk) > heroDef and charData.hp > 0 then
      charData.hp = charData.hp - (love.math.random(mobDam))
      punch[love.math.random(1,7)]:play()
      game.message = game.message .. "^wThe mob ^rHITS back! "
    else
      game.message = game.message .. "^wThe mob ^gMISSES! "
    end

    if mobFighting[2] <= 0 then
      -- victory for hero
      game.message = " ^wYou ^yWIN ^wthe fight! ^WXP "..charData.xp.." -> "
      charData.mobskilled = charData.mobskilled + 1
      charData.xp = charData.xp + math.ceil(mobFighting[7]*(charData.xpgain/100)*(charData.enemy/charData.level))
      charData.xprate = math.ceil(charData.xp / (charData.playtime/60))
      game.message = game.message .. charData.xp
      if charData.xp > xptnl[charData.level] then
        charData.levelup = true
        charData.level = charData.level + 1
        if charData.level == 5 then charData.reached5 = charData.playtime end
        if charData.level == 10 then charData.reached10 = charData.playtime end
        if charData.level == 20 then charData.reached20 = charData.playtime end
        if charData.level == 31 then charData.reached31 = charData.playtime end
        charData.trains = charData.trains + 1
        if charData.class == "Bard" then
          charData.hpmax = charData.hpmax + ( math.ceil(charData.con/3) + (love.math.random(2,12)) )
          charData.mnmax = charData.mnmax + ( math.ceil(charData.int/6) + (love.math.random(1,2)) )
          charData.mvmax = charData.mvmax + ( 5 * math.ceil(charData.str/18) )
          charData.atk = charData.atk + math.ceil(charData.cha/18)
        end
        if charData.class == "Cleric" then
          -- upgrade  stuff
          charData.hpmax = charData.hpmax + ( math.ceil(charData.con/3) + (love.math.random(1,10)) )
          charData.mnmax = charData.mnmax + ( math.ceil(charData.int/4) + (love.math.random(1,4)) )
          charData.mvmax = charData.mvmax + ( 5 * math.ceil(charData.str/18) )
          charData.atk = charData.atk + math.ceil(charData.wis/18)
        end
        if charData.class == "Commoner" then
          -- upgrade  stuff
          charData.hpmax = charData.hpmax + ( math.ceil(charData.con/9) + (love.math.random(1,4)) )
          charData.mnmax = charData.mnmax + ( math.ceil(charData.int/10) + (love.math.random(1,2)) )
          charData.mvmax = charData.mvmax + ( 5 * math.ceil(charData.str/18) )
          charData.atk = charData.atk + math.ceil((charData.wis/18) - 1)
        end
        if charData.class == "Druid" then
          -- upgrade  stuff
          charData.hpmax = charData.hpmax + ( math.ceil(charData.con/2) + (love.math.random(2,14)) )
          charData.mnmax = charData.mnmax + ( math.ceil(charData.int/4) + (love.math.random(1,4)) )
          charData.mvmax = charData.mvmax + ( 5 * math.ceil(charData.str/18) )
          charData.atk = charData.atk + math.ceil(charData.con/18)
        end
        if charData.class == "Fighter" then
          charData.hpmax = charData.hpmax + ( math.ceil(charData.con/2) + (love.math.random(2,14)) )
          charData.mnmax = charData.mnmax + ( math.ceil(charData.int/8) + (love.math.random(1,2)) )
          charData.mvmax = charData.mvmax + ( 7 * math.ceil(charData.str/18) )
          charData.atk = charData.atk + math.ceil(charData.str/18)
          -- upgrade  stuff
        end
        if charData.class == "Mage" then
          -- upgrade  stuff
          charData.hpmax = charData.hpmax + ( math.ceil(charData.con/6) + (love.math.random(1,5)) )
          charData.mnmax = charData.mnmax + ( math.ceil(charData.int/3) + (love.math.random(1,4)) )
          charData.mvmax = charData.mvmax + ( 3 * math.ceil(charData.str/18) )
          charData.atk = charData.atk + math.ceil(charData.int/18)
        end
        if charData.class == "Thief" then
          -- upgrade  stuff
          charData.hpmax = charData.hpmax + ( math.ceil(charData.con/3) + (love.math.random(1,10)) )
          charData.mnmax = charData.mnmax + ( math.ceil(charData.int/6) + (love.math.random(1,3)) )
          charData.mvmax = charData.mvmax + ( 6 * math.ceil(charData.str/18) )
          charData.atk = charData.atk + math.ceil(charData.dex/18)
        end
      end
      if charData.totalcoinsearned == nil then charData.totalcoinsearned = 0 end
      charData.totalcoinsearned = charData.totalcoinsearned + mobFighting[8]
      charData.coinrate = math.ceil(charData.totalcoinsearned / (charData.playtime/60))
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
      if charData.deaths == nil then charData.deaths = 0 end
      charData.deaths = charData.deaths + 1
      groan:play()
      charData.hp = 0
      charData.xp = charData.xp - mobFighting[7]
      charData.xprate = math.ceil(charData.xp / (charData.playtime/60))
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


  -- standard HUD for 5E
  drawTextColor("^y"..charData.name, 0, 0, 16, color.black)
  drawTextColor("^WLevel ^y"..charData.level.." ", 16, 0, 9, color.black)
  drawTextColor("^c"..areaData[charData.location][1].." ",25, 0, 20, color.black)
  drawTextColor("^y"..charData.coins.." ^Wcoins ",45, 0, 12, color.black)
  drawTextColor("^y"..charData.items.."^W/"..charData.itemsmax.." items ",57, 0, 14, color.black)
  drawTextColor("^y"..charData.load.."^W/"..charData.loadmax.." load ",71, 0, 14, color.black)
  drawTextColor(" ^WPlaytime: ^y"..charData.playtime, 85, 0, 20, color.black)
  drawText("XP: "..charData.xp.."/"..xptnl[charData.level], 0, 1, 80, color.black, color.brightyellow, charData.xp, xptnl[charData.level])

  drawTextColor(game.message, 0, 38, 160, color.black)

  -- encounter HUD
  drawText("HP: "..charData.hp.."/"..charData.hpmax, 40, 4, 38, color.white, color.brightred, charData.hp, charData.hpmax)
  drawText("Mob HP: "..mobFighting[2].."/"..mobData[charData.enemy][2], 82, 4, 38, color.white, color.brightred, mobFighting[2], mobData[charData.enemy][2])

  drawTextBox("\n [Z] Drink Small HP Potion : "..charData.smallhppot, 0, 34, 34, 3, color.brightcyan, color.blue, "left")
  drawTextBox("\n [X] Drink Medium HP Potion : "..charData.medhppot, 35, 34, 34, 3, color.brightcyan, color.blue, "left")
  drawTextBox("\n [C] Drink Large HP Potion : "..charData.largehppot, 70, 34, 34, 3, color.brightcyan, color.blue, "left")

  drawTextColor(" ^w[^yF^w] FLEE!  ^w[^yescape^w] Return to menu ", 50, 40, 60, color.black)


end -- titleDraw
