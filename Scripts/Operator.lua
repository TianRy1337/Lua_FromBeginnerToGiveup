-- -- NOTE: Lua Arithmetic Operators : + - * / % ^ - //
-- a = 21
-- b = 10
-- print("A 值為: "..a.." ， B 值為: "..b)
-- c = a + b
-- print("+","A + B 的值 C 為: ",c)
-- c = a - b
-- print("-","A - B 的值 C 為: ",c)
-- c = a * b
-- print("*","A * B 的值 C 為: ",c)
-- c = a / b
-- print("/","A / B 的值 C 為: ",c)
-- c = a % b
-- print("%","A % B 的值 C 為: ",c)
-- c = a^2
-- print("^","A ^ 2 的值 C 為: ",c)
-- c = -b
-- print("-","-B 的值 C 為: ",c)

-- a = 5
-- b = 2
-- print("除法 a/b的值為: ",a/b)
-- print("整除除法 a//b的值為: ",a//b)


-- --NOTE: Lua Relational Operators : == ~= > < >= <=
-- a = 21
-- b = 10
-- print("A 值為: "..a.." ， B 值為: "..b)
-- if( a == b )then
--    print("A 等於 B" )
-- else
--    print("A 不等於 B" )
-- end

-- if( a ~= b )then
--     print("A 不等於 B" )
--  else
--     print("A 等於 B" )
--  end

--  if( a < b )then
--     print("A 小於 B" )
--  else
--     print("A 大於 B" )
--  end

--  if( a > b )then
--     print("A 大於 B" )
--  else
--     print("A 小於 B" )
--  end

--  if( a <= b )then
--     print("A 小於等於 B" )
--  else
--     print("A 大於等於 B" )
--  end
--  a = 21
--  b = 55
--  print("修改後 A 值為: "..a.." ， B 值為: "..b)

--  if( a >= b )then
--     print("A 大於等於 B" )
--  else
--     print("A 小於等於 B" )
--  end

--  --NOTE: Lua Logic Operators : and or not
--  a = true;
--  b = true;
--  print("A 值為: ",a," B 值為: ",b)

--  if ( a and b )then
--    print("a and b -true" )
-- end
-- if ( a or b )then
--     print("a or b -true" )
--  end
-- print("------------------" )
-- a = true;
-- b = false;
-- print("修改後 ".."A 值為: ",a," B 值為: ",b)
-- if ( a and b )then
--     print("a and b -true" )
-- else
--     print("a and b -false" )
--  end

-- if ( not( a and b) )then
--     print("not(a and b) -true" )
-- else
--     print("not(a and b) -false" )
-- end


-- --NOTE: Lua other Operators : .. #
-- a = "Hello"
-- b = "World"
-- -- -- .. 用來連接字串
-- -- -- # 用來計算 table 或字串的長度
-- print("連接字串用 .. ",a..b)
-- print("b的字串長度",#b)
-- print("Test的字串長度",#"Test")


-- --NOTE: Lua Operators Sequence (High - Low)
-- -- ^
-- -- not    - (unary)
-- -- *      /       %
-- -- +      -
-- -- ..
-- -- <      >      <=     >=     ~=     ==
-- -- and
-- -- or

-- -- Hint: 除了'^'和'..'以外的所有二元運算都是由左至右
-- -- a+i < b/2+1          -->       (a+i) < ((b/2)+1)
-- -- 5+x^2*8              -->       5+((x^2)*8)
-- -- a < y and y <= z     -->       (a < y) and (y <= z)
-- -- -x^2                 -->       -(x^2)
-- -- x^y^z                -->       x^(y^z)




-- -- --Hint:透過'#'去取得 Table 長度是根據最大索引值
-- tab = {}
-- tab[1]="1"
-- tab[2]="2"
-- tab[4]="4"
-- print("tab 長度 "..#tab) -- 4


-- -- --Hint: tab 索引跳號兩次'#'就會直接取跳號前最大值索引
-- Ntab = {}
-- Ntab[1]="1"
-- Ntab[2]="2"
-- Ntab[3]=nil
-- Ntab[4]=nil
-- Ntab[5]="5"
-- print("Ntab 長度 "..#Ntab) -- 2

-- -- --Hint: 奇怪的 # 取 Table 長度 TODO:待研究
-- t = {}
-- t[1] = "1"
-- t[2] = nil
-- t[3] = "2"
-- t[4] = nil
-- print("t的長度為 "..#t) --> 1

-- t[1] = "1"
-- t[2] = nil
-- t[3] = "2"
-- t[4] = "4"
-- print("t的長度為 "..#t) --> 4

-- T = {1,nil,3}
-- print("T的長度為 "..#T) --> 3

-- T = {1,nil,3,nil}
-- print("T的長度為 "..#T) --> 3

-- T = {1,nil,3,nil,nil}
-- print("T的長度為 "..#T) --> 1

-- T2= {nil,nil,3,4}
-- print("T2的長度為 "..#T2) --> 4
-- TT = {}
-- TT[1] = nil
-- TT[2] = nil
-- TT[3] = "3"
-- TT[4] = "4"
-- print("TT的長度為 "..#TT) --> 0

-- -- --Hint: 實現 C/C++ 三元運算
-- -- condition ? result1:result2

-- -- if condition then
-- --     return result1
-- -- else
-- --     return result2
-- -- end
-- -- 透過 and 和 or 的特性快速實現
-- --({condition} and {result1} or {result2})
-- local isApple = true;
-- print(isApple and "蘋果"or"鳳梨")