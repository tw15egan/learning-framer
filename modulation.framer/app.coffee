Framer.Screen.backgroundColor = "#fff"

container = new Layer
	height: 400
	width: 200
	backgroundColor: null

ball = new Layer
	borderRadius: "50%"
	superLayer: container
	
ball.originalFrame = ball.frame
	
ballA = ball.copy()
ballA.superLayer = container
ballA.y = 120

ballB = ball.copy()
ballB.superLayer = container
ballB.y = 240

ballC = ball.copy()
ballC.superLayer = container
ballC.y = 360

ball.draggable = true
ball.draggable.vertical = false
ball.draggable.constraints = container.frame

ball.on "change:x", ->
	ballA.x = Utils.modulate @x, [0, 400], [0, 200]
	ballB.x = @x
	ballC.x = Utils.modulate @x, [0, 400], [0, 600]
	
ball.on Events.DragEnd, ->
	ball.animate
		properties: 
			x: @originalFrame.x
		time: .25