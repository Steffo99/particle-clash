extends Sprite


var can_act = false


func tiles_init(shape, sd):
	print("Initializing tiles for %s..." % player)
	$Tiles.set_shape(shape, sd)
	check_matches()


var cursor_pos setget set_cursor_pos
func set_cursor_pos(val):
	var offset = $Tiles.size / 2 - 1
	$Tiles/Cursor.position = Vector2( \
		(val.x - offset) * $Tiles.TILE_SIZE, \
		(val.y - offset) * $Tiles.TILE_SIZE  \
	)
	cursor_pos = val

func cursor_would_collide(top_left: Vector2):
	var shape = $Tiles.shape
	var size_x = len(shape) - 1
	var size_y = len(shape[0]) - 1
	return \
		top_left.x < 0 || \
		top_left.y < 0 || \
		top_left.x >= size_x || \
		top_left.y >= size_y || \
		shape[top_left.x][top_left.y] == " " || \
		shape[top_left.x+1][top_left.y] == " " || \
		shape[top_left.x][top_left.y+1] == " " || \
		shape[top_left.x+1][top_left.y+1] == " "

func cursor_init():
	var shape = $Tiles.shape
	var y = 0
	while y < len(shape):
		var x = 0
		while x < len(shape[y]):
			var new_pos = Vector2(x, y)
			if not cursor_would_collide(new_pos):
				set_cursor_pos(new_pos)
				return
			x += 1
		y += 1
	push_error("Could not find a valid position for the cursor")
	get_tree().quit()

func cursor_up():
	if can_act:
		cursor_move(Vector2(cursor_pos.x, cursor_pos.y - 1))

func cursor_right():
	if can_act:
		cursor_move(Vector2(cursor_pos.x + 1, cursor_pos.y))

func cursor_down():
	if can_act:
		cursor_move(Vector2(cursor_pos.x, cursor_pos.y + 1))

func cursor_left():
	if can_act:
		cursor_move(Vector2(cursor_pos.x - 1, cursor_pos.y))

func cursor_move(dest):
	if not cursor_would_collide(dest):
		set_cursor_pos(dest)

func cursor_rotate():
	if can_act:
		var top_left = $Tiles.atoms[cursor_pos.y][cursor_pos.x]
		var top_right = $Tiles.atoms[cursor_pos.y][cursor_pos.x+1]
		var bottom_left = $Tiles.atoms[cursor_pos.y+1][cursor_pos.x]
		var bottom_right = $Tiles.atoms[cursor_pos.y+1][cursor_pos.x+1]
		
		var tmp = top_left.position
		top_left.position = top_right.position
		top_right.position = bottom_right.position
		bottom_right.position = bottom_left.position
		bottom_left.position = tmp
		
		$Tiles.atoms[cursor_pos.y][cursor_pos.x] = bottom_left
		$Tiles.atoms[cursor_pos.y][cursor_pos.x+1] = top_left
		$Tiles.atoms[cursor_pos.y+1][cursor_pos.x+1] = top_right
		$Tiles.atoms[cursor_pos.y+1][cursor_pos.x] = bottom_right

		# Optimizable
		var old_score = score
		var new_score = check_matches()
		if new_score > old_score:
			$Tiles/Cursor/SoundOk.play()
		else:
			$Tiles/Cursor/SoundMove.play()


var score

func check_matches():
	# Horizontally
	var size = $Tiles.size

	for row in $Tiles.atoms:
		for col in row:
			if col == null:
				continue
			col.linked = false

	for row in $Tiles.atoms:
		var x = 0
		while x < size - 3:
			var a1 = row[x]
			var a2 = row[x+1]
			var a3 = row[x+2]
			var a4 = row[x+3]
			x += 1
			if a1 == null || a2 == null || a3 == null || a4 == null:
				continue
			if a1.self_modulate == a2.self_modulate && a2.self_modulate == a3.self_modulate && a3.self_modulate == a4.self_modulate:
				a1.linked = true
				a2.linked = true
				a3.linked = true
				a4.linked = true

	var y = 0
	while y < size - 3:
		var x = 0
		while x < size:
			var a1 = $Tiles.atoms[y][x]
			var a2 = $Tiles.atoms[y+1][x]
			var a3 = $Tiles.atoms[y+2][x]
			var a4 = $Tiles.atoms[y+3][x]
			x += 1
			if a1 == null || a2 == null || a3 == null || a4 == null:
				continue
			if a1.self_modulate == a2.self_modulate && a2.self_modulate == a3.self_modulate && a3.self_modulate == a4.self_modulate:
				a1.linked = true
				a2.linked = true
				a3.linked = true
				a4.linked = true
		y += 1

	score = 0
	for row in $Tiles.atoms:
		for col in row:
			if col == null:
				continue
			if col.linked:
				score += 1

	$Label.text = "%d" % score

	return score


export(String) var player

func _process(_delta):
	if Input.is_action_just_pressed(player + "_up"):
		cursor_up()
	if Input.is_action_just_pressed(player + "_right"):
		cursor_right()
	if Input.is_action_just_pressed(player + "_down"):
		cursor_down()
	if Input.is_action_just_pressed(player + "_left"):
		cursor_left()
	if Input.is_action_just_pressed(player + "_rotate"):
		cursor_rotate()
