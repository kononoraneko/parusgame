extends Camera2D

@onready var tileMap = $"..".tileMap
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var mapRect = tileMap.get_used_rect()
	var tileSize = tileMap.rendering_quadrant_size
	var worldSizeInPixels = mapRect.size * tileSize
	limit_bottom = worldSizeInPixels.y
	limit_right = worldSizeInPixels.x
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
