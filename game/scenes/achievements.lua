-- all the different inputs for each scene, in functions


function achievementsLoad()
	-- all the one-time things that need to load for title scene
end -- titleLoad()


function achievementsInput()
	-- this scene's input mapping
	function love.keypressed(key, scancode, isrepeat)


    -- for switching scenes
		if key == "escape" then
			game.scene.now = "title"
			game.scene.previous = "achievements"
      titleInput()
			titleRun()
		end

		if key == "return" then
			fullscreen = not fullscreen
			love.window.setFullscreen(fullscreen, "exclusive")
		end


	end
end -- titleInput

function achievementsRun()
	-- anything to run on scene load
  if game.bgm.title:isPlaying() then
    -- do stuff
  else
    love.audio.stop( )
    game.bgm.title:play()
  end
end -- titleRun

function achievementsUpdate()
	-- this scene's updates

end -- titleUpdate

function achievementsDraw()
	-- this scene's draws

	-- fill full window with background color
	love.graphics.setColor( color.darkgrey )
	love.graphics.rectangle("fill", 0, 0, width, height)

	local text = "\nACHIEVEMENTS SCENE\n\nThis is the credits scene. I would like to thank everyone...\n"
	drawTextBox(text, 20, 10, 40, 6, color.white, color.grey, "center")

  drawTextColor(" ^w[^yescape^w] Return to menu ", 65, 26, 30, color.black)



end -- titleDraw
