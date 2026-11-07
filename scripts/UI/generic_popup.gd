class_name GenericPopup extends Window
var text: String = "Text"
var opt: Array[Array]
const POPUP_BUTTON = preload("uid://bj4m2gc5qb67n")
const GENERIC_POPUP = preload("uid://bp8a47gvi52jn")
@onready var popup_options: HBoxContainer = $VBoxContainer/MarginContainer/PopupOptions

func _ready() -> void:
	for option in opt:
		print(option[0])
		var butt : Button = POPUP_BUTTON.instantiate()
		butt.text = option[0]
		if option[1] and option[1] is int:
			butt.exit_code = option[1]
		butt.code_emitted.connect(_on_exit_code_received)
		popup_options.add_child(butt)
	$VBoxContainer/Label.text=text
	popup_centered_clamped(Vector2(640,100))


static func new_popup(new_text: String, options: Array[Array]) -> GenericPopup:
	var pop : GenericPopup = GENERIC_POPUP.instantiate()
	pop.title = new_text
	pop.text = new_text
	pop.opt = options
	return pop

func _on_exit_code_received(code: int)->void:
	if code == 0:
		close_popup()
	return
	
func close_popup()-> void:
	
	call_deferred("free")

func _on_close_requested() -> void:
	close_popup()
