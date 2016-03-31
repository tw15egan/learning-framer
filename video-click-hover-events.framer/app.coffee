
container = new Layer
	backgroundColor: "#fff"
	height: 500
	width: 500
	
container.center()

videoLayer = new VideoLayer 
	width: 480
	height: 270
	video: "images/Street-View.mp4"
	superLayer: container
	
layerA = new Layer
	height: 20
	width: 20
	borderRadius: 50
	visible: false
	superLayer: container

videoLayer.on Events.MouseOver,  ->
	if @player.paused
		@player.play()
		print "play"
	else
		@player.pause()
		print "pause"
		
videoLayer.on Events.MouseOut,  ->
	if @player.paused
		@player.play()
		print "play"
	else
		@player.pause()
		print "pause"

# Get click coordinates
videoLayer.on Events.Click, (event) ->
	print "Offset: ", event.offsetX, event.offsetY
	print "Absolute: ", event.x, event.y
	layerA.visible = true
	layerA.midX = event.offsetX
	layerA.midY = event.offsetY





