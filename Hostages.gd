extends Node2D

# speed of the hostage
var speed = 670

func _ready():
	set_physics_process(true)

# movement of the hostage
func _physics_process(delta):
	global_position.x += speed * delta
	pass
