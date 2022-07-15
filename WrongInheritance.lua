Rectangle = {Length = 0, Width = 0, Area = 0}

function Rectangle:New(iLength, iWidth)
    local _new = {
        Length = iLength,
        Width = iWidth
    }
    setmetatable(_new, self)
    self.__index = self
    self.Area = iLength * iWidth --錯誤的寫法任何繼承這個 Rectangle 的人所擁有的 Area 都會被上一個經過這的人蓋掉，因為每次 "Self" 的 Area 都會被新創造的物件所改動
    return _new
end

function Rectangle:PrintLength()
    print("我的 Length 是:".. self.Length)
end

function Rectangle:PrintWidth()
    print("我的 Width 是:".. self.Width)
end

function Rectangle:PrintArea()
    print("我的 Area 是:".. self.Area)
end

RectangleA = Rectangle:New(10,10)

RectangleA:PrintLength()
RectangleA:PrintWidth()
RectangleA:PrintArea()

print("\n===============================================\n")

RectangleB = Rectangle:New(10,5)

RectangleB:PrintLength()
RectangleB:PrintWidth()
RectangleB:PrintArea()

print("\n===============================================\n")

RectangleA:PrintArea()
