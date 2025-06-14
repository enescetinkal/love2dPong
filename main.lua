require("paddle")
require("ball")
require("utils")
require("game")

function love.load()
    for key, value in pairs(score) do
        score[key] = 0
    end

    love.audio.setVolume(1)
    sounds.music:play()
    sounds.music:seek(0, "seconds")

    ball.x = math.random(100, 620)
    ball.y = math.random(100, 460)

    ball.xspeed = 100
    ball.yspeed = 100

    love.window.setTitle("Pong")
    love.window.setMode(screen.x, screen.y, {vsync = true})
end

function love.update(dt)
    ball:update(dt)

    paddle1:update(dt)
    aiPaddle:update(dt)

    if checkCollision(ball, paddle1) then
        ball.xspeed = ball.xspeed * -1.1
        ball.yspeed = ball.yspeed * 1.05

        local maxSpeed = 500
        if math.abs(ball.xspeed) > maxSpeed then
            ball.xspeed = maxSpeed * (ball.xspeed > 0 and 1 or -1)
        end
        if math.abs(ball.yspeed) > maxSpeed then
            ball.yspeed = maxSpeed * (ball.yspeed > 0 and 1 or -1)
        end

        score.player = score.player + 1

        local clone_sfx = sounds.bounceScore:clone()
	    clone_sfx:play()
    end

    if checkCollision(ball, aiPaddle) then
        ball.xspeed = ball.xspeed * -1.1
        ball.yspeed = ball.yspeed * 1.05

        local maxSpeed = 500
        if math.abs(ball.xspeed) > maxSpeed then
            ball.xspeed = maxSpeed * (ball.xspeed > 0 and 1 or -1)
        end
        if math.abs(ball.yspeed) > maxSpeed then
            ball.yspeed = maxSpeed * (ball.yspeed > 0 and 1 or -1)
        end

        score.ai = score.ai + 1

        local clone_sfx = sounds.bounceScore:clone()
	    clone_sfx:play()
    end


    if checkCollision(ball, bounds) or checkCollision(ball, aiBounds) then
        ball.x = -math.huge
        ball.y = -math.huge

        gameLost = true
        love.audio.setVolume(0)
    end

    if gameLost and love.keyboard.isDown("r") then
        gameLost = false
        love.load()
    end
end

function love.draw()
    printUI()
    ball:draw()

    paddle1:draw()
    aiPaddle:draw()
end

