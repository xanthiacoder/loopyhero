-- all the different inputs for each scene, in functions


function encounteringLoad()
	-- all the one-time things that need to load for title scene
  game.bgm.encountering = love.audio.newSource("bgm/Encountering-DanaRoskvist.ogg", "stream")
  game.bgm.encountering:setLooping(true)
end -- titleLoad()

function encounteringInput()
	-- this scene's input mapping
	function love.keypressed(key, scancode, isrepeat)
		if key == "return" then
			fullscreen = not fullscreen
			love.window.setFullscreen(fullscreen, "exclusive")
		end

        -- for switching scenes
		if key == "escape" then
			game.scene.now = "title"
			game.scene.previous = "encountering"
      titleInput()
			titleRun()
		end

    if key == "e" or key == "E" then
			game.scene.now = "exchanging"
			game.scene.previous = "encountering"
      exchangingInput()
			exchangingRun()
		end


		-- for testing HP bars
		if key == "a" then
			local hit = love.math.random(2)
			if hit == 1 then
				punch[love.math.random(7)]:play()
				game.playerone.hpNow = game.playerone.hpNow - love.math.random(10)
			else
				punch[love.math.random(7)]:play()
				game.playertwo.hpNow = game.playertwo.hpNow - love.math.random(10)
			end
		end

	end
end -- titleInput

function encounteringRun()
	-- anything to run on scene load
  if game.bgm.encountering:isPlaying() then
    -- do stuff
  else
    love.audio.stop( )
    game.bgm.encountering:play()
  end
end -- titleRun

function encounteringUpdate()
	-- this scene's updates

end -- titleUpdate

function encounteringDraw()
	-- this scene's draws

	-- fill full window with background color
	love.graphics.setColor( color.darkgrey )
	love.graphics.rectangle("fill", 0, 0, width, height)

	local text = "\nENCOUNTER SCENE\n\nThis is the encounter scene. Imagine some combat here.\n"
	drawTextBox(text, 20, 10, 40, 6, color.brightcyan, color.blue, "center")

  drawTextColor(" ^w[^yE^w] Go to ^yE^wxchanging  ^w[^yescape^w] Return to menu ", 55, 36, 50, color.black)

end -- titleDraw
