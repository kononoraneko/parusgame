class_name Task extends Node

var is_done = 0

var completed_dialogs = {
	"npc":0,
}


var items_count = 0

var dialogs = {
	"npc": [["Выполни задание"], ["Спасибо, что выполнил задание"]]
}

var collectable_item: CollectableItem 

func update(npc, player):
	print("Task update")


#func update(npc:NPC, player:Player):
	#if is_done:
		#return
	#is_done = 1
	#for dialog in completed_dialogs.values():
		#if dialog == 0:
			#is_done = 0
	#completed_dialogs[npc.lore_name] = 1
	#
	#if collectable_item != null:
		#if player.get_item_count(collectable_item) >= items_count:
			#player.remove_items(collectable_item, items_count)
		#else:
			#is_done = 0
