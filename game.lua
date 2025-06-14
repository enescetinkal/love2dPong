screen = {
    x = 640,
    y = 480,
    image = love.graphics.newImage("bg.jpg"),
}

bounds = {
    x = 0,
    y = 0,
    xsize = 10,
    ysize = screen.y,
}
aiBounds = {
    x = screen.x - 10,
    y = 0,
    xsize = 10,
    ysize = screen.y,
}

sounds = {
    bounceNormal = love.audio.newSource("bounceNormal.wav", "static"),
    bounceScore = love.audio.newSource("bounceScore.wav", "static"),
    music = love.audio.newSource("pianister.ogg", "stream"),
}

score = {
    player = 0,
    ai = 0,
}
gameLost = false

function printUI()
    if not gameLost then
        love.graphics.draw(screen.image, 0, 0)
    else
        setColor({ 255, 255, 255 })
        love.graphics.print("Game over! Press R to restart.", 300, 200)
    end

    setColor({ 255, 255, 255 })
    love.graphics.print(tostring(score.player), 10, 10)
    love.graphics.print(tostring(score.ai), screen.x - 30, 10)
end
