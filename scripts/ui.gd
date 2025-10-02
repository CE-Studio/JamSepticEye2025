class_name UI
extends Control


static var instance:Control

@onready var transition_handler:Control = $"TransitionHandler"


func _ready() -> void:
	instance = self
