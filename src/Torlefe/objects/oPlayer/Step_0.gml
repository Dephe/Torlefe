//Player input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);
key_jump_held = keyboard_check(vk_space);

//Movement
//Left and right
var move = key_right - key_left;

hsp = move * walksp;
vsp = vsp + grv;

//Jump
if (place_meeting(x,y+1,oWall)) and (key_jump)
{
	vsp = vsp + jumpsp;
	
}

//Held jump

if (vsp < 0) and (!key_jump_held) 
{
	vsp = max(vsp, jumpsp/3)
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

//Animation

if (hsp != 0) && (vsp == 0) sprite_index = sNoviceR; else sprite_index = sNovice;

if (hsp != 0) image_xscale = sign(hsp);

