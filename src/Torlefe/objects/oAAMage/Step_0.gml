//Colisiones
//if (place_meeting(x,y,oWall)) instance_destroy();

if mouse_check_button(mb_left)
{
	x = followid.x + AAx
	y = followid.y + AAy
}

//Colisiones
if (place_meeting(x,y,oWall)) && (!mouse_check_button(mb_left))
	{
		instance_destroy(id)
	}

//AAinstances
if (instance_exists(id)) && (mouse_check_button_released(mb_left))
	{
		OGmx = mouse_x
		OGmy = mouse_y
		speed = 15
		direction = point_direction(x,y,OGmx,OGmy)
		AAcharges = 4
	}	