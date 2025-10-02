extends Area3D


@export_file_path("*.tscn") var target_scene:String


func _on_player_enter(_body) -> void:
	if target_scene.strip_edges() != "":
		#get_tree().change_scene_to_file.call_deferred(target_scene)
		UI.instance.transition_handler.begin_load_fadeout(target_scene)
