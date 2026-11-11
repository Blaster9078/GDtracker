extends Node
var path : String
var items : Array
var checks : Array

func load_items(file_path: String) -> void:
	var file : FileAccess = FileAccess.open(file_path, FileAccess.READ)
	var as_text : String = file.get_as_text()
	var pre_items = JSON.parse_string(as_text)
	clean_array(items)
	for item in pre_items['items']:
		var it : TrackerItem = TrackerItem.new_item(item["name"], item["levels"])
		items.append(it)

func load_checks(file_path: String) -> void:
	var file : FileAccess = FileAccess.open(file_path, FileAccess.READ)
	var as_text : String = file.get_as_text()
	var pre_checks = JSON.parse_string(as_text)
	clean_array(checks)
	for check in pre_checks['checks']:
		var c : TrackerCheck = TrackerCheck.new_check(check["name"], check["x"], check["y"], check["requirements"])
		checks.append(c)
func clean_array(arr: Array)->void:
	for x in arr:
		x.free()
	arr.clear()
