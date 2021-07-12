extends KinematicBody2D

# Tracks when the goblins run into the borders of the game
func _ready():
	$Area2D.connect("area_entered", self, "_colliding")

func _process(delta):
	# print(GlobalVariables.goblinInstanceCount)
	pass

# When the goblin collides with the borders of the game, reset their position
func _colliding(area):
	if area.is_in_group("right"):
		get_parent().global_position.y += 50
		get_parent().speed = get_parent().speed * -1
	if area.is_in_group("left"):
		get_parent().global_position.y += 50
		get_parent().speed = get_parent().speed * -1
		#When the goblin enters the adventurer group load the lose scene
	if area.is_in_group("Game over"):
		get_tree().change_scene("res://Game over.tscn")
