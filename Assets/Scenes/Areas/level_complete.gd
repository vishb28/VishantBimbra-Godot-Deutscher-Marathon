extends Area2D

var level_completed: bool = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and not level_completed:
		level_completed = true
		body.set_physics_process(false)
		

		var overlay = ColorRect.new()
		overlay.color = Color(0, 0, 0, 0.7)
		overlay.set_anchors_preset(Control.PRESET_FULL_RECT)
		
		var message = Label.new()
		message.text = "🎉 Level 2 Complete!"
		message.add_theme_font_size_override("font_size", 48)
		message.add_theme_color_override("font_color", Color.GOLD)
		message.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		message.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		message.set_anchors_preset(Control.PRESET_FULL_RECT)
		
		overlay.add_child(message)
		
		
		var canvas = CanvasLayer.new()
		canvas.layer = 100
		canvas.add_child(overlay)
		get_tree().current_scene.add_child(canvas)
		
	
		await get_tree().create_timer(3.0).timeout
		get_tree().change_scene_to_file("res://Assets/Scenes/Area Functionality/area_template.tscn")
