Screen.backgroundColor = "#fff"

targetLayer = new Layer
	x: 100
	y: 100
	height: 200
	width: 300
	borderRadius: 10
	
animation = new Animation
	layer: targetLayer
	properties: 
		x: 300
	curve: "spring"
	time: .5

count = 0	
reverse = animation.reverse()

animation.on Events.AnimationEnd, ->
	++count
	print count
	reverse.start()
	
reverse.on Events.AnimationEnd, ->
	++count
	print count
	animation.start()
	


start = new Layer
	height: 100
	width: 300
	borderRadius: 10

start.center()

start.on Events.Click, ->
	if !targetLayer.isAnimating
		animation.start()
	else 
		animation.stop()
		

