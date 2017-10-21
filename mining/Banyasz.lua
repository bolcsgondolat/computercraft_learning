
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
		
		if see and 
			(block.name == "minecraft: coal_ore" or block.name == "minecraft: iron_ore"  
			or block.name == "minecraft: gold_ore" or block.name == "minecraft: redstone_ore" 
			or block.name == "minecraft: diamond_ore" or block.name == "minecraft: emerald_ore") then
			turtle.dig() 
		end
	end
end

function Ore() 
	if see and 
			(block.name == "minecraft: coal_ore" or block.name == "minecraft: iron_ore"  
			or block.name == "minecraft: gold_ore" or block.name == "minecraft: redstone_ore" 
			or block.name == "minecraft: diamond_ore" or block.name == "minecraft: emerald_ore") then
			return true 
	end
	return false
end 

function PlaceTorch()
	util.turn()
	
	util.select("minecraft:torch")
	turtle.place()
	
	util.turn()
end

GoDown(100)
util.printItems()
