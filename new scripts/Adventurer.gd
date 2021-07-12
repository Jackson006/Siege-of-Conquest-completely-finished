extends KinematicBody2D

var bullet = preload("res://Arrow.tscn")

# Speed of the adventurer
var speed = 500

# Tracks when the character runs into the borders of the game
func _ready():
	set_process(true)
	set_physics_process(true)
	$Area2D.connect("area_entered", self, "_colliding")
	$Area2D.connect("area_exited", self, "_not_colliding")

# When the player presses the spacebar, fire an arrow
func _process(delta):
	if Input.is_action_just_pressed("fire"):
		if GlobalVariables.arrowInstanceCount < 3:
		# spawn a bullet
			var bulletInstance = bullet.instance()
			bulletInstance.position = Vector2(position.x, position.y -150)
			get_tree().get_root().add_child(bulletInstance)

# When the player presses the left and right arrows move them accordingly
func _physics_process (delta):
	if Input.is_action_pressed("ui_left"):
		move_and_collide(Vector2(-speed * delta, 0))
	elif Input.is_action_pressed("ui_right"):
		move_and_collide(Vector2(speed * delta, 0))

# When the character collides with the borders of the game, reset their position
func _colliding(area):
	if area. is_in_group("left"):
		print("left")
		position.x=100
	if area. is_in_group("right"):
		print("right")
		position.x=1820
	
func _not_colliding(area):
	pass
