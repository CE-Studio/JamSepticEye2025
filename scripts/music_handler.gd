extends Node3D


const ACTIVE_VOL_LIVE:float = 0.2
const ACTIVE_VOL_DEAD:float = 0.1

var f_live:float = ACTIVE_VOL_LIVE
var f_dead:float = 0
var r_live:float = ACTIVE_VOL_LIVE
var r_dead:float = 0

var i_live:int
var i_dead:int


func _ready() -> void:
	i_live = AudioServer.get_bus_index("Music")
	i_dead = AudioServer.get_bus_index("Music2")
	set_mus_live()


func _process(delta: float) -> void:
	r_live = move_toward(r_live, f_live, delta * 0.1)
	r_dead = move_toward(r_dead, f_dead, delta * 0.1)
	AudioServer.set_bus_volume_linear(i_live, r_live)
	AudioServer.set_bus_volume_linear(i_dead, r_dead)


func set_mus_live() -> void:
	f_live = ACTIVE_VOL_LIVE
	f_dead = 0


func set_mus_dead() -> void:
	f_live = 0
	f_dead = ACTIVE_VOL_DEAD
