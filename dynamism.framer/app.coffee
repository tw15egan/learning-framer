layerA = new Layer
layerA.center()

layerA.draggable.enabled = true
layerA.draggable.horizontal = false

layerA.originalFrame = layerA.frame


layerA.on Events.DragMove, ->
	ydist = @y - @originalFrame.y
	
	@shadowX = - ydist / 20
	
	@shadowBlur = Math.abs ydist / 20
	
layerA.on Events.DragEnd, ->
	@animate
		properties:
			x: @originalFrame.x
			y: @originalFrame.y
			shadowX: 0
			shadowBlur: 0
		curve: "spring(1000, 40, 0)"
