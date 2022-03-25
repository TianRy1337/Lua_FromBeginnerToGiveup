-- -- -- NOTE: Lua 的函式定義格式如下
-- -- optional_function_scope function function_name( argument1, argument2, argument3..., argumentn)
-- --     function_body
-- --     return result_params_comma_separated
-- -- end
-- -- Hint: lua 可以返回多個值 用逗號隔開
-- function max(num1, num2)

--     if (num1 > num2) then
--        result = num1;
--     else
--        result = num2;
--     end
 
--     return result;
--  end

--  print("兩值比較大的值為",max(100,34))


-- -- Hint: 函式也可以當作參數
-- myprint = function(iParam)
--     print("印出",iParam)
-- end

-- -- Hint: 可以當成參數給其他函式使用
-- function add(num1,num2,functionPrint)
--     result = num1 + num2
--     functionPrint(result)
--  end

--  myprint(10)
--  add(8,7,myprint)

-- --Hint: 可以一次返回多個值

-- ---@param a table
-- ---@return any 索引
-- ---@return integer 最大值
-- function Maximum (a)
--     local mi = 1             
--     local m = a[mi]          
--     for i,val in ipairs(a) do
--        if val > m then
--            mi = i
--            m = val
--        end
--     end
--     return mi, m
-- end
-- print(Maximum({7,77,87,9487,}))

-- -- --Hint: 可變參數
-- function average(...)
--     result = 0
--     local arg={...}    --> arg 是一個可變 table 
--     for i,v in ipairs(arg) do
--        result = result + v
--     end
--     print("總共輸入 " .. #arg .. " 個數字")
--     return result/#arg
--  end
 
--  print("平均值: ",average(10,5,3,4,5,6))

-- -- --Hint: 也可以用 select("#"...) 來取得可便參數的數量
-- function average(...)
--     result = 0
--     local arg={...}    --> arg 是一個可變 table 
--     for i,v in ipairs(arg) do
--        result = result + v
--     end
--     print("總共輸入 " .. select("#",...) .. " 個數字")
--     return result/#arg
--  end
 
--  print("平均值: ",average(10,5,3,4,5,6))



-- --Hint: 可以使用固定參數搭配可變參數，固定參數需要加在最前面
-- function Fwrite(fmt,...)
--     return io.write(string.format(fmt, ...));
-- end

-- Fwrite("Google\n");                   -----> fmt = Google
-- Fwrite("%d%d\n",1,2);       -----> fmt = "%d%d",可變參數為1,2


-- -- NOTE: select
-- select('#', …) 返回可變參數的長度。
-- select(n, …) 用於返回從起點 n 開始到結束的所有位置
-- function f(...)
--     a = select(3,...)  
--     print (a)
--     print (select(3,...)) 
-- end
-- f(0,1,2,3,4,5)


-- do
--     function foo(...)
--         for i = 1, select('#', ...) do  -->得到所有可變參數
--             local arg = select(i, ...); -->讀取參數，arg 對應右值第一個參數
--             print("arg", arg);  
--         end
--     end
--     foo(1, 2, 3, 4);  
-- end