@icon("res://textures/ico/cube.svg")
extends RigidBody3D
class_name  Cube


const EXPLOSION:PackedScene = preload("res://parts/components/explosionDecal.tscn")
@onready var aud:AudioStreamPlayer3D = $AudioStreamPlayer3D
@onready var ray:RayCast3D = $RayCast3D


func _on_body_entered(_body):
	aud.play()


func pop():
	if global_position.distance_to(Player.instance.global_position) <= 2:
		Player.instance.die()
	ray.global_rotation = Vector3.ZERO
	ray.force_raycast_update()
	var expl:Decal = EXPLOSION.instantiate()
	get_parent().add_child(expl)
	if ray.is_colliding():
		if ray.get_collision_normal() == Vector3.UP:
			var pos = ray.get_collision_point()
			expl.global_position = pos
	queue_free()
