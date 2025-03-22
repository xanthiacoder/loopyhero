-- all the different inputs for each scene, in functions

-- local data here


function quitLoad()
	-- all the one-time things that need to load for title scene
end -- titleLoad()


function quitInput()
	-- this scene's input mapping
	function love.keypressed(key, scancode, isrepeat)
		if key == "return" then
			fullscreen = not fullscreen
			love.window.setFullscreen(fullscreen, "exclusive")
		end

		-- for switching scenes
		if key == "y" or key == "Y" then
      saveData()
			love.event.quit()
    end
		if key == "n" or key == "N" then
			game.scene.now = "title"
      game.scene.previous = "quit"
      titleInput()
      titleRun()
		end

	end
end -- titleInput

function quitRun()
	-- anything to run on scene load
  if game.bgm.title:isPlaying() then
    -- do stuff
  else
    love.audio.stop( )
    game.bgm.title:play()
  end
end -- titleRun

function quitUpdate()
	-- this scene's updates

end -- titleUpdate

function quitDraw()
	-- this scene's draws
  love.graphics.setColor( color.white ) -- reset color
  love.graphics.draw(game.bgart.title, 0, 0)
  drawTextColor("^rIDLE CHAMPION ^wOF THE ^yCOFFEEMUD ^wGRIND", 30, 34, 50, color.black)

  local text = "\nThanks to Bo Zimmerman:\n\nFor allowing us to pay tribute to CoffeeMUD, which you can play at coffeemud.net\n\n"
	drawTextBox(text, 90, 10, 60, 6, color.brightcyan, color.blue, "center")

  drawDialogBox("", "Do you really want to quit?", " [Y]es  [N]o ", 105, 18, color.brightblue, color.blue)
end -- titleDraw
