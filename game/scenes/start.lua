-- all the different inputs for each scene, in functions


function startLoad()
	-- all the one-time things that need to load for title scene
end -- titleLoad()


function startInput()
	-- this scene's input mapping
	function love.keypressed(key, scancode, isrepeat)
		if key == "return" then
			fullscreen = not fullscreen
			love.window.setFullscreen(fullscreen, "exclusive")
		end

    -- for switching scenes
		if key == "escape" then
			game.scene.now = "title"
			game.scene.previous = "start"
      titleInput()
			titleRun()
		end


	end
end -- titleInput

function startRun()
	-- anything to run on scene load

  -- check if char is already created
	if love.filesystem.getInfo( "char/data.txt" ) == nil then -- char not created
		-- go to creation
    game.scene.now = "creation"
    game.scene.previous = "start"
    creationInput()
    creationRun()
	else
    loadData()
    game.scene.now = charData.scene
    game.scene.previous = "start"
    if game.scene.now == "exploring" then
      exploringInput()
      exploringRun()
    elseif game.scene.now == "encountering" then
      encounteringInput()
      encounteringRun()
    elseif game.scene.now == "exchanging" then
      exchangingInput()
      exchangingRun()
    elseif game.scene.now == "enhancing" then
      enhancingInput()
      enhancingRun()
    elseif game.scene.now == "equiping" then
      equipingInput()
      equipingRun()
    else
      game.scene.now = "exploring"
      exploringInput()
      exploringRun()
    end
  end
end -- startRun

function startUpdate()
	-- this scene's updates

end -- titleUpdate

function startDraw()
	-- this scene's draws

	-- fill full window with background color
	love.graphics.setColor( color.darkgrey )
	love.graphics.rectangle("fill", 0, 0, width, height)

	local text = "\nSTART SCENE\n\nThis is the start of the adventure...\n"
	drawTextBox(text, 20, 10, 40, 6, color.brightcyan, color.blue, "center")

  drawTextColor(" ^w[^yescape^w] Return to menu ", 65, 26, 30, color.black)

end -- titleDraw
