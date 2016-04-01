layerA = new Layer
bg = new BackgroundLayer
	
bounce = new Animation
	layer: layerA
	properties: 
		x: 100
		y: 100
	time: .5
	curve: "spring(200,20,5,0)"
	
layerA.center()
	
layerA.states.add
	stateA:
		x: 0
	stateB:
		x: 300
		scale: .5
		rotation: 135
	stateC:
		x: 400
		scale: 1
		rotation: 0

layerA.states.animationOptions = curve: "spring(200, 20, 10)"

layerA.on Events.Click, ->
	layerA.states.next()