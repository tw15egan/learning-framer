layerA = new Layer
	width: 200
	height: 200

layerB = new Layer
	width: 200
	height: 300
	superLayer: layerA
	image: "https://unsplash.it/500/500/?random"
	
layerA.center()


Utils.labelLayer(layerB, "layerB")
layerB.center()
	

layerA.scroll = true
