extends Control

@onready var score = $score

func _tick():
	score.text = "Score: " + str(Singletone.score)
