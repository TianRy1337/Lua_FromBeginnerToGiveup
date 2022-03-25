-- ---NOTE: Print Type -----
-- print("hello");
-- print(type("Hello world"))      --> string
-- print(type(10.4*3))             --> number
-- print(type(print))              --> function
-- print(type(type))               --> function
-- print(type(true))               --> boolean
-- print(type(nil))                --> nil
-- print(type(type(X)))            --> string


-- ---NOTE: nil 可以拿來當刪除的工具 -----
-- tab1 = {key1= "val1",key2="val2",key3}
-- for k,v in pairs(tab1) do
--     print(k.."-"..v)
-- end
-- tab1.key1 = nil;
-- for k,v in pairs(tab1) do
--     print(k.."-"..v)
-- end


-- ---NOTE: 比較 nil 時應該加上雙引號""-----
-- print(type(x))
-- print(type(x) == nil)
-- print(type(x) == "nil")


-- ---NOTE: Boolean 布林　-----
-- print(type(true))
-- print(type(false))
-- print(type(nil))
-- if false or nil then
--     print("至少有一個是 true")
-- else
--     print("false 和 nil 都是 false")
-- end

-- if 0 then
--     print("數字 0 是 true")
-- else
--     print("數字 0 是 false")
-- end

-- ---NOTE: Number 數字 
-- print(type(2))
-- print(type(2.2))
-- print(type(0.2))
-- print(type(2e+1))
-- print(type(0.2e-1))
-- print(type(7.823242563357e-06))


-- ---NOTE: string 字符串 -----
-- string1 = "this is string1"
-- string2 = "this is string2"

-- html = [[
-- <html>
-- <head></head>
-- <body>
--     <a href="http://www.google.com/">谷歌</a>
-- </body>
-- </html>
-- ]]
-- print(html)


-- ---NOTE: 對數字字串做運算時，Lua 會嘗試將數字字串轉成數字
-- print("2"+6)
-- print("2"+"6")
-- print("2+6")
-- print("-2e2"*"6")
-- print("error"+1)---Compiler error


-- ---NOTE: 字串連接請使用 ".."
-- print("a".."b")
-- print("1234".."5678")


-- ---NOTE: table (associative arrays) 陣列的索引可以是數字或是字串
-- local tal1 = {} ---建一個空表
-- local tbl2 = {"apple","pear","orange","grape"} ---直接初始化

-- a = {}
-- a["key"] = "value"
-- key = 94
-- a[key] = 43
-- a[key] = a[key]+44
-- for k,v in pairs(a) do
--     print (k..":"..v)
-- end


-- ---NOTE: Lua 裡面 table的預設初始值是從 1 開始 不是 0
-- local tbl = {"apple","pear","orange","grape"}
-- for k, v in pairs(tbl) do
--     print("key",k)
-- end


-- ---NOTE: table 不會固定大小，有新資料添加的時候 table 會自動增加，沒初始化的 table 都是 nil
-- a3 = {}
-- for i =1,10 do
--     a3[i]=i
-- end
-- a3["key"] = "value"
-- print(a3["key"])
-- print(a3["none"])

-- ---NOTE: function 在 Lua 被當作 First-Class value, 且函式可以存在變數裡
-- function factorial(n)
--     if n == 0 then
--         return 1
--     else
--         return n * factorial(n - 1)
--     end
-- end
-- print(factorial(5))
-- NewFactorial = factorial
-- print(NewFactorial(5))


-- ---NOTE: function 可以用匿名函數 (anonymous function) 的方式傳遞參數

-- function TestFun(tab,fun)
--     for k,v in pairs(tab) do
--         print(fun(k,v))
--     end
-- end

-- Mytab = {key1 = "value1",key2 = "value2",key3 = "value3"}
-- TestFun(Mytab,
-- function (key,val)
--     return key.." = "..val
-- end)
