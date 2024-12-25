extends Entity

func interact(player:Player):
	player.show_dialog(["Я на баскетбольной площадке."], "Записка")
	super(player)
