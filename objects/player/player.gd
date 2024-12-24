class_name Player extends CharacterBody2D

@export var tileMap: TileMapLayer
@export var speed = 300.0

var dialog_step = 0
var dialog_array = []
var is_dialog_opened:bool = false


var items = []


func get_item_count(item: CollectableItem) -> int:
	var count = 0
	for i in items:
		if i.item_name == item.item_name:
			count += 1
	return count

func remove_items(item:CollectableItem, count:int):
	for _i in range(count):
		for i in items:
			if i.item_name == item.item_name:
				items.erase(i)
				break

func _ready() -> void:
	$AnimatedSprite2D.play("idle")
	
	

func _process(delta: float) -> void:
	if !is_dialog_opened:
		movement_handler(delta)


func _physics_process(_delta: float) -> void:
	animation_handler()
	input_handler()



func movement_handler(_delta: float) -> void:
	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		$InteractRayCast.rotation = 0
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		$InteractRayCast.rotation = deg_to_rad(180)
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		$InteractRayCast.rotation = deg_to_rad(270)
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		$InteractRayCast.rotation = deg_to_rad(90)
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	move_and_slide()



func animation_handler() -> void:
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



func input_handler() -> void:
	if is_dialog_opened:
		if Input.is_action_just_pressed("interact"):
			dialog_step += 1
			if len(dialog_array) == dialog_step:
				close_dialog()
				return
			$CanvasLayer/VBoxContainer/DialogPanel/HBoxContainer/DialogTextLabel.text = dialog_array[dialog_step]

	elif $InteractRayCast.is_colliding():
		if !is_instance_valid($InteractRayCast.get_collider()):
			$Label.hide()
			return
			
		if $InteractRayCast.get_collider().get_parent().has_method("interact") and $InteractRayCast.get_collider().get_parent().can_interact:
			$Label.show()
			if Input.is_action_just_pressed("interact"):
				$InteractRayCast.get_collider().get_parent().interact(self)
	else:
		$Label.hide()
		


func show_dialog(text):
	dialog_array = text
	is_dialog_opened = true
	$CanvasLayer/VBoxContainer/DialogPanel/HBoxContainer/DialogTextLabel.text = dialog_array[0]
	$CanvasLayer/VBoxContainer/DialogPanel.show()


func close_dialog():
	dialog_step = 0
	dialog_array = []
	is_dialog_opened = false
	$CanvasLayer/VBoxContainer/DialogPanel.hide()
	$CanvasLayer/VBoxContainer/DialogPanel/HBoxContainer/DialogTextLabel.text = ""
