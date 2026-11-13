class_name CheckLocationButton extends Button
var check_reference : TrackerCheck
const CHECK_LOCATION_BUTTON = preload("uid://b424rauh7notk")

func _ready() -> void:
	check_reference.availability_changed.connect(on_check_availability_changed)
	on_check_availability_changed()
	
static func new_button(check: TrackerCheck ,x: float ,y: float) -> CheckLocationButton:
	var butt : CheckLocationButton = CHECK_LOCATION_BUTTON.instantiate()
	butt.position = Vector2(x,y)
	butt.check_reference = check
	return butt
	
func on_check_availability_changed()->void:
	if check_reference.available:
		show()
	else:
		hide()


func _on_toggled(toggled_on: bool) -> void:
	check_reference.acquired = toggled_on
	if toggled_on:
		$ColorRect.color=Color(0,255,0)
	else:
		$ColorRect.color=Color(255,0,0)
