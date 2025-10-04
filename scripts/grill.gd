class_name grill
extends Node3D


@export var threshold:int = 1
@export var inverted := false
var count:int = 0
var active := true


func _ready() -> void:
	update()


func connectionOn() -> void:
	count += 1
	update()


func connectionOff() -> void:
	count -= 1
	update()


func update() -> void:
	if count >= threshold:
		active = inverted
	else:
		active = not inverted
	$MeshInstance3D.visible = active
	$StaticBody3D.collision_layer = 16 * int(active)
	$StaticBody3D.collision_mask = 16 * int(active)


func _on_area_3d_body_entered(body: Node3D) -> void:
	if not active:
		return
	if body is Player:
		for i:Node in body.grab.get_children():
			if i is Cube:
				i.pop()
			else:
				i.queue_free()
	elif body is Cube:
		body.pop()
	else:
		body.queue_free()
