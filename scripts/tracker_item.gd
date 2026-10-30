class_name TrackerItem extends Node

var item_name : String = "item"
var max_item_levels : int = 1
var item_levels : int = 0
signal level_changed
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

static func new_item(new_name: String, levels: int)->TrackerItem:
	var item: TrackerItem = TrackerItem.new()
	item.item_name=new_name
	item.max_item_levels=levels
	return item
	
func increase_level()->void:
	if (item_levels+1) <= max_item_levels:
		item_levels += 1
		level_changed.emit()
func decrease_level()->void:
	if (item_levels-1) >= 0:
		item_levels -= 1
		level_changed.emit()
