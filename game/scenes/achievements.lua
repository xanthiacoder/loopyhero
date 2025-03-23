-- all the different inputs for each scene, in functions


function achievementsLoad()
	-- all the one-time things that need to load for title scene
	if love.filesystem.getInfo( "char/data.txt" ) ~= nil then -- char already created
    loadData()
  end
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

  drawTextColor("", 0, 2, 160, color.black)

  if charData.deaths == nil then charData.deaths = 0 end
  drawTextColor(" ^WYou died ^y"..charData.deaths.." ^Wtimes. ", 0, 3, 40, color.black)
  if charData.fled == nil then charData.fled = 0 end
  drawTextColor(" ^WYou fled ^y"..charData.fled.." ^Wtimes. ", 0, 4, 40, color.black)
  if charData.drankpots == nil then charData.drankpots = 0 end
  drawTextColor(" ^WYou drank ^y"..charData.drankpots.." ^Wpotions. ", 0, 5, 40, color.black)
  if charData.mobskilled == nil then charData.mobskilled = 0 end
  drawTextColor(" ^WYou killed ^y"..charData.mobskilled.." ^Wmobs. ", 0, 6, 40, color.black)

  drawTextColor("", 0, 7, 160, color.black)
  if charData.foughthigher == nil then charData.foughthigher = 0 end
  drawTextColor(" ^WYou fought higher level mobs ^y"..charData.foughthigher.." ^Wtimes. ", 40, 7, 60, color.black)

  if charData.coinrate == nil then charData.coinrate = 0 end
  drawTextColor(" ^WYou earn about ^y"..charData.coinrate.." ^Wcoins per minute.", 40, 3, 60, color.black)
  if charData.totalcoinsearned == nil then charData.totalcoinsearned = 0 end
  drawTextColor(" ^WYour total earnings is ^y"..charData.totalcoinsearned.." ^Wcoins.", 40, 4, 60, color.black)
  if charData.xprate == nil then charData.xprate = 0 end
  drawTextColor(" ^WYou earn about ^y"..charData.xprate.." ^WXP per minute.", 40, 5, 60, color.black)
  if charData.charscreated == nil then charData.charscreated = 0 end
  drawTextColor(" ^WYou created ^y"..charData.charscreated.." ^Wcharacters.", 40, 6, 60, color.black)

  if charData.reached5 == nil then charData.reached5 = 0 end
  drawTextColor(" ^WYou reached level  5 in ^y"..charData.reached5.." ^Wseconds. ", 100, 3, 60, color.black)
  if charData.reached10 == nil then charData.reached10 = 0 end
  drawTextColor(" ^WYou reached level 10 in ^y"..charData.reached10.." ^Wseconds. ", 100, 4, 60, color.black)
  if charData.reached20 == nil then charData.reached20 = 0 end
  drawTextColor(" ^WYou reached level 20 in ^y"..charData.reached20.." ^Wseconds. ", 100, 5, 60, color.black)
  if charData.reached31 == nil then charData.reached31 = 0 end
  drawTextColor(" ^WYou reached level 31 in ^y"..charData.reached31.." ^Wseconds. ", 100, 6, 60, color.black)

  drawTextColor("", 0, 8, 160, color.black)


  drawTextColor(" ^w[^yescape^w] Return to menu ", 65, 40, 30, color.black)



end -- titleDraw
