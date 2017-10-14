

local util = dofile("util.lua")
util.hello()

function GoDown(times)
	local bedrock = false
	
	for i=1, times do
		turtle.dig()
		turtle.forward()
		
		see, block = turtle.inspect()
		if see and block.name == "minecraft:bedrock" then
			bedrock = true
			
			print("Elertem az aljat :)")
			-- break
			
			turtle.up()
		end
		
		turtle.digUp()
		turtle.digDown()
		
		if i % 8 == 0 then
			PlaceTorch()
		end
		
		if not bedrock then
			turtle.down()
		end
	end
end

function PlaceTorch()
	util.turn()
	
	if util.select("minecraft:torch") then 
		turtle.place()
	end
	
	util.turn()
end

GoDown(100)
