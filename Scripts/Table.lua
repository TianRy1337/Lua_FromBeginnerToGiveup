-- -- -- NOTE: Table
-- -- table 是 Lua 的一種數據結構，用來幫助我們創建不同數據類型 ，如：陣列、字典等
-- -- table 是關聯型陣列 (有指定的鍵的陣列，每個鍵關聯一個值)
-- -- table 的大小是不固定的，可以根據自己的需求擴充
-- -- Lua 主要是透過 table 來解決 module,package,Object 
-- -- 例如：string.format 就是使用 "format" 來索引 table string的

-- 初始化表格
local myNewtable = {}

-- 指定值
myNewtable[1] = "One"

-- 移除引用
myNewtable = nil

-- -- Hint: 當我們宣告 Table A 並宣告元素 , 若將Table A 賦值給 Table B
-- -- 則 A 與 B 都指向同一個記憶體位置
-- -- 如果 A 的值為 nil ，則 B 一樣能走訪 Table 的元素，如果沒有指定的變數指向 A
-- -- Lua 的 GC(垃圾回收) 會清理相對應的記憶體，以下演練發生上述狀況

local myTable = {}
print("myTable 的型態是",type(myTable))
myTable[1] = "One"
myTable[2] = "Before"
print("myTable 的索引 1 是",myTable[1])
print("myTable 的索引 2 是",myTable[2])

-- -- 現在 myTable 和 alternateTable 都是指向同一個 table
local alternateTable = myTable
print("alternateTable 的索引 1 是",alternateTable[1])
print("alternateTable 的索引 2 是",alternateTable[2])

alternateTable[2] = "After"

print("myTable 的索引 2 是",myTable[2])


-- -- GC
alternateTable = nil
print("alternateTable 是",alternateTable)

-- -- myTable 仍然可以存取
print("myTable 的索引 2 是",myTable[2])

myTable = nil
print("myTable 是",myTable)
print("End")


-- -- Hint: table.concat (table [, sep [, start [, end]]])
local fruits = {"Apple","Banana","Pear","Orange"};
-- 回傳 table 連接後的字串
print(table.concat(fruits))

-- 回傳 table 連接後的字串並指定連接符號
print(table.concat(fruits,","))

-- 回傳 table 連接後的字串並指定連接符號與指定起始索引
print(table.concat(fruits,",",2))

-- 回傳 table 連接後的字串並指定連接符號與指定起始和結束索引
print(table.concat(fruits,",",2,3))



-- -- Hint: insert and Remove
local countrys = {"Taiwan","China","Japan","Korean"}

-- 插入資料
table.insert(countrys,"American")
print("剛剛加入的資料為：",countrys[5])

-- 指定位置插入資料
table.insert(countrys,3,"Russia")

print(table.concat(countrys,","))

--移除最後一個元素
table.remove(countrys)
print(table.concat(countrys,","))

--移除指定位置的元素
table.remove(countrys,2)
print(table.concat(countrys,","))


-- --Hint: sort
local Colors = {"blue","purple","orange","green"}
print("before sort")
for k,v in ipairs(Colors) do
    print(k,v)
end

table.sort(Colors)

print("After Sort")
for k,v in ipairs(Colors) do
    print(k,v)
end



-- --NOTE: 取得 table 最大值 ※table.maxn 在 Lua 5.2 之後就不存在了 須自己定義實現
function table_MAX(iTable)
    local maxNumber = nil
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
local tbl = {[0]=15,[1] = 2, [2] = 6, [3] = 34, [26] =5}
print(table_MAX(tbl))


-- --NOTE: 取得 table 長度，用 # 或是用 table.getn 都會因為索引中斷而造成長度異常無法取得正確的長度
-- 可以用以下函式代替 (但只含有值)
function table_leng(iTable)
    local len = 0
    for k,v in pairs(iTable)do
        len = len + 1
    end
    return len
end

T = {1,nil,3,nil,nil}
print("T的長度為 "..#T) --> 1
print("T的正確長度為 "..table_leng(T)) -->2

T2= {nil,nil,3,4,5}
print("T2的長度為 "..#T2) --> 5
print("T2的正確長度為 "..table_leng(T2)) -->3
TT = {}
TT[1] = nil
TT[2] = nil
TT[3] = "3"
TT[4] = "4"
print("TT的長度為 "..#TT) --> 0
print("TT的正確長度為 "..table_leng(TT)) -->2