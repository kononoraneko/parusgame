class_name BaseScene extends Node

var player
@onready var entrance_markers: Node2D = $EntranceMarkers
@export var player_speed = 75
@export var player_scale:Vector2 = Vector2(1,1)


func _ready() -> void:
	if has_node("Player"):
		player = $Player
	if scene_manager.player:
		if has_node("Player"):
			get_node("Player").queue_free()
		player = scene_manager.player
		player.scale = player_scale
		player.speed = player_speed
		add_child(player)
		position_player()


func position_player() -> void:
	var last_scene = scene_manager.last_scene_name
	
	if last_scene.is_empty():
		last_scene = "any"
	#if !scene_manager.marker.is_empty():
		#last_scene = scene_manager.marker
		#scene_manager.marker = null
	
	for entrance in entrance_markers.get_children():
		if entrance is Marker2D and entrance.name == "any" or entrance.name == last_scene:
			player.global_position = entrance.global_position
			break
			
			
