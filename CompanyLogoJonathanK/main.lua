-----------------------------------------------------------------------------------------
-- Title: Company Logo Animation
-- Name: Jonathan Kene
-- Course: ICS20/3C
-- This program displays tha company logo animated on the screen
-----------------------------------------------------------------------------------------

-- global variables
scrollSpeed = 3

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

local shield = display.newImageRect( "Images/shield.png", 300, 300)
shield.x = 200
shield.y = 400

-- set the image to be transparent 
shield.alpha = 0

local function MoveShield(event)
	-- add the scroll speed to the x-value of the shield
	shield.x = shield.x + scrollSpeed

	-- change the transparency of the shield every time it moves so that it fades out
	 shield.alpha = shield.alpha + 0.01



end


transition.scaleTo( shield, { xScale = 1, yScale = 1, time = 1000 } )

 transition.fadeOut( shield, { time= 100 } )
 
-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShield)

