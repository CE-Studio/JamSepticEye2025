extends Control


var target_scene:String = ""

@onready var anim:AnimationPlayer = $"AnimationPlayer"


func begin_load_fadeout(target:String) -> void:
	target_scene = target
	anim.play("EndFadeIn")


func _swap_scene() -> void:
	get_tree().change_scene_to_file.call_deferred(target_scene)
