layer = new Layer
	x: 20
	y: 20
	width: 200
	height: 200
	
sub = new Layer
	backgroundColor: "#000"
	x: 0
	
sub.superLayer = layer

sub.on Events.Click, ->
	@animate
		properties:
			x: 200
		time: .25
		curve: "ease-in-out"


