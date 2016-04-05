###
 EXERCISE: Responsive Interfaces
 We'll create a prototype of a Tinder-inspired
 card-swipe interface. The card will react by
 showing a direction-dependent overlay, and by 
 responding to direction and velocity as you drag it.
 
 These image layers were created in Sketch and
 pulled into the Framer Studio UI one-by-one. I've 
 taken the liberty of making OverlayRight and 
 OverlayLeft subLayers of the Card layer.
###
Background = new BackgroundLayer 
	x:0, y:0, image:"images/Gradient.png"
Card = new Layer 
	x:0, y:0, z: 100, width:660, height:639, image:"images/CardElements.png"
OverlayLeft = new Layer 
	x:0, y:0, width:660, height:639, image:"images/OverlayRight.png", superLayer: Card
OverlayRight = new Layer 
	x:0, y:0, width:660, height:639, image:"images/OverlayLeft.png", superLayer: Card

Card.bringToFront()
###
 Set a default animation curve. Also, feel
 create a variable for the "drag threshold"
 that determines how far a swipe in either direction
 can go before the card moves off screen.
###
Framer.Defaults.Animation =
	curve: "spring(250, 25, 10)"

threshold = 300

###
 Hide the OverlayLeft and OverlayRight
 layers by setting their opacity to 0.
###
OverlayLeft.opacity = 0
OverlayRight.opacity = 0

Card.center()

Card.originalFrame = Card.frame


###
 Enable dragging on the Card layer.
###
Card.draggable = true
Card.draggable.vertical = false



###
 Give the Card layer a drop shadow. Use the 
 shadowColor, shadowBlur and shadowY properties.
###
Card.props =
	shadowColor: "rgba(0, 0, 0, .5)"
	shadowBlur: 15
	shadowY: 5
	scale: 1
	
	


###
 Center the card in the viewport, and create an 
 originalFrame property on the Card which retains
 the starting frame coordinates and size.
###


###
 Give the user some feedback when they first "touch"
 the card. In this case, we want to bring the card 
 towards the user by scaling up slightly, and increase
 the card's shadow blur and spread so it appears that
 the user is picking the card up off the background.
###
Card.on Events.DragStart, ->
	@scale = .9
	@animate
		properties:
			scale: 1.1
			shadowBlur: 50
		time: .5



###
 Depending upon which way the user drags the Card,
 fade either OverlayLeft or OverlayRight in.
 For added responsiveness, rotate the card slightly
 in response to its movement.
 
 Extra credit! Use velocity to transform the Card's 
 rotationY and shadow properties to mimic the effect
 fast motion might have on a real-life paper card.
###

	# Fade in OverlayRight as the Card moves right or
	# OverlayLeft as it moves left by changing opacity.
	# Hint: use `Utils.modulate` to transform the distance
	# moved to the much smaller value needed for opacity.
Card.on "change:x", ->
	distance = @x - @originalFrame.x
	velocity = @.draggable.calculateVelocity().x
	
	
	opacity = Utils.modulate distance, [0, 100], [0, .4]
	
	OverlayLeft.opacity = -opacity
	OverlayRight.opacity = opacity


	# Rotate the card slightly as it moves left or right
	# by changing the rotation property.
	# Hint: `Utils.modulate` again!	
	
	rotate = Utils.modulate velocity, [-1000, 1000], [-25, 25], true
	
	if @x > 0
		@rotationY = rotate * 200
		@shadowX = rotate * 1000
		@shadowY = rotate * 1000
	else
		@rotationY = rotate * 200
		@shadowX = rotate * 1000
		@shadowY = rotate * 1000

	

	# If you're going for extra credit, you'll want to
	# use `layer.draggable.calculateVelocity()` and modulate
	# the output to manipulate rotationY and the layer's
	# shadowX and shadowY properties



###
 When the user releases the card on DragEnd, hide any 
 visible overlay and either animate the card's x
 position out of view in the direction it's been dragged
 (using a 
 or reset it to its original position using the `resetCard()`
 function that's already been written below.
###
Card.on Events.DragEnd, ->
	# Find the distance that the card's been
	# dragged from its original x position.
	
	# Compare that distance to the threshold
	# number you set earlier as a variable and
	# animate the card accordingly.
	# Hint: there are three possible conditions here.
	
	distance = @x - @originalFrame.x
	
	if distance > 250
		@animate
			properties:
				rotation: 90
				scale: .5
				y: Framer.Device.screen.height
				x: Framer.Device.screen.width + 100
			time: .5
			
	else if distance < -250
		@animate
			properties:
				rotation: -90
				scale: .5
				y: Framer.Device.screen.height
				x: -Framer.Device.screen.width + 100
			time: .5
	else
		@animate
			properties:
				rotation: 0
				x: @originalFrame.x
			time: .5
			

###
 Here's a hacky move to "reset" the prototype: 
 If the user taps the Background anywhere, 
 the card will animate back to its original 
 position. I've added this already since it's 
 not terribly exciting. Just comment it in when
 you're ready to use it.
###

Background.on Events.Click, ->
	resetCard()
	
resetCard = ->
	Card.animateStop()
	OverlayRight.opacity = 0
	OverlayLeft.opacity = 0
	Card.animate
		properties:
			x: Card.originalFrame.x
			y: Card.originalFrame.y
			rotation: 0
			rotationY: 0
			scale: 1
			shadowX: 0
			shadowY: 3
			shadowBlur: 5
			shadowSpread: 0
