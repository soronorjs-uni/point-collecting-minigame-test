extends Node

func load_random_file_from_directory(directory_path: String ):
	var file_names := DirAccess.get_files_at(directory_path)
	var random_file := file_names.get(randi_range(0, file_names.size() - 1))
	var full_path = directory_path + random_file
	var file_resource = load(full_path)

	return file_resource
