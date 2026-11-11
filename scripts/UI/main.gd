extends Control

@export var pack_path: HBoxContainer
const ITEM_MISSING_POPUP = preload("uid://dudl65pk6vyp8")



func _on_load_button_pressed() -> void:
	if not pack_path.file_path:
		print("Item field not set")
		var pop = GenericPopup.new_popup("Field Not Set",[["Ok", 0]])
		add_child(pop)
		return 
	elif not pack_path.file_path.is_absolute_path():
		var pop = GenericPopup.new_popup("Path not absolute",[["Ok", 0]])
		add_child(pop)
		print("File path not absolute")
		return
	FileManagement.path = pack_path.file_path
	var item_path = FileManagement.path + "/items.json"
	print(item_path)

	
	if not FileAccess.file_exists(item_path):
		var pop = GenericPopup.new_popup("items.json not found",[["Ok", 0]])
		add_child(pop)
		print("File doesn't exist")
		return
	FileManagement.load_items(item_path)
	if FileAccess.file_exists(FileManagement.path + "/checks.json"):
		FileManagement.load_checks(FileManagement.path + "/checks.json")
	SceneManagement.change_scene("res://scenes/board.tscn")
