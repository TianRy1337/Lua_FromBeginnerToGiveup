-- -- testfile
-- house = {
--          ["Street 22"] = {
--                            {name = "George", age = 20},
--                            {name = "Pete", age = 25}
--                          },
--          ["Street 30"] = {
--                            {name = "John", age = 32},
--                          }
--        }
-- for i, v in pairs(house) do
--         print(i)
-- end
-- local house={}
-- table.insert(house, "Street 22")
-- local street = house[#house]
-- print(street)
-- house[street] = { {name = "George", age = 20},
--                   {name = "Pete", age = 25} }

-- table.insert(house, "Street 30")
-- street = house[#house]
-- house[street] = { {name = "John", age = 32} }

-- for _, v in ipairs(house) do
--     print(v)
--   end

local function add(a,b)
  assert(type(a) == "number", "a is not a number")
  assert(type(b) == "number", "b is not a number")
  return a+b
end
add(10)