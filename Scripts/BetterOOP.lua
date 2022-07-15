Shape = {area = 0}

-- New 一個 Shape 出來
function Shape:New(iSide)
    local _new = {}
    setmetatable(_new, {__index = self})
    iSide = iSide or 0
    _new.area = iSide * iSide
    return _new
end

-- 底層函式 印出面積
function Shape:PrintArea()
    print("面積為 ",self.area)
end

MyShape = Shape:New(10)
MyShape:PrintArea()

-- Square 繼承 Shape
Square = Shape:New()

-- Square 覆寫 Square 的 New function
function Square:New(iSide)
    local _new = Shape:New(iSide)
    setmetatable(_new, {__index = self})
    return _new
end

-- 創造一個 Square
MySquare = Square:New(5)
MySquare:PrintArea()

-- Rectangle 繼承 Shape
Rectangle = Shape:New()

-- Rectangle 覆寫 Square 的 New function
function Rectangle:New(iLength, iBreadth)
    local _new = Shape:New(iLength)
    setmetatable(_new, {__index = self})
    _new.area = iLength * iBreadth
    return _new
end

-- 創造一個 Rectangle
MyRectangle = Rectangle:New(10,5)
MyRectangle:PrintArea()
