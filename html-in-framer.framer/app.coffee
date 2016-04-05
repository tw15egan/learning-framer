Framer.Defaults.Layer.backgroundColor = null
Framer.Defaults.Layer.color = "#000"
Framer.Device.screen.backgroundColor = "#fff"

layerA = new Layer
	x: 20
	y: 20
	width: 500
	height: 120
	
layerB = layerA.copy()
layerB.height = 300
layerB.y = 160

layerA.style =
	color: "#000"
	fontSize: "16px"
	lineHeight: 1.5

layerA.html = "Fanny pack echo park pabst kombucha. Tumblr church-key blue bottle seitan quinoa twee. DIY sustainable food truck blog sriracha bespoke. Ennui before they sold out affogato bicycle rights, pop-up kickstarter listicle retro actually mixtape brunch"

layerB.html = "<div class='structuredHTML'><h1>High Life</h1><p>Gluten-free <strong>try-hard</strong></p>"
	
	
Utils.insertCSS "
	.structuredHTML {
		color: #888;
		line-height: 1;
	}
"

