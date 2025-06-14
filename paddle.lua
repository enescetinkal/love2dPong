require("game")
require("ball")

paddle1 = {
    x = 0,
    y = 100,
    speed = 400,
    color = { 225, 165, 255 },
    xsize = 25,
    ysize = 85,
}

aiPaddle = {
    x = 615,
    y = 100,
    speed = 300,
    color = { 225, 165, 255 },
    xsize = 25,
    ysize = 85,
    chance = math.random(1, 100)
}


function paddle1:update(dt)
    if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
        self.y = self.y + self.speed * dt
    end
    if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
        self.y = self.y - self.speed * dt
    end

    -- clamppity
    if self.y < 0 then
        self.y = 0
    end

    if self.y > screen.y - self.ysize then
        self.y = 480 - self.ysize
    end
end

function aiPaddle:update(dt)
    if ball.y + ball.ysize / 2 > self.y + self.ysize / 2 then
        if self.chance >= 30 then
            self.y = self.y + self.speed * dt
        else
            self.y = self.y
        end
    elseif ball.y + ball.ysize / 2 < aiPaddle.y + aiPaddle.ysize / 2 then
        if self.chance >= 30 then
            self.y = self.y - self.speed * dt
        else
            self.y = self.y
        end
    end
    self.chance = math.random(1, 100)

    -- Clamp
    if self.y < 0 then 
        self.y = 0 
    end
    if self.y > screen.y - self.ysize then
        self.y = screen.y - self.ysize
    end
end

function paddle1:draw()
    setColor(self.color)
    love.graphics.rectangle("fill", paddle1.x, paddle1.y, paddle1.xsize, paddle1.ysize)
end

function aiPaddle:draw()
    setColor(self.color)
    love.graphics.rectangle("fill", self.x, self.y, self.xsize, self.ysize)
end
