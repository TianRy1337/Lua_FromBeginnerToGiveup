-- -- NOTE: String
-- -- 單引號和雙引號之間都是 String
-- -- [[ 與 ]] 之間也是 String
-- string1 = "Lua"
-- print("\"字串 1 是\"",string1)
-- string2 = 'Google.com'
-- print("字串 2 是",string2)

-- string3 = [[Lua 教學]]
-- print("字串 3 是",string3)



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

