extends Node3D


const ACTIVE_VOL:float = 0.8

var i_live:int
var i_dead:int


func _ready() -> void:
	i_live = AudioServer.get_bus_index("Music")
	i_dead = AudioServer.get_bus_index("Music2")
	set_mus_live()


func set_mus_live() -> void:
	AudioServer.set_bus_volume_linear(i_live, ACTIVE_VOL)
	AudioServer.set_bus_volume_linear(i_dead, 0)


func set_mus_dead() -> void:
	AudioServer.set_bus_volume_linear(i_live, 0)
	AudioServer.set_bus_volume_linear(i_dead, ACTIVE_VOL)
