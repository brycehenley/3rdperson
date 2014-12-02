player = getObject("Feet")
camera = getObject("Camera1")
bob = getObject("bob")
head = getObject("head")
pblock = getObject("Entity0")

dx = 0.0
dy = 0.0

centerCursor()
window = getWindowScale()
mx = getAxis("MOUSE_X")
my = getAxis("MOUSE_Y")


function onSceneUpdate()

	if isKeyPressed("ESCAPE") then quit() end

	dx = getAxis("MOUSE_X") - mx
	dy = getAxis("MOUSE_Y") - my
	
	rotate(player, {0.0, 0.0, -1.0}, dx*250.0, "local")
	rotate(head, {-1.0, 0.0, 0.0}, dy*150.0, "local")


	rotation = getRotation(player)
	rotation[1] = 0.0
	rotation[2] = 0.0


	setRotation(player, rotation)

	
	centerCursor()
	hideCursor()

	-- CHARACTER CONTROLER
	-- if isCollisionBetween(player, pblock) == true then
		if isKeyPressed("W") then translate(player, {0.0, 0.5, 0.0}, "local") end
		if isKeyPressed("S") then translate(player, {0.0, -0.5, 0.0}, "local") end
		if isKeyPressed("A") then translate(player, {-0.5, 0.0, 0.0}, "local") end
		if isKeyPressed("D") then translate(player, {0.5, 0.0, 0.0}, "local") end
		if isKeyPressed("LSHIFT") then translate(player, {0.0, 0.25, 0.0}, "local") end
	-- end

	if isKeyPressed("SPACE") then 

    	if isCollisionBetween(player, pblock) == true then 
    		-- translate(player, {0.0, 0.0, 2.0}, "local")
    		addCentralForce(player, {0.0, 0.0, 2000.0}, "global")
    	end
	end

    setGravity({0.0, 0.0, 0.0})

    if isCollisionBetween(player, pblock) ~= true then 
    	addCentralForce(player, {0.0, 0.0, -100.0}, "global")
    end

	-- if isKeyPressed("W") then addCentralForce(player, {0.0, 2000.0, 0.0}, "local") end
	-- if isKeyPressed("LSHIFT") then addCentralForce(player, {0.0, 2000.0, 0.0}, "local") end
	-- if isKeyPressed("S") then addCentralForce(player, {0.0, -2000.0, 0.0}, "local") end
	-- if isKeyPressed("A") then addCentralForce(player, {-1000.0, 0.0, 0.0}, "local") end
	-- if isKeyPressed("D") then addCentralForce(player, {1000.0, 0.0, 0.0}, "local") end
    -- if isKeyPressed("SPACE") then addCentralForce(player, {0.0, 0.0, 200.0}, "local") end
  	
  	-- ANIMATION CONTROL
	if onKeyDown("W") then
		changeAnimation(bob, "3")
	end


	-- if isKeyPressed("SPACE") then translate(camera, {0.0, 0.3, 0.0}, "local") end
	
	-- if isKeyPressed("C") then translate(camera, {0.0, -0.3, 0.0}, "local") end

end