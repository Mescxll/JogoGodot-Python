extends Node2D

var texto_atual = "Mesmo tendo alcançado seu objetivo, não era esse o melhor caminho. Porém, não 
desanime, você pode tentar novamente. Eu sei que você conseguirá, nunca desista e con-
tinue se esforçando aqui e aí também!"
var letra_atual = 0
var timer = null

func _on_ready() -> void:  
	Musica.rein_music2()
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
	get_tree().change_scene_to_file("res://cena_niveis.tscn")
