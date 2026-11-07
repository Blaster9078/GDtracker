extends HBoxContainer

var file_path : String


func _on_select_file_button_pressed() -> void:
	$FileDialog.popup_file_dialog()






func _on_path_line_text_changed(new_text: String) -> void:
	file_path = new_text
	print(file_path)



func _on_file_dialog_dir_selected(dir: String) -> void:
	file_path = dir
	print(file_path)
	$PathLine.text = file_path
