-- all the different inputs for each scene, in functions


function titleLoad()
	-- all the one-time things that need to load for title scene
  game.bgart.title = love.graphics.newImage("bgart/title.jpg")
end -- titleLoad()


function titleInput()
	-- this scene's input mapping
	function love.keypressed(key, scancode, isrepeat)
		if key == "return" then
			fullscreen = not fullscreen
			love.window.setFullscreen(fullscreen, "exclusive")
		end

    -- for quick debugging (REMOVE WHEN RELEASE!)
		if key == "0" then
			game.scene.now = "encountering"
      game.scene.previous = "title"
			encounteringInput()
			encounteringRun()
		end

		-- for switching scenes
		if key == "s" or key == "S" then
			game.scene.now = "start"
      game.scene.previous = "title"
			startInput()
			startRun()
		end
		if key == "o" or key == "O" then
			game.scene.now = "options"
      game.scene.previous ="title"
			optionsInput()
			optionsRun()
		end
		if key == "a" or key == "A" then
			game.scene.now = "achievements"
      game.scene.previous = "title"
			creditsInput()
			creditsRun()
    end
		if key == "c" or key == "C" then
			game.scene.now = "credits"
      game.scene.previous = "title"
			creditsInput()
			creditsRun()
		end
		if key == "q" or key == "Q" then
			game.scene.now = "quit"
      game.scene.previous = "title"
			quitInput()
			quitRun()
		end

	end
end -- titleInput

function titleRun()
	-- anything to run on scene load
  if game.bgm.exploring:isPlaying() then
    -- do stuff
  else
    love.audio.stop( )
    game.bgm.exploring:play()
  end
end -- titleRun

function titleUpdate()
	-- this scene's updates

end -- titleUpdate

function titleDraw()
	-- this scene's draws
  love.graphics.setColor( color.white ) -- reset color
  love.graphics.draw(game.bgart.title, 0, 0)
  drawTextColor("^rIDLE CHAMPION ^wOF THE ^yCOFFEEMUD ^wGRIND", 30, 34, 50, color.black)

  local menuOptions = {
    [1] = "^W[^yS^W]tart game",
    [2] = "^W[^yO^W]ptions",
    [3] = "^W[^yA^W]chievements",
    [4] = "^W[^yC^W]redits",
    [5] = "^W[^yQ^W]uit",
  }
  drawNoScrollList("", menuOptions, " ^wLoopy Hero v0.0.7 ", 105, 18, 31, color.brightblue, color.blue)


end -- titleDraw
