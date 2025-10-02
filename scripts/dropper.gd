extends Node3D


@export var template:PackedScene = preload("res://parts/cube.tscn")


@export var slot1:Node3D
@export var slot2:Node3D


@export var threshold:int = 0
var count:int = 0


@onready var spawnpoint:Node3D = $spawnpoint


func connectionOn() -> void:
	count += 1
	if count >= threshold:
		$AnimationPlayer.play(&"open")


func connectionOff() -> void:
	count -= 1


func activate(_name:StringName) -> void:
	if is_instance_valid(slot1):
		if slot1.has_method(&"pop"):
			slot1.pop()
		else:
			slot1.queue_free()
	slot1 = slot2
	slot2 = template.instantiate()
	get_parent().add_child(slot2)
	slot2.global_transform = spawnpoint.global_transform
