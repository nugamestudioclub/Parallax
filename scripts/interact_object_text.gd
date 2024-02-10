extends Node
@export var object_dialogue_scene: DialogueResource
@export var object_dialogue_start: String

func on_interact():
	DialogueManager.show_dialogue_balloon(object_dialogue_scene, object_dialogue_start)
