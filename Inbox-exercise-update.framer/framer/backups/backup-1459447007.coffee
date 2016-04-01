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



###
 You'll need to hide all of the label/icon 
 pairs by default. Create two arrays, one for
 label layers and one for icons, and set each 
 layer's opacity to 0. Also create and store an 
 originalFrame property for each.
 Hint: layer.subLayers returns an array of layers.
###


	
###
 Also, hide the ComposeLabel, EditIcon
 and the Backdrop layers using opacity.
###



###
 When the Button gets tapped, unleash animation 
 goodness. Screen the background with the Backdrop
 layer, "spin" the button by manipulating EditIcon
 and PlusIcon, and of course show all of the label/
 icon pairs in a cascading motion.
###

	# Spin and fade out the PlusIcon

	# And at the same time, spin and
	# fade the EditIcon in

	# Fade in the ComposeLabel

	# Using lodash's _.each, iterate over the
	# array of labels and icons to show each
	# one with a slightly offset delay. Staggering
	# using delays gives it the cascading effect.

	# Fade the Backdrop in.

	# Extra credit! Call the function you wrote that
	# creates the "ripple" effect on the button.
			
###
 And when the Backdrop layer is tapped, fade out
 and hide all of the label/icon pairs and "spin"
 the button icons back to their initial state.
###		

	# Hide the Backdrop.

	# Show the PlusIcon by spinning it back
	# in, and hide the EditIcon.

	# Hide the ComposeLabel.

	# Iterate back through the arrays of labels
	# and icons to hide each one, all at once.



###
 Extra credit! Create a new layer and write a function
 that creates uses the layer to make a "ripple" effect 
 on the red button where it's tapped.
 Hint: midX/midY, event.offsetX/event.offsetY.
###


