extends Node2D


func _process(_delta):
	var timer = $Timer
	$Minimap/Left.position.x = (1 - timer.time_left / timer.wait_time) * (get_viewport().size.x / 2)
	$Minimap/Right.position.x = get_viewport().size.x - (1 - timer.time_left / timer.wait_time) * (get_viewport().size.x / 2)


func _on_Timer_timeout():
	$LeftPlayArea.can_act = false
	$RightPlayArea.can_act = false
