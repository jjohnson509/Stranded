extends Node2D

# class member variables go here, for example:
var time = 0.0
var amount = 5
var spawned = false

func _ready():
	self.hide()

func attack(amt, vec):
	amount = amt
	spawned = true
	var angle = Vector2(0,-1).angle_to(vec)
	self.position.x = vec.x * 35
	self.position.y = vec.y * 35
	self.show()
	if vec.x >= 0:
		$Sprite.flip_h = false
	else:
		$Sprite.flip_h = true
	self.rotation = angle
		
	time = .1
	hit()


func hit():
	for body in $Area2D.get_overlapping_bodies():
		if body.has_method("damage"):
			body.damage("player", amount) 

func _process(delta):
	time = time-delta
	if time < 0 and spawned:
		spawned = false
		hit()
		self.hide()