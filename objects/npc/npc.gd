class_name NPC extends Entity

var progress = 0
var needed_progress = 1

var tasks = []

func interact(player: Player) -> void:
	player.show_dialog(TaskManager.get_dialog(self, player), lore_name)
