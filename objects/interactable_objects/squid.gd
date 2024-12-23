extends Entity

func  _ready() -> void:
	pass

func interact(player:Player):
	if $AnimatedSprite2D.frame == 1:
		$AnimatedSprite2D.frame = 0
	else:
		$AnimatedSprite2D.frame = 1
	$CollisionShape2D.disabled = $AnimatedSprite2D.frame == 1
