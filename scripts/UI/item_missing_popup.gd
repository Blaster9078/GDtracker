extends Popup


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super.popup_centered_clamped(Vector2i(127,127))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass


func _on_button_pressed() -> void:
	call_deferred("free")
	pass # Replace with function body.
