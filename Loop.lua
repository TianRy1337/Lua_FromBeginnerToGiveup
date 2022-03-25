-- --NOTE: While Loop
-- -- while(true)
-- -- do
-- --    print("Forever Loop")
-- -- end 

-- a = 10
-- while(a < 20)
-- do
--     print("a 值為: ",a) ---print 10 ~19
--     a = a+1
-- end

-- --NOTE: for Loop
-- -- var 從 exp1 到 exp2 每次變化以 exp3 為基準遞增或遞減，
-- --並執行一次<Do Something>,exp3是可選的，不只定的話預設為1
-- -- for var = exp1,exp2,exp3 do 
-- -- <Do something>
-- -- end

-- for i=10,1,-1 do
--     print(i)
-- end

-- for i =0,10 do
--     print(i)
-- end

-- -- -- Hint: for的三個表達式只會在循環開始前一次求值，之後就不再變動
-- function f(x)  
--     print("Do function")  
--     return x*2  
-- end  

-- -- 此處得到 f(5) = 10 之後就不會再求值了
-- for i=1,f(5) 
-- do 
--     print(i)  
-- end

-- -- Hint:泛型<T>For循環
-- a = {"one","two","three"}
-- for i ,v in ipairs(a) do 
--     print(i,v)
-- end

-- days = {"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"}  
-- for i,v in ipairs(days) do  
--     print(v) 
-- end 


-- --Hint: pairs 跟 ipairs 差別: 
-- -- pairs 會全部輸出，但不會照順序
-- -- ipairs 會照順序輸出，當 Key+1 = nil 則不再輸出
-- test2 = { 
--     [1] = "Andy", 
--     [2] = "Bob", 
--     [4] = "Denny",
--     [5] = "Eric", 
--     word = "word",
--     pi = 3.14,
-- }

-- for _ , v in pairs(test2) do
--     print(_,v)
-- end



-- --NOTE: repeat..until Loop
-- -- repeat
-- -- <Do something>
-- -- until(condition)
-- a = 10
-- repeat
--     print("a值為: ",a)
--     a = a+1;
-- until (a>15)

-- --Hint: Lua 允許多重迴圈
-- j =5
-- for i=3,40 do
--    for j=1,(i/j) , 3 do
--       if(not(i%j))then
--          break
--       end
--       if(j > (i/j))then
--          print("i 值為：",i) -- i 值為：35 ~ 40
--       end
--    end
-- end

-- -- NOTE: break and goto 
-- a = 10
-- while( a < 20 )do
--    print("a 值為: ", a)
--    a=a+1
--    if( a > 15)then
--       break --a 大於 15就終止迴圈
--    end
-- end

-- a = 1
-- ::label:: print("--- goto label ---")
-- a = a+1
-- if a < 3 then
--     goto label   
-- end

-- i = 0
-- ::s1::do
--     print(i)
--     i = i+1
-- end
-- if(i>3)then
--     os.exit() -- i 大於 3 時退出
-- end
-- goto s1

-- --Hint: Lua 沒有 continue 的功能 ，但可以透過 goto 實現
-- for i = 0,10,1 do
--     if (i % 2 == 0)  then
--         print(i,"Yes")
--         goto continue
--     end
--     print(i,"No")
--     ::continue::do
--         print("Using Continue")
--     end
-- end