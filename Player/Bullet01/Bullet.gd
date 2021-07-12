extends KinematicBody2D

var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.bulletInstanceCount += 1
	set_physics_process(true) # Replace with function body.

func _physics_process(delta):
	var collidedobject = move_and_collide(Vector2(0, -speed * delta))
	if (collidedobject):
		
		if "Enemy" in collidedobject.collider.name:
			collidedobject.get_collider().queue_free()
		queue_free()
		GlobalVariables.bulletInstanceCount -= 1
