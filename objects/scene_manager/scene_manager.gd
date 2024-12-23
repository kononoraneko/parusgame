class_name SceneManager extends Node

var player: Player
var last_scene_name: String
var world = PackedScene.new()

var scene_dir_path = "res://scenes/"


func change_scene(from, to_scene_name: String) -> void:
	last_scene_name = from.name 
	player = from.player
	
	if from.name == "World":
		for child in from.get_children():
			if child is Area2D:
				for s in child.get_signal_connection_list("body_entered"):
					child.disconnect(s["signal"].get_name(), s["callable"])
		for child in from.get_node("Items").get_children():
			for item in child.get_children():
				for s in item.get_signal_connection_list("body_entered"):
					item.disconnect(s["signal"].get_name(), s["callable"])
		world.pack(player.get_parent())
	
	player.get_parent().remove_child(player)
	
	if to_scene_name == "world" and world.can_instantiate():
		
		get_tree().call_deferred("change_scene_to_packed", world)
		return
	
	var full_path = scene_dir_path + to_scene_name + ".tscn"
	from.get_tree().call_deferred("change_scene_to_file", full_path)
