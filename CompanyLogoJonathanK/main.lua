-----------------------------------------------------------------------------------------
-- Title: Company Logo Animation
-- Name: Jonathan Kene
-- Course: ICS20/3C
-- This program displays tha company logo animated on the screen
-----------------------------------------------------------------------------------------

-- global variables
scrollSpeed = 100

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

local sword = display.newImageRect( "Images/sword.png", 500, 500)
sword.x = 50
sword.y = 400

-- displays text on the screen at position x = 400 and y = 5 with
-- a deafult font style and font size of 30
textObject = display.newText( "Dark Exalibur", 500, 650, nil, 100)


local function GrowSword(event)
	-- add the scroll speed to the x-value of the sword
	sword.x = sword.x + scrollSpeed
     -- make the sword grow
	 transition.scaleTo( sword, { xScale = 2, yScale = 2, time = 1000 } )
	 transition.fadeOut( sword, { time = 2000 } )
end


-- Function: MoveSword 
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the sword
local function MoveSword(event)
	-- add the scroll speed to the x-value of the ship
	sword.x = sword.x + scrollSpeed
	transition.fadeOut( textObject, { time = 2000 } )
end
-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveSword)
Runtime:addEventListener("enterFrame", GrowSword)


