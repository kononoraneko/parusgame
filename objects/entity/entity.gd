class_name Entity extends CharacterBody2D

@export var frames: SpriteFrames
@export var lore_name:String 

func _ready() -> void:
	$AnimatedSprite2D.sprite_frames = frames
	$AnimatedSprite2D.play("idle")


func interact(player: Player) -> void:
	print("interaction!")
	
