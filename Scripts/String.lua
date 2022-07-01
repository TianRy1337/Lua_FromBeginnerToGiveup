-- -- NOTE: String
-- -- 單引號和雙引號之間都是 String
-- -- [[ 與 ]] 之間也是 String
local string1 = "Lua"
print("\"字串 1 是\"",string1)
local string2 = 'Google.com'
print("字串 2 是",string2)

local string3 = [[Lua 教學]]
print("字串 3 是",string3)



-- --Hint: string.upper(argument) 全轉大寫字母
local aToA = "abcde"
print(string.upper(aToA))

-- -- Hint: string.lower(argument) 全轉小寫字母
local AToa = "ABCDE"
print(string.lower(AToa))

-- -- Hint: string.gsub(mainString,findString,replaceString,num) 字串替換
-- -- mainString : 要進行操作的字串
-- -- findString : 要被替換的字串
-- -- replaceString : 替換的字串
-- -- num : 替換的次數 (可忽略，忽略則全替換)
-- -- Return{String:替換完成的字串, number:替換的次數}
print(string.gsub("AAAA","A","Z",2))
print(string.gsub("AAAA","A","Z"))
print(string.gsub("ABAC","A","Z",1))


-- --Hint:string.find (str, substr, [init, [end]])
-- -- 在指定目標 "str" 找到指定內容"substr" 並 Return 起始索引和結束索引
-- -- intit : 搜尋的起始位置 可以是負值
print (string.find("Hello Lua world","Lua",1))

-- --Hint:string.reverse(arg)
-- -- 反轉字串
print(string.reverse("Lua"))

-- --Hint:string.format(...)
-- -- Return 一個類似 printf的格式化字串
print(string.format("the number is : %d",87))


-- --Hint:string.char(arg) 和 string.byte(arg[,int])
-- -- string.char 將整數數字轉成字符並連接，byte將字符轉換成整數 (可指定哪一個，預設第一個)
print(string.char(65,66,67,68))
print(string.byte("ABCD",2,4))
print(string.byte("ABCD"))


-- --Hint:string.len(arg) 計算字串長度
print(string.len("abc"))

-- --Hint:string.rep(s,n) return s的複製 n為次數
print(string.rep("HaHa",2))


-- --Hint:string.gmatch(str, pattern) 
-- -- return iterator ,每次呼叫這個函式，返回一個在字串 str 裡面找到的
-- -- 下一個符合 pattern 描述的子字串，如果參數 pattern 描述的字串符沒找到 迭代函式就返回 nil
for s in string.gmatch("Hello Lua World","%a+")do
    print(s)
end


-- --Hint:string.match(str, pattern, init)
-- -- 只尋找 str 中的第一個找到的字串，init預設為1
-- -- 有找到就返回整個 patter 字串
-- -- 若沒有成功找到就返回 nil
print(string.match("I have 2 questions for you.","questions"))
print(string.format("%d, %q", string.match("I have 2 questions for you.", "(%d+) (%a+)")))
print(string.match("I have 2 questions for you.",123))


----Hint:字串格式化
-- %c - 接受一個數字, 並將其轉化為ASCII碼表中對應的字符
-- %d, %i - 接受一個數字並將其轉化為有符號的整數格式
-- %o - 接受一個數字並將其轉化為八進制數格式
-- %u - 接受一個數字並將其轉化為無符號整數格式
-- %x - 接受一個數字並將其轉化為十六進制數格式, 使用小寫字母
-- %X - 接受一個數字並將其轉化為十六進制數格式, 使用大寫字母
-- %e - 接受一個數字並將其轉化為科學記數法格式, 使用小寫字母e
-- %E - 接受一個數字並將其轉化為科學記數法格式, 使用大寫字母E
-- %f - 接受一個數字並將其轉化為浮點數格式
-- %g(%G) - 接受一個數字並將其轉化為%e(%E, 對應%G)及%f中較短的一種格式
-- %q - 接受一個字符串並將其轉化為可安全被Lua編譯器讀入的格式
-- %s - 接受一個字符串並按照給定的參數格式化該字符串 

string1 = "Lua"
string2 = "Tutorial"
local number1 = 10
local number2 = 20
print(string.format("基本格式化 %s %s",string1,string2))
local date = 25; local month = 3; local year = 2022
print(string.format("日期格式化 %02d/%02d/%03d", date, month, year))
print(string.format("%.4f",1/3))


local s = "Deadline is 30/05/1999, firm"
date = "%d%d/%d%d/%d%d%d%d"
print(string.sub(s, string.find(s, date)))


----NOTE: 阿拉伯數字轉中文數字
local function NumToCN(num)
    local size = #tostring(num)
    local CN = "";
    local StrCN = {"一","二","三","四","五","六","七","八","九"}
    for i = 1,size do
        if(string.sub(tostring(num),i,i)~='0')then
            CN = CN..StrCN[tonumber(string.sub(tostring(num),i,i))]
        else 
            CN = CN.."零"
        end
    end
    return CN
end
print(NumToCN(1234567890))
