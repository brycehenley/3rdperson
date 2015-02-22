dofile("SDK/Neo3D.lua")
dofile("SDK/Graphics2D.lua")

player = getObject("Feet")
camera = getObject("Camera1")
bob = getObject("bob")
head = getObject("head")
pblock = getObject("Entity0")

walking = false
walkjump = false

isKeyInput = false
dx = 0.0
dy = 0.0

centerCursor()
window = getWindowScale()
mx = getAxis("MOUSE_X")
my = getAxis("MOUSE_Y")

speed = 0.0

setGravity({0.0, 0.0, 0.0})

function onSceneUpdate()
	-- ANIMATION CONTROL
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
			translate(player, {0.0, 0.5, 0.0}, "local")

			if isCollisionBetween(player, pblock) == false then
    			addCentralForce(player, {0.0, 0.0, -50}, "local")
    		end
    
			
			-- start walking animation
			walking = true
			
			if onKeyDown("SPACE") then 
				walkjump = true

			
    
			end

			if walkjump == true then
				changeAnimation(bob, "3")
				if isAnimationOver(bob) then
					walkjump = false
				end
			else
				changeAnimation(bob, "1")
			end
		end

		if onKeyUp("W") then
			walking = false
			--blend animation to idle

			--fixes slope sliding
    		if isCollisionBetween(player, pblock) == true then
    			clearForces(player)
    		end

		end
		

		if isKeyPressed("S") then 
			translate(player, {0.0, -0.5, 0.0}, "local") 
			changeAnimation(bob, "1")
		end
		

		if isKeyPressed("A") then 
			translate(player, {-0.5, 0.0, 0.0}, "local") 
			changeAnimation(bob, "1")
		end
		

		if isKeyPressed("D") then 
			translate(player, {0.5, 0.0, 0.0}, "local")
			changeAnimation(bob, "1") 
		end
		

		if isKeyPressed("LSHIFT") then 
			if walking == true then
			translate(player, {0.0, 0.25, 0.0}, "local")
			 setAnimationSpeed(bob, 0.6) 
			end
		end
	-- end

	if onKeyDown("SPACE") then 

		if walking == false then
			changeAnimation(bob, "2")
		end

		if isCollisionBetween(player, pblock) == false then
    		addCentralForce(player, {0.0, 0.0, -50}, "local")
    	end

    	-- if isCollisionBetween(player, pblock) == true then 
    	-- 	-- translate(player, {0.0, 0.0, 2.0}, "local")
    	-- 	addCentralForce(player, {0.0, 0.0, 1000}, "local")
    	-- end
	end

    -- if isCollisionBetween(player, pblock) ~= true then 
    -- 	addCentralForce(player, {0.0, 0.0, -100.0}, "global")
    -- end

	-- if isKeyPressed("W") then addCentralForce(player, {0.0, 2000.0, 0.0}, "local") end
	-- if isKeyPressed("LSHIFT") then addCentralForce(player, {0.0, 2000.0, 0.0}, "local") end
	-- if isKeyPressed("S") then addCentralForce(player, {0.0, -2000.0, 0.0}, "local") end
	-- if isKeyPressed("A") then addCentralForce(player, {-1000.0, 0.0, 0.0}, "local") end
	-- if isKeyPressed("D") then addCentralForce(player, {1000.0, 0.0, 0.0}, "local") end
    -- if isKeyPressed("SPACE") then addCentralForce(player, {0.0, 0.0, 200.0}, "local") end
  	
	-- if isKeyPressed("SPACE") then translate(camera, {0.0, 0.3, 0.0}, "local") end
	
	-- if isKeyPressed("C") then translate(camera, {0.0, -0.3, 0.0}, "local") end

end