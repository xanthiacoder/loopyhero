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
			game.scene.now = "title"
			game.scene.previous = "enhancing"
      titleInput()
			titleRun()
		end

    if key == "e" or key == "E" then
			game.scene.now = "equiping"
			game.scene.previous = "enhancing"
      equipingInput()
			equipingRun()
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

	local text = "\nENHANCING SCENE\n\nThis is the enhancing scene. Imagine some fancy logo here.\n"
	drawTextBox(text, 20, 10, 40, 6, color.brightcyan, color.blue, "center")

  drawTextColor(" ^w[^yE^w] Go to ^yE^wquiping  ^w[^yescape^w] Return to menu ", 55, 36, 50, color.black)

end -- titleDraw
