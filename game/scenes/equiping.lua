-- all the different inputs for each scene, in functions

--[[
the weapons rack contains:
      A wooden handled flail
      A leather whip
      A throwing spear
      A sling
      A wooden mace
      A pack of 50 bullets
      A knotted staff
      A tin dagger
      A copper axe
      A steel headed lance
      A short bow
      A steel sword
      A quiver of 10 arrows
      A steel tipped glaive ]]


local areaData = {
  id = "Mud School", -- name of area, eg Mud School
  desc = "Recommended for new players to explore slowly and get a Mud School Diploma. The cage rooms are also great for quickly leveling to level 6. You may leave for Midgaard anytime, but will not be able to return.", -- general desc of area
  rooms = 75, -- number of rooms
  population = 34, -- number of mobs
  levelLow = 1, -- lowest level mob
  levelHigh = 6, -- highest level mob
  levelMid = 1, -- median level of mobs
  alignment = 50, -- average alignment of mobs in percentage (0 for evil, 50 for neutral, 100 for good)
  terrain = "city", -- types (water, forest, rocks, jungle, city, mountains, plains, desert, swamp, hills)
}

function equipingLoad()
	-- all the one-time things that need to load for title scene
  game.bgm.equiping = love.audio.newSource("bgm/Equiping-Sample.ogg", "stream")
  game.bgm.equiping:setLooping(true)
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

    if key == "e" or key == "E" then
			game.scene.now = "exploring"
			game.scene.previous = "equiping"
      exploringInput()
			exploringRun()
		end


  end
end -- titleInput

function equipingRun()
	-- anything to run on scene load
  if game.bgm.equiping:isPlaying() then
    -- do stuff
  else
    love.audio.stop( )
    game.bgm.equiping:play()
  end
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

  drawTextColor(" ^w[^yE^w] Go to ^yE^wxploring  ^w[^yescape^w] Return to menu ", 55, 40, 50, color.black)

end -- titleDraw
