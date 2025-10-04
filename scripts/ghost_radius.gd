class_name GhostRadius
extends Node3D


const ROTATE_SPEED:float = deg_to_rad(20.0)
const RADIUS:float = 7.75

static var first_spawn:bool = true

@onready var outer:Node3D = $"EffectOuter"
@onready var inner:Node3D = $"EffectInner"
@onready var anim:AnimationPlayer = $"AnimationPlayer"
@onready var part:GPUParticles3D = $"GPUParticles3D"


func _ready() -> void:
	anim.play("Spawn")
	first_spawn = false
	rotate(Vector3.UP, randf_range(-PI, PI))


func _process(delta: float) -> void:
	outer.rotate(Vector3.UP, ROTATE_SPEED * delta)
	inner.rotate(Vector3.UP, ROTATE_SPEED * delta * -1.5)


func despawn():
	anim.play("Despawn")


func _free_self() -> void:
	queue_free()
