-- --NOTE: Lua Coroutine
-- Lua 的 Coroutine 跟 Thread 比較類似：擁有獨立的 Stack&Heap 獨立的區域變數，獨立的 Pointer
-- 同事又與其他 Coroutine 共享全域變數以及其他大部分的東西

--* coroutine.create()：創建一個 coroutine ,回傳一個 coroutine，
-- 參數是一個函式，和Resume配合使用就喚醒函式呼叫
--* coroutine.resume()：重啟 coroutine，和 create 配合使用
--* coroutine.yield()：保留執行狀態並返回，配合 resume 使用能達到很多效果
--* coroutine.status()：查看 coroutine 狀態，共三種：dead, suspended, running
--* coroutine.wrap()： 可以將 Thread 包裝成一個函式(function)
-- 創建 coroutine，返回一個函式一旦呼叫這個函式，就進入 coroutione，和 Create 功能重複
--* coroutine.running()：返回正在執行的 coroutine，一個 coroutine 就是一個 Thread ，當使用 running
-- 的時候，就是返回一個 corouting 的 Thread

co = coroutine.create(
    function (i)
        print(i)
    end
)
coroutine.resume(co,1)
print(coroutine.status(co))
print("==============")

co2 = coroutine.create(
    function ()
        for i = 1, 10 do
            print(i)
            if(i==3)then
                print(coroutine.status(co2)) -- --> running
                print(coroutine.running())  -- -->thread:XXXXX
            end
            coroutine.yield()
        end
    end
)

coroutine.resume(co2) --1
coroutine.resume(co2) --2
coroutine.resume(co2) --3

print(coroutine.status(co2)) -- suspended
print(coroutine.running())
print("==============")


function foo(a)
    print("foo print :",a)
    return coroutine.yield(2*a)
end

co3 = coroutine.create(
    function (a,b)
        print("First coroutine print",a,b)
        local r = foo(a+1)
        print("Second coroutine print",r)
        local v,s = coroutine.yield(a+b,a-b)

        print("Thrid coroutine print",v,s)
        return b,"End coroutine"
    end
)
print("main",coroutine.resume(co3,1,10))
print("==============")
print("main",coroutine.resume(co3,"r"))
print("==============")
print("main",coroutine.resume(co3,"x","y"))
print("==============")
print("main",coroutine.resume(co3,"x","y"))



-- --NOTE: creat 和 wrap 差異
co_creat = coroutine.create(
    function()
        print("co_creat類型是"..type(co_creat))
    end
)

co_wrap = coroutine.wrap(
    function()
        print("co_wrap類型是"..type(co_wrap))
    end
)

coroutine.resume(co_creat)
co_wrap()


-- --NOTE: coroutine.resueme 特別注意 :這個方法只要呼叫就會回傳一個 boolean 
-- -- coroutine.resueme 如果呼叫成功就回完 true，如果有 yield，就同時回傳 yield 括號裡的參數
-- -- 如果失敗就回傳 false 並補上一句字串 "cannot resume dead coroutine"
co_yieldtest = coroutine.create(
    function()
        coroutine.yield()
        coroutine.yield(1)
        return 2
    end
)

for i = 1,4 do
    print("第"..i.."次呼叫 coroutine:", coroutine.resume(co_yieldtest))
end