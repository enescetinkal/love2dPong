function setColor(colorTable)
    love.graphics.setColor(love.math.colorFromBytes(colorTable[1], colorTable[2], colorTable[3]))
end

function checkCollision(rectA, rectB)
    return rectA.x < rectB.x + rectB.xsize and
           rectA.x + rectA.xsize > rectB.x and
           rectA.y < rectB.y + rectB.ysize and
           rectA.y + rectA.ysize > rectB.y
end