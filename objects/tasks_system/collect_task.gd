class_name CollectItemsTask extends Task

func _init(_dialog, _completed_dialog, _item, _item_count):
	completed_dialogs = _completed_dialog
	dialogs = _dialog
	collectable_item = _item
	items_count = _item_count


func update(npc:NPC, player:Player):
	if is_done:
		TaskManager.update()
		return
	
	is_done = 1
	for dialog in completed_dialogs.values():
		if dialog == 0:
			is_done = 0
	completed_dialogs[npc.lore_name] = 1
	
	
	if collectable_item != null and is_done:
		if player.get_item_count(collectable_item) >= items_count:
			player.remove_items(collectable_item, items_count)
		else:
			is_done = 0
	TaskManager.update()
