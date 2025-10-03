@icon("res://textures/ico/cube.svg")
extends RigidBody3D
class_name  Cube


const EXPLOSION:PackedScene = preload("res://parts/components/explosionDecal.tscn")
@onready var aud := $AudioStreamPlayer3D


func _on_body_entered(_body):
	aud.play()


func pop():
	if global_position.distance_to(Player.instance.global_position) <= 4:
		Player.instance.die()
	var expl:Decal = EXPLOSION.instantiate()
	
	get_parent().add_child(expl)
	expl.global_position = global_position
	queue_free()
