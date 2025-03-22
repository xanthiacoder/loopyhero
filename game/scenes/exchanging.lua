-- all the different inputs for each scene, in functions


function exchangingLoad()
	-- all the one-time things that need to load for title scene
  game.bgm.exchanging = love.audio.newSource("bgm/Exchanging-Sample.ogg", "stream")
  game.bgm.exchanging:setLooping(true)
end -- titleLoad()


function exchangingInput()
	-- this scene's input mapping
	function love.keypressed(key, scancode, isrepeat)
		if key == "return" then
			fullscreen = not fullscreen
			love.window.setFullscreen(fullscreen, "exclusive")
		end

    -- for switching scenes
		if key == "escape" then
      charData.scene = "exchanging"
      saveData()
			game.scene.now = "title"
			game.scene.previous = "exchanging"
      titleInput()
			titleRun()
		end

    if key == "e" or key == "E" then
      saveData()
			game.scene.now = "enhancing"
			game.scene.previous = "exchanging"
      enhancingInput()
			enhancingRun()
		end



	end
end -- titleInput

function exchangingRun()
	-- anything to run on scene load
  if game.bgm.exchanging:isPlaying() then
    -- do stuff
  else
    love.audio.stop( )
    game.bgm.exchanging:play()
  end
end -- titleRun

function exchangingUpdate()
	-- this scene's updates

end -- titleUpdate

function exchangingDraw()
	-- this scene's draws

	-- fill full window with background color
	love.graphics.setColor( color.darkgrey )
	love.graphics.rectangle("fill", 0, 0, width, height)

	local text = "\nEXCHANGING SCENE\n\nAfter risking life and limb, what better place to be than at a marketplace where you can trade! Perhaps you'd find some interesting artifact that you can now afford...\n\n(work in progress)"
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

  drawTextColor(" ^w[^yE^w] Go to ^yE^wnhancing  ^w[^yescape^w] Return to menu ", 55, 40, 50, color.black)

end -- titleDraw
