extends Node2D


func _process(_delta):
	var timer = $Timer
	var left = $Minimap/Left
	var right = $Minimap/Right

	var progress = 1 - timer.time_left / timer.wait_time	
	var wide = get_viewport().size.x

	left.position.x = progress * wide / 2
	right.position.x = wide - progress * wide / 2
