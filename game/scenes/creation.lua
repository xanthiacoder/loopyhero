-- all the different inputs for each scene, in functions

  local charAbilites = {

  }

  local charImmunities = {

  }

  local charEquipment = {

  }

  local races = {
    [1] = "Aarakocran",
    [2] = "Beastkin",
    [3] = "Centaur",
    [4] = "Drow",
    [5] = "Duergar",
    [6] = "Dwarf",
    [7] = "Elf",
    [8] = "Githyanki",
    [9] = "Gnoll",
    [10] = "Gnome",
    [11] = "Goblin",
    [12] = "Half Elf",
    [13] = "Halfling",
    [14] = "Human",
    [15] = "Lizard Man",
    [16] = "Merfolk",
    [17] = "Mindflayer",
    [18] = "Ogre",
    [19] = "Orc",
    [20] = "Pixie",
    [21] = "Svirfneblin",
    [22] = "Tiefling",
  }

  local raceDesc = {
    [1] = "Aarakocran are bipedal birdmen, with hands incorporated into their wings. Aarakocran are a little taller than humans, but much lighter dueto their bone structure.  They are adept flyers with superior vision.",
    [2] = "Though others dismiss the fuzzy, animal-like Beastkin as a single aberration, there are many distinct kinds, each resembling a different woodland beast: wolves, foxes, and rabbits are only some of them.  Beastkin may be noble or savage, but usually take to natural magics well while spurning orthodox religion.",
    [3] = "Centaurs are large creatures with the body of a horse and the upper torso, head, and arms of a human. Their class choices are limited, but they excel at forestry, and make excellent rangers and druids.",
    [4] = "These dark skinned cousins of the elves hate the sunlight, and are quick, but frail.  Due to their weakness to sunlight, Drow adventurers prefer to remain underground, although those who venture to the surface use their darkness globes to dampen the light.  This race is more challenging to play.",
    [5] = "A grumpier balder dwarf, these creatures have numerous dark underground abilities.  Duergar are slow to level and starts in a more difficult start area, Magthere Wa'q.",
    [6] = "Dwarves are shorter than humans, but much stockier, and enjoy sporting beards (including the women).",
    [7] = "Elves are slightly shorter and more slender than humans, but are quick and agile.",
    [8] = "Githyanki are planar travelers from an ancient race whom have taken residence in the Astral Plane.  They are tall and gaunt, but also quite powerful.  They use their knowledge of the planes to take brief jaunts around obstacles, appearing to teleport into well protected areas. This race starts in a more difficult start area, Magthere Wa'q.",
    [9] = "Gnolls are viscous anthropomorphic hyena-men.  They stand 6 feet to 7 and a half feet tall, are lean and very viscous.  Gnolls enjoy displays of cruelty and mercilessness, often pulling limbs from their living prey. They hunt creatures of all sorts, but particularly enjoy hunting intelligent species.",
    [10] = "Gnomes are curious and quick-witted folk, resembling small dwarves.",
    [11] = "Goblins are small twisted creatures, quick on their feet, and natural tinkerers with all manner of wicked traps and devices  Their class choices are limited, but they excel at thieving, and make great miners and delvers.  Due to their short life expectancy, Goblin adventurers receive a bonus to experience.",
    [12] = "Half Elves are a mixture of humans and elves, possessing human drive and elven grace.",
    [13] = "Halflings are a very short fur-footed folk, noted for their quick hands and round, full stomachs.",
    [14] = "Just like you and me!  Humans are versatile and successful adventurers!",
    [15] = "These large, bidedal humanoids stand about a head taller than humans. They have a thick three to six foot tail which they use for improved swimming and to protect themselves.  Lizard men prefer temperate to tropical environments and can hold their breath underwater for extended periods.",
    [16] = "Merfolk are half-fish, half-humanoid dwellers of the sea.  They can breathe air and water, enabling trade with surface dwellers.  Merfolk are the dominant underwater race.",
    [17] = "Mindflayers, or Illithid, are alien humanoids with a smooth, leathery face with four tentacles surrounding and protecting their mouths. They are taller than humans, but lighter and more frail due to millennia of reliance upon mind-controlled slave labor to do their manual work.  Mindflayers require a very special diet of brains that they mindsuck from charmed victims. This race starts in a more difficult start area, Magthere Wa'q.",
    [18] = "Ogres are the less enlightened kin to the giants, possessing great strength and ferociousness at the expense of their intellect and dexterity .  As they are naturals at ripping things apart, they make excellent butchers.  Their class choices are limited, but any kind of Fighter or Barbarian would suit an ogre very well.",
    [19] = "Orcs are powerful, brutish porcine humanoids that take great joy in the agony of others.  Their society is dictated by the strongest, most-vicious alphas of the tribe, who often band together to create great war-parties to destroy other species? civilization.",
    [20] = "Pixies are playful fairy-kin, standing roughly two feet tall. These pranksters rarely venture into society, but sometimes enjoy pranking villagers near their woodland habitats.  Pixies have transparent butterfly wings and the innate ability to remain invisible as long as they wish.  Pixies are vegetarians and eating meat can make them violently ill.",
    [21] = "Svirfneblin, or Deep Gnomes, are earthy-toned gnomes that live deep below the surface.  They prefer to isolate themselves from other underground societies, which are often cruel and conniving by deep gnome standards.",
    [22] = "Tieflings are mortal beings who have a trace of demon heritage, granting them distinguished features including hornes, wings and a tail. Tiefling are universally distrusted due to their ancestry and tendency to fall upon the wicked ways of demons.",
  }


local racesBonus = {
--        str, maxstr, int, maxint, dex, maxdex, con, maxcon, cha, maxcha, wis, maxwis, xpgain
  [1]  = {  0,      0,   0,      0,   2,      2,  -1,     -1,  -1,     -1,   0,      0,      0 },
  [2]  = {  0,      0,   0,      0,   1,      1,   2,      2,  -1,     -1,  -2,     -2,      0 },
  [3]  = {  1,      1,   1,      1,   0,      0,   0,      0,  -1,      1,  -1,      1,      0 },
  [4]  = {  0,      0,   1,      1,   3,      3,  -4,      1,  -3,      1,   0,      0,      0 },
  [5]  = {  0,      0,   0,      0,   0,      0,   1,      1,  -4,      1,   0,      0,      0 },
  [6]  = {  0,      0,   0,      0,   0,      0,   1,      1,  -1,      1,   0,      0,      0 },
  [7]  = {  0,      0,   0,      0,   1,      1,  -1,      1,   0,      0,   0,      0,      0 },
  [8]  = {  0,      0,   0,      0,   1,      1,   0,      0,   0,      0,   1,      1,    -20 },
  [9]  = {  2,      2,  -3,      1,   0,      0,   0,      0,   0,      0,  -2,      1,      0 },
  [10] = {  0,      0,   1,      1,   0,      0,   0,      0,   0,      0,  -1,      1,      5 },
  [11] = { -1,      1,   1,      1,   2,      2,   0,      0,  -1,      1,  -1,      1,      0 },
  [12] = {  0,      0,   0,      0,   0,      0,   0,      0,   0,      0,   0,      0,      0 },
  [13] = { -1,      1,   0,      0,   1,      1,   0,      0,   0,      0,   0,      0,      0 },
  [14] = {  0,      0,   0,      0,   0,      0,   0,      0,   0,      0,   0,      0,      0 },
  [15] = {  1,      1,  -1,      1,   0,      0,   1,      1,  -1,      1,   0,      0,      0 },
  [16] = {  0,      0,   0,      0,   2,      2,   0,      0,   0,      0,  -2,      1,      0 },
  [17] = { -4,      1,   4,      4,   0,      0,  -2,      1,   2,      2,   0,      0,    -25 },
  [18] = {  4,      4,  -1,      1,  -2,      1,   0,      0,  -1,      1,   0,      0,      0 },
  [19] = {  2,      2,  -1,      1,   0,      0,   0,      0,  -1,      1,  -1,      1,      0 },
  [20] = { -6,      1,   0,      0,   7,      7,  -7,     -7,   2,      2,   0,      0,      0 },
  [21] = {  2,      2,   1,      1,   0,      0,  -2,      1,   0,      0,  -1,      1,      0 },
  [22] = {  0,      0,   1,      1,   0,      0,   0,      0,   2,      2,   0,      0,    -20 },
}

local racesHW = {
-- height weight | Hlow, Hhigh,  Wlow, Whigh
  [1]  =         {   59,    71,   160,  240 },
  [2]  =         {   66,    78,   150,  200 },
  [3]  =         {   60,    72,  1150, 1550 },
  [4]  =         {   59,    71,    80,  160 },
  [5]  =         {   50,    58,   150,  250 },
  [6]  =         {   50,    58,   150,  250 },
  [7]  =         {   59,    71,    80,  160 },
  [8]  =         {   61,    73,    90,  180 },
  [9]  =         {   71,    79,   180,  260 },
  [10] =         {   38,    44,    60,  110 },
  [11] =         {   42,    48,    70,  120 },
  [12] =         {   61,    73,    90,  180 },
  [13] =         {   38,    44,    80,  130 },
  [14] =         {   66,    78,   150,  200 },
  [15] =         {   69,    72,   200,  250 },
  [16] =         {   90,   102,   180,  230 },
  [17] =         {   61,    73,    90,  180 },
  [18] =         {   71,    83,   290,  380 },
  [19] =         {   58,    70,   150,  250 },
  [20] =         {   23,    27,    30,   35 },
  [21] =         {   38,    44,    60,  110 },
  [22] =         {   65,    73,   150,  230 },
}

--[[Your stats below reflect your physical and mental gifts.  They can be
boosted through the use of Training sessions, which are granted at first level,
and
are gained at a rate of one per level.  These training sessions are also
needed to gain new spells and abilities which your class qualifies for, but does
not get at first level.

Strength: Physical strength and fighting prowess is reflected in strength.
Fighter-types love their muscles.
Intelligence: Memory and concentration, and the ability to gain greater
proficiency in skills is reflected in Intelligence. Mages require intellect.
Dexterity: Agility and the ability to dodge blows is reflected in Dexterity.
Thieves need all of this they can get.
Constitution: Health, stamina, and the ability to live through harder fights
is reflected in Constitution. Druids adore health.
Charisma: Grace, charm, and the ability to get better prices from merchants
is reflected in Charisma. Bards live off their charm.
Wisdom: Intuition, wit, and the ability to gain more practice points per
level is reflected in Wisdom. Clerics use wisdom best.

You are awarded 2 BONUSCHARSTATS!

You are awarded 2 BONUSCHARSTATS!

Your current stats are:
Strength       : 3 /18
Intelligence   : 3 /18
Dexterity      : 3 /18
Constitution   : 3 /18
Charisma       : 3 /18
Wisdom         : 3 /18
STATS TOTAL    : 18/108

You have 56 points remaining.
Enter a Stat to add or remove points, ? for help, or R for random roll.]]

--[[This would qualify you for Apprentice, Bard, Cleric, Druid, Fighter, Mage,
and Thief.

Now it is time to choose your character's Class, which is the career-path
that they will follow in the game.  This is your most important decision,
choose wisely!

Fighter   : Fighters are brutish weapon masters, skilled in the art of
killing, and invaluable in a close melee.  This also include Rangers, Paladins,
Barbarians, and Monks.

Thief     : Thieves are skillful, sly, and devious, skilled at swiping,
stealing, hiding, sneaking, trapping, poisoning, and more.  This also includes
Assassins, Arcanists, Burglars, and Trappers.

Bard      : Bards are traveling singers, whose "songs" can possess
powerful magic, who also qualify for many thief skills.

Cleric    : Clerics are the great vassals of the Gods, who possess great
magical abilities in their numerous "prayers".  This also includes
numerous specialist devotional Cleric classes.

Mage      : Mages are masters of magic, and wielders of the great elemental
powers.  This also includes numerous Specialist Mage classes.

Druid     : Druids are mystical guardians of the natural world, whose magic
is drawn from earth, sea, and sky.

Apprentice: Not sure what to be?  Start off as an Apprentice, and take
training in one of the better classes when you are ready!

Please choose from the following Classes:
[Apprentice, Bard, Cleric, Druid, Fighter, Mage, or Thief]]

local nameEntry = false -- state for data entry
local dataString = "" -- input string from user

local raceEntry = false -- state for race entry
local raceSelected = 1

local genderEntry = false

local statsEntry = false
local statPoints = 56 -- points to be distributed among the stats

local classEntry = false
local classSelected = 1
local classList = {
  [1] = "Bard",
  [2] = "Cleric",
  [3] = "Commoner",
  [4] = "Druid",
  [5] = "Fighter",
  [6] = "Mage",
  [7] = "Thief"
}
local classDesc = {
  [1] = "Bards are traveling singers, whose songs can possess powerful magic, who also qualify for many thief skills.",
  [2] = "Clerics are the great vassals of the Gods, who possess great magical abilities in their numerous prayers.",
  [3] = "Commoners might not appear like heroes, but they delve deep into crafting items and equipment.",
  [4] = "Druids are mystical guardians of the natural world, whose magic is drawn from earth, sea, and sky.",
  [5] = "Fighters are brutish weapon masters, skilled in the art of killing, and invaluable in a close melee.",
  [6] = "Mages are masters of magic, and wielders of the great elemental powers.",
  [7] = "Thieves are skillful, sly, and devious, skilled at swiping, stealing, hiding, sneaking, trapping, poisoning, and more.",
}

local alignmentEntry = false
alignmentSelected = 1

local alignmentList = {
  [1] = "Evil",
  [2] = "Neutral",
  [3] = "Good",
}

--[[Your social order inclination is rated from Lawful to Chaotic, with Lawful
representing cultural acceptance and social order, Chaotic representing
heightened importance on free will and rule fluidity, and Moderate representing
the balance between Lawful and Chaotic.]]

local inclinationEntry = false
inclinationSelected = 1

local inclinationList = {
  [1] = "Chaotic",
  [2] = "Moderate",
  [3] = "Lawful",
}

function creationLoad()
	-- all the one-time things that need to load for title scene
  game.bgm.creation = love.audio.newSource("bgm/Creation-DanaRoskvist.ogg", "stream")
  game.bgm.creation:setLooping(true)
end -- titleLoad()


function creationInput()
	-- this scene's input mapping
	function love.keypressed(key, scancode, isrepeat)

    -- for switching scenes
		if key == "escape" then
			game.scene.now = "title"
			game.scene.previous = "creation"
      titleInput()
			titleRun()
		end

    -- 7th : inclination entry

    if nameEntry and raceEntry and genderEntry and statsEntry and classEntry and alignmentEntry and inclinationEntry == false then
      if key == "up" and inclinationSelected > 1 then
        inclinationSelected = inclinationSelected - 1
      end
      if key == "down" and inclinationSelected < #inclinationList and inclinationEntry == false then
        inclinationSelected = inclinationSelected + 1
      end
      if key == "return" then
        if inclinationSelected == 1 then
          charData.inclination = 0
        end
        if inclinationSelected == 2 then
          charData.inclination = 50
        end
        if inclinationSelected == 3 then
          charData.inclination = 100
        end
        inclinationEntry = true
      end
    end

    -- 6th : alignment entry
    if nameEntry and raceEntry and genderEntry and statsEntry and classEntry and alignmentEntry == false then
      if key == "up" and alignmentSelected > 1 then
        alignmentSelected = alignmentSelected - 1
      end
      if key == "down" and alignmentSelected < #alignmentList and alignmentEntry == false then
        alignmentSelected = alignmentSelected + 1
      end
      if key == "return" then
        if alignmentSelected == 1 then
          charData.alignment = 0
        end
        if alignmentSelected == 2 then
          charData.alignment = 50
        end
        if alignmentSelected == 3 then
          charData.alignment = 100
        end
        alignmentEntry = true
      end
    end

    -- 5th : class entry
    if nameEntry and raceEntry and genderEntry and statsEntry and classEntry == false then
      if key == "up" and classSelected > 1 then
        classSelected = classSelected - 1
      end
      if key == "down" and classSelected < #classList and classEntry == false then
        classSelected = classSelected + 1
      end
      if key == "return" then
        if classSelected == 1 and charData.cha > 8 then -- clear bard's minimum requirements
          charData.class = classList[classSelected]
          charData.pracs = 5 + (math.ceil(charData.wis/6) + 1)
          charData.trains = 3 + 1
          charData.hpmax = 20 + ( math.ceil(charData.con/3) + (love.math.random(2,12)) )
          charData.mnmax = 100 + ( math.ceil(charData.int/6) + (love.math.random(1,2)) )
          charData.mvmax = 100 + ( 5 * math.ceil(charData.str/18) )
          charData.atk = math.ceil(charData.cha/18)
          charData.dmg = 1
          classEntry = true
        end
        if classSelected == 2 and charData.wis > 8 then -- clear cleric's minimum requirements
          charData.class = classList[classSelected]
          charData.pracs = 5 + (math.ceil(charData.wis/6) + 2)
          charData.trains = 3 + 1
          charData.hpmax = 20 + ( math.ceil(charData.con/3) + (love.math.random(1,10)) )
          charData.mnmax = 100 + ( math.ceil(charData.int/4) + (love.math.random(1,4)) )
          charData.mvmax = 100 + ( 5 * math.ceil(charData.str/18) )
          charData.atk = math.ceil(charData.wis/18)
          charData.dmg = 1
          classEntry = true
        end
        if classSelected == 3 and charData.wis > 4 and charData.int > 4 then -- clear commoner's minimum requirements
          charData.class = classList[classSelected]
          charData.pracs = 5 + (math.ceil(charData.wis/6) + 5)
          charData.trains = 6 + 1
          charData.hpmax = 20 + ( math.ceil(charData.con/9) + (love.math.random(1,4)) )
          charData.mnmax = 100 + ( math.ceil(charData.int/10) + (love.math.random(1,2)) )
          charData.mvmax = 100 + ( 5 * math.ceil(charData.str/18) )
          charData.atk = math.ceil(charData.wis/18) - 1
          charData.dmg = 1
          classEntry = true
        end
        if classSelected == 4 and charData.con > 8 then -- clear druid's minimum requirements
          charData.class = classList[classSelected]
          charData.pracs = 5 + (math.ceil(charData.wis/6) + 2)
          charData.trains = 3 + 1
          charData.hpmax = 20 + ( math.ceil(charData.con/2) + (love.math.random(2,14)) )
          charData.mnmax = 100 + ( math.ceil(charData.int/4) + (love.math.random(1,4)) )
          charData.mvmax = 100 + ( 5 * math.ceil(charData.str/18) )
          charData.atk = math.ceil(charData.con/18)
          charData.dmg = 1
          classEntry = true
        end
        if classSelected == 5 and charData.str > 8 then -- clear fighter's minimum requirements
          charData.class = classList[classSelected]
          charData.pracs = 3 + (math.ceil(charData.wis/6) - 1)
          charData.trains = 4 + 1
          charData.hpmax = 20 + ( math.ceil(charData.con/2) + (love.math.random(2,14)) )
          charData.mnmax = 100 + ( math.ceil(charData.int/8) + (love.math.random(1,2)) )
          charData.mvmax = 100 + ( 7 * math.ceil(charData.str/18) )
          charData.atk = math.ceil(charData.str/18)
          charData.dmg = 1
          classEntry = true
        end
        if classSelected == 6 and charData.int > 8 then -- clear mage's minimum requirements
          charData.class = classList[classSelected]
          charData.pracs = 6 + (math.ceil(charData.wis/6) + 4)
          charData.trains = 3 + 1
          charData.hpmax = 20 + ( math.ceil(charData.con/6) + (love.math.random(1,5)) )
          charData.mnmax = 100 + ( math.ceil(charData.int/3) + (love.math.random(1,4)) )
          charData.mvmax = 100 + ( 3 * math.ceil(charData.str/18) )
          charData.atk = math.ceil(charData.int/18)
          charData.dmg = 1
          classEntry = true
        end
        if classSelected == 7 and charData.dex > 8 then -- clear thief's minimum requirements
          charData.class = classList[classSelected]
          charData.pracs = 5 + (math.ceil(charData.wis/6) + 1)
          charData.trains = 3 + 1
          charData.hpmax = 20 + ( math.ceil(charData.con/3) + (love.math.random(1,10)) )
          charData.mnmax = 100 + ( math.ceil(charData.int/6) + (love.math.random(1,3)) )
          charData.mvmax = 100 + ( 6 * math.ceil(charData.str/18) )
          charData.atk = math.ceil(charData.dex/18)
          charData.dmg = 1
          classEntry = true
        end
        charData.hp = charData.hpmax
        charData.mn = charData.mnmax
        charData.mv = charData.mvmax
      end
    end

    -- 4th : stats entry
    if nameEntry and raceEntry and genderEntry and statsEntry == false then
      if key == "return" and statPoints == 0 then -- only confirm when all points are used
        statsEntry = true
      end
      -- Q/W for str
      -- A/S for int
      -- Z/X for dex
      -- E/R for con
      -- D/F for cha
      -- C/V for wis
      if key == "q" and charData.str > 3 then
        charData.str = charData.str - 1
        statPoints = statPoints + 1
      end
      if key == "a" and charData.int > 3 then
        charData.int = charData.int - 1
        statPoints = statPoints + 1
      end
      if key == "z" and charData.dex > 3 then
        charData.dex = charData.dex - 1
        statPoints = statPoints + 1
      end
      if key == "e" and charData.con > 3 then
        charData.con = charData.con - 1
        statPoints = statPoints + 1
      end
      if key == "d" and charData.cha > 3 then
        charData.cha = charData.cha - 1
        statPoints = statPoints + 1
      end
      if key == "c" and charData.wis > 3 then
        charData.wis = charData.wis - 1
        statPoints = statPoints + 1
      end
      if key == "w" and charData.str < charData.maxstr and statPoints > 0 then
        charData.str = charData.str + 1
        statPoints = statPoints - 1
      end
      if key == "s" and charData.int < charData.maxint and statPoints > 0 then
        charData.int = charData.int + 1
        statPoints = statPoints - 1
      end
      if key == "x" and charData.dex < charData.maxdex and statPoints > 0 then
        charData.dex = charData.dex + 1
        statPoints = statPoints - 1
      end
      if key == "r" and charData.con < charData.maxcon and statPoints > 0 then
        charData.con = charData.con + 1
        statPoints = statPoints - 1
      end
      if key == "f" and charData.cha < charData.maxcha and statPoints > 0 then
        charData.cha = charData.cha + 1
        statPoints = statPoints - 1
      end
      if key == "v" and charData.wis < charData.maxwis and statPoints > 0 then
        charData.wis = charData.wis + 1
        statPoints = statPoints - 1
      end
    end

    -- 3rd : gender entry
    if nameEntry and raceEntry and genderEntry == false then
      if key == "m" then
        charData.gender = "Male"
        genderEntry = true
      end
      if key == "f" then
        charData.gender = "Female"
        genderEntry = true
      end
    end

    -- 2nd : race entry
    if nameEntry and charData.race == "" and raceEntry == false then
      if key == "up" and raceSelected > 1 then
        raceSelected = raceSelected - 1
      end
      if key == "down" and raceSelected < #races and raceEntry == false then
        raceSelected = raceSelected + 1
      end
      if key == "return" then
        raceEntry = true
        charData.race = races[raceSelected]
        charData.str = charData.str + racesBonus[raceSelected][1]
        charData.maxstr = charData.maxstr + racesBonus[raceSelected][2]
        charData.int = charData.int + racesBonus[raceSelected][3]
        charData.maxint = charData.maxint + racesBonus[raceSelected][4]
        charData.dex = charData.dex + racesBonus[raceSelected][5]
        charData.maxdex = charData.maxdex + racesBonus[raceSelected][6]
        charData.con = charData.con + racesBonus[raceSelected][7]
        charData.maxcon = charData.maxcon + racesBonus[raceSelected][8]
        charData.cha = charData.cha + racesBonus[raceSelected][9]
        charData.maxcha = charData.maxcha + racesBonus[raceSelected][10]
        charData.wis = charData.wis + racesBonus[raceSelected][11]
        charData.maxwis = charData.maxwis + racesBonus[raceSelected][12]
        charData.xpgain = charData.xpgain + racesBonus[raceSelected][13]
        charData.height = love.math.random( racesHW[raceSelected][1], racesHW[raceSelected][2] )
        charData.weight = love.math.random( racesHW[raceSelected][3], racesHW[raceSelected][4] )
      end
    end

    -- 1st capture keys for name entry
    if nameEntry == false then
      if key == "return" and #dataString > 0 then
        nameEntry = true
        charData.name = dataString -- confirm charData.name
        key = nil
      else
        if key == "backspace" then
          dataString = dataString:sub(1, -2)
        elseif string.byte(key) >= 97 and string.byte(key) <= 122 and #key == 1 and #dataString < 26 then -- single alphabet detected
          if #dataString == 0 then -- first character, capitalize automatically
            dataString = dataString .. string.char(string.byte(key)-32)
          else
            dataString = dataString .. key -- add alphabet to dataString
          end
        end
      end
    end

	end
end -- titleInput

function creationRun()
	-- anything to run on scene load
  if game.bgm.creation:isPlaying() then
    -- do stuff
  else
    love.audio.stop( )
    game.bgm.creation:play()
  end
end -- titleRun

function creationUpdate()
	-- this scene's updates

end -- titleUpdate

function creationDraw()
	-- this scene's draws

	-- fill full window with background color
	love.graphics.setColor( color.darkgrey )
	love.graphics.rectangle("fill", 0, 0, width, height)

  drawTextColor("^wName  : ^y"..charData.name, 1, 1, 40, color.black)
  drawTextColor("^wRace  : ^y"..charData.race, 1, 2, 40, color.black)
  drawTextColor("^wGender: ^y"..charData.gender, 1, 3, 40, color.black)
  drawTextColor("^wHeight: ^y"..charData.height, 1, 4, 40, color.black)
  drawTextColor("^wWeight: ^y"..charData.weight, 1, 5, 40, color.black)

  drawTextColor("^wStrength     : ^y"..charData.str.."/"..charData.maxstr, 1, 7,  40, color.black)
  drawTextColor("^wIntelligence : ^y"..charData.int.."/"..charData.maxint, 1, 8,  40, color.black)
  drawTextColor("^wDexterity    : ^y"..charData.dex.."/"..charData.maxdex, 1, 9,  40, color.black)
  drawTextColor("^wConstitution : ^y"..charData.con.."/"..charData.maxcon, 1, 10,  40, color.black)
  drawTextColor("^wCharisma     : ^y"..charData.cha.."/"..charData.maxcha, 1, 11,  40, color.black)
  drawTextColor("^wWisdom       : ^y"..charData.wis.."/"..charData.maxwis, 1, 12, 40, color.black)
  drawTextColor("^wXP gain      : ^y"..charData.xpgain.."%", 1, 13, 40, color.black)

  drawTextColor("^wClass        : ^y"..charData.class, 1, 14, 40, color.black)
  drawTextColor("^wAlignment    : ^y"..charData.alignment, 1, 15, 40, color.black)
  drawTextColor("^wInclination  : ^y"..charData.inclination, 1, 16, 40, color.black)

  drawTextColor("^wHealth   : ^y"..charData.hp.."/"..charData.hpmax, 1, 18, 40, color.black)
  drawTextColor("^wMana     : ^y"..charData.mn.."/"..charData.mnmax, 1, 19, 40, color.black)
  drawTextColor("^wMovement : ^y"..charData.mv.."/"..charData.mvmax, 1, 20, 40, color.black)

  drawTextColor("^wAttack : ^y"..charData.atk, 1, 22, 40, color.black)
  drawTextColor("^wDamage : ^y"..charData.dmg, 1, 23, 40, color.black)

  drawTextColor("^wPractices : ^y"..charData.pracs, 1, 25, 40, color.black)
  drawTextColor("^wTrains    : ^y"..charData.trains, 1, 26, 40, color.black)
  drawTextColor("^wXP        : ^y"..charData.xp, 1, 28, 40, color.black)

  -- 1st : enter character name
  if charData.name == "" then -- draw dialogbox for dataentry for charData.name
    drawBox("", 65, 19, 30, 3, color.white, color.blue, "thick", "")
    drawTextColor("^w| ^yEnter name ^w|", 67, 19, 14, color.blue)
    drawTextColor("^w"..dataString, 67, 20, 26, color.blue)
  end

  -- 2nd : choose race
  if charData.name ~= "" and charData.race == "" then
    drawScrollList("", races, "^w[^yUP/DOWN^w] Select Race ", raceSelected, 60, 19, 40, color.brightblue, color.blue)
    drawTextBox(raceDesc[raceSelected], 60, 1, 40, 15, color.white, color.blue, "left")

    drawTextColor("^Wadjusted by:"..racesBonus[raceSelected][1].."/"..racesBonus[raceSelected][2], 22, 7,  18, color.black)
    drawTextColor("^Wadjusted by:"..racesBonus[raceSelected][3].."/"..racesBonus[raceSelected][4], 22, 8,  18, color.black)
    drawTextColor("^Wadjusted by:"..racesBonus[raceSelected][5].."/"..racesBonus[raceSelected][6], 22, 9,  18, color.black)
    drawTextColor("^Wadjusted by:"..racesBonus[raceSelected][7].."/"..racesBonus[raceSelected][8], 22, 10,  18, color.black)
    drawTextColor("^Wadjusted by:"..racesBonus[raceSelected][9].."/"..racesBonus[raceSelected][10], 22, 11,  18, color.black)
    drawTextColor("^Wadjusted by:"..racesBonus[raceSelected][11].."/"..racesBonus[raceSelected][12], 22, 12, 18, color.black)
    drawTextColor("^Wadjusted by:"..racesBonus[raceSelected][13], 22, 13, 18, color.black)

  end

    -- 3rd : gender entry
    if nameEntry and raceEntry and charData.gender == "" then

      drawTextBox("Gender doesn't affect anything in the game (for this version)", 60, 1, 40, 15, color.white, color.blue, "left")

      drawBox("", 65, 19, 30, 3, color.white, color.blue, "thick", "")
      drawTextColor(" ^w[^yM^w]ale or [^yF^w]emale ", 70, 20, 20 , color.blue)
    end


    -- 4th : stats entry
    if nameEntry and raceEntry and genderEntry and statsEntry == false then

      local text = "\n Distribute pts\n\n Dec   Stat  Inc\n [Q]   Str   [W]\n [A]   Int   [S]\n [Z]   Dex   [X]\n [E]   Con   [R]\n [D]   Cha   [F]\n [C]   Wis   [V]\n\n Stat points left = "..statPoints.."\n\n All points must be used\n\n [RETURN] Finish distribution"
      drawTextBox(text, 60, 1, 40, 17, color.white, color.blue, "left")

      text = "\n To be eligible for a class, a minimum amount in a prime stat is required\n\n Class     Minimum Stat Required\n\n Bard      Charisma 9+\n Cleric    Wisdom 9+\n Commoner  Wisdom 5+, Intelligence 5+\n Druid     Constitution 9+\n Fighter   Strength 9+\n Mage      Intelligence 9+\n Thief     Dexterity 9+\n\n"
      drawTextBox(text, 110, 1, 45, 17, color.brightyellow, color.blue, "left")

      text = " Str : affects carry capacity, modifies melee damage, movement recovery outside combat, determines attack score\n Int : affects mana gained per level, mana regeneration outside combat, spells critical chance and damage, skill proficiency rates\n Dex : determines armor score, melee / ranged critical hit chance and damage, resists and recovers from some skill attacks\n Con : affects health and movement gained per level, health recovery outside of combat, disease and poison resistance\n Cha : determines max number of followers you can have grouped, affects buy and sell prices\n Wis : affects bonus practice points per level, mana regeneration outside of combat"
      drawTextBox(text, 0, 29, 160, 6, color.white, color.green, "left")

    end

    -- 5th : class entry
    if nameEntry and raceEntry and genderEntry and statsEntry and classEntry == false then
      drawScrollList("", classList, "^w[^yUP/DOWN^w] Select Class ", classSelected, 60, 19, 40, color.brightblue, color.blue)
      drawTextBox(classDesc[classSelected], 60, 1, 40, 15, color.white, color.blue, "left")
    end

    -- 6th : alignment entry
    if nameEntry and raceEntry and genderEntry and statsEntry and classEntry and alignmentEntry == false then
      drawScrollList("", alignmentList, "^w[^yUP/DOWN^w] Select alignment ", alignmentSelected, 60, 19, 40, color.brightblue, color.blue)
      drawTextBox("Alignment affects the amount of XP you get from combat. An evil character killing an evil monster earns less than a good character killing the same.\n\nDruids need to remain neutral so that their chants do not fail, and clerical prayers tend to fail when alignments do not match.\n\n(in percentage : 0 = evil, 50 = neutral, 100 = good)", 60, 1, 40, 15, color.white, color.blue, "left")
    end

    -- 7th : alignment entry
    if nameEntry and raceEntry and genderEntry and statsEntry and classEntry and alignmentEntry and inclinationEntry == false then
      drawScrollList("", inclinationList, "^w[^yUP/DOWN^w] Select inclination ", inclinationSelected, 60, 19, 40, color.brightblue, color.blue)
      drawTextBox("Your social order inclination is rated from Lawful to Chaotic, with Lawful representing cultural acceptance and social order, Chaotic representing heightened importance on free will and rule fluidity, and Moderate representing the balance between Lawful and Chaotic.\n\n(Currently does not impact much in this game version)", 60, 1, 40, 15, color.white, color.blue, "left")
    end



  drawTextColor(" ^w[^yescape^w] Return to menu ", 65, 36, 30, color.black)


end -- titleDraw
