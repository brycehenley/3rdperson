feet = getObject("Feet")
camera = getObject("Camera1")
bob = getObject("bob")
head = getObject("head")

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
	
	rotate(feet, {0.0, 0.0, -1.0}, dx*250.0, "local")
	rotate(head, {-1.0, 0.0, 0.0}, dy*150.0, "local")


	rotation = getRotation(feet)
	rotation[1] = 0.0
	rotation[2] = 0.0


	setRotation(feet, rotation)

	
	centerCursor()
	hideCursor()

	-- setRotation(feet, {0.0, 0.0, getRotation(feet)[3]})

	-- if isKeyPressed("W") then translate(feet, {0.0, 0.3, 0.0}, "local") end
	-- if isKeyPressed("S") then translate(feet, {0.0, -0.3, 0.0}, "local") end
	-- if isKeyPressed("A") then translate(feet, {-0.3, 0.0, 0.0}, "local") end
	-- if isKeyPressed("D") then translate(feet, {0.3, 0.0, 0.0}, "local") end

	if isKeyPressed("W") then addCentralForce(feet, {0.0, 2000.0, 0.0}, "local") end
	if isKeyPressed("LSHIFT") then addCentralForce(feet, {0.0, 2000.0, 0.0}, "local") end
	if isKeyPressed("S") then addCentralForce(feet, {0.0, -2000.0, 0.0}, "local") end
	if isKeyPressed("A") then addCentralForce(feet, {-1000.0, 0.0, 0.0}, "local") end
	if isKeyPressed("D") then addCentralForce(feet, {1000.0, 0.0, 0.0}, "local") end
    -- if isKeyPressed("SPACE") then addCentralForce(feet, {0.0, 0.0, 200.0}, "local") end
  
	if onKeyDown("W") then
		changeAnimation(bob, "3")
	end


	-- if isKeyPressed("SPACE") then translate(camera, {0.0, 0.3, 0.0}, "local") end
	
	-- if isKeyPressed("C") then translate(camera, {0.0, -0.3, 0.0}, "local") end

end