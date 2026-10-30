extends Control

@onready var img_path: HBoxContainer = $TextureRect/VBoxContainer/ImgPath
@onready var item_path: HBoxContainer = $TextureRect/VBoxContainer/ItemPath
@onready var checks_path: HBoxContainer = $TextureRect/VBoxContainer/ChecksPath
const ITEM_MISSING_POPUP = preload("uid://dudl65pk6vyp8")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_load_button_pressed() -> void:
	if not item_path.file_path:
		print("Item field not set")
		var pop = ITEM_MISSING_POPUP.instantiate()
		add_child(pop)
		return 
	elif not item_path.file_path.is_absolute_path():
		print("File path not absolute")
		return
	elif item_path.file_path.get_extension() != "json":
		print("File is not json")
		return
	elif not FileAccess.file_exists(item_path.file_path):
		print("File doesn't exist")
		return
	FileManagement.load_items(item_path.file_path)
		
	pass # Replace with function body.
