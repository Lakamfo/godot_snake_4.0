extends Control

func _unhandled_input(event):
	if (event is InputEventScreenTouch) or (event is InputEventScreenDrag):
		show()
	elif (event is InputEventKey):
		hide()

func _on_button_up_button_down():
	Input.action_press("ui_up")

func _on_button_up_button_up():
	Input.action_release("ui_up")

func _on_button_down_button_down():
	Input.action_press("ui_down")


func _on_button_down_button_up():
	Input.action_release("ui_down")


func _on_button_left_button_down():
	Input.action_press("ui_left")


func _on_button_left_button_up():
	Input.action_release("ui_left")


func _on_button_right_button_down():
	Input.action_press("ui_right")


func _on_button_right_button_up():
	Input.action_release("ui_right")
