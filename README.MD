# Lua 從入門到入墳

工作突然需要用到 Lua ，用這個 Repo 把練習跟一些酷酷ㄉ東西記錄下來。方便自己快速回憶，這篇僅記錄部分本人常忘記的重點，Lua 官方文件有更多詳細的部分。
>然後 Lua 不用加 `;`


## Variable 
Lua 中的變數預設都是**全域變數**
要特別注意的是，哪怕是函式裡面的變數 只要沒有特別用 `local` 聲明為區域變數，都會被視作全域變數

**Example:**
```lua
function TestingVariable()
    A = 15  -- Global variable
    local B = 30 --Local variable
end

TestingVariable()
print(A,B) -- 15 and  nil
```
多重賦值通常用在交換變數數值  
**Example:**
```lua
-- definition:
local a, b

-- Initialization
a = 10
b = 30

print(a,b) --10 , 30

b, a = a, b

print(a,b) --30 , 10
```
