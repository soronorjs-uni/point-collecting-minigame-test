extends Line2D

@export var trail_point_limit = 30

func display_trail():
	if self.points.size() >= trail_point_limit && self.points.size() != 0:
		self.remove_point(0)
	else:
		self.add_point(get_parent().position)
