-- all the different inputs for each scene, in functions

-- local data here


function creditsLoad()
	-- all the one-time things that need to load for title scene
end -- titleLoad()


function creditsInput()
	-- this scene's input mapping
	function love.keypressed(key, scancode, isrepeat)
		if key == "return" then
			fullscreen = not fullscreen
			love.window.setFullscreen(fullscreen, "exclusive")
		end

    -- for switching scenes
		if key == "escape" then
			game.scene.now = "title"
			game.scene.previous = "credits"
      titleInput()
			titleRun()
		end

	end
end -- titleInput

function creditsRun()
	-- anything to run on scene load
  if game.bgm.title:isPlaying() then
    -- do stuff
  else
    love.audio.stop( )
    game.bgm.title:play()
  end
end -- titleRun

function creditsUpdate()
	-- this scene's updates

end -- titleUpdate

function creditsDraw()
	-- this scene's draws

	-- fill full window with background color
	love.graphics.setColor( color.darkgrey )
	love.graphics.rectangle("fill", 0, 0, width, height)

	local text = "\nCREDITS SCENE\n\nThis is the credits scene. I would like to thank everyone...\n"
	drawTextBox(text, 20, 10, 40, 6, color.white, color.grey, "center")

  drawTextColor(" ^w[^yescape^w] Return to menu ", 65, 26, 30, color.black)

end -- titleDraw