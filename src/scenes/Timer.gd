extends Timer


func _process(_delta):
	$Minimap/Left.position.x = (1 - time_left / wait_time) * (get_viewport().size.x / 2)
	$Minimap/Right.position.x = get_viewport().size.x - (1 - time_left / wait_time) * (get_viewport().size.x / 2)
