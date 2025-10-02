extends Area3D


func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		get_tree().reload_current_scene.call_deferred()
	else:
		body.queue_free()
