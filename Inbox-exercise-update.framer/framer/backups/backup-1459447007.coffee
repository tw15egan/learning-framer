###
 EXERCISE: Animation workshop
 
 We'll prototype the animation that Gmail's Inbox
 app unleashes when the user taps the plus button.
 This simple animation demonstrates overlapping 
 cascading motion, immediate feedback and attention-
 directing effects.
###

###
 This imports all the layers for "Inbox" into imports.
 It's already been done for you.
###
imports = Framer.Importer.load "imported/Inbox"


###
 Use Framer.Defaults.Animation to set a 
 nice-looking, responsive animation style.
###
Framer.Defaults.Animation = 
	curve: "spring(100,10,10)"
	time: .2


###
 You'll need to hide all of the label/icon 
 pairs by default. Create two arrays, one for
 label layers and one for icons, and set each 
 layer's opacity to 0. Also create and store an 
 originalFrame property for each.
 Hint: layer.subLayers returns an array of layers.
###
labelArray = imports.Labels.subLayers
iconArray = imports.Icons.subLayers
button = imports.Button
button.clip = true

for layer in labelArray
	layer.originalFrame = layer.frame
	layer.opacity = 0
	
for layer in iconArray
	layer.originalFrame = layer.frame
	layer.opacity = 0

###
 Also, hide the ComposeLabel, EditIcon
 and the Backdrop layers using opacity.
###
editIcon = imports.EditIcon
composeLabel = imports.ComposeLabel
backdrop = imports.Backdrop

editIcon.opacity = 0
editIcon.rotation = 180
composeLabel.opacity = 0
backdrop.opacity = 0


###
 When the Button gets tapped, unleash animation 
 goodness. Screen the background with the Backdrop
 layer, "spin" the button by manipulating EditIcon
 and PlusIcon, and of course show all of the label/
 icon pairs in a cascading motion.
###
button.on Events.Click, ->
	# Spin and fade out the PlusIcon
	imports.PlusIcon.animate
		properties: 
			opacity: 0
			rotation: 135
	# And at the same time, spin and
	# fade the EditIcon in
	editIcon.animate
		properties:
			opacity: 1
			rotation: 0

	# Fade in the ComposeLabel
	composeLabel.animate
		properties: 
			opacity: 1

	# Using lodash's _.each, iterate over the
	# array of labels and icons to show each
	# one with a slightly offset delay. Staggering
	# using delays gives it the cascading effect.
	_.each iconArray, (layer, index) ->
		layer.y += 20
		layer.scale = .25
		layer.animate
			properties:
				y: layer.originalFrame.y
				opacity: 1
				scale: 1
			delay: index/20
	
	_.each labelArray, (layer, index) ->
		layer.y += 20
		layer.animate
			properties:
				y: layer.originalFrame.y
				opacity: 1
			delay: index/20
			
	# Fade the Backdrop in.
	backdrop.animate
		properties: 
			opacity: 1
			
	makeRipple event

	# Extra credit! Call the function you wrote that
	# creates the "ripple" effect on the button.
	
###
 And when the Backdrop layer is tapped, fade out
 and hide all of the label/icon pairs and "spin"
 the button icons back to their initial state.
###		
backdrop.on Events.Click, ->
	# Hide the Backdrop.
	backdrop.animate
		properties: 
			opacity: 0

	# Show the PlusIcon by spinning it back
	# in, and hide the EditIcon.
	imports.PlusIcon.animate
		properties:
			opacity: 1
			rotation: 0
	
	editIcon.animate
		properties: 
			opacity: 0
			rotation: 180
			
	# Hide the ComposeLabel.
	composeLabel.animate
		properties: 
			opacity: 0

	# Iterate back through the arrays of labels
	# and icons to hide each one, all at once.
	_.each iconArray, (layer, index) ->
		layer.animate
			properties:
				opacity: 0
	
	_.each labelArray, (layer, index) ->
		layer.animate
			properties:
				opacity: 0


###
 Extra credit! Create a new layer and write a function
 that creates uses the layer to make a "ripple" effect 
 on the red button where it's tapped.
 Hint: midX/midY, event.offsetX/event.offsetY.
###
ripple = new Layer
	width: 120
	height: 120
	backgroundColor: "#fff"
	borderRadius: "50%"
ripple.superLayer = imports.Button
ripple.opacity = 0

makeRipple = (event) ->
	ripple.midX = event.offsetX
	ripple.midY = event.offsetY
	ripple.scale = 0
	ripple.opacity = .4
	ripple.animate
		properties:
			scale: 2
			opacity: 0
		curve: "linear"


