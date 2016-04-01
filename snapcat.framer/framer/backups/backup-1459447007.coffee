# Import file "Snapcat"
imports = Framer.Importer.load("imported/Snapcat@1x")





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
	

imports.Navigation_Artboard.x = 0
imports.Camera_Artboard.x = 0

imports.Navigation_Artboard.visible = false
imports.Camera_Artboard.visible = false
imports.Main_Artboard.visible = true

ripple = new Layer
	height: 100
	width: 100
	backgroundColor: "#eee"
	opacity: 0
	superLayer: imports.Camera_Artboard
	
imports.Camera_Artboard.clip = true

###
 Set up the Container layer for scrolling.
 Set an explicit height and then set scrollVertical
 to true so the inner content scrolls.
###

imports.Container.height = Framer.Device.screen.height - imports.TopBar.height


scroll = ScrollComponent.wrap(imports.Container)
scroll.scrollHorizontal = false


###
 When the NavButton layer is tapped, animate the
 side nav open, and when the Menu itself is tapped,
 close the side nav.

 First, open the navigation when the NavButton layer
 gets clicked/tapped.
###
imports.NavButton.on Events.Click, ->
	imports.Camera_Artboard.visible = false
	imports.Navigation_Artboard.visible = true
	
	imports.Main_Artboard.animate
		properties: 
			x: 550
		curve: "ease-in-out"
		time: .25
			
	imports.MenuItems.animate
		properties:
			x: 75
			scale: 1
		curve: "ease-in-out"
		time: .25


###
 Then close the navigation when the MenuItems layer
 is clicked/tapped.	
###
imports.MenuItems.on Events.Click, ->
	
	imports.MenuItems.animate
		properties:
			x: 400
			scale: .5
		curve: "ease-in-out"
		time: .25
	
	imports.Main_Artboard.animate
		properties:
			x: 0
		curve: "ease-in-out"
		time: .25

	
###
 Show and hide the camera view.
 
 First, when PhotoButton is tapped, slide the Main 
 view down to reveal the camera view behind.
###

###
 And when CameraCloseButton is tapped, slide the 
 Main view back up from the bottom.
###
imports.PhotoButton.on Events.Click, () ->
	imports.Camera_Artboard.visible = true
	imports.Navigation_Artboard.visible = false
	
	imports.Main_Artboard.animate
		properties: 
			y: Framer.Device.screen.height
		curve: "ease-in-out"
		time: .25
	
imports.CameraCloseButton.on Events.Click, () ->
		
	imports.Main_Artboard.animate
		properties: 
			y: 0
		curve: "ease-in-out"
		time: .25
		
	
imports.CameraPhotoButton.on Events.Click, (event) ->
	
	ripple.center()
	ripple.scale = 0
	ripple.opacity = 1
	
	ripple.animate
		properties: 
			scale: 20
			opacity: 0
		time: .25
		curve: "ease-in-out"
			
	
###
 Extra credit! Animate the MenuItems layer
 in when the side nav slides open.
###
