class_name TrackerCheck extends Node
var check_name : String
var x : float = 0.0
var y : float = 0.0
var available : bool = false
var acquired : bool = false
var requirements : Array[TrackerItem]
signal availability_changed
func _ready() -> void:
	for r in requirements:
		r.level_changed.connect(_on_requirement_level_changed)
static func new_check(new_name: String, new_x: float, new_y: float, req:Array[String])-> TrackerCheck:
	var check : TrackerCheck = TrackerCheck.new()
	check.check_name = new_name
	check.x = new_x
	check.y = new_y
	for r in req:
		for item in FileManagement.items:
			if item.item_name == r:
				check.requirements.append(item)
				break
	return check
	
func _on_requirement_level_changed()->void:
	for r in requirements:
		if r.item_levels == 0:
			set_availability(false)
			return
	set_availability(true)
func set_availability(setting: bool)->void:
	if available != setting:
		available = setting
		availability_changed.emit()
