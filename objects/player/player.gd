extends CharacterBody2D

@export var tileMap: TileMapLayer
@export var speed = 300.0
const JUMP_VELOCITY = -400.0

func printHello() -> void:
	print("Hello, world!")


func _process(delta: float) -> void:
	movement_handler(delta)



func _physics_process(delta: float) -> void:
	pass
	




func movement_handler(delta: float) -> void:
	var velocity = Vector2.ZERO
	
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
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta 
