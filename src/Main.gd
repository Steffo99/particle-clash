extends Node2D

func _on_LeftColorPicker_color_changed(color: Color):
	$Background/Left.modulate = color
	$Gameplay/LeftPlayArea.self_modulate = color
	$Gameplay/LeftPlayArea/Tiles.self_modulate = color
	$Gameplay/LeftPlayArea/Label.self_modulate = color
	$Gameplay/Minimap/Left.self_modulate = color

func _on_RightColorPicker_color_changed(color: Color):
	$Background/Right.modulate = color
	$Gameplay/RightPlayArea.self_modulate = color
	$Gameplay/RightPlayArea/Tiles.self_modulate = color
	$Gameplay/RightPlayArea/Label.self_modulate = color
	$Gameplay/Minimap/Right.self_modulate = color


const SHAPE = [
	# Cross
	[
		"   GG   ",
		"   YY   ",
		"  YGGY  ",
		"RBRWWRBR",
		"RBRWWRBR",
		"  YGGY  ",
		"   YY   ",
		"   GG   "
	],
	# Larger
	[
		"  GGBB  ",
		" GRRYYB ",
		"GRRRYYYB",
		"GRRRYYYB",
		"YBBBGGGR",
		"YBBBGGGR",
		" YBBGGR ",
		"  YYRR  "
	],
	# Donut
	[
		"  RBBR  ",
		" RBRRBR ",
		"RBRBBRBR",
		"BRB  BRB",
		"BRB  BRB",
		"RBRBBRBR",
		" RBRRBR ",
		"  RBBR  "
	],
	# Good intro level
	[
		" RRBB ",
		"RRBRBB",
		"RBRBRB",
		"BRBRBR",
		"BBRBRR",
		" BBRR "
	],
	# With a trick
	[
		" RBBR ",
		"RBRRBR",
		"BRWWRB",
		"BRWWRB",
		"RBRRBR",
		" RBBR "
	],
	# TODO: Find solution?
	[
		" RRBB ",
		"RBBRRB",
		"BRRBBR",
		"RBB RB",
		"BRRBBR",
		" BBRR "
	],
]


func _on_Button_button_up():
	$Menu.visible = false
	$Gameplay.visible = true
	$Gameplay/LeftPlayArea.tiles_init(SHAPE[0])
	$Gameplay/LeftPlayArea.cursor_init()
	$Gameplay/RightPlayArea.tiles_init(SHAPE[0])
	$Gameplay/RightPlayArea.cursor_init()
	$Gameplay/Timer.start()
