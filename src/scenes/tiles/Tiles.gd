extends TileMap


const COLORS = {
	"R": Color.red,
	"G": Color.green,
	"B": Color.blue,
	"Y": Color.yellow,
	"C": Color.cyan,
	"M": Color.magenta,
	"W": Color.white,
}
const ATOM = preload("res://src/scenes/Atom.tscn")
const TILE_SIZE = 86
const TILE_OFFSET = TILE_SIZE / 2


var shape
var size
var atoms = []


var rng


func set_shape(val, sd):
	var new_size = len(val)
	var rescale_to = clamp(6 / float(new_size), 0, 1)

	clear()
	for atom in $Atoms.get_children():
		atom.queue_free()

	rng = RandomNumberGenerator.new()
	rng.set_seed(sd)

	atoms = []
	var offset = new_size / 2
	var y = - offset
	for row in val:
		var atoms_row = []
		var x = - offset
		for col in row:
			if col != " ":
				set_cell(x, y, 0)
				var atom = ATOM.instance()
				var random_amount = int(col)
				if random_amount > 0:
					var keys = COLORS.keys()
					col = keys[rng.randi() % min(len(keys), random_amount)]
				val[y+offset][x+offset] = col
				atom.self_modulate = COLORS[col]
				atom.position = Vector2(x * TILE_SIZE + TILE_OFFSET, y * TILE_SIZE + TILE_OFFSET)
				$Atoms.add_child(atom)
				atoms_row.append(atom)
			else:
				atoms_row.append(null)
			x += 1
		atoms.append(atoms_row)
		y += 1

	size = new_size
	shape = val
	scale = Vector2(rescale_to, rescale_to)
