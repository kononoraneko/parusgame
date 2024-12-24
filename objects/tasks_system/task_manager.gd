extends Node

var current_chapter = 0

var defaultDialog = ["Привет! Как дела?", "Пока"]

var tasks = [
	CollectItemsTask.new(
		{
			"npc": [["Привет! выполни мне задания"],["Спасибо, что выполнил."]]
		},
		{
			"npc":0
		},
		Stick.new(),
		3
	),
	TalkTask.new(
		{
			"Bob": [["Дарова. Поговори с Ваней", "Ваня находится где то там"],defaultDialog],
			"Ivan": [["Привет!"], ["Че смотришь?"]],
		},
		{
			"Bob":0,
			"Ivan":0
		}
	)
	]


func get_dialog(npc: NPC, player:Player):
	for task in TaskManager.tasks:
		for dialog in task.dialogs.keys():
			if dialog == npc.lore_name:
				task.update(npc, player)
				return task.dialogs[dialog][task.is_done]
	return defaultDialog


func next_chapter():
	current_chapter += 1
	
	if current_chapter == 1:
		tasks = [CollectItemsTask.new(
		{
			"Bob": [["Привет! Пиздуй собирай предметы"],["Че так долго."]]
		},
		{
			"Bob":0
		},
		CollectableItem.new(),
		5
	)]
	else:
		tasks = []


func update():
	var res = true
	for task in TaskManager.tasks:
		if task.is_done == 0:
			res = false
			break
	if res:
		next_chapter()
