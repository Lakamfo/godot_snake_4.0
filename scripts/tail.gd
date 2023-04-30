extends Node2D

@onready var previous_position = Vector2.ZERO
@onready var next_tail : Node2D
@onready var head_position = Vector2.ZERO

@onready var head 

@onready var sprite : Sprite2D

func _ready():
	head = get_tree().get_nodes_in_group("head")[0]

func _tick():
	previous_position = position
	position = next_tail.previous_position
	
	head_position = head.position
	
	if position == head_position:
		get_tree().reload_current_scene()
	
	if Singletone.apples.size() < 0:
		return
	
	for apple in Singletone.apples:
		if apple != null:
			if position == apple.position:
				Singletone.apples.erase(Singletone.apples.find(apple))
				apple.queue_free()
				head._apple()
				Singletone.score += 50
				Singletone.apple_sound.play()
				break

func color(X):
	sprite = $Sprite2D
	sprite.modulate = X
