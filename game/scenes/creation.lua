-- all the different inputs for each scene, in functions


function creationLoad()
	-- all the one-time things that need to load for title scene
end -- titleLoad()


function creationInput()
	-- this scene's input mapping
	function love.keypressed(key, scancode, isrepeat)
		if key == "return" then
			fullscreen = not fullscreen
			love.window.setFullscreen(fullscreen, "exclusive")
		end

        -- for switching scenes
		if key == "escape" then
			game.scene.now = "title"
			game.scene.previous = "creation"
      titleInput()
			titleRun()
		end



	end
end -- titleInput

function creationRun()
	-- anything to run on scene load
end -- titleRun

function creationUpdate()
	-- this scene's updates

end -- titleUpdate

function creationDraw()
	-- this scene's draws

	-- fill full window with background color
	love.graphics.setColor( color.darkgrey )
	love.graphics.rectangle("fill", 0, 0, width, height)

	local text = "\nCREATION SCENE\n\nCreate your character here\n"
	drawTextBox(text, 20, 10, 40, 6, color.brightcyan, color.blue, "center")

  drawTextColor(" ^w[^yescape^w] Return to menu ", 65, 26, 30, color.black)


end -- titleDraw