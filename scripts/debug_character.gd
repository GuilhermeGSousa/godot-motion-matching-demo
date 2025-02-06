class_name DebugCharacter extends Node

const TRAJECTORY_POINT_SIZE = 0.1

@export var character : MMCharacter

var result_trajectory: Array[Vector3]

func _ready() -> void:
	character.on_query_result.connect(_on_query_result)

func _process(_delta: float) -> void:
	var traj = character.get_trajectory()
	for p in traj:
		Debug.draw_sphere(p["position"], TRAJECTORY_POINT_SIZE)
		
	for p in result_trajectory:
		Debug.draw_sphere(p, TRAJECTORY_POINT_SIZE, Color.GREEN)
	

func _on_query_result(result: Dictionary):
	var result_data = result["frame_data"]
	
	if result_data.is_empty():
		return
	var anim_mixer = character.animation_tree
	var library : MMAnimationLibrary = anim_mixer.get_animation_library(anim_mixer.get_animation_library_list()[0])
	
	var offset = 0
	for feature in library.features:
		var start_index = offset
		var end_index = start_index + feature.get_dimension_count()
		
		var feature_data = result_data.slice(start_index, end_index)
		
		if feature is MMTrajectoryFeature:
			result_trajectory.clear()
			var char_skeleton = character.skeleton
			var points = feature.get_trajectory_points(char_skeleton.transform, feature_data)
			for p in points:
				var point: Vector3 = p["position"]
				result_trajectory.append(point)
			break
		offset += feature.get_dimension_count()
