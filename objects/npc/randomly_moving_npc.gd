class_name randomlyMovingNpc extends NPC

@onready var navigation_agent = $NavigationAgent2D
@export var tileLayer: TileMapLayer
@export var max_wait_time:float = 10
@export var min_wait_time:float = 3
@export var move_speed:float = 100
@export var enable_nav_agent_debug:bool = false
var is_speaking:bool = false
var player:Player
@export var timeout_time:float = 30

func _ready():
	super()
	randomize()
	navigation_agent.path_desired_distance = 2.0
	navigation_agent.target_desired_distance = 2.0
	navigation_agent.debug_enabled = enable_nav_agent_debug
	set_timer()

func interact(_player:Player):
	super(_player)
	is_speaking = true
	player = _player
	

func set_movement_target(movement_target: Vector2):
	navigation_agent.target_position = movement_target

func get_random_point():
	return Vector2(randi_range(20, tileLayer.get_used_rect().size.x * tileLayer.rendering_quadrant_size), randi_range(20, tileLayer.get_used_rect().size.y * tileLayer.rendering_quadrant_size))


func _physics_process(_delta):
	if is_speaking == true:
		if player.is_dialog_opened:
			$AnimatedSprite2D.animation = "idle"
			return
		else:
			is_speaking = false
	
	
	if navigation_agent.is_navigation_finished():
		$AnimatedSprite2D.animation = "idle"
		return

	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()

	velocity = current_agent_position.direction_to(next_path_position) * move_speed
	move_and_slide()
	animation_handler()

func _on_navigation_agent_2d_target_reached() -> void:
	$AnimatedSprite2D.animation = "idle"
	set_timer()

func set_timer():
	$Timer.wait_time = randf_range(min_wait_time, max_wait_time)
	$Timer.start()


func _on_timer_timeout() -> void:
	set_movement_target(get_random_point())
	$TimeoutTimer.start(timeout_time)



func animation_handler() -> void:
	if abs(velocity.y) > 0.3:
		if velocity.y > 0:
			$AnimatedSprite2D.animation = "walk_down"
		if velocity.y < 0:
			$AnimatedSprite2D.animation = "walk_up"
	elif abs(velocity.x) > 0.3:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_h = velocity.x > 0
	else:
		$AnimatedSprite2D.animation = "idle"
