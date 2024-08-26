extends Node2D

@onready var player = $jpplay_robinhood

# Called when the node enters the scene tree for the first time.
func _ready():
	player.morri.connect(_resetar)
	
func _resetar():
	get_tree().reload_current_scene()
	Global.somaPontos = 0
