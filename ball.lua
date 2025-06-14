require("game")

ball = {
    x = 0,
    y = 0,
    xspeed = 100,
    yspeed = 100,
    color = { 125, 165, 255 },
    xsize = 20,
    ysize = 20,
}

function ball:update(dt)
    if ball.x >= screen.x - ball.xsize or ball.x < 0 then
        ball.xspeed = ball.xspeed * -1
        local clone_sfx = sounds.bounceNormal:clone()
        clone_sfx:play()
    end
    ball.x = ball.x + ball.xspeed * dt

    if ball.y >= screen.y - ball.xsize or ball.y < 0 then
        ball.yspeed = ball.yspeed * -1
        local clone_sfx = sounds.bounceNormal:clone()
        clone_sfx:play()
    end
    ball.y = ball.y + ball.yspeed * dt
end

function ball:draw()
    setColor(ball.color)
    love.graphics.rectangle("fill", ball.x, ball.y, ball.xsize, ball.ysize)
end
