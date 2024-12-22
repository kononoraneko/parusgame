extends Node

var MAX_CHAPTER = 2

var testDialog: Array[String] = ["Привет!", "Как дела?", "Пока!"]
var cur_chapter = 0

var characters_progress = {
	"npc": 0,
	"Bob": 0,
	"Misha": 0,
}

var characters = {
	"npc": [
		[
			["Привет!", "Как дела?"],
		],
		[
			["Классная сегодня погода!", "Как дела?"],
		],
		[
			["Уже вечер, пора спать!", "Давай, пока!"],
		]
	],
	
	
	"Bob": [
		[
			["Привет! Я Боб!", "Сделаешь для меня пару заданий, и мы в расчете"],
			["Теперь делай для меня другое задание.", "Давай шуруй."],
			["Молодец! Ты выполнил задания", "Теперь проваливай."]
		],
		[
			["Чего пристал ко мне?", "Вали отсюда давай."]
		],
		[
			["Сегодня классная погода"]
		]
	],
	
	"Misha": [
		[
			["Че каво, не кипишуй браток"]
		],
		[
			["Че каво, не кипишуй браток"]
		],
		[
			["Че каво, не кипишуй браток"]
		],
	],
}

func get_dialog(npc: NPC, isDone:bool = false, isNextChapter:bool = false):
	
	if isNextChapter:
		next_chapter()
	
	if isDone:
		characters_progress[npc.lore_name]+=1
		if len(characters[npc.lore_name][cur_chapter]) == characters_progress[npc.lore_name]:
			characters_progress[npc.lore_name]-=1
	
	#if cur_chapter >= len(characters[npc.lore_name]):
		#return characters[npc.lore_name]
	
	var res = characters[npc.lore_name][cur_chapter][characters_progress[npc.lore_name]]
	return res


func next_chapter():
	cur_chapter += 1
	if cur_chapter > MAX_CHAPTER:
		cur_chapter = MAX_CHAPTER
	for key in characters_progress.keys():
		characters_progress[key] = 0
