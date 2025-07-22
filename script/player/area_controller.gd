extends Area2D

signal buff_signaled
signal pickup_area_entered
signal pickup_item


func add_buff(_buff: buff):
	buff_signaled.emit(_buff)

func in_pickup_range(res):
	if res.autopick:
		pickup_item.emit(res)
