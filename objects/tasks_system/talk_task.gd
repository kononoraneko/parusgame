class_name TalkTask extends Task


func _init(_dialogs, _completed_dialogs):
	completed_dialogs = _completed_dialogs
	dialogs = _dialogs

func update(npc:NPC, player:Player):
	if is_done:
		return
	is_done = 1
	for dialog in completed_dialogs.values():
		if dialog == 0:
			is_done = 0
	completed_dialogs[npc.lore_name] = 1
	
