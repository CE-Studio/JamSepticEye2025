extends Node3D


@export var entry := false
@export var auto_on := false
@export var connections:Array[Node]
@export var threshold:int = 1
var count:int = 0
var gate := true


func _ready() -> void:
	if entry:
		$AnimationPlayer.animation_finished.connect(end, CONNECT_ONE_SHOT)
		$AnimationPlayer.play("appear")
	elif auto_on:
		connectionOn()


func connectionOn() -> void:
	if entry:
		return
	count += 1
	if count >= threshold:
		if gate:
			gate = false
			$AnimationPlayer.play("appear")
			$door2.connectionOn()


func connectionOff() -> void:
	count -= 1


func end(_a) -> void:
	$door2.connectionOn()
	trigger()


func trigger() -> void:
	for i in connections:
		if i.has_method("connectionOn"):
			i.connectionOn()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if entry:
		return
	if body is Player:
		$AnimationPlayer.play("end")
