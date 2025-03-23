-- all the different inputs for each scene, in functions

local tick = 0 -- timing for regeneration


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
      charData.scene = "equiping"
      saveData()
      game.scene.now = "title"
      game.scene.previous = "equiping"
      titleInput()
      titleRun()
    end

    if key == "e" or key == "E" then
      saveData()
			game.scene.now = "exploring"
			game.scene.previous = "equiping"
      exploringInput()
			exploringRun()
		end


  end
end -- titleInput

function equipingRun()
	-- anything to run on scene load
  game.message = ""
  if game.bgm.enhancing:isPlaying() then
    -- do stuff
  else
    love.audio.stop( )
    game.bgm.enhancing:play()
  end
end -- titleRun

function equipingUpdate(dt)
	-- this scene's updates

  tick = tick + dt
  if tick >= 6 then
    charData.playtime = charData.playtime + 6
    if charData.hp < charData.hpmax then
      charData.hp = charData.hp + math.ceil((charData.str + charData.level)/3)
      if charData.hp > charData.hpmax then
        charData.hp = charData.hpmax
      end
    end
    tick = 0
  end


end -- titleUpdate

function equipingDraw()
	-- this scene's draws

	-- fill full window with background color
	love.graphics.setColor( color.darkgrey )
	love.graphics.rectangle("fill", 0, 0, width, height)

	local text = "\nEQUIPING SCENE\n\nBefore setting off, you want to ensure you are properly equiped for the area you wish to explore. It's all part of good planning.\n\n(work in progress)"
	drawTextBox(text, 0, 3, 80, 20, color.brightcyan, color.blue, "center")

  -- standard HUD for 5E
  drawTextColor("^y"..charData.name, 0, 0, 16, color.black)
  drawTextColor("^WLevel ^y"..charData.level.." ", 16, 0, 9, color.black)
  drawTextColor("^c"..areaData[charData.location][1].." ",25, 0, 20, color.black)
  drawTextColor("^y"..charData.coins.." ^Wcoins ",45, 0, 12, color.black)
  drawTextColor("^y"..charData.items.."^W/"..charData.itemsmax.." items ",57, 0, 14, color.black)
  drawTextColor("^y"..charData.load.."^W/"..charData.loadmax.." load ",71, 0, 14, color.black)
  drawTextColor(" ^WPlaytime: ^y"..charData.playtime, 85, 0, 20, color.black)
  drawText("XP: "..charData.xp.."/"..xptnl[charData.level], 0, 1, 80, color.black, color.brightyellow, charData.xp, xptnl[charData.level])

  drawTextColor(game.message, 0, 38, 160, color.black)

  drawTextColor(" ^w[^yE^w] Go to ^yE^wxploring  ^w[^yescape^w] Return to menu ", 55, 40, 50, color.black)

end -- titleDraw
