extends Sprite


var linked = false setget set_linked


func set_linked(val):
	if val:
		modulate = Color.white
	else:
		modulate = Color(0.501961, 0.501961, 0.501961)
	linked = val
