/// @description Insert description here
// You can write your code in this editor
if oPlayer.draw_bolt == 1 and instance_exists(oPlayer.bolted_dude) {
	while oPlayer.frames_elapsed < oPlayer.frames_alive {
		//draw_sprite_ext(sBolt,0, oPlayer.x, oPlayer.y, 1 , oPlayer.bolt_range/oPlayer.bolt_step, 180 + point_direction(oPlayer.x, oPlayer.y, oPlayer.bolted_dude.x, oPlayer.bolted_dude.y), c_white, 1)
		draw_sprite_pos(sBolt, 0, oPlayer.x, oPlayer.y, oPlayer.bolted_dude.x+10, oPlayer.bolted_dude.y+10, oPlayer.bolted_dude.x, oPlayer.bolted_dude.y, oPlayer.x, oPlayer.y+10, 1);
		oPlayer.frames_elapsed +=1; 
		oPlayer.draw_bolt = 0;
		oPlayer.bolted_dude.mask_hp -= 2;
	}
}

oPlayer.frames_elapsed = 0;