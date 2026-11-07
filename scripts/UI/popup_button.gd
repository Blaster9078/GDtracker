extends Button

var exit_code: int = 0
signal code_emitted(code: int)
func _on_pressed() -> void:
	code_emitted.emit(exit_code)
