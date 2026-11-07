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
	#elif item_path.file_path.get_extension() != "json":
		#print("File is not json")
		#return
	
	if not FileAccess.file_exists(item_path):
		var pop = GenericPopup.new_popup("items.json not found",[["Ok", 0]])
		add_child(pop)
		print("File doesn't exist")
		return
	FileManagement.load_items(item_path)
	SceneManagement.change_scene("res://scenes/board.tscn")

func import_items()->void:
	pass
