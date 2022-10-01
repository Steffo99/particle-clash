extends TileMap


var shape setget set_shape


func set_shape(val):

	var size = len(val)

	clear()
	var offset = int(size / 2)
	var y = - offset
	for row in val:
		var x = - offset
		for col in row:
			if col != " ":
				set_cell(x, y, 0)
			x += 1
		y += 1
	
	var rescale_to = clamp(5 / float(size), 0, 1)
	scale = Vector2(rescale_to, rescale_to)
	shape = val


const TEST = [
	"OOOOOO",
	"OOOOOO",
	"OO  OO",
	"OO  OO",
	"OOOOOO",
	"OOOOOO",
]


func _ready():
	set_shape(TEST)
