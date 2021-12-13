extends Node

func load_json(path: String) -> Dictionary:
	var f := File.new()
	
	var err = f.open(path, File.READ)
	if err != OK:
		printerr("Could not open file, error code", err)
		return {}
	
	var text = f.get_as_text()
	f.close()
	
	var json := JSON.parse(text)
	if json.error != OK:
		printerr("Failed to parse json")
		return {}
	
	return json.result
