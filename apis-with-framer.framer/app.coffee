apiEndpoint = "https://unsplash.it/list"
Framer.Defaults.Animation = curve: "spring(100, 10, 10)"

data = Utils.domLoadJSONSync apiEndpoint


container = new Layer
	width: Framer.Screen.width
	height: Framer.Screen.height
	backgroundColor: null


scrollContainer = new ScrollComponent
	width: Framer.Screen.width
	height: Framer.Screen.height
	superLayer: container
	backgroundColor: null

count = 0
for shot in data[12..34]
	image = new Layer
		width: Framer.Screen.width
		height: Framer.Screen.height
		image: "https://unsplash.it/" + Framer.Screen.width + "/" + Framer.Screen.height + "?image=" + shot.id
		x: Framer.Screen.width * count
		parent: scrollContainer.content
	
	count++
	
image.draggable.enabled = true
image.draggable.propagateEvents = false


scrollContainer.on "change:x", ->
	if @.x > 0
		@.x = 0
	

