class_name TriggerAnimationPlayer
extends AnimationPlayer


@export var threshold:int = 1
@export var to_play:StringName
var count:int = 0
var gate := true


func connectionOn() -> void:
	count += 1
	if count >= threshold:
		if gate:
			gate = false
			play(to_play)


func connectionOff() -> void:
	count -= 1
