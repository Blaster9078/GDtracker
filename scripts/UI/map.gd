extends TextureRect

func _ready() -> void:
	attempt_image_load()
	
	
func attempt_image_load() -> void:
	var file_path : String = FileManagement.path + "/map.png"
	var pic : Image = Image.new()
	var err = pic.load(file_path)
	if err != OK:
		print(err)
	texture = ImageTexture.create_from_image(pic)
