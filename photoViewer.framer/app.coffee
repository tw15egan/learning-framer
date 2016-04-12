Framer.Defaults.Animation = 
	time: 3
		
scroll = new ScrollComponent
	size: Screen.size
	scrollHorizontal: false

for i in [0..9]
	
	img = new Layer
		height: 500
		width: Screen.width
		y: 500 * i
		image: "https://www.unsplash.it/500/100#{i}"
		parent: scroll.content

	img.on Events.Click, (event, layer) ->
		if @height < 501
			scroll.scrollVertical = false
			@.animate
				properties:
					index: 100
				time: .0001
					
			@.animate
				properties: 
					height: Screen.height + 10
					y: -scroll.content.y
				curve: "spring(250, 25, 10)"
				delay: .1
				
		else 
			@.animate
				properties:
					height: 500
					y: ((layer.id - 3) * 500)
					index: 1
				curve: "spring(150, 25, 10)"

				
