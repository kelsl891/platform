 /// @desc Core Player Logic

//get player inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

//calculate movement
var _move = key_right - key_left;

hsp = _move*walksp;

vsp = vsp + grv;

if(place_meeting(x,y+1,obj_invisible_wall)) && (key_jump)
{
	vsp=-jumpsp;
}

//Horizontal collision

if(place_meeting(x+hsp,y,obj_invisible_wall))
{
	while(!place_meeting(x+sign(hsp),y,obj_invisible_wall))
	{
		x=x+sign(hsp);
	}
	hsp=0;
}
x=x+hsp;
//Verical collision

if(place_meeting(x,y+vsp,obj_invisible_wall))
{
	while(!place_meeting(x,y+sign(vsp),obj_invisible_wall))
	{
		y=y+sign(vsp);
	}
	vsp=0;
}
y=y+vsp;

//Animation

if(!place_meeting(x,y+1,obj_invisible_wall))
{
	sprite_index = spr_player_jump;
	image_speed = 0;
	if(vsp>0) image_index = 1; else image_index = 0;
}else{
	image_speed = 1;
	if(hsp == 0)
	{
		sprite_index = spr_player;
	}else{
		sprite_index = spr_player_run;
	}
}

//if(hsp != 0) image_xscale = sign(hsp);