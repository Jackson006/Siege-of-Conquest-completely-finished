extends Node2D

# the speed of the goblins
var speed = 500

func _ready():
	set_physics_process(true)

# The movement pattern of the goblin
func _physics_process(delta):
	global_position.x += speed * delta
	pass
