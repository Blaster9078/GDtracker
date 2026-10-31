class_name ItemButton extends Button

var levels : int = 0
var item_reference : TrackerItem
var timer_expired : bool = false
const self_scene = preload("uid://c01sxensnjro4")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	item_reference.level_changed.connect(update_level)
	$Levels.text = "0"


static func new_item_button(ref : TrackerItem)-> ItemButton:
	var new_button : ItemButton = self_scene.instantiate()
	new_button.item_reference = ref
	return new_button
	
func update_level()->void:
	$Levels.text = String.num_int64(item_reference.item_levels)


func _on_button_down() -> void:
	$HoldTimer.start(0.5)
	timer_expired = false


func _on_button_up() -> void:
	if timer_expired:
		item_reference.decrease_level()
	else:
		item_reference.increase_level()


func _on_hold_timer_timeout() -> void:
	timer_expired=true
