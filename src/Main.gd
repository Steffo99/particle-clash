extends Node2D

func _on_LeftColorPicker_color_changed(color: Color):
	$Background/Left.modulate = color
	$Gameplay/LeftPlayArea.self_modulate = color
	$Gameplay/LeftPlayArea/Tiles.self_modulate = color
	$Gameplay/Minimap/Left.self_modulate = color

func _on_RightColorPicker_color_changed(color: Color):
	$Background/Right.modulate = color
	$Gameplay/RightPlayArea.self_modulate = color
	$Gameplay/RightPlayArea/Tiles.self_modulate = color
	$Gameplay/Minimap/Right.self_modulate = color

func _on_Button_button_up():
	$Menu.visible = false
	$Gameplay.visible = true
	$Gameplay/LeftPlayArea.tiles_init()
	$Gameplay/LeftPlayArea.cursor_init()
	$Gameplay/RightPlayArea.tiles_init()
	$Gameplay/RightPlayArea.cursor_init()
	$Gameplay/Timer.start()
