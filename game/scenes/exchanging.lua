-- all the different inputs for each scene, in functions

local tick = 0 -- timing for regeneration

local saleList = {
  [1] = "^wSmall ^rHealth ^wPotion ^W(+10 HP)",
  [2] = "^wMedium ^rHealth ^wPotion ^W(+30 HP)",
  [3] = "^wLarge ^rHealth ^wPotion ^W(+50 HP)",
}

local buyItem = 1

function exchangingLoad()
	-- all the one-time things that need to load for title scene
  game.bgm.exchanging = love.audio.newSource("bgm/Exchanging-Baroo.ogg", "stream")
  game.bgm.exchanging:setLooping(true)
  buyconfirm = love.audio.newSource("sfx/buyitem.ogg", "static")
end -- titleLoad()


function exchangingInput()
	-- this scene's input mapping
	function love.keypressed(key, scancode, isrepeat)

    -- for switching scenes
		if key == "escape" then
      charData.scene = "exchanging"
      saveData()
			game.scene.now = "title"
			game.scene.previous = "exchanging"
      titleInput()
			titleRun()
		end

    if key == "e" or key == "E" then
      saveData()
			game.scene.now = "enhancing"
			game.scene.previous = "exchanging"
      enhancingInput()
			enhancingRun()
		end

		-- for selecting what to buy on saleList
		if key == "up" and (buyItem-1) ~= 0 then -- don't go below 1
			buyItem = buyItem - 1
		end
		if key == "down" and buyItem < #saleList then -- don't past last item
			buyItem = buyItem + 1
		end

    if key == "return" and charData.items < charData.itemsmax then
      if buyItem == 1 and charData.coins > 2 then
        buyconfirm:stop()
        buyconfirm:play()
        charData.smallhppot = charData.smallhppot + 1
        charData.items = charData.items + 1
        charData.coins = charData.coins - 2 + math.floor(2*(charData.cha/24))
      end

      if buyItem == 2 and charData.coins > 40 then
        buyconfirm:stop()
        buyconfirm:play()
        charData.medhppot = charData.medhppot + 1
        charData.items = charData.items + 1
        charData.coins = charData.coins - 40 + math.floor(40*(charData.cha/24))
      end

      if buyItem == 3 and charData.coins > 80 then
        buyconfirm:stop()
        buyconfirm:play()
        charData.largehppot = charData.largehppot + 1
        charData.items = charData.items + 1
        charData.coins = charData.coins - 80 + math.floor(80*(charData.cha/24))
      end

    end


	end
end -- titleInput

function exchangingRun()
	-- anything to run on scene load
  game.message = ""
  if game.bgm.exchanging:isPlaying() then
    -- do stuff
  else
    love.audio.stop( )
    game.bgm.exchanging:play()
  end
end -- titleRun

function exchangingUpdate(dt)
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

function exchangingDraw()
	-- this scene's draws

	-- fill full window with background color
	love.graphics.setColor( color.darkgrey )
	love.graphics.rectangle("fill", 0, 0, width, height)

	-- exchanging HUD
  local text = "\nEXCHANGING SCENE\n\nYou have coins, we have potions!\n\nAfter risking life and limb, what better place to be than at a marketplace where you can trade! Perhaps you'd find some interesting artifact that you can now afford...\n\nThe amount of items you can carry and the prices you pay are affected by your stats.\n\n(work in progress)"
	drawTextBox(text, 0, 3, 80, 20, color.brightcyan, color.blue, "center")

  drawTextBox("\n Small HP Potion : "..charData.smallhppot, 0, 34, 34, 3, color.brightcyan, color.blue, "left")
  drawTextBox("\n Medium HP Potion : "..charData.medhppot, 35, 34, 34, 3, color.brightcyan, color.blue, "left")
  drawTextBox("\n Large HP Potion : "..charData.largehppot, 70, 34, 34, 3, color.brightcyan, color.blue, "left")


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

  drawTextColor(" ^w[^yE^w] Go to ^yE^wnhancing  ^w[^yescape^w] Return to menu ", 55, 40, 50, color.black)

  drawScrollList("", saleList, " ^w[^yUP/DOWN^w] Select item  [^yRETURN^w] Buy item ", buyItem, 82, 5, 40, color.brightblue, color.blue)

end -- titleDraw
