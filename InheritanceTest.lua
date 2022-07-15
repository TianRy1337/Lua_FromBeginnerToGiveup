-- 寫法1，可以保持繼承鏈
local class = {}
 
function class:new()
    --寫法1-1
    self.__index = self
    return setmetatable({},self)
    
    
    -- --寫法1-2
    -- return setmetatable( {}, {__index = self})
end
 
function class:say()
    print("Hello")
end
 
local o1 = class:new()
o1:say()
 
local o2 = o1:new()
o2:say()

--- 寫法2, 只能繼承1次, 第二次繼承時會把 __index 元方法弄丟
local Class = {}
Class.__index = Class
 
function Class:new()
    return setmetatable( {}, self )
end
 
function Class:say()
    print("Hello2")
end
 
local O1 = Class:new()
O1:say()
 

local O2 = O1:new()
O2:say() --這一次繼承失敗了, 因為找不到__index了
print("End")
