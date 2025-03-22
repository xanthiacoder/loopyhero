-- all the different inputs for each scene, in functions


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

function enhancingUpdate()
	-- this scene's updates

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
