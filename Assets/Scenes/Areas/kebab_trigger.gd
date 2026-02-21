
extends Area2D

const DIALOGUE_RESOURCE = preload("res://Assets/Dialogues/kebab_quiz.dialogue")
var question_answered: bool = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and not question_answered:

		DialogueManager.show_example_dialogue_balloon(DIALOGUE_RESOURCE, "kebab_quiz")
