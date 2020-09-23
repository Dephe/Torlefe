//Player input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

//Movement
var move = key_right - key_left;

hsp = move * walksp;
vsp = vsp + grv

if (place_meeting(x,y+1,oWall)) and (key_jump)
{
	vsp = vsp -7;
	
}


//Collision
//Horizontal

if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x +sign(hsp);
	}
	hsp=0;
}

x = x + hsp; 

//Vertical
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y +sign(vsp);
	}
	vsp=0;
}

y = y + vsp; 