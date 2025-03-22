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
  if game.bgm.exploring:isPlaying() then
    -- do stuff
  else
    love.audio.stop( )
    game.bgm.exploring:play()
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

	local text = "\nMusic by:\n\nDana Roskvist (https://soundcloud.com/danaroskvist)\nBaroo (https://baroo-x.itch.io)\n\nArt by:\nH.K.\n\nCoding by:\nXanthia (https://github.com/xanthiacoder)\n\nSpecial Thanks to:\nLove2D discord community for their support"
	drawTextBox(text, 40, 5, 80, 20, color.brightcyan, color.blue, "center")

  drawTextColor(" ^w[^yescape^w] Return to menu ", 65, 40, 30, color.black)

end -- titleDraw
