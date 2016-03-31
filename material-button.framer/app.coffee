

button = new Layer
	width: 340
	height: 100
	borderRadius: 5
	shadowX: -1
	shadowY: 1
	shadowBlur: 2
	shadowSpread: 1
	shadowColor: "rgba(0, 0, 0, .25)"
	backgroundColor: "#fff"
	clip: true

button.center()

ripple = new Layer
	width: 100
	height: 100
	borderRadius: "50%"
	backgroundColor: "#ddd"
	opacity: 0
	
ripple.superLayer = button

button.on Events.Click, (event) ->
	ripple.midX = event.offsetX
	ripple.midY = event.offsetY
	ripple.scale = 0
	ripple.opacity = 1
	
	ripple.animate
		properties:
			scale: 6
			opacity: 0
		time: .5
		curve: "ease-out"
		
	button.animate
		properties:
			shadowX: -5
			shadowY: 5
			shadowBlur: 5
		time: .3
		
	Utils.delay .3, ->
		button.animate
			properties:
				shadowX: -1
				shadowY: 1
				shadowBlur: 2
			time: .3

