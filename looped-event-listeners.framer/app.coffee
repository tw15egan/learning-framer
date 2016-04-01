container = new Layer
	height: Screen.height
	width: Screen.width
	backgroundColor: "#eee"

for cell in [0..4]
	cellLayer = new Layer
		x: cell * (100 + 10)
		superLayer: container

_.each container.subLayers, (layer, index) ->
	layer.on Events.Click, ->
		layer.animate
			properties:
				y: layer.y + 100
				
	layer.on Events.AnimationEnd, ->
		layer.animate
			properties:
				y: 0