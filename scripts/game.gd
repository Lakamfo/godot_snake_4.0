extends Node2D

@onready var time_period = 0.25
var time = 0.0
@onready var apple_period = 5
var apple_timer = 0.0

@onready var apple_scene = preload("res://tscn/apple.tscn")

func _ready():
	Singletone.score = 0

var apple_positions = [
	475,425,375,325,275,225,175,125,75,25
]

func _process(delta):
	time += delta
	apple_timer += delta
	
	if time >= time_period:
		time = 0.0
		
		get_tree().call_group("head","_tick")
		get_tree().call_group("tail","_tick")
	
	if apple_timer >= apple_period:
		var apple = apple_scene.instantiate()
		add_child(apple)
		
		apple.position = Vector2(apple_positions.pick_random(),apple_positions.pick_random())
		apple_timer = 0.0
