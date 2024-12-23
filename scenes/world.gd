extends BaseScene

@onready var camera = $follow_camera

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	camera.follow_node = player
	
	
