-- all the different inputs for each scene, in functions


function exploringLoad()
	-- all the one-time things that need to load for title scene
  game.bgm.exploring = love.audio.newSource("bgm/Exploring-DanaRoskvist.ogg", "stream")
  game.bgm.exploring:setLooping(true)
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
      game.scene.now = "title"
      game.scene.previous = "exploring"
      titleInput()
      titleRun()
    end

    if key == "e" or key == "E" then
			game.scene.now = "encountering"
			game.scene.previous = "exploring"
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

end -- titleRun

function exploringUpdate()
	-- this scene's updates

end -- titleUpdate

function exploringDraw()
	-- this scene's draws

	-- fill full window with background color
	love.graphics.setColor( color.darkgrey )
	love.graphics.rectangle("fill", 0, 0, width, height)

	local text = "\nEXPLORING SCENE\n\nThis is the title scene. Imagine some fancy logo here.\n"
	drawTextBox(text, 20, 10, 40, 6, color.brightcyan, color.blue, "center")

  drawTextColor(" ^w[^yE^w] Go to ^yE^wncountering  ^w[^yescape^w] Return to menu ", 55, 36, 50, color.black)

end -- titleDraw
