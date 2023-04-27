extends Node2D

func _ready():
	Singletone.apples.push_back(self)
