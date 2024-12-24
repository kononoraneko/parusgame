class_name Door extends Entity

@export var connected_scene: String

func _ready() -> void:
	pass

func interact(_player):
	scene_manager.change_scene(get_owner(), connected_scene)
