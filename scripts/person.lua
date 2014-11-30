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
	
	rotate(camera, {0.0, 0.0, -1.0}, dx*250.0)
	rotate(camera, {-1.0, 0.0, 0.0}, dy*150.0, "local")

	centerCursor()
	hideCursor()

	-- setRotation(feet, {0.0, 0.0, getRotation(feet)[3]})

	if isKeyPressed("W") then translate(camera, {0.0, 0.0, -0.3}, "local") end

	if isKeyPressed("S") then translate(camera, {0.0, 0.0, 0.3}, "local") end

	if isKeyPressed("A") then translate(camera, {-0.3, 0.0, 0.0}, "local") end

	if isKeyPressed("D") then translate(camera, {0.3, 0.0, 0.0}, "local") end


	if isKeyPressed("SPACE") then translate(camera, {0.0, 0.3, 0.0}, "local") end
	
	if isKeyPressed("C") then translate(camera, {0.0, -0.3, 0.0}, "local") end

end