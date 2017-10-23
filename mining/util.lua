local util = {}

function util.hello()
	print("Hello from util :) v0.3")
end

function util.select(name)
	for i=1, 16 do
		info = turtle.getItemDetail(i)
		
		if info then
			if string.find(info.name, name) then
				turtle.select(i)
				
				return true
			end
		end
	end
	
	return false
end

function util.printItems(name)
	for i=1, 16 do
		info = turtle.getItemDetail(i)
		
		if info then
			print(info.name)
		end
	end
end

function util.lookAround()
	local look = {}
	
	for i=1,4 do
		lookInfo(i, look, turtle.inspect())
		turtle.turnRight()
	end
	
	lookInfo("up", look, turtle.inspectUp())
	lookInfo("down", look, turtle.inspectUp())
	
	util.printTable(look)
	
	return look
end

function util.printTable(look)
	for key, value in pairs(look) do 
		print(key .. "," .. value)
	end
end

function lookInfo(tag, look, see, info)
	if see then
		print(tag .. ": " .. info.name)
		look[tag] = info.name
	end
end

function util.turn()
	turtle.turnLeft()
	turtle.turnLeft()
end

function util.dig(info)
	digInfo(info, turtle.dig())
end
function util.digUp(info)
	digInfo(info, turtle.digUp())
end
function util.digDown(info)
	digInfo(info, turtle.digDown())
end

function digInfo(info, ok, msg)
	if not info then
		info = ""
	end
	if not ok then
		print("Nem sikerült felfele ásni " .. msg .. " / " .. info)
	end
end

return util
