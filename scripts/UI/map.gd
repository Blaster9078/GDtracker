extends TextureRect
var x_scale : float
var y_scale : float
func _ready() -> void:
	attempt_image_load()
	call_deferred("calculate_scale")
	call_deferred("create_checks")
	
	
func attempt_image_load() -> void:
	var file_path : String = FileManagement.path + "/map.png"
	var pic : Image = Image.new()
	var err = pic.load(file_path)
	if err != OK:
		print(err)
	texture = ImageTexture.create_from_image(pic)

func create_checks() -> void:
	for check in FileManagement.checks:
		var c : CheckLocationButton = CheckLocationButton.new_button(check, check.x*x_scale ,check.y*y_scale)
		add_child(c)
	pass
func calculate_scale()->void:
	x_scale=get_size().x/texture.get_width()
	y_scale=get_size().y/texture.get_height()
