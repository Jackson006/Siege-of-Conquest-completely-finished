extends KinematicBody2D

var bullet = preload("res://Player/Bullet01/Bullet.tscn")
export var speed = 250

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	set_physics_process(true)
	$Area2D.connect("area_entered", self, "_colliding")
	$Area2D.connect("area_exited", self, "_not_colliding")

func _process(delta):
	if Input.is_action_just_pressed("fire"):
		if GlobalVariables.bulletInstanceCount < 4:
			var bulletInstance = bullet.instance()
			bulletInstance.position = Vector2(position.x, position.y - 25)
			get_tree().get_root().add_child(bulletInstance)

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		move_and_collide(Vector2(-speed * delta, 0))
	elif Input.is_action_pressed("ui_right"):
		move_and_collide(Vector2(speed * delta, 0))

func _colliding(area):
	if area.is_in_group("Left"):
		print("Left")
	if area.is_in_group("Right"):
		print("Right")

func _not_colliding(area):
	pass
