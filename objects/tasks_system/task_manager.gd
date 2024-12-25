extends Node

var current_chapter = 0

var defaultDialog = ["Привет! Как дела?", "Пока"]

var tasks = [
	CollectItemsTask.new(
		{
			"Вожатый Матвей": [["Привет! Даю тебе сегодняшнее задание.","Собери мне 5 палок для костра","Палки можешь поискать вокруг в лесу"],["Ты ищещь Кирилла? Я могу тебе помочь.", "Спроси у ребят: Лизы, Ангелины, Лёши и Вовы"]]
		},
		{
			"Вожатый Матвей":0
		},
		Stick.new(),
		5
	),
	TalkTask.new(
		{
			"Лиза": [["Ты ищешь Кирилла? Хмм..", "Я кажется видела Кирилла возле столовой"],defaultDialog],
			"Вова": [["Привет, Максим!","Кирилл? Дай подумать","...","...", "Вспомнил! Он куда то быстро убегал мимо столовой "], ["Удачи в поисках!"]],
			"Геля": [["Посмотри в столовой."], defaultDialog]
		},
		{
			"Лиза":0,
			"Вова":0,
			"Геля":0,
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
		tasks = [TalkTask.new(
		{
			"Записка": [["Я на баскетбольной площадке."],["Я на баскетбольной площадке."]]
		},
		{
			"Записка":0
		},
		
	),
	TalkTask.new(
		{
			"Кирилл": [["Ты молодец!"],["Спасибо за прохождение игры.", "Теперь пора загружать игру, у нас осталось всего 10 минут:)"]]
		},
		{
			"Кирилл":0
		},
		
	)
	]
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
