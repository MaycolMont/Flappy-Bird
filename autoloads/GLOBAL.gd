extends Node

var new_game : bool = true
var score : int = 0

var game_data : Dictionary = {
	'max_score': 0
}

var save_path : String = 'user://save_game.dat'


func set_max_score():
	if score > game_data['max_score']:
		game_data['max_score'] = score
		save_data()

func save_data():
	var save_file = FileAccess.open(save_path, FileAccess.WRITE)
	save_file.store_var(game_data)
	save_file.close()

func load_data():
	if FileAccess.file_exists(save_path):
		var save_file = FileAccess.open(save_path, FileAccess.READ)

		game_data = save_file.get_var()
		save_file.close()
