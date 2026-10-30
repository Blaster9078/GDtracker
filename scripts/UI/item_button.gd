class_name ItemButton extends Button

var levels : int = 0
var item_reference : TrackerItem
var timer_expired : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	item_reference.level_changed.connect(update_level)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
static func new_item_button(ref : TrackerItem)-> ItemButton:
	var new_button : ItemButton = ItemButton.new()
	new_button.item_reference = ref
	return new_button
func update_level()->void:
	$Levels.text = String.num_int64(item_reference.item_levels)


func _on_button_down() -> void:
	$HoldTimer.start(3)
	timer_expired = false
	pass # Replace with function body.


func _on_button_up() -> void:
	if timer_expired:
		item_reference.decrease_level()
	else:
		item_reference.increase_level()
	pass # Replace with function body.


func _on_hold_timer_timeout() -> void:
	pass # Replace with function body.
