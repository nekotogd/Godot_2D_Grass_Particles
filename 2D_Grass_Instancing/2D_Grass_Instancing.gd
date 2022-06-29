extends Node2D

export(Mesh) var grass_mesh : Mesh
export(Vector2) var spawn_range = Vector2(10.0, 10.0)
export(float) var grass_scale = 0.1
export(Vector2) var grass_spacing = Vector2(20.0, 20.0)
export(float) var rand_rotation_degrees = 3.0
export(Material) var grass_material : Material

onready var mmi = $MultiMeshInstance2D
onready var fps_label = $FPSLabel

var rng := RandomNumberGenerator.new()

func _ready():
#	distribute_grass(Rect2(Vector2.ZERO, spawn_range))
	$GrassParticles.emitting = true

func _process(_delta):
	fps_label.text = "FPS: " + str(Engine.get_frames_per_second())
	
	mmi.material.set_shader_param("player_pos", get_global_mouse_position())
	$GrassParticles.material.set_shader_param("player_pos", get_global_mouse_position())

func distribute_grass(rect : Rect2):
	var mm : MultiMesh = MultiMesh.new()
	
	# 1 is 8-bit lowp
	# 2 is 4-byte Float highp
	mm.custom_data_format = 2
	
	mm.mesh = grass_mesh
	mm.instance_count = int(rect.size.x * rect.size.y)
	
	var t := Transform2D()
	t = t.scaled(Vector2(grass_scale, grass_scale))
	var rand_rotation_radians : float = deg2rad(rand_rotation_degrees)
	for x in range(rect.position.x, rect.end.x):
		for y in range(rect.position.y, rect.end.y):
			var v : Vector2 = Vector2(x * grass_spacing.x, y * grass_spacing.y)
			t = t.rotated(rng.randf_range(-rand_rotation_radians, rand_rotation_radians))
			t.origin = v
			var index : int = int(spawn_range.x * x + y)
			mm.set_instance_custom_data(index, Color(v.x, v.y, 0.0, 0.0))
			mm.set_instance_transform_2d(index, t)
	
	mmi.multimesh = mm
