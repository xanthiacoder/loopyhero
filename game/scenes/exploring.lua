-- all the different inputs for each scene, in functions

  local showMap = false -- either show Map or Area

  local tick = 0 -- timing for regeneration


function drawMap(x , y)

  local i = 0

  local mapData = {
  [1]  = "                                                   Moria                       ",
  [2]  = "                             Olympus          New    |    Dwarven--Mines       ",
  [3]  = "High            Elven Valley    |     Ofcol--Ofcol   +----Kingdom              ",
  [4]  = "Tower                       \\   |       |            |       |    \\Catacombs   ",
  [5]  = "  |    Dragon Tower          Plains-----+            |   Day-Care              ",
  [6]  = "  |   /                         |       |            |             Void---Old  ",
  [7]  = "Shadow                      Northern  Stones of      |   Nirvana\\    |   Thalos",
  [8]  = "Grove---Galaxy              Midgaard   G'harne       |            \\Holy        ",
  [9]  = "  |                             |                    |             Grove       ",
  [10] = "   \\  Arachnos    Shire  Asgard | In the Air         |   Kendermore  |         ",
  [11] = "     \\   |          |         \\ | /                  |       |       |    Check",
  [12] = "      Forest Of-----+-------Midgaard---------------Cross---Eastern Road---Point",
  [13] = "      Haon Dor              / | | | \\              Roads             |         ",
  [14] = "     /     |     Mob Factory  | | |  Machine            \\        Gnome Village ",
  [15] = "  Old    Troll               /  | |  Dreams               \\                    ",
  [16] = " Marsh    Den           Sewer   |  \\            Ruins of---Dwarf---Frigid Waste",
  [17] = "                                |    \\Midgaard   Thalos    Forest         |    ",
  [18] = "      Redferne's---Chain---Southern    River                |  \\      Keep of  ",
  [19] = "      Residence            Midgaard         \\       Wyvern--+  Drow   Mahn-tor ",
  [20] = "           |                  / | \\          Sands of Tower  |  City           ",
  [21] = "         Clouds      Gang Land  | Graveyard  Sorrow          |                 ",
  [22] = "        (Harpies)               |      \\           \\       Elemental           ",
  [23] = "                            Miden'nir   Church   Mega-City  Canyon             ",
  [24] = "                            (Goblins)  Catacombs    One                        ",
  --      12345678901234567890123456789012345678901234567890123456789012345678901234567890
  }

  for i = 1,24 do
    drawTextColor(mapData[i], x, y+(i-1), 80, color.black)
  end

end

function drawArea(x,y)

  local i = 0
  local j = 0

  drawTextColor("^w Location   : ^c"..areaData[charData.location][1], x, y+1, 40, color.black)
  drawTextColor("^w Rooms      : ^c"..areaData[charData.location][2], x, y+2, 40, color.black)
  drawTextColor("^w Population : ^c"..areaData[charData.location][3], x, y+3, 40, color.black)
  drawTextColor("^w Level range: ^c"..areaData[charData.location][4].." to "..areaData[charData.location][5], x, y+4, 80, color.black)
  j = 1
  for i = areaData[charData.location][4],areaData[charData.location][5] do
    drawTextColor("^W[^y"..j.."^W] Fight level ^y"..i.."^W monster ", x, y+5+j, 80, color.black)
    j = j + 1
  end

--[[
  [1]  = {"Mud School", 75, 34, 1, 6, neutral },
  [2]  = {"Gangland", 70, 92, 7, 13, neutral},
  [3]  = {"High Tower", 183, 109, 14, 22, evil},
  [4]  = {"Sands of Sorrow", 130, 27, 23, 30, neutral},
  ]]
  drawTextColor("^W[^yM^W] Go to Mud School ", x+40, y+1, 40, color.black)
  drawTextColor("^W[^yG^W] Go to Gangland ", x+40, y+2, 40, color.black)
  drawTextColor("^W[^yH^W] Go to High Tower ", x+40, y+3, 40, color.black)
  drawTextColor("^W[^yS^W] Go to Sands of Sorrow ", x+40, y+4, 40, color.black)
end


function exploringLoad()
	-- all the one-time things that need to load for title scene
  game.bgm.exploring = love.audio.newSource("bgm/Exploring-DanaRoskvist.ogg", "stream")
  game.bgm.exploring:setLooping(true)
  appear = love.audio.newSource("sfx/appear.ogg", "static")
  gulp = love.audio.newSource("sfx/gulp.ogg", "static")
end -- titleLoad()


function exploringInput()
	-- this scene's input mapping
	function love.keypressed(key, scancode, isrepeat)

		if key == "return" then
			fullscreen = not fullscreen
			love.window.setFullscreen(fullscreen, "exclusive")
		end

    -- for switching scenes
    if key == "escape" then
      charData.scene = "exploring"
      game.scene.now = "title"
      game.scene.previous = "exploring"
      saveData()
      titleInput()
      titleRun()
    end

    if key == "w" or key == "W" then
      showMap = true
    end

    if key == "a" or key == "A" then
      showMap = false
    end

    if key == "e" or key == "E" then
			game.scene.now = "exchanging"
			game.scene.previous = "exploring"
      saveData()
      exchangingInput()
			exchangingRun()
		end

    if key == "m" or key == "M" then
      charData.location = 1
      appear:stop()
      appear:play()
    end

    if key == "g" or key == "G" then
      charData.location = 2
      appear:stop()
      appear:play()
    end

    if key == "h" or key == "H" then
      charData.location = 3
      appear:stop()
      appear:play()
    end

    if key == "s" or key == "S" then
      charData.location = 4
      appear:stop()
      appear:play()
    end

    -- drink hp potion [Z X C]
    if (key == "z" or key == "Z") and charData.smallhppot ~= 0 and charData.hp < charData.hpmax then
      charData.smallhppot = charData.smallhppot - 1
      charData.items = charData.items - 1
      charData.hp = charData.hp + 10
      if charData.hp > charData.hpmax then charData.hp = charData.hpmax end
      gulp:stop()
      gulp:play()
    end
    if (key == "x" or key == "X") and charData.medhppot ~= 0 and charData.hp < charData.hpmax then
      charData.medhppot = charData.medhppot - 1
      charData.items = charData.items - 1
      charData.hp = charData.hp + 30
      if charData.hp > charData.hpmax then charData.hp = charData.hpmax end
      gulp:stop()
      gulp:play()
    end
    if (key == "c" or key == "C") and charData.largehppot ~= 0 and charData.hp < charData.hpmax then
      charData.largehppot = charData.largehppot - 1
      charData.items = charData.items - 1
      charData.hp = charData.hp + 50
      if charData.hp > charData.hpmax then charData.hp = charData.hpmax end
      gulp:stop()
      gulp:play()
    end




      if key == "1" and tonumber(key) <= areaData[charData.location][5] then
  			game.scene.now = "encountering"
  			game.scene.previous = "exploring"
        charData.enemy = areaData[charData.location][4]
        saveData()
        encounteringInput()
			  encounteringRun()
      end

      if key == "2" and tonumber(key) <= areaData[charData.location][5] then
  			game.scene.now = "encountering"
  			game.scene.previous = "exploring"
        charData.enemy = areaData[charData.location][4] + 1
        saveData()
        encounteringInput()
			  encounteringRun()
      end

      if key == "3" and tonumber(key) <= areaData[charData.location][5] then
  			game.scene.now = "encountering"
  			game.scene.previous = "exploring"
        charData.enemy = areaData[charData.location][4] + 2
        saveData()
        encounteringInput()
			  encounteringRun()
      end

      if key == "4" and tonumber(key) <= areaData[charData.location][5] then
  			game.scene.now = "encountering"
  			game.scene.previous = "exploring"
        charData.enemy = areaData[charData.location][4] + 3
        saveData()
        encounteringInput()
			  encounteringRun()
      end

      if key == "5" and tonumber(key) <= areaData[charData.location][5] then
  			game.scene.now = "encountering"
  			game.scene.previous = "exploring"
        charData.enemy = areaData[charData.location][4] + 4
        saveData()
        encounteringInput()
			  encounteringRun()
      end

      if key == "6" and tonumber(key) <= areaData[charData.location][5] then
  			game.scene.now = "encountering"
  			game.scene.previous = "exploring"
        charData.enemy = areaData[charData.location][4] + 5
        saveData()
        encounteringInput()
			  encounteringRun()
      end

      if key == "7" and tonumber(key) <= areaData[charData.location][5] then
  			game.scene.now = "encountering"
  			game.scene.previous = "exploring"
        charData.enemy = areaData[charData.location][4] + 6
        saveData()
        encounteringInput()
			  encounteringRun()
      end

      if key == "8" and tonumber(key) <= areaData[charData.location][5] then
  			game.scene.now = "encountering"
  			game.scene.previous = "exploring"
        charData.enemy = areaData[charData.location][4] + 7
        saveData()
        encounteringInput()
			  encounteringRun()
      end


      if key == "9" and tonumber(key) <= areaData[charData.location][5] then
  			game.scene.now = "encountering"
  			game.scene.previous = "exploring"
        charData.enemy = areaData[charData.location][4] + 8
        saveData()
        encounteringInput()
			  encounteringRun()
      end

	end
end -- titleInput

function exploringRun()
	-- anything to run on scene load
  if game.bgm.exploring:isPlaying() then
    -- do stuff
  else
    love.audio.stop( )
    game.bgm.exploring:play()
  end

  if charData.levelup == true then
    -- do levelup stuff
    levelup:play()
  end

end -- titleRun

function exploringUpdate(dt)
	-- this scene's updates

  tick = tick + dt
  if tick >= 6 then
    charData.playtime = charData.playtime + 6
    if charData.hp < charData.hpmax then
      charData.hp = charData.hp + math.ceil((charData.str + charData.level)/3)
      if charData.hp > charData.hpmax then
        charData.hp = charData.hpmax
      end
    end
    tick = 0
  end

end -- titleUpdate

function exploringDraw()
	-- this scene's draws

	-- fill full window with background color
	love.graphics.setColor( color.darkgrey )
	love.graphics.rectangle("fill", 0, 0, width, height)

  drawTextColor(" ^w[^yW^w]orld Map  [^yA^w]rea Map ", 105, 0, 55, color.black)
  if showMap then
    drawMap(80,2)
  else
    drawArea(80,2)
  end

  drawTextColor(" ^w[^yE^w] Go to ^yE^wxchanging  ^w[^yescape^w] Return to menu ", 55, 40, 50, color.black)

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


-- exploring HUD
drawText("HP: "..charData.hp.."/"..charData.hpmax, 40, 4, 38, color.white, color.brightred, charData.hp, charData.hpmax)

drawTextBox("\n [Z] Drink Small HP Potion : "..charData.smallhppot, 0, 34, 34, 3, color.brightcyan, color.blue, "left")
drawTextBox("\n [X] Drink Medium HP Potion : "..charData.medhppot, 35, 34, 34, 3, color.brightcyan, color.blue, "left")
drawTextBox("\n [C] Drink Large HP Potion : "..charData.largehppot, 70, 34, 34, 3, color.brightcyan, color.blue, "left")

-- on levelup
if charData.levelup then
  drawTextBox("\n You have LEVELED! ", 70, 28, 22, 3, color.white, color.red, "center")
end

local text = "\n\nYou can rest here in-between battles. Or travel to other areas for different levels of fights. It's all your choice in this open world.\n\nFighting monsters higher level than you will get you more XP, fighting lower will net less.\n\n(work in progress)"
drawTextBox(text, 0, 6, 79, 20, color.brightcyan, color.blue, "center")


end -- titleDraw
