-----------------------------------------------------------------------------------------
-- Title: Animating Images
-- Name: Jonathan Kene
-- Course: ISC2O/3C
-- This program displays animating images moving different directions.
-----------------------------------------------------------------------------------------


--global variables
scrollSpeed = 6

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set background image with width and height
local backgroundImage = display.newImageRect("Images/space.jpg", 2048, 1600)

-- set character image with width and height
local kirby = display.newImage("Images/kirby.png", 200, 200)
kirby.x = 100
kirby.x = 125

-- set character image with width and height
local kirbytwo = display.newImage("Images/kirbytwo.png", 100, 200)

-- set character image with width and height
local kirbythewicked = display.newImage("Images/kirbythewicked.jpg", 600, 600)

-- set the image to be transparent 
kirbytwo.alpha = 0

-- flip kirbytwo horizontally
kirbytwo.xScale = 1

-- rotate kirbytwo 45 degrees
kirbytwo.rotation = 180
print( kirby.rotation )  -- Prints 45 in the terminal

-- rotate kirby 45 degrees
kirby.rotation = 45
print( kirby.rotation )  -- Prints 45 in the terminal

local textObject
--displays text on the screen at position x = 500 and y = 700 with
-- a deafult font style and font size of 70
textObject = display.newText( "I'll get you two next time!!", 600, 725, nil, 50 )

-- Function: MoveKirby
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the kirby
local function MoveKirby(event)
	-- add the scroll speed to the x-value of the kirby
	kirby.x = kirby.x + scrollSpeed
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveKirby)

-- Function: MoveKirbyTwo
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the kirbytwo
local function MoveKirbyTwo(event)
	-- add the scroll speed to the x-value of the kirbytwo
	kirbytwo.x = kirbytwo.x + scrollSpeed
	-- change the transparency of the kirbytwo every time it moves so that it fades out
	 kirbytwo.alpha = kirbytwo.alpha + 0.01
end

transition.fadeOut( kirby, { time=2000 } )

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveKirbyTwo)