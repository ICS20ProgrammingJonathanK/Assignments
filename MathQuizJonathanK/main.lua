-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 124/255, 249/255, 199/255)

---------------------------------------------------
--LOCAL VARIABLES
-------------------------------------------------

local questionObject

local correctObject
local incorrectObject

local numericField
local userAnswer
local correctAnswer

local pointsTextObject
local numberPoints = 0

local randomOperator
local gameOver

-- variables for the timer
local totalSeconds = 15
local secondsLeft = 15
local clockText
local countDownTimer

local lives = 3
local heart1
local heart2
local heart3

local randomNumber1
local randomNumber2
---------------------------------------------------
-- SOUNDS
-------------------------------------------------


-- Correct sound
local theGong = audio.loadSound( "Sounds/theGong.mp3" ) -- Setting a variable to an mp3 file
local correctSoundChannel
local theExtra = audio.loadSound( "Sounds/theExtra.mp3" ) -- Setting a variable to an mp3 file
local theGongChannel
local theExtraChannel
 

---------------------------------------------------
--LOCAL FUNCTIONS
-------------------------------------------------

local function UpdateLives()
    if (lives == 2) then
        heart3.isVisible = false
    elseif (lives == 1) then
        heart2.isVisible = false
    elseif (lives == 0) then
    	heart1.isVisible = false
        gameOver.isVisible = true
        timer.cancel(countDownTimer)
        numericField.isVisible = false
        wrongSoundChannel = audio.play(wrongSound)
    end 
end

local function UpdateTime()

	-- decrement the number of seconds left
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	-- display the number of seconds left in the clock object
	clockText.text = " Time remaining = ".. secondsLeft .. "", 40

    if (secondsLeft == 0) then
    	-- reset the number of seconds left in the clock object
    	secondsLeft = totalSeconds - 0

    	UpdateLives()
    end
end

-- function that calls the timer
local function StartTimer()
	-- create countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
end


 local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomOperator = math.random(1, 4)
	randomNumber1 = math.random(1, 20)
	randomNumber2 = math.random(1, 20)

	if (randomOperator == 1) then
		correctAnswer = randomNumber1 + randomNumber2

    	-- create question in the text object
    	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
    	
     randomNumber1 = math.random(1, 20)
	 randomNumber2 = math.random(1, 20)

	elseif (randomOperator == 2) then
		correctAnswer = randomNumber1 - randomNumber2

    	-- create question in the text object
    	questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

     randomNumber1 = math.random(1, 20)
	 randomNumber2 = math.random(1, 20)
 	
     elseif (randomOperator == 3) then
 		correctAnswer = randomNumber1 * randomNumber2
 		
    	-- create question in the text object
    	questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "

     randomNumber1 = math.random(1, 10)
	 randomNumber2 = math.random(1, 10)

    	elseif (randomOperator == 4) then
 		correctAnswer = randomNumber1 / randomNumber2
 		
    	-- create question in the text object
    	questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = "

     randomNumber1 = math.random(1, 100)
     randomNumber2 = math.random(1, 100)
    end
end

local function hideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end 

local function hideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener(event)

	-- User begins editing "numericField"
	if ( event.phase == "began" ) then

		-- clear text field
		event.target.text = ""

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the user answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			incorrectObject.isVisible = false
			correctSoundChannel = audio.play(correctSound)
			timer.performWithDelay(1000, hideCorrect, 0)
			numberPoints = numberPoints + 1
			secondsLeft = totalSeconds + 1

			 pointsTextObject.text = "Numbers correct = ".. numberPoints
	    else
	    	correctObject.isVisible = false
	    	incorrectObject.isVisible = true
	    	wrongSoundChannel = audio.play(wrongSound)
	    	timer.performWithDelay(1000, hideIncorrect)
	    	lives = lives - 1
	    	secondsLeft = totalSeconds + 1

	    -- call the function to decrease lives
	    	UpdateLives()
	    end

	    	event.target.text = ""

	end
end

---------------------------------------------------
-- OBJECT CREATION
-------------------------------------------------

-- create points box adn make it visible
pointsTextObject = display.newText( "Numbers correct = ".. numberPoints, 800, 385, nil, 40 )
pointsTextObject:setTextColor(155/255, 42/255, 198/255)


-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(155/255, 42/255, 198/255)

-- create the correct text object and make it invisble
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(155/255, 42/255, 198/255)
correctObject.isVisible = false

-- create the incorrect text object and make it invisble
incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
incorrectObject:setTextColor(155/255, 42/255, 198/255)
incorrectObject.isVisible = false

-- create the incorrect text object and make it invisble
clockText = display.newText( "", display.contentWidth/2, display.contentHeight*2/3, nil, 100 )
clockText:setTextColor(155/255, 42/255, 198/255)
clockText.isVisible = true
clockText.x = 500
clockText.y = 600

-- Create numeric field
numericField = native.newTextField( 520, 380, 150, 90 )
numericField.inputType = "default"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-- add background image
gameOver = display.newImageRect("Images/gameOver.png", 1030, 775)
gameOver.x = 510
gameOver.y = 385
gameOver.isVisible = false

-- create the lives to display on the screen
heart1 = display.newImageRect("Images/heartLife.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heartLife2.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heartLife3.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

---------------------------------------------------
-- FUNCTION CALLS
-------------------------------------------------

-- call the function to ask the question
StartTimer()

-- call the function to ask the question
AskQuestion()