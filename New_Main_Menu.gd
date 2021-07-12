extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	for button in $"Menu/Main Section/Buttons/Menu Buttons".get_children():
		button.connect("pressed", self, "_on_Button_pressed",[button.scene_to_load])

# When this button is pressed reset the number of goblins and change the scene
func _on_Button_pressed(scene_to_load):
	GlobalVariables.goblinInstanceCount = 16
	print("Changing Scene...")
	print(scene_to_load)
	get_tree().change_scene(scene_to_load)
