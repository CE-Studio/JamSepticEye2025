extends Node3D


@export var entry := false
@export var connections:Array[Node]


func _ready() -> void:
	if entry:
		$AnimationPlayer.animation_finished.connect(end, CONNECT_ONE_SHOT)
		$AnimationPlayer.play("appear")


func end(_a) -> void:
	$door.connectionOn()
	trigger()


func trigger() -> void:
	for i in connections:
		if i.has_method("connectionOn"):
			i.connectionOn()
