extends Control

@onready var contador = $MarginContainer/HBoxContainer/contador


# Called when the node enters the scene tree for the first time.
func _ready():
	contador.text=str(Global.somaPontos)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
