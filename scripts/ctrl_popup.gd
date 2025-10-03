extends Area3D


var active:bool = false
var anim_started:bool = false

@export_file_path("*.png") var texture:String
@export var delay:float = 0.0


func _ready() -> void:
	$"Sprite3D".texture = load(texture)


func _process(delta: float) -> void:
	if active and not anim_started:
		delay -= delta
		if delay <= 0.0:
			anim_started = true
			$"Sprite3D".visible = true
			$"AnimationPlayer".play("anim")


func _on_player_enter(body:Node3D) -> void:
	if body is Player:
		active = true
