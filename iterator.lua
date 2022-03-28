-- -- NOTE: Ilerator
-- -- Hint: 泛型 for 自帶 key/value 
-- -- for k, v in pairs(t) do 
-- --     print(k,v)
-- -- end
local array = {"Chrome","Edge"}
for key,value in ipairs(array) do
    print(key,value)
end


-- -- NOTE: 無狀態的迭代器
-- -- 指不保留任何狀態的迭代器，可以避免創建 Closure 花費額外代價
-- --每一次迭代，函式都是用兩個變數(狀態變數和控制變數)的值作為參數，一個無狀態迭代器只用這兩個值獲取下一個元素
-- --最常見的例子就是 ipairs 它走訪陣列中的每個元素，元素的索引是需要數值的
local function square(iIteratorMaxCount,iCurrentNumber)
    if(iCurrentNumber < iIteratorMaxCount) then
        iCurrentNumber = iCurrentNumber + 1
        return iCurrentNumber , iCurrentNumber*iCurrentNumber
    end
end

for i,n in square,3,0 do
    print(i,n)
end

-- -- --Hint: 迭代的狀態包括被走訪的表格(循環過程中不會改變的狀態常數)和當下索引的位置(控制變數)
-- -- 當 Lua 開始使用 ipairs(a) 循環時，得到三個值：迭代函式 iter , 狀態變數 a , 控制變數初始值 0
-- -- 然後 Lua 開始使用 iter(a,0)並返回 1,a[1] (除非a[1]= nil ); 第二次呼叫使用 iter(a,1)返回 2, a[2].....值到第一個 nil 元素
-- -- function iter(a,i)
-- --     i = i + 1
-- --     local v = a[i]
-- --     if v then
-- --         return i,v
-- --     end
-- -- end
-- -- function ipairs(a)
-- --     return iter,a,0
-- -- end


-- -- NOTE:多狀態的迭代器
-- -- 很多情況下，迭代器需要保存多個狀態而不是簡單的狀態常數和控制變數，最簡單的方式就是使用 Clouser
-- -- 還有一種是將所有狀態封裝到 table 裡面，將 table 作為迭代器的狀態常數
-- -- 因為這種情況下將所有資訊放在 table，所以迭代函式通常不需要第二個參數
local array1 = {"Chrome","Edge","FireFox"}
local function elementIterator(collection)
    local index = 0
    local count = #collection
    --Closure Function
    return function ()
        index = index + 1
        if index <= count then
            return collection[index]
        end
    end
end

for element in elementIterator(array1) do
    --table.insert(array1,"Brave")
    print(element)
end