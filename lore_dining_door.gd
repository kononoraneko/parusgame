extends Door

func interact(player:Player):
	if TaskManager.current_chapter == 0:
		player.show_dialog(["Лучше сначала спрошу у всех ребят..."])
	else:
		super(player)
