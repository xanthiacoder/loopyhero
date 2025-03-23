-- all the different inputs for each scene, in functions


function achievementsLoad()
	-- all the one-time things that need to load for title scene
  loadData()
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
  if game.bgm.exploring:isPlaying() then
    -- do stuff
  else
    love.audio.stop( )
    game.bgm.exploring:play()
  end
end -- titleRun

function achievementsUpdate(dt)
	-- this scene's updates

end -- titleUpdate

function achievementsDraw()
	-- this scene's draws

	-- fill full window with background color
	love.graphics.setColor( color.darkgrey )
	love.graphics.rectangle("fill", 0, 0, width, height)

  if charData.deaths == nil then charData.deaths = 0 end
  drawTextColor(" ^WYou died ^y"..charData.deaths.." ^Wtimes. ", 0, 3, 40, color.black)
  if charData.fled == nil then charData.fled = 0 end
  drawTextColor(" ^WYou fled ^y"..charData.fled.." ^Wtimes. ", 0, 4, 40, color.black)
  if charData.drankpots == nil then charData.drankpots = 0 end
  drawTextColor(" ^WYou drank ^y"..charData.drankpots.." ^Wpotions. ", 0, 5, 40, color.black)
  if charData.mobskilled == nil then charData.mobskilled = 0 end
  drawTextColor(" ^WYou killed ^y"..charData.mobskilled.." ^Wmobs. ", 0, 6, 40, color.black)


  if charData.reached31 == nil then charData.reached31 = 0 end
  drawTextColor(" ^WYou reached level 31 in ^y"..charData.reached31.." ^Wseconds. ", 100, 3, 60, color.black)


  drawTextColor(" ^w[^yescape^w] Return to menu ", 65, 40, 30, color.black)



end -- titleDraw
