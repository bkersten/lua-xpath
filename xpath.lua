--[[
Author: Ben Kersten

Copyright © 2011 Quest Software

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the 
"Software"), to deal in the Software without restriction, including 
without limitation the rights to use, copy, modify, merge, publish, 
distribute, sublicense, and/or sell copies of the Software, and to 
permit persons to whom the Software is furnished to do so, subject 
to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

]]

-- NOTE: no support for full axis names; uses abreviated syntax
-- TODO: add support for node[last()]


string.trim = string.trim or function(s)
	return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

string.split = string.split or function(str, pat)
    -- http://lua-users.org/wiki/SplitJoin
	assert(type(str) == 'string', debug.traceback())
	local t = {}
	local fpat = "(.-)" .. pat
	local last_end = 1
	local s, e, cap = str:find(fpat, 1)
	while s do
		if s ~= 1 or cap ~= "" then
			t[#t+1] = cap
		end
		last_end = e+1
		s, e, cap = str:find(fpat, last_end)
	end
	if last_end <= #str then
		cap = str:sub(last_end)
		t[#t+1] = cap
	end
	return t
end


local xpath = {}

local function insertToTable(t, leaf, selection)
	if type(leaf) == "table" then
		if selection == nil then
			t[#t+1] = leaf
		
		elseif selection == "text()" then
			t[#t+1] = leaf[1]
			
		elseif selection:find("@") == 1 then
			if selection[2] == '*' then
				for i,v in ipairs(leaf.attr) do
					t[#t+1] = leaf.attr[v]
				end
			else
				t[#t+1] = leaf.attr[selection:sub(2)]
			end
		end
	end
end


local function eval_predicate(node, expression)
	assert(type(expression) == 'string', debug.traceback())
	local expression_parts = string.split(expression, ' and ')

	for _,expr in ipairs(expression_parts) do
		local name_start = expr:find("@") or 0
		local name_end = expr:find("=") or 0
		local name = expr:sub(name_start+1, name_end-1)
		local val = nil
		if name_end > 0 then
			val = expr:sub(name_end+1)
		end
		
		if name_start > 0 then
			-- attribute
			if name == '*' then
				if #node.attr == 0 then
					return false
				end
				
			elseif node.attr[name] == nil then
				return false
				
			elseif val then
				val = string.gsub(val, "'", "") -- remove '
				val = string.gsub(val, "\"", "") -- remove "
				
				if val ~= node.attr[name] then
					return false
				end
			end
		else
			-- child node
			local pred_result = false
			for _,child in ipairs(node) do
				if child.tag == name then
					if val then
						-- check text() value
						if child[1] and child[1] == val then
							pred_result = true
						end
					else
						pred_result = true
					end
				end
			end
			
			if not pred_result then
				return false
			end
		end
	end
	
	return true
end


local function match(node, tag_name, expression)
	if tag_name ~= node.tag and tag_name ~= '*' then
		return false
	end
	
	if expression == nil then
		return true
	end
	
	return eval_predicate(node, expression)
end


-- NOTE: descendant-or-self::node() // is represented by a space
local function parseNodes(xmlNode, segments, idx, nodes, selection)
	if idx > #segments then
		return {}
	end
	
	local segment = segments[idx]
	if
		segment.tag == '..' --or segment.tag == "parent::node()" 
	then
		return { idx+1 } -- return next idx to continue from at parent
	end
	
	local positions = {}
	local parent_positions = {}
	
	if
		segment.tag == "." --or segment.tag == "self::node()"
	then
		local pos_t = parseNodes(xmlNode, segments, idx+1, nodes, selection)
		for i=1,#pos_t do
			local pos = pos_t[i]
			positions[#positions+1] = pos
		end
		pos_t = nil
	end
	
	if 
		segment.tag == " " --or segment.tag == "descendant-or-self::node()" 
	then
	
		local pos_t = parseNodes(xmlNode, segments, idx+1, nodes, selection)
		for i=1,#pos_t do
			parent_positions[#parent_positions+1] = pos_t[i]
		end
		pos_t = nil
	
		for _,node in ipairs(xmlNode) do
			if type(node) == "table" then
				if node.tag ~= nil and node.attr ~= nil then
					local pos_t = parseNodes(node, segments, idx, nodes, selection)
					for i=1,#pos_t do
						positions[#positions+1] = pos_t[i]
					end
					pos_t = nil
				end
			end
		end
	end
	
	for _,node in ipairs(xmlNode) do
		if type(node) == "table" then
			if node.tag ~= nil and node.attr ~= nil then
				local found = match(node, segment.tag, segment.expression)
				if found then
					segment.cur_index = segment.cur_index+1
					
					local insert = true
					if segment.index then
						--print("index: " .. segment.index .. ", cur_index: " .. segment.cur_index)
						if segment.cur_index == segment.index then
							insert = true
						else
							insert = false
						end
					end
					
					if insert then
						if #segments == idx then
							insertToTable(nodes, node, selection)
						else
							local pos_t = parseNodes(node, segments, idx+1, nodes, selection)
							for i=1,#pos_t do
								local pos = pos_t[i]
								positions[#positions+1] = pos
							end
							pos_t = nil
						end
					end
				end
			end
		end
	end
	
	for i=1,#positions do
		local cur_pos = positions[i]
		
		if cur_pos > #segments then
			insertToTable(nodes, xmlNode, selection)

		elseif segments[cur_pos] == '..' then
			parent_positions[#parent_positions+1] = cur_pos+1
			
		else
			local pos_t = parseNodes(xmlNode, segments, cur_pos, nodes, selection)
			for i=1,#pos_t do
				parent_positions[#parent_positions+1] = pos_t[i]
			end
			pos_t = nil
		end
	end
	
	return parent_positions
end


local function select_nodes(xmlTree, query, nodes)
	if
		query:find("///") ~= nil or 
		query:find("//%.%.") ~= nil 
	then
		-- invalid queries
		return
	end
	
	local query = string.trim(query)
	if string.len(query) == 0 then
		return
	end
	
	local first_pos = query:find("/")
	if first_pos == nil then
		-- replace nodename with equivelant //nodename/*
		query = string.format("//%s/*", query)
	elseif first_pos > 1 and query:find('.') ~=1 then
		-- replace nodename/something with equivelant //nodename/something (except if starting with self)
		query = string.format("//%s", query)
	end
	
	query = string.gsub(query, "//", "/ /")
	
	local segments = string.split(query, '/')
	
	local last_tag = segments[#segments]
	local selection = nil
	if 
		last_tag:find("@") == 1 or
		last_tag:find("text()") == 1
	then
		selection = last_tag
		segments[#segments] = nil
	end
	
	local query_segments = {}
	for _,segment in ipairs(segments) do
		local pred_start = segment:find("[[]") or 0
		local pred_end = segment:find("[]]")
		
		local tag = segment:sub(1, pred_start-1)
		--print("tag: '" .. tag .. "'")
		
		local expression = nil
		local index = nil
		
		if pred_start > 0 and pred_end then
			expression = segment:sub(pred_start+1, pred_end-1)
			
			if pred_end < #segment then
				local idx_start = segment:find("[[]", pred_end+1)
				local idx_end = segment:find("[]]", pred_end+1)
				if idx_start and idx_end then
					index = segment:sub(idx_start+1, idx_end-1)
				end
				
			elseif tonumber(expression) then
				index = expression
				expression = nil
			end
		end
	
		query_segments[#query_segments+1] = {
			['tag'] = tag,
			['expression'] = expression,
			['index'] = tonumber(index),
			['cur_index'] = 0,
		}
	end
	
	parseNodes(xmlTree, query_segments, 1, nodes, selection)
end


local function selectNodes(xml_root, query)
	assert(type(xml_root) == "table", debug.traceback())
	assert(type(query) == "string", debug.traceback())
	
	local queries = {}
	if query:find('|') ~= nil then
		queries = string.split(query, '|')
	else
		queries = { query }
	end
	
	local nodes = {}
	for i=1, #queries do
		local q = queries[i]
		local tree = xml_root
		local c = string.char(string.byte(q, 1))
		--print(c)
		if c == '/' then
			-- push xml onto xmlTree so that parseNodes doesn't need a special case for root
			tree = { [1] = xml_root }
		end
		select_nodes(tree, q, nodes)
	end
	
	return nodes
end
xpath.selectNodes = selectNodes


return xpath
