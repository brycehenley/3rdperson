dofile("SDK/Neo3D.lua")
dofile("SDK/Graphics2D.lua")

player = getObject("Feet")
camera = getObject("Camera1")
bob = getObject("bob")
head = getObject("head")
pblock = getObject("Entity0")

isKeyInput = false
dx = 0.0
dy = 0.0

centerCursor()
window = getWindowScale()
mx = getAxis("MOUSE_X")
my = getAxis("MOUSE_Y")

setGravity({0.0, 0.0, 0.0})

function onSceneUpdate()

	-- Sets animation playback speed to acount for not being 60fps
	setAnimationSpeed(bob, 0.4)



	if isKeyPressed("ESCAPE") then quit() end

	dx = getAxis("MOUSE_X") - mx
	dy = getAxis("MOUSE_Y") - my
	
	rotate(bob, {0.0, 0.0, -1.0}, dx*250.0, "local")
	setRotation(player, getRotation(bob), "local")
	rotate(head, {-1.0, 0.0, 0.0}, dy*150.0, "local")

	centerCursor()
	hideCursor()

	-- CHARACTER CONTROLER
	-- if isCollisionBetween(player, pblock) == true then
		if isKeyPressed("W") then 
			changeAnimation(bob, "1")
			translate(player, {0.0, 0.5, 0.0}, "local")
			addCentralForce(player, {0.0, 0.0, -50}, "local")
			if isCollisionBetween(player, pblock) == true then
				clearForces(player)
			end
		end
		if onKeyUp("W") then
			clearForces(player)
		end
		
		if isKeyPressed("S") then 
			translate(player, {0.0, -0.5, 0.0}, "local")
			addCentralForce(player, {0.0, 0.0, -50}, "local")
			if isCollisionBetween(player, pblock) == true then
				clearForces(player)
			end
		end
		if onKeyUp("S") then
			clearForces(player)
		end

		if isKeyPressed("A") then 
			translate(player, {-0.5, 0.0, 0.0}, "local")
			addCentralForce(player, {0.0, 0.0, -50}, "local")
			if isCollisionBetween(player, pblock) == true then
				clearForces(player)
			end
		end
		if onKeyUp("A") then
			clearForces(player)
		end

		if isKeyPressed("D") then 
			translate(player, {0.5, 0.0, 0.0}, "local")
			addCentralForce(player, {0.0, 0.0, -50}, "local")
			if isCollisionBetween(player, pblock) == true then
				clearForces(player)
			end
		end
		if onKeyUp("D") then
			clearForces(player)
		end

		if isKeyPressed("LSHIFT") then 
			translate(player, {0.0, 0.25, 0.0}, "local") 
		end
	-- end

	if isKeyPressed("SPACE") then 

    	if isCollisionBetween(player, pblock) == true then 
    		-- translate(player, {0.0, 0.0, 2.0}, "local")
    		addCentralForce(player, {0.0, 0.0, 1000}, "local")
    	end
	end

	--Artificial gravity + slide prevetion

	-- if tick == 1 then 
 --    	addCentralForce(player, {0.0, 0.0, -50}, "local")
 --    	tick = 0
 --    	addtick = false
 --    end
    

    -- if isCollisionBetween(player, pblock) ~= true then 
    -- 	addCentralForce(player, {0.0, 0.0, -100.0}, "global")
    -- end

	-- if isKeyPressed("W") then addCentralForce(player, {0.0, 2000.0, 0.0}, "local") end
	-- if isKeyPressed("LSHIFT") then addCentralForce(player, {0.0, 2000.0, 0.0}, "local") end
	-- if isKeyPressed("S") then addCentralForce(player, {0.0, -2000.0, 0.0}, "local") end
	-- if isKeyPressed("A") then addCentralForce(player, {-1000.0, 0.0, 0.0}, "local") end
	-- if isKeyPressed("D") then addCentralForce(player, {1000.0, 0.0, 0.0}, "local") end
    -- if isKeyPressed("SPACE") then addCentralForce(player, {0.0, 0.0, 200.0}, "local") end
  	
  	-- ANIMATION CONTROL
	if onKeyDown("W") then
		changeAnimation(bob, "1")
	end


	-- if isKeyPressed("SPACE") then translate(camera, {0.0, 0.3, 0.0}, "local") end
	
	-- if isKeyPressed("C") then translate(camera, {0.0, -0.3, 0.0}, "local") end

end