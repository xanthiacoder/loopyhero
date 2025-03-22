-- all the different inputs for each scene, in functions

local tick = 0 -- timing for regeneration


function enhancingLoad()
	-- all the one-time things that need to load for title scene
  game.bgm.enhancing = love.audio.newSource("bgm/Enhancing-Baroo.ogg", "stream")
  game.bgm.enhancing:setLooping(true)
end -- titleLoad()


function enhancingInput()
	-- this scene's input mapping
	function love.keypressed(key, scancode, isrepeat)
		if key == "return" then
			fullscreen = not fullscreen
			love.window.setFullscreen(fullscreen, "exclusive")
		end

    -- for switching scenes
		if key == "escape" then
      charData.scene = "enhancing"
      saveData()
			game.scene.now = "title"
			game.scene.previous = "enhancing"
      titleInput()
			titleRun()
		end

    if key == "e" or key == "E" then
      saveData()
			game.scene.now = "equiping"
			game.scene.previous = "enhancing"
      equipingInput()
			equipingRun()
		end

    if key == "r" or key == "R" then
              -- clear data and start again
              nameEntry = false
              charData.name = ""
              raceEntry = false
              charData.race = ""
              raceSelected = 1
              genderEntry = false
              charData.gender = ""
              statsEntry = false
              statPoints = 56
              charData.str = 3 -- strength
              charData.maxstr = 18
              charData.int = 3 -- intelligence
              charData.maxint = 18
              charData.dex = 3 -- dexterity
              charData.maxdex = 18
              charData.con = 3 -- constitution
              charData.maxcon = 18
              charData.cha = 3 -- charisma
              charData.maxcha = 18
              charData.wis = 3 -- wisdom
              charData.maxwis = 18
              charData.atk = 0 -- attack points
              charData.dmg = 0 -- damage points
              charData.pracs = 0 -- practice points
              charData.trains = 0 -- train points
              charData.hp = 0 -- health
              charData.hpmax = 0
              charData.mn = 0 -- mana
              charData.mnmax = 0
              charData.mv = 0 -- movement
              charData.mvmax = 0
              charData.height = 0
              charData.weight = 0
              charData.xpgain = 100 -- earned experience rate in percentage
              classEntry = false
              charData.class = ""
              classSelected = 1
              alignmentEntry = false
              charData.alignment = 0
              alignmentSelected = 1
              inclinationEntry = false
              charData.inclination = 0
              inclinationSelected = 1

      saveData()
      game.scene.now = "creation"
      game.scene.previous = "enhancing"
      creationInput()
      creationRun()
    end

	end
end -- titleInput

function enhancingRun()
	-- anything to run on scene load
  if game.bgm.enhancing:isPlaying() then
    -- do stuff
  else
    love.audio.stop( )
    game.bgm.enhancing:play()
  end
end -- titleRun

function enhancingUpdate(dt)
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

function enhancingDraw()
	-- this scene's draws

	-- fill full window with background color
	love.graphics.setColor( color.darkgrey )
	love.graphics.rectangle("fill", 0, 0, width, height)

	local text = "\nENHANCING SCENE\n\nImagine a place where you can safely enhance youself, and your items, with the points you have gained. Acquired skills would also allow improving of items like sharpening them to be more effective, or protecting them from breakage.\n\nYou may also re-create your character, which will erase all current character progress.\n\n(work in progress)"
	drawTextBox(text, 0, 3, 80, 20, color.brightcyan, color.blue, "center")

  -- standard HUD for 5E
  drawTextColor("^y"..charData.name, 0, 0, 16, color.black)
  drawTextColor("^WLevel ^y"..charData.level.." ", 16, 0, 9, color.black)
  drawTextColor("^c"..areaData[charData.location][1].." ",25, 0, 20, color.black)
  drawTextColor("^y"..charData.coins.." ^Wcoins ",45, 0, 12, color.black)
  drawTextColor("^y"..charData.items.."^W/"..charData.itemsmax.." items ",57, 0, 14, color.black)
  drawTextColor("^y"..charData.load.."^W/"..charData.loadmax.." load ",71, 0, 14, color.black)
  drawTextColor(" ^WPlaytime: ^y"..charData.playtime, 85, 0, 20, color.black)
  drawText("XP: "..charData.xp.."/"..xptnl[charData.level], 0, 1, 80, color.black, color.brightyellow, charData.xp, xptnl[charData.level])

  drawTextColor(" ^w[^yR^w] Re-create Character ", 80, 3, 40, color.black)

  drawTextColor(" ^w[^yE^w] Go to ^yE^wquiping  ^w[^yescape^w] Return to menu ", 55, 40, 50, color.black)

end -- titleDraw
