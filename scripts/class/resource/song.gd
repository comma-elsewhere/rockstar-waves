class_name SongResource extends Resource

@export var audio_stream: AudioStream
@export_range(2,8) var time_sig: int = 4
@export var actual_bpm: int = 100
@export_subgroup("Offset")
@export var sec_offset: float = 0
@export var beat_offset: int = 0
@export var song_end: float = 0.0
@export_subgroup("Timing")
@export var intro: float = 20.0
@export var first_half: float = 40.0
@export var bridge: float = 50.0
@export var second_half: float = 70.0
@export var ending: float = 90.0
