extends GridContainer

const ITEM_BUTTON = preload("uid://c01sxensnjro4")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for item in FileManagement.items:
		var butt : ItemButton = ItemButton.new_item_button(item)
		add_child(butt)
