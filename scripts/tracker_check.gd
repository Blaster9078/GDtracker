class_name TrackerCheck extends Node
var check_name : String
var x : float = 0.0
var y : float = 0.0
var available : bool = false
var acquired : bool = false
var requirements : Array[TrackerItem]
signal availability_changed
	
static func new_check(new_name: String, new_x: float, new_y: float, req:Array)-> TrackerCheck:
	var check : TrackerCheck = TrackerCheck.new()
	check.check_name = new_name
	check.x = new_x
	check.y = new_y
	for r in req:
		for item in FileManagement.items:
			if item.item_name == r:
				check.requirements.append(item)
				break
	check.connect_requirements()
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
		
func connect_requirements() -> void:
	if requirements.is_empty():
		set_availability(true)
	for r in requirements:
		r.level_changed.connect(_on_requirement_level_changed)
