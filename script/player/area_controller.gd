extends Area2D

signal buff_signaled

func add_buff(_buff: buff):
	buff_signaled.emit(_buff)
