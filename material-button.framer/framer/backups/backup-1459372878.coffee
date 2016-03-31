###
 EXERCISE: Material Response
 
 Take a look at Google's Material Design guidelines and the
 Material Response example at http://bit.ly/1GQWnPF.
 Let's create one of those buttons that ripples when you
 tap it and "lifts" off the page below.
###

###
 First off, set your viewer in fullscreen mode over yonder ->
###



###
 Make a new BackgroundLayer that's #eeeeee.
###
bg = new BackgroundLayer
	backgroundColor: "#eee"

###
 Create the button layer and center it onscreen.
###



###
 Create a circle that we'll animate with a
 ripple in response to the button being clicked.
###



###	
 When you click the button, place and expand the circle.
 Use midX/midY and event.offsetX/offsetY to place it.
 Animate opacity and scale for the ripple effect.
###

###
 Extra credit! "Lift" the button when it's clicked.
 Hint: this is a two-part animation so you'll have
 to delay the second part of it with Utils.delay().
###
