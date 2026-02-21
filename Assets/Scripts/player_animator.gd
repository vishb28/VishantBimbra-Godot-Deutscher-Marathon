extends Node2D

@export var player_Controller : PlayerController
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D

func _process(Delta):
	if player_Controller.direction == 1:
		sprite.flip_h = false
	elif player_Controller.direction == -1:
		sprite.flip_h = true
