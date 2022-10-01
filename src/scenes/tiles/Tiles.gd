extends TileMap


const COLORS = {
	"R": Color.red,
	"G": Color.green,
	"B": Color.blue,
	"C": Color.cyan,
	"M": Color.magenta,
	"Y": Color.yellow,
	"W": Color.white,
	"K": Color.black,
}
const ATOM = preload("res://src/scenes/Atom.tscn")
const TILE_SIZE = 86


var shape setget set_shape
var size
var atoms = []


func set_shape(val):
	var new_size = len(val)
	var rescale_to = clamp(6 / float(new_size), 0, 1)

	clear()
	atoms = []
	var y = - (new_size / 2)
	for row in val:
		var atoms_row = []
		var x = - (new_size / 2)
		for col in row:
			if col != " ":
				set_cell(x, y, 0)
				var atom = ATOM.instance()
				atom.self_modulate = COLORS[col]
				atom.position = Vector2(x * TILE_SIZE, y * TILE_SIZE)
				add_child(atom)
				atoms_row.append(atom)
			else:
				atoms_row.append(null)
			x += 1
		atoms.append(atoms_row)
		y += 1

	size = new_size
	shape = val
	scale = Vector2(rescale_to, rescale_to)
