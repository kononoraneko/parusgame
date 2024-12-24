extends CanvasLayer

@onready var debugLabel = $VBoxContainer/Control/DebugInfo

func _physics_process(_delta: float) -> void:
	debugLabel.text = str(TaskManager.current_chapter)+"\n"
	for task in TaskManager.tasks:
		debugLabel.text += str(task.is_done) + "\n"
	debugLabel.text += "items["
	for item in $"..".items:
		debugLabel.text += item.item_name + " "
	debugLabel.text += "]"
