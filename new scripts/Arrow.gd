extends KinematicBody2D

# The speed of the arrow
var speed = 500

# States a global variable
func _ready():
	GlobalVariables.arrowInstanceCount += 1
	set_physics_process(true) # Replace with function body.

# happens when the arrow collides with something
func _physics_process(delta):
	var collidedobject = move_and_collide(Vector2(0, -speed * delta))
	if (collidedobject):
		
		# if the arrow collides with a hostage the player loses the game
		if "Hostage" in collidedobject.collider.name:
			print ("Game Over")
			get_tree().change_scene("res://Game over.tscn")
			collidedobject.get_collider().queue_free()
		queue_free()
		# if the arrow collides with a goblin delete the goblin, reduce the count of goblins and add to the player's score
		if "Goblin" in collidedobject.collider.name:
			GlobalVariables.goblinInstanceCount -= 1
			GlobalVariables.playerScore += 10 #multiplied by time left
			#if the number of goblins = 0, load the win scene
			print ("score =", GlobalVariables.playerScore)
			if GlobalVariables.goblinInstanceCount == 0:
				print ("Game Over")
				get_tree().change_scene("res://You Win.tscn")
			collidedobject.get_collider().queue_free()
		queue_free()
		# if the arrow collides with the brute load the win scene
		GlobalVariables.arrowInstanceCount -= 1
		if "Goblin brute" in collidedobject.collider.name:
			get_tree().change_scene("res://You Win.tscn")
