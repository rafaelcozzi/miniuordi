extends Area2D
@onready var player = $"../jpplay_robinhood"

func _on_body_entered(body):
	if body.name == "jpplay_robinhood":
		print("levou dano-serra")
		player._levouDano()
