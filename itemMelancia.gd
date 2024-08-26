extends Area2D

var ponto = 1


func _on_body_entered(body):
	if body.name == "jpplay_robinhood":
		Global.somaPontos += ponto
		$Anim_item.play("coletado")
		await $Anim_item.animation_finished
		queue_free()
