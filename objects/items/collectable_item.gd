class_name CollectableItem extends Node

var item_name = "item"

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.items.append(self.duplicate())
	queue_free()
