extends Control


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file.call_deferred("res://scenes/levels/level_1.tscn")
