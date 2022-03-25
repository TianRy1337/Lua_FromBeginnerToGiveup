---NOTE: Lua Variable
-- a = 5       --Global variable
-- local b = 5 --Local variable

-- function Fun()
--     c= 5         --Global variable
--     local d = 5  --Local variable
-- end

-- Fun()
-- print(c,d)      --> 5 nil

-- do 
--     local a = 7 --> Local variable
--     b = 7       --> ReAssignment local variable 'b', 'b' still local variable
--     print(a,b)  --> 7 7
-- end
-- print(a,b)      --> 5 7

--- NOTE: Assignment
--a = "hello".." world!"
--t.n = t.n + 1
-- a,b = 10 , 2*x -- a = 10 , b = 2*x
-- x = 1
-- y = 2
-- print(x,y)
-- --- Hint: Lua 會先計算R-value所有的值再進行 Assignment
-- x,y = y,x           --swap 'x' for 'y'
-- print(x,y)
-- print("------------")
-- A = {}
-- i,j = 1,2
-- A[i] = 1
-- A[j] = 2
-- print(A[i],A[j]);
-- A[i],A[j] = A[j],A[i]   --swap a[i] for 'a[j]'
-- print(A[i],A[j]);


--- NOTE: 變數數量 > 賦值數量 : 按變數數量補足 nil
---變數數量 < 賦值數量 : 多餘的值會被忽略
-- a,b,c = 0,1 
-- print(a,b,c)            --- 0 1 nil

-- a,b = a+1,b+1,b+2       --- 'b + 2'會被忽略
-- print(a,b)

-- a,b,c = 0
-- print(a,b,c)            --- 0 nil nil
-- a,b,c = 0 , 0 , 0
-- print(a,b,c)            --- 0 0 0

--Hint:多變數賦值通常用在交換變數或函式回調給變數
-- --a,b = f()
-- --此處 f() 應返回兩個數值，第一個給 a , 第二個給 b
-- --並且盡量使用區域變數,原因如下:
-- --1. 避免命名衝突
-- --2. 訪問區域變數的數度會比全域變數快


---NOTE: 索引
---Hint: 當 Table 索引為字串時，可使用這種簡易縮寫
-- T = {}
-- T["Key"] = 100
-- print(T.Key)

-- Site ={}
-- Site["Key"] = "http://www.google.com/"
-- print(type(Site.Key))
-- print(Site.Key)



---Hint: Lua 對多個變數同時進行賦值時候，不會進行變數傳遞，僅做數值傳遞
---總之就是先處理R-value在進行Assignment
-- a,b  = 0,1
-- print(a,b)
-- a,b = a+1,a+1;
-- print(a,b);

-- a,b  = 0,1
-- print(a,b)
-- a,b = b+1,b+1;
-- print(a,b);


---Hint: 在 Lua 中 ，全域變數無須聲明即可直接使用，未經初始化也不會導致錯誤，但為初始化的全域變數只會得到 nil
-- -- b ---> nil
-- b = 10
-- -- b ---> 10

---Hint: 當把 nil 賦值給全域變數，Lua 會回收該全域變數
-- -- b = nil
-- -- b --> nil

