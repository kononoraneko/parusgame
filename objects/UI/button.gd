extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_button_2_pressed() -> void:
	get_tree().quit()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://objects/help_menu.tscn")


func _back_to_main_menu() -> void:
	get_tree().change_scene_to_file("res://objects/main_menu.tscn")