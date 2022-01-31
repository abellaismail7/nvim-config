local ls = require("luasnip")
local t = ls.text_node
local s = ls.snippet
local i = ls.insert_node
local d = ls.dynamic_node
local sn = ls.snippet_node

local html_attrs = {
   a = {"href"},
   img = {"src", "alt"},
   input = {"type"}
}

---
--- @param tag string
--- returns table
---
local function get_attrs(nodes, tag)
   local attrs = html_attrs[tag]

   if not attrs then
      return {}
   end

   local count = 1

   for _,attr in pairs(attrs)
   do

      table.insert(nodes, t(" "))
      table.insert(nodes, t(attr))
      table.insert(nodes, t'="')
      table.insert(nodes, i(count))
      table.insert(nodes, t'"')

      count = count + 1
   end
   return nodes
end


return {
   s(
      { trig = "<?[%w%.#_]+", regTrig = true },
      d(1 ,function(_, snip)
         local _,_, tag = string.find(snip.trigger, "<?([%w_]+)")
         local _,_, id = string.find(snip.trigger, "#([%w_]+)")
         local _,_, class = string.find(snip.trigger, "%.([%w_]+)")

         local attrs = ""
         if class then
            attrs = ' class="' .. class .. '"'
         end
         if id then
            attrs = attrs .. ' id="' .. id ..'"'
         end
         local nodes = {}
         table.insert(nodes, t("<" .. tag .. attrs))
         get_attrs(nodes, tag)
         table.insert(nodes, t(" >"))
         table.insert(nodes, i(0))
         table.insert(nodes, t("</" .. tag .. ">"))
      	return sn(nil, nodes)
      end, {})
   )
}
