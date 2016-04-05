###
 EXERCISE: "Smart" prototypes with Firebase
 
 We'll create a pizza search and ratings
 app that uses Firebase to collect how many
 "likes" each pizza place has gotten. It'll
 demonstrate basic Firebase/Framer integration.
 A lot of the design and initial work has been done
 so you can focus on Firebase, but if you're feeling 
 ambitious, rip it out and start from scratch!
###

###
 This imports all the layers for "Sliced" into imports.
 It's already been done for you.
###
imports = Framer.Importer.load "imported/Sliced"


###
 Set some defaults and variables for easy reference
 in your code, including screen dimensions, the 
 height of each "card", and animation defaults.
###
screenWidth = Framer.Device.screen.width
screenHeight = Framer.Device.screen.height
cardHeight = 400
Framer.Defaults.Animation = 
	curve: "spring(100, 10, 0)"
	
###
 Use Utils.insertCSS to import Karla from Google 
 fonts for use with dynamic text.
###
Utils.insertCSS "@import url(http://fonts.googleapis.com/css?family=Karla);"
	
###
 Create ScrollContainer, which will become the 
 scroll bounds and superLayer for CardsContainer.
###
ScrollContainer = new Layer
	y: imports.Header.height
	width: screenWidth
	height: screenHeight - imports.Header.height
	backgroundColor: null
ScrollContainer.scrollVertical = true
imports.CardsContainer.superLayer = ScrollContainer
imports.CardsContainer.y = 0

###
 The Sketch source has two placeholder layers
 for the two states of the "like" button (the heart).
 Hide the placeholder heart layers by default.
###
imports.EmptyHeart.visible = imports.FilledHeart.visible = false

###
 The Sketch source is organized with individual
 pizza place cards inside of the CardsContainer
 layer set. For each card, create:
 
 1) A HeartButton layer that will hold copies of
    the EmptyHeart and FilledHeart layers
 2) A TextLayer which will contain HTML text with
    the number of "likes" a pizza place received
 3) A click event handler, bound to the HeartButton
    which manages the display state of the heart 
    and calls an `updatePizzaJoint(name, count)`
    function which we'll write to deal with Firebase
###
for layer in imports.CardsContainer.subLayers

	HeartButton = new Layer
		name: "HeartButton"
		superLayer: layer
		backgroundColor: null
		
	# Note: I'm setting names for each of these layers
	# so we can use Layer.subLayersByName() later.
	EmptyHeart = imports.EmptyHeart.copy()
	EmptyHeart.name = "EmptyHeart"
	EmptyHeart.x = 13
	EmptyHeart.y = 18
	EmptyHeart.states.add
		"liked":
			opacity: 0
			scale: 2
		"unliked":
			opacity: 1
			scale: .5
	
	FilledHeart = imports.FilledHeart.copy()
	FilledHeart.name = "FilledHeart"
	FilledHeart.x = 13
	FilledHeart.y = 18
	FilledHeart.opacity = 0
	FilledHeart.states.add
		"liked":
			opacity: 1
	
	EmptyHeart.superLayer = FilledHeart.superLayer = HeartButton
	EmptyHeart.visible = FilledHeart.visible = true
	
	TextLayer = new Layer
		x: 80
		y: 28
		name: "TextLayer"
		backgroundColor: null
		superLayer: layer
	TextLayer.style =
		fontFamily: "Karla"
		fontSize: "36px"
		fontWeight: "bold"
	TextLayer.html = "0"
	
	HeartButton.on Events.Click, ->
		empty = @subLayersByName "EmptyHeart"
		filled = @subLayersByName "FilledHeart"
		text = @superLayer.subLayersByName "TextLayer"
		if filled[0].states.state == "liked"
			text[0].html = Number(text[0].html) - 1
			empty[0].states.switchInstant "default"
			empty[0].states.switch "default"
			filled[0].states.switch "default"
		else
			text[0].html = Number(text[0].html) + 1
			empty[0].states.switch "liked"
			filled[0].states.switch "liked"
		updatePizzaJoint @superLayer.name, text[0].html
		
###
 First things first: make sure that you have added the 
 Firebase Javascript library in your project's index.html. 
###
	
###
 Connect to a Firebase instance, and then create a variable 
 to hold a reference to the child location called `pizzaJoints`.
###

firebase = new Firebase "https://sizzling-fire-2651.firebaseio.com/"

pizzaJoints = firebase.child "pizzaJoints"
	



###
 Use `on()` to listen for data changes to the 
 entire Firebase. Listen for the "value" Firebase event 
 type which triggers with initial data and then
 every time data is changed.
 
 Pass a callback as the second argument to `on()`
 which iterates through every single `pizzaJoint`
 and updates the corresponding card's TextLayer's 
 html with the like count for that card.
###




###
 Write a function named `updatePizzaJoint` that accepts
 two arguments: `key` which will be the Firebase key,
 and `count` which is the updated number of likes. This 
 function should use Firebase's set() to update 
 the likeCount value for that card in Firebase.
###
updatePizzaJoint = (key, count) ->
	# Since every card layer has a layer.name given to it
	# in the Sketch source doc, and every card layer's name is
	# unique, you're free to use this as the Firebase key.
	pizzaJoints.child(key).set
		likeCount: count