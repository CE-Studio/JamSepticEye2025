extends Area3D


@export_file_path("*.tscn") var target_scene:String


func _on_player_enter(_body) -> void:
	if _body is Player and not _body.dead:
		if target_scene.strip_edges() != "":
			UI.instance.transition_handler.begin_load_fadeout(target_scene)
