# Queue.lua
在 Lua 中實現 Queue

Queue implementation for Lua.

## Reference
**`Queue:New()`**
Create a new queue.

**`Queue:Enqueue(iData)`**
Add a data{iData} to the end of queue.

**`Queue:Dequeue()`**
return a data from in front of queue and remove it from queue.

**`Queue:Size()`**
return Lenght of the queue.

**`Queue:IsEmpty()`**
If queue is empty return true else false.

**`Queue:Peek()`**
return a data from in front of queue but not remove it.

**`Queue:PeekTail()`**
return a data from the end of queue but not remove it.

**`Queue:Clear()`**
Clear queue

## Example
```lua
local myQueue = Queue:New()
  
myQueue:Enqueue(3)
myQueue:Enqueue(5)
myQueue:Enqueue(10) 
-- myQueue = { 3, 5, 10 }

print(myQueue:Size()) --> 3
  
print(myQueue:Dequeue()) --> 3
print(myQueue:Dequeue()) --> 5
print(myQueue:Dequeue()) --> 10

print(myQueue:IsEmpty()) --> true

--or item contains bunch of data

local Item  = {name = "", Num = 0, IsCanMove = true}
function Item:New(iName, iNum, iIsCanMove)
   local _n = 
   {
      name = iName or "",
      Num = iNum or 0,
      IsCanMove = iIsCanMove or true
   }
   setmetatable(_n, {__index = self})
   return _n
end

local myItemQueue = Queue:New()

local _TestItem  = Item:New("TestingItem", 5, true)
local _TestItem2  = Item:New("TestingItem2", 10, true)

myItemQueue:Enqueue(Item:New("IAmItem", 20, false))
myItemQueue:Enqueue(_TestItem)
myItemQueue:Enqueue(_TestItem2)

-- myItemQueue {{name = IAmItem, Num = 20, IsCanMove = false},
-- {name = TestingItem, Num = 5, IsCanMove = true},
-- {name = TestingItem2, Num = 10, IsCanMove = true}}

print(myItemQueue:Size()) --3
print(myItemQueue:Dequeue().name) -- IAMItem
print(myItemQueue:Dequeue().num) -- 5

myItemQueue:Clear() -- Clear the queue

print(myItemQueue:IsEmpty()) --true

```
