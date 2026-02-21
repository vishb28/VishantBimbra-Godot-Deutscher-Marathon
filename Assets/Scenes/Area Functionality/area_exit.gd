extends Area2D

@export var target_scene: String
var player_inside := false

func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		player_inside = true
		print("Player in gate")

func _on_body_exited(body: Node2D) -> void:
	if body is PlayerController:
		player_inside = false
		print("Player left gate")

func _process(_delta):
	if player_inside and Input.is_action_just_pressed("ui_accept"):
		if target_scene != "":
			get_tree().change_scene_to_file(target_scene)


func _on_level_complete_body_entered(body: Node2D) -> void:
	pass 
