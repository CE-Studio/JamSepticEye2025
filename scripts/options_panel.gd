extends Control


#var index_music:int
#var index_sound:int
var index:int

@onready var slider_sen:HSlider = $"PanelContainer/MarginContainer/VBoxContainer/SSen"
#@onready var slider_music:HSlider = $"PanelContainer/MarginContainer/VBoxContainer/SMusic"
@onready var slider_sound:HSlider = $"PanelContainer/MarginContainer/VBoxContainer/SSound"


func _ready() -> void:
	#index_music = AudioServer.get_bus_index("Music")
	#index_sound = AudioServer.get_bus_index("Sound")
	index = AudioServer.get_bus_index("Master")
	
	slider_sen.set_value_no_signal(ProjectSettings.get_setting("game/mouse_sensitivity"))
	#slider_music.set_value_no_signal(int(AudioServer.get_bus_volume_linear(index_music) * 20))
	slider_sound.set_value_no_signal(int(AudioServer.get_bus_volume_linear(index) * 20))


func _process(_delta: float) -> void:
	if Input.is_action_pressed("ui_cancel"):
		slider_sen.release_focus()
		slider_sound.release_focus()


func _on_sen_edit(_changed) -> void:
	ProjectSettings.set_setting("game/mouse_sensitivity", slider_sen.value)


#func _on_music_edit(_changed) -> void:
#	AudioServer.set_bus_volume_linear(index_music, slider_music.value / 20.0)


func _on_sound_edit(_changed) -> void:
	AudioServer.set_bus_volume_linear(index, float(slider_sound.value) / 20.0)
