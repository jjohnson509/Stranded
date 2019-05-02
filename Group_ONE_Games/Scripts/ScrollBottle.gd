extends Node2D

var inArea = false
var inSoundArea = false
onready var scrollOnShelf = get_node("/root/DemoLevel/CanvasLayer/GUI/Dropdown/Shelf_TOP/Scroll1")
onready var scrollIMG = preload("res://Art/Items/Bottle_Message.png")
onready var scrollLabel = get_node("Z_Index/Label")
onready var popUpScrollScene = preload("res://Scenes/PopUpScroll.tscn")
onready var demoLevel = get_node("/root/DemoLevel")
onready var popUpScroll = popUpScrollScene.instance()

var scrollText = {
	
	1: {
		text = "I ended up on this island... Some massive storm carried my ship here while I was on my way to Europe to deliver these crates of artifacts to a client. I tried to escape by..."
	},
	
	2: {
		text = "... building a raft out of these long vines I found in the forest, some clothe from a washed up crate, and a few trees; basically whatever I found on the island, but..."
	},
	3: {
		text = "... that same type of storm keeps bringing me back to this island. I'm starting to feel cursed. My latest effort ended with a wrecked raft. I also keep hearing... "
	},
	4: {
		text = "... sounds at night now and it's getting creepy. I feel like something is following me. I dont think I can stay here. I must move again. I have to find another way off this island.  THe museum better pay up big time for making me carry those crates of..."
	},
	5: {
		text = "... cursed items for that new exhibit.  I wonder why they wanted a bunch of a dead guy's clothing. Probably because it was taken out of a chest found in the ocean.  I admit they are... "
	},
	6: {
		text = "... pretty comfortable clothes and I look pretty snappy in this getup.  It's missing a hat though, must have been on the next shipment. The noises are getting worse. I see things now, faintly glowing weird looking creatures.  They seem to be interested in these clothes and..."
	},
	7: {
		text = "... they seem angry that I am sporting them.  I noticed an old pirate ship on the far beach, seems ghosly. I'mguessing that is where these weird creatures are coming from. These clothes..."
	},
	8: {
		text = "... kept pulling me toward the ship and I found a glowing chest that is simply tantalizing.  It calls to my mind... I feel like it wants me to open it. I keep hearing 'return them' in my mind. Them? The clothes maybe?"
	},
	9: {
		text = "The hat...it...wanted the hat."
	}
}

func _on_InteractArea_body_entered(body):
	if body.is_in_group("Player"):
		inArea = true
		scrollLabel.show()

			

func _on_InteractArea_body_exited(body):
	if body.is_in_group("Player"):
		inArea = false
		scrollLabel.hide()


func _input(event):
	if event.is_action_pressed("ui_interact") && inArea == true:
		match self.name:
			"Scroll1":
				scrollOnShelf = get_node("/root/DemoLevel/CanvasLayer/GUI/Dropdown/Shelf_TOP/" + str(self.name))
				print("1")
				print(scrollText[1].text)
				show_scroll(scrollText[1].text)
				#Do stuff if scroll picked up is Scroll1
			"Scroll2":
				scrollOnShelf = get_node("/root/DemoLevel/CanvasLayer/GUI/Dropdown/Shelf_TOP/" + str(self.name))
				print("2")
				show_scroll(scrollText[2].text)
				#Do stuff if scroll picked up is Scroll2
			"Scroll3":
				scrollOnShelf = get_node("/root/DemoLevel/CanvasLayer/GUI/Dropdown/Shelf_TOP/" + str(self.name))
				print("3")
				show_scroll(scrollText[3].text)
				#Do stuff if scroll picked up is Scroll3
			"Scroll4":
				scrollOnShelf = get_node("/root/DemoLevel/CanvasLayer/GUI/Dropdown/Shelf_TOP/" + str(self.name))
				print("4")
				show_scroll(scrollText[4].text)
				#Do stuff if scroll picked up is Scroll4
			"Scroll5":
				scrollOnShelf = get_node("/root/DemoLevel/CanvasLayer/GUI/Dropdown/Shelf_MID/" + str(self.name))
				print("5")
				show_scroll(scrollText[5].text)
				#Do stuff if scroll picked up is Scroll5
			"Scroll6":
				scrollOnShelf = get_node("/root/DemoLevel/CanvasLayer/GUI/Dropdown/Shelf_MID/" + str(self.name))
				print("6")
				show_scroll(scrollText[6].text)
				#Do stuff if scroll picked up is Scroll6
			"Scroll7":
				scrollOnShelf = get_node("/root/DemoLevel/CanvasLayer/GUI/Dropdown/Shelf_MID/" + str(self.name))
				print("7")
				show_scroll(scrollText[7].text)
				#Do stuff if scroll picked up is Scroll7
			"Scroll8":
				scrollOnShelf = get_node("/root/DemoLevel/CanvasLayer/GUI/Dropdown/Shelf_BOT/" + str(self.name))
				print("8")
				show_scroll(scrollText[8].text)
				#Do stuff if scroll picked up is Scroll8
			"Scroll9":
				scrollOnShelf = get_node("/root/DemoLevel/CanvasLayer/GUI/Dropdown/Shelf_BOT/" + str(self.name))
				print("9")
				
		queue_free()
		scrollOnShelf.texture = scrollIMG
		AudioServer.set_bus_mute(1, true)


func _on_SoundArea_body_entered(body):
	if body.is_in_group("Player"):
		print("playing")
		AudioServer.set_bus_mute(1, false)
		$AudioStreamPlayer2D.play(0.90)

func _on_SoundArea_body_exited(body):
	if body.is_in_group("Player"):
		$AudioStreamPlayer2D.stop()


func show_scroll(text):
	var popUpText = popUpScroll.get_node("CanvasLayer/Texture/TextLabel")
	popUpText.text = text
	get_tree().paused = true
	demoLevel.add_child(popUpScroll)
	popUpScroll.show()


