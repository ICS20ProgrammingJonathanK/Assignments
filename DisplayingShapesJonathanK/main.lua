
-----------------------------------------------------------------------------------------
-- Name: Jonathan Kene
-- Course: ICS2O /3C
-- Title: Display Shapes 
-- This program displays different shapes/polygons with its name underneath in on iPad simulator
-----------------------------------------------------------------------------------------

-- create my local variables

local verticesTriangle
local verticesTriangle = {-100, -75, 0, -300, 100, -75}
local triangleX = 500
local triangleY = 500
local myTriangle
local myTriangle = display.newPolygon (triangleX, triangleY, verticesTriangle)



