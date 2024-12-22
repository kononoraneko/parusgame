extends CharacterBody2D

@export var tileMap: TileMapLayer
@export var speed = 300.0
const JUMP_VELOCITY = -400.0

func _ready() -> void:
	$AnimatedSprite2D.play("idle")

func _process(delta: float) -> void:
	movement_handler(delta)



func movement_handler(delta: float) -> void:
	
	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	
	if velocity.y != 0:
		if velocity.y > 0:
			$AnimatedSprite2D.animation = "walk_down"
		if velocity.y < 0:
			$AnimatedSprite2D.animation = "walk_up"
	elif velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_h = velocity.x > 0
	else:
		$AnimatedSprite2D.animation = "idle"
	
	move_and_slide()
