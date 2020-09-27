/// @description Insert description here
// You can write your code in this editor

if instance_exists(oPlayer) {
move_towards_point(oPlayer.x, oPlayer.y, mask_speed);
}
mask_speed += 0.01;


if mask_hp < 1 {
	instance_destroy()
}


if place_meeting(x, y, oPlayer) {
	oPlayer.player_hp -= 1;
	instance_destroy();
	}
	
if place_meeting(x,y, oAAMage) {
	mask_hp -= 1;
}