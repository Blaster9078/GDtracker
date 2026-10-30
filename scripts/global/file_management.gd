extends Node
var image : ImageTexture
var items : Array
var checks : Array
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func load_items(file_path: String) -> void:
	var file : FileAccess = FileAccess.open(file_path, FileAccess.READ)
	var as_text : String = file.get_as_text()
	var pre_items = JSON.parse_string(as_text)
	clean_array(items)
	print(pre_items['items'])
	for item in pre_items['items']:
		var it : TrackerItem = TrackerItem.new_item(item["name"], item["levels"])
		items.append(it)
	for x in items:
		print(x.item_name, x.max_item_levels)
	pass

func clean_array(arr: Array)->void:
	for x in arr:
		x.free()
	arr.clear()
