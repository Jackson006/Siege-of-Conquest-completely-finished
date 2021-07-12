extends KinematicBody2D

# Tracks when the hostage run into the borders of the game
func _ready():
	$Area2D.connect("area_entered", self, "_colliding")

# When the hostage collides with the borders of the game, reset their position
func _colliding(area):
	if area.is_in_group("right"):
		get_parent().global_position.y += 50
		get_parent().speed = get_parent().speed * -1
	if area.is_in_group("left"):
		get_parent().global_position.y += 50
		get_parent().speed = get_parent().speed * -1
		# when the hostage enters the bottom border delete the hostage
	if area.is_in_group("bottom"):
		queue_free()
