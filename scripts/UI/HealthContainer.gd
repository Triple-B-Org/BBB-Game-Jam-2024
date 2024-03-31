extends HBoxContainer


@onready var full_heart: CompressedTexture2D = preload("res://assets/full-heart.png")
@onready var empty_heart: CompressedTexture2D = preload("res://assets/empty-heart.png")


var hearts_textures: Array[TextureRect] = []


func _ready() -> void:
	for index: int in GlobalVar.player_max_health:
		var heart_texture_instance: TextureRect = TextureRect.new()
		add_child(heart_texture_instance)
		heart_texture_instance.texture = full_heart
		heart_texture_instance.expand_mode = TextureRect.EXPAND_FIT_WIDTH_PROPORTIONAL
		hearts_textures.append(heart_texture_instance)


func reset_health() -> void:
	for index: int in range(GlobalVar.player_max_health):
		if index > hearts_textures.size() - 1:
			var heart_texture_instance: TextureRect = TextureRect.new()
			add_child(heart_texture_instance)
			heart_texture_instance.texture = full_heart
			heart_texture_instance.expand_mode = TextureRect.EXPAND_FIT_WIDTH_PROPORTIONAL
			hearts_textures.append(heart_texture_instance)
		else:
			hearts_textures[index].texture = full_heart


func update_health() -> void:
	var current_hearts: int = GlobalVar.player_health
	for heart_texture_instance: TextureRect in hearts_textures:
		if current_hearts > 0:
			heart_texture_instance.texture = full_heart
			current_hearts -= 1
		else:
			heart_texture_instance.texture = empty_heart

