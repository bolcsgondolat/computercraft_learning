local util = {}

function util.hello()
	print("Hello from util :)")
end

function util.select(name)
	for i=1, 16 do
		info = turtle.getItemDetail(i)
		
		if info then
			if info.name == name then
				turtle.select(i)

				return true
			end
		end
	end

	return false
end

function util.printItems()
	for i=1, 16 do
		info = turtle.getItemDetail(i)
		
		if info then
			print(info.name)
		end
	end
end

function util.turn()
	turtle.turnLeft()
	turtle.turnLeft()
end

return util
