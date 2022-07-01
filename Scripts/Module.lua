-- --NOTE: Module and Package
module = {}
module.constant = "這是一個常數"

function module.func1()
    io.write("這是一個全域函式!\n")
end

local function func2()
    io.write("這是一個區域函式!\n")
end

function module.func3()
    func2()
end

return module

-- -- 基本上 Lua 的模組就是一個 table 的結構，因此可以向操作 table 那樣來呼叫模組裡面的常數或函式
-- -- 上面的 func2 因為是區域變數，也就是一個區域函式，因此如果要呼叫必須通過其他全域函式