/// @desc Core Player Logic

//get player inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

//calculate movement
var _move = key_right - key_left;

hsp = _move*walksp;

vsp = vsp + grv;

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