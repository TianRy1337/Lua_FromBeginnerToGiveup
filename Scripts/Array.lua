-- -- NOTE: 陣列
print("---陣列---")
local array = {"Lua", "Tutorial"}

for i = 0,2 do 
    print(array[i])
end

-- -- Hint: Lua 索引值預設從 1 開始，但也能指定從 0 開始
-- -- 甚至可以用負數當索引值

--- 從 0 開始
local array2 = {}
array2[0] = "Zero"
array2[1] = "One"
array2[2] = "Two"

for i = 0,2 do 
    print(array2[i])
end


--- 負數索引
local array3 = {}

for i= -2, 2 do
   array3[i] = i *2
end

for i = -2,2 do
   print(array3[i])
end


-- -- NOTE: 二維陣列
-- 初始化陣列
print("---二維陣列---")
local array4 = {}
for i=1,3 do 
    array4[i] = {}
    for j=1,3 do
        array4[i][j] = i*j
    end
end

-- 存取陣列
for i=1,3 do
    for j=1,3 do
        print(array4[i][j])
    end
end


-- -- NOTE: 多維陣列
print("---多維陣列---")
local array5 = {}
local maxRows = 3
local maxColums = 3
for row=1 ,maxRows do
    for col=1,maxColums do
        array5[row*maxColums+col] = row*col
    end
end

for row=1,maxRows do
    for col=1,maxColums do
        print(array5[row*maxColums+col])
    end
end

