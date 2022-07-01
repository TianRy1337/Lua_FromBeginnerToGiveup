-- --NOTE: OOP in Lua
-- Hint: Lua 中的 Class 是用 table + function 模擬出來的
Rectangle = {area = 0, length = 0, breadth = 0}
-- -- ====================================================================================
function Rectangle:new(o,length,breadth)
    o = o or {}
    setmetatable(o,self)
    self.__index = self
    self.length = length or 0
    self.breadth = breadth or 0
    self.area = length*breadth;
    return o
end
function Rectangle:printArea ()
    print("方形面積為 ",self.area)
end

-- 創建物件是替 class 分配記憶體的過程，每個 class 都有屬於自己的記憶體並共享裡面的資料
r = Rectangle:new(nil,10,20)

-- 用點號 '.' 來存取 class 的屬性
print(r.length)
-- 用冒號 ':' 來存取 class 的函式
r:printArea()
-- -- ====================================================================================
-- -- 避免每次 o 都要 nil 可以變形一下寫法省去麻煩
Shape = {area = 0}
function Shape:new(side)
    local o ={
        side = side or 0,
        area = side * side
    }
    setmetatable(o,{
        __index = self
    })
    return o;
end
function Shape:printArea()
    print("面積為",self.area)
end
Square = Shape:new(4)
Square:printArea()

-- -- ====================================================================================
-- -- 一個完整的創造物件寫法
car = {brand = "",wheel = 0} -- Meta class
function car:new(brand , wheel)
    local o = {
        brand = brand or "",
        wheel = wheel or 0
    }
    setmetatable(o,{
        __index = self
    })
    return o;
end

function car:printBrand()
    print("品牌為 ",self.brand)
end

function car:printWheel()
    print("輪子數量為 ",self.wheel)
end

--創建物件
mycar = car:new("Toyota",4)
mycar:printBrand()
mycar:printWheel()

NewToyota = mycar:new()

function NewToyota:new(brand,wheel)
    local o = {
        brand = brand or "",
        wheel = wheel or 0
    }
    setmetatable(o,{
        __index = self
    })
    return o;
end

function NewToyota:printBrand()
    print("This is Tesla")
end
myTesla = NewToyota:new("Tesla",8)
myTesla:printBrand();
myTesla:printWheel();