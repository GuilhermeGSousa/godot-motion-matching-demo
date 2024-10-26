extends Node

func _process(delta: float) -> void:
	$AnimationTree.set("parameters/MMAnimationNode/motion_matching_input", MMQueryInputRefCounted.new())
