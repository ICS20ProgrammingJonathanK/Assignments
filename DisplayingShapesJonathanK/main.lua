
-----------------------------------------------------------------------------------------
-- Name: Jonathan Kene
-- Course: ICS2O /3C
-- Title: Display Shapes 
-- This program displays different shapes/polygons with its name underneath in on iPad simulator

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the backround color
local background = display.setDefault( "background", 40/255, 40/255, 238/255 )

local verticesTriangle
local verticesTriangle = {-100, -75, 0, -300, 100, -75}
local triangleX = 200
local triangleY = 300
local myTriangle
local myTriangle = display.newPolygon (triangleX, triangleY, verticesTriangle)
 
local textObject
-- displays text on the screen at position x = 500 and y = 500 with
-- a deafult font style and font size of 70
textObject = display.newText( "Triangle", 200, 500, nil, 70 )

local verticesDiamond
local verticesDiamond = {-100, -75, 0, -250, 100, -75, -2, 100}
local diamondX = 800
local diamondY = 220
local myDiamond
local myDiamond = display.newPolygon (diamondX, diamondY, verticesDiamond)

local textObject
-- displays text on the screen at position x = 800 and y = 450 with
-- a deafult font style and font size of 70
textObject = display.newText( "Diamond", 800, 450, nil, 70 )

local verticesDiamond
local verticesDiamond = {-80, -75, 10, -150, 90, -75, 55, 70, -80, -30, -20, 10, -60, -10}
local diamondX = 500
local diamondY = 550
local myDiamond
local myDiamond = display.newPolygon (diamondX, diamondY, verticesDiamond)

--displays text on the screen at position x = 500 and y = 700 with
-- a deafult font style and font size of 70
textObject = display.newText( "Pentagon", 500, 700, nil, 70 )

