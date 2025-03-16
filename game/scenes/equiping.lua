-- all the different inputs for each scene, in functions


function equipingLoad()
	-- all the one-time things that need to load for title scene
end -- titleLoad()


function equipingInput()
	-- this scene's input mapping
	function love.keypressed(key, scancode, isrepeat)
		if key == "return" then
			fullscreen = not fullscreen
			love.window.setFullscreen(fullscreen, "exclusive")
		end

        -- for switching scenes
        if key == "escape" then
          game.scene.now = "title"
          game.scene.previous = "equiping"
          titleInput()
          titleRun()
        end


	end
end -- titleInput

function equipingRun()
	-- anything to run on scene load
end -- titleRun

function equipingUpdate()
	-- this scene's updates

end -- titleUpdate

function equipingDraw()
	-- this scene's draws

	-- fill full window with background color
	love.graphics.setColor( color.darkgrey )
	love.graphics.rectangle("fill", 0, 0, width, height)

	local text = "\nEQUIPING SCENE\n\nAdventure starts from a safe area.\n"
	drawTextBox(text, 20, 10, 40, 6, color.brightcyan, color.blue, "center")

  drawTextColor(" ^w[^yescape^w] Return to menu ", 65, 26, 30, color.black)

end -- titleDraw