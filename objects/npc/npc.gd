class_name NPC extends CharacterBody2D

@export var frames: SpriteFrames

func _ready() -> void:
	$AnimatedSprite2D.sprite_frames = frames
	$AnimatedSprite2D.play("idle")


func interact(player: Player) -> void:
	player.show_dialog(["Привет!", "Как дела?"])
