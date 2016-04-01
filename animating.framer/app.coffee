Screen.backgroundColor = "#fff"

targetLayer = new Layer
	x: 100
	y: 100
	height: 200
	width: 300
	borderRadius: 10
	
start = new Layer
	x: 100
	y: 400
	borderRadius: 10
	backgroundColor: "#1243da"
	
reverse = start.copy()
reverse.x = 220

stop = start.copy()
stop.x = 340

animation = new Animation
	layer: targetLayer
	properties: 
		x: 600
	curve: "ease-in-out"
	time: 1
	
reverseAnimation = animation.reverse()

start.on Events.Click, ->
	animation.start()

stop.on Events.Click, ->
	targetLayer.animateStop()
	
reverse.on Events.Click, ->
	reverseAnimation.start()