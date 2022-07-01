-- -- NOTE: Metatable
-- 我們能透過 Lua table 進行存取 key 來得到 value，但卻無法對兩個 table 進行動作(比如相加)，
-- 因此 Lua 提供了元表(Metatable)，允許我們改變 table 的動作
-- 例如：使用元表時我們可以宣告 Lua 如何計算兩個 table 的相加操作 table a + table b
-- 先檢查兩個表格是否都存在元表，之後檢查是否有叫做 __add 的字串(以 '+' 為例)，若找到即使用對應的值

-- * setmetatable(table,metatable)：對 table 設置元表(metatable),如果元表存在 __meatatable 鍵值，則失敗
-- * getmetatable(table) 回傳對象的元表(metatable)

-- local myTable = {} -->普通表格
-- local myMetatable = {} -->元表
-- setmetatable(myTable,myMetatable) -->把 myMetatable 設為 myTable 的元表

-- ---- 可以簡化成以下這種寫法
-- myTable = setmetatable({},{})


-- --Hint: __index 元方法
-- 當透過鍵(key)來存取 table 時，如果這個鍵沒有值，那 lua 就會尋找 table 的 metatable(假設有)中的 __index 鍵
-- 如果 __index 包含一個表格，Lua 會在表格裡尋找相對應的鍵

-- 如果 __index 包含一個函式的話，Lua 會使用那個函式，table 和鍵會做為參數傳遞給函式

-- __index 元方法查看表中元素是否存在，如果不存在就返回 nil; 如果存在就由 __index 返回結果
mytable = setmetatable({key1 = "value1"}, {
  __index = function(mytable, key)
    if key == "key2" then
      return "metatablevalue"
    else
      return nil
    end
  end
})

print(mytable.key1,mytable.key2)


-- --Hint: __newindex 元方法
-- __newindex 元方法用來對表格進行更新 , __index則用來對表存取
-- 當你給表格一個缺少的索引進行賦值，解釋器就會查找 __newindex 元方法：如果存在就調用這個函式而不進行賦值
--以下實際操練

    local myMetatable = {}
    local myTable = setmetatable({key1 = "value1"},{__newindex = myMetatable})
    
    print(myTable.key1)
    
    myTable.newkey = "new_value"
    print(myTable.newkey,myMetatable.newkey)
    
    myTable.key1 = "NEW_VALUE"
    print(myTable.key1,myMetatable.key1)
-- 簡單檢析上述:上述設置了 __newindex ，在對新索引鍵 newkey 賦值時，會呼叫元方法，而不進行賦值
-- 而對已存在的索引鍵 key1 ,則會進行賦值，而不呼叫 __newindex



--Hint: 用 rawset 來更新表格
local mytable2 = setmetatable({key1 = "value1"},
{
        __newindex = function (mytable2,key,value)
            rawset(mytable2,key,"\""..value.."\"")
        end    
})

mytable2.key1 = "new value"
mytable2.key2 = 87

print(mytable2.key1,mytable2.key2)


-- -- NOTE: 替表格新增運算符號

--取表格最大值
function table_MAX(iTable)
    local maxNumber = 0
    for k,v in pairs(iTable) do
        if(maxNumber==nil)then
            maxNumber = v
        end
        if(maxNumber<v)then
            maxNumber = v
        end
    end
    return maxNumber
end


--兩表格相加
local firstTable = setmetatable({1,2,3},
{
    __add = function(firstTable,otherTable)
        for i = 1,table_MAX(otherTable)do
            table.insert(firstTable,table_MAX(firstTable)+1,otherTable[i])
        end
        return firstTable
    end
})

local secondTable ={4,5,6}

firstTable = firstTable + secondTable --這是示範的 若未依照大小會出錯 請依每個人需求自行調整
for k,v in ipairs(firstTable)do
    print(k,v)
end

-- -- 還有其他運算符號可以用以下對應
--      __add   ==>    +
--      __sub   ==>    -
--      __mul   ==>    *
--      __div   ==>    /
--      __mod   ==>    %
--      __pow   ==>    ^
--      __unm   ==>    - (負)
--      __concat   ==>    ..
--      __eq   ==>    ==
--      __lt   ==>    <
--      __le   ==>    <=
--      __gt   ==>    >
--      __ge   ==>    >=


-- --Hint: __call 元方法

function table_maxn(t)
    local mn = 0
    for k, v in pairs(t) do
        if mn < k then
            mn = k
        end
    end
    return mn
end

local mytable3 = setmetatable({10},
{
    __call = function(itable,newtable)
        sum = 0
        for i = 1,table_maxn(itable) do
            sum = sum + itable[i]
        end
        for i = 1,table_maxn(newtable) do
            sum = sum+newtable[i]
        end
        return sum
    end
})
local mytable4 = {10,20,30}
print(mytable3(mytable4))


-- --Hint: __tostring 元方法 用於修改表格的輸出行為
local mytable5 = setmetatable({10,20,30},
{
    __tostring=function(mytable)
        local sum = 0
        for k , v in pairs(mytable) do
            sum = sum + v
        end
        return "表格所有元素的合為"..sum
    end
})
print(mytable5)