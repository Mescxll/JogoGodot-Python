extends Node2D

var texto_atual = "Você fez um bom trabalho! Ainda não é o caminho mais eficiente, mas você está no 
caminho certo! Com mais algumas tentativas, tenho certeza de que você vai descobrir a 
forma mais rápida e eficaz. Não desista, continue se esforçando!"
var letra_atual = 0
var timer = null

func _on_ready() -> void:  
	if timer == null:
		timer = Timer.new()
		timer.wait_time = 0.05  
		timer.one_shot = false
		timer.connect("timeout", Callable(self, "_on_typing_timeout"))
		add_child(timer)
		timer.start()
	$Label.text = ""  

func _on_typing_timeout():
	$Label.text = texto_atual.substr(0, letra_atual)
	letra_atual += 1    
	if letra_atual > texto_atual.length():
		timer.stop()

func _on_seta_e_pressed() -> void:
	Musica.rein_music2()
	get_tree().change_scene_to_file("res://cena_niveis.tscn")
