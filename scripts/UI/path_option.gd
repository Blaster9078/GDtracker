extends HBoxContainer

var file_path : String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_select_file_button_pressed() -> void:
	$FileDialog.popup_file_dialog()
	
	pass # Replace with function body.


func _on_file_dialog_file_selected(path: String) -> void:
	file_path = path
	print(file_path)
	$PathLine.text = file_path
	pass # Replace with function body.




func _on_path_line_text_changed(new_text: String) -> void:
	file_path = new_text
	print(file_path)
	pass # Replace with function body.
