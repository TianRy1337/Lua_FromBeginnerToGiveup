-- --NOTE: Module and Package
-- -- 需要用到 Module.Lua
require("Module")
print(module.constant)
module.func3();


-- --Hint: require 用於搜尋 Lua 文件路徑是存放在全域變數 package.path中
-- -- 當 Lua 啟動後 會根據環境變數 LUA_PATH 來初始化這個數值，如果沒有找到就使用一個編譯時定義的
-- -- 預設路徑來進行初始化，如果沒有 LUA_PATH 也可以自己設置