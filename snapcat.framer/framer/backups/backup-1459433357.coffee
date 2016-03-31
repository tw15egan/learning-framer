###
 EXERCISE: Prototyping an app
 
 We'll use Framer Studio to prototype a mobile app
 with three different screen states. Using either Sketch
 or Photoshop, you'll use Framer Studio's design
 workflow integration and create interactivity. 
###

###
 Use Framer Studio's Import functionality to import 
 artwork from either the included Sketch or Photoshop file.
 Take a look at the file first to get to know how
 the artwork is organized into layer groups.
###




###
 If you're importing from Sketch, you'll need to
 set each artboard's visiblity to true. You won't 
 have to do it conditionally, though this prevents
 the Photoshop version of this exercise from breaking.
 Comment this in when you've imported the artwork.
###
# if imports.Main_Artboard then imports.Main_Artboard.visible = true
# if imports.Navigation_Artboard then imports.Navigation_Artboard.visible = true
# if imports.Camera_Artboard then imports.Camera_Artboard.visible = true



###
 Set up the Container layer for scrolling.
 Set an explicit height and then set scrollVertical
 to true so the inner content scrolls.
###



###
 When the NavButton layer is tapped, animate the
 side nav open, and when the Menu itself is tapped,
 close the side nav.

 First, open the navigation when the NavButton layer
 gets clicked/tapped.
###

###
 Then close the navigation when the MenuItems layer
 is clicked/tapped.	
###


	
###
 Show and hide the camera view.
 
 First, when PhotoButton is tapped, slide the Main 
 view down to reveal the camera view behind.
###

###
 And when CameraCloseButton is tapped, slide the 
 Main view back up from the bottom.
###


		
###
 Extra credit! Animate the MenuItems layer
 in when the side nav slides open.
###
