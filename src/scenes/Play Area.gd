extends Sprite


const TILE_SIZE = 86

var cursor_pos setget set_cursor_pos
func set_cursor_pos(val):
	var shape = $Tiles.shape
	#warning-ignore:integer_division
	var offset_x = len(shape) / 2 - 1
	#warning-ignore:integer_division
	var offset_y = len(shape[0]) / 2 - 1
	$Tiles/Spinner.position = Vector2((val.x - offset_x) * TILE_SIZE, (val.y - offset_y) * TILE_SIZE)
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
				print("Found location for cursor @ %d, %d" % [new_pos.x, new_pos.y])
				set_cursor_pos(new_pos)
				return
			x += 1
		y += 1
	push_error("Could not find a valid position for the cursor")
	get_tree().quit()

func cursor_up():
	cursor_move(Vector2(cursor_pos.x, cursor_pos.y - 1))

func cursor_right():
	cursor_move(Vector2(cursor_pos.x + 1, cursor_pos.y))

func cursor_down():
	cursor_move(Vector2(cursor_pos.x, cursor_pos.y + 1))

func cursor_left():
	cursor_move(Vector2(cursor_pos.x - 1, cursor_pos.y))

func cursor_move(dest):
	if not cursor_would_collide(dest):
		set_cursor_pos(dest)
	else:
		print("Cursor collided @ %d, %d" % [dest.x, dest.y])

func cursor_rotate():
	pass


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


func _ready():
	cursor_init()
