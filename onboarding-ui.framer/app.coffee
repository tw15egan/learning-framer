# Import file "framerOnboard_12-9"
$ = Framer.Importer.load("imported/framerOnboard_12-9@1x")

$.card2.x = 700
$.card2.y = 300

$.placeholder1.opacity = 0
$.placeholder2.opacity = 0
$.card3.opacity = 0

$.card2.scale = .85
$.card2.originX = 0
$.card2.originY = 0

$.card1.states.add
	two:
		x: -510
		y: 300
		scale: .85
		originX: 1
		originY: 0

$.card1.on Events.Click, ->
	$.card1.states.switch('two')