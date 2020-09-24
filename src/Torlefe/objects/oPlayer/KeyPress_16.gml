//Blink
blink_range = 600


x = x + lengthdir_x(blink_range, point_direction(x, y, mouse_x, mouse_y))
y = y + lengthdir_y(blink_range, point_direction(x, y, mouse_x, mouse_y))
hsp = 0
vsp = 0