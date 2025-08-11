extends Camera2D

var camera_settings := {
	"default_offset": -100.0
	, "look_down_offset": 100.0
	, "move_speed": 500.0
	, "limit_bottom_default": 1180.0
	, "limit_bottom_look_down": 980.0
}

var target_offset_y : float

func _ready():
	target_offset_y = camera_settings.default_offset

func _process(delta):
	if Input.is_action_pressed("camera_look_down"):
		target_offset_y = camera_settings.look_down_offset
	elif Input.is_action_just_released("camera_look_down"):
		target_offset_y = camera_settings.default_offset
	
	offset.y = move_toward(offset.y, target_offset_y, camera_settings.move_speed * delta)
	
	var t = inverse_lerp(camera_settings.default_offset, camera_settings.look_down_offset, offset.y)
	limit_bottom = lerp(camera_settings.limit_bottom_default, camera_settings.limit_bottom_look_down, t)
