layerA = new Layer

layerA.center()

Utils.labelLayer layerA, "Drag Me!"

layerA.draggable.enabled = true

layerA.on Events.DragStart, ->
	@backgroundColor = Utils.randomColor()

layerA.on Events.DragMove, (event, layer) ->
	print "X: ", event.x
	print "Y: ", event.y
	
layerA.originalFrame = layerA.frame

layerA.on Events.DragEnd, ->
	@animate
		properties:
			x: @originalFrame.x
			y: @originalFrame.y
		time: .5
		curve: "ease-in-out"