extends Camera2D

@export var tileMap: TileMapLayer
@export var follow_node: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var mapRect = tileMap.get_used_rect()
	var tileSize = tileMap.rendering_quadrant_size
	var worldSizeInPixels = mapRect.size * tileSize
	limit_bottom = worldSizeInPixels.y
	limit_right = worldSizeInPixels.x
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	global_position = follow_node.global_position
