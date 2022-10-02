extends Node2D

func _on_LeftColorPicker_color_changed(color: Color):
	$Background/Left.modulate = color
	$Gameplay/LeftPlayArea.self_modulate = color
	$Gameplay/LeftPlayArea/Tiles.self_modulate = color
	$Gameplay/LeftPlayArea/Label.self_modulate = color
	$Gameplay/Minimap/Left.self_modulate = color
	$Transitions/LeftTransition.color = color
	$Results/Container/Scores/Left.self_modulate = color
	$Results/Container/Rounds/Left.self_modulate = color

func _on_RightColorPicker_color_changed(color: Color):
	$Background/Right.modulate = color
	$Gameplay/RightPlayArea.self_modulate = color
	$Gameplay/RightPlayArea/Tiles.self_modulate = color
	$Gameplay/RightPlayArea/Label.self_modulate = color
	$Gameplay/Minimap/Right.self_modulate = color
	$Transitions/RightTransition.color = color
	$Results/Container/Scores/Right.self_modulate = color
	$Results/Container/Rounds/Right.self_modulate = color


const SHAPES = [
#	# Good intro level
#	[
#		" RRBB ",
#		"RRBRBB",
#		"RBRBRB",
#		"BRBRBR",
#		"BBRBRR",
#		" BBRR "
#	],
#	# With a trick
#	[
#		" RBBR ",
#		"RBRRBR",
#		"BRWWRB",
#		"BRWWRB",
#		"RBRRBR",
#		" RBBR "
#	],
#	# The Gap
#	[
#		" RRBB ",
#		"RBBRRB",
#		"BRRBBR",
#		"RBB RB",
#		"BRRBBR",
#		" BBRR "
#	],
#	# Larger
#	[
#		"  GGBB  ",
#		" GRRYYB ",
#		"GRRRYYYB",
#		"GRRRYYYB",
#		"YBBBGGGR",
#		"YBBBGGGR",
#		" YBBGGR ",
#		"  YYRR  "
#	],
#	# Donut
#	[
#		"  RBBR  ",
#		" RBRRBR ",
#		"RBRBBRBR",
#		"BRB  BRB",
#		"BRB  BRB",
#		"RBRBBRBR",
#		" RBRRBR ",
#		"  RBBR  "
#	],
#	# Huge
#	[
#		"  BBBRRR  ",
#		" 22222222 ",
#		"R22222222B",
#		"R222 2222B",
#		"R222222 2B",
#		"B2 222222R",
#		"B2222 222R",
#		"B22222222R",
#		" 22222222 ",
#		"  RRRBBB  "
#	]
]

const RANDOM_SHAPES = [
#	# Smol 2
#	[
#		" 2222 ",
#		"222222",
#		"222222",
#		"222222",
#		"222222",
#		" 2222 ",
#	],
#	# Smol 3
#	[
#		" 3333 ",
#		"333333",
#		"333333",
#		"333333",
#		"333333",
#		" 3333 ",
#	],
#	# Smol 4
#	[
#		" 4444 ",
#		"444444",
#		"444444",
#		"444444",
#		"444444",
#		" 4444 ",
#	],
#	# Larger 3
#	[
#		"  3333  ",
#		" 333333 ",
#		"33333333",
#		"33333333",
#		"33333333",
#		"33333333",
#		" 333333 ",
#		"  3333  "
#	],
#	# Larger 4
#	[
#		"  4444  ",
#		" 444444 ",
#		"44444444",
#		"44444444",
#		"44444444",
#		"44444444",
#		" 444444 ",
#		"  4444  "
#	],
#	# Larger 5
#	[
#		"  5555  ",
#		" 555555 ",
#		"55555555",
#		"55555555",
#		"55555555",
#		"55555555",
#		" 555555 ",
#		"  5555  "
#	],
#	# Donut 3
#	[
#		"  3333  ",
#		" 333333 ",
#		"33333333",
#		"333  333",
#		"333  333",
#		"33333333",
#		" 333333 ",
#		"  3333  "
#	],
#	# Huge mix
#	[
#		"   2222   ",
#		"  233332  ",
#		" 23555532 ",
#		"2355555532",
#		"2355555532",
#		"2355555532",
#		"2355555532",
#		" 23555532 ",
#		"  233332  ",
#		"   2222   "
#	],
	# Huge 3
	[
		"   3333   ",
		" 33333333 ",
		" 33333333 ",
		"3333333333",
		"3333333333",
		"3333333333",
		"3333333333",
		" 33333333 ",
		" 33333333 ",
		"   3333   "
	]
]


func _on_Button_button_up():
	$Menu.visible = false
	$Transitions/MenuTransition/Fade.play("FadeIn")


func init_round():
	var shape = SHAPES.pop_front()
	if shape == null:
		shape = RANDOM_SHAPES[rng.randi_range(0, len(RANDOM_SHAPES)) - 1]

	var current_time = OS.get_unix_time()
	print("Using %d as seed" % current_time)

	$Gameplay/LeftPlayArea.tiles_init(shape, current_time)
	$Gameplay/LeftPlayArea.cursor_init()
	$Gameplay/RightPlayArea.tiles_init(shape, current_time)
	$Gameplay/RightPlayArea.cursor_init()


func start_round():
	$Gameplay/Timer.start()
	$Gameplay/LeftPlayArea.can_act = true
	$Gameplay/RightPlayArea.can_act = true

	$Gameplay/Music/MusicBase.play()

	if len($Gameplay/LeftPlayArea/Tiles.shape) >= 6:
		$Gameplay/Music/MusicSine.play()

	if len($Gameplay/LeftPlayArea/Tiles.shape) >= 8:
		$Gameplay/Music/MusicSquare.play()
		
	if len($Gameplay/LeftPlayArea/Tiles.shape) >= 10:
		$Gameplay/Music/MusicSaw.play()




func _on_MenuFade_animation_finished(anim_name: String):
	if anim_name == "FadeIn":
		$Gameplay.visible = true
		init_round()
		$Transitions/MenuTransition/Fade.play("FadeOut")
	elif anim_name == "FadeOut":
		start_round()


var which_transition
var left_rounds = 0
var right_rounds = 0
var completed_rounds = 0

func _on_PlayTimer_timeout():
	$Gameplay/LeftPlayArea.can_act = false
	$Gameplay/RightPlayArea.can_act = false

	var left_score = $Gameplay/LeftPlayArea.score
	var right_score = $Gameplay/RightPlayArea.score

	completed_rounds += 1

	if left_score > right_score:
		$Results/Container/Winner.text = "Left wins the round!"
		left_rounds += 1
		which_transition = "Left"
		$Transitions/LeftTransition/Fade.play("FadeIn")
	elif left_score < right_score:
		$Results/Container/Winner.text = "Right wins the round!"
		right_rounds += 1
		which_transition = "Right"
		$Transitions/RightTransition/Fade.play("FadeIn")
	else:
		$Results/Container/Winner.text = "It's a tie!"
		which_transition = "Tie"
		$Transitions/TieTransition/Fade.play("FadeIn")

	$Results/Container/Scores/Left.text = "%d" % left_score
	$Results/Container/Scores/Right.text = "%d" % right_score

	$Results/Container/Rounds/Left.text = "%d" % left_rounds
	$Results/Container/Rounds/Right.text = "%d" % right_rounds


func _on_SideFade_animation_finished(anim_name: String):
	if anim_name == "FadeIn":
		$Results.visible = true
		$Results/Timer.start()
	elif anim_name == "FadeOut":
		start_round()


func _on_ResultsTimer_timeout():
	$Results.visible = false

	init_round()

	if which_transition == "Left":
		$Transitions/LeftTransition/Fade.play("FadeOut")
	if which_transition == "Right":
		$Transitions/RightTransition/Fade.play("FadeOut")
	if which_transition == "Tie":
		$Transitions/TieTransition/Fade.play("FadeOut")
	

var rng = RandomNumberGenerator.new()

func _ready():
	# Now this is a good hack
	rng.seed = OS.get_datetime()["minute"]


func _process(_delta):
	if Input.is_action_just_pressed("mute_music"):
		var bus = AudioServer.get_bus_index("Music")
		if AudioServer.get_bus_volume_db(bus) == 0:
			AudioServer.set_bus_volume_db(bus, -80)
		else:
			AudioServer.set_bus_volume_db(bus, 0)
	
	if Input.is_action_just_pressed("mute_sound"):
		var bus = AudioServer.get_bus_index("Sound")
		if AudioServer.get_bus_volume_db(bus) == 0:
			AudioServer.set_bus_volume_db(bus, -80)
		else:
			AudioServer.set_bus_volume_db(bus, 0)
