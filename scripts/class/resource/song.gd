class_name SongResource extends Resource

@export var audio_stream: AudioStream
@export_range(2,8) var time_sig: int = 4
@export var actual_bpm: int = 100
@export_range(0,12) var start_offset: int = 0
