shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

uniform vec2 centers[128];
uniform float times[128];
uniform int amount;

uniform float ttime;

float random( float seed )
{
	return fract( 543.2543 * sin( dot( vec2( seed, seed ), vec2( 3525.46, -54.3415 ) ) ) );
}

float get_radius(float t)
{
	return 64.0*0.95*exp(-0.25*t)*atan(4.2*t);
}

void fragment( )
{
	vec2 fixed_uv = SCREEN_UV;
	vec4 pixel_color = textureLod( SCREEN_TEXTURE, fixed_uv, 0.0 );
	int cnt = 0;
	for (int i = 0; i < amount; i++)
	{
		float radius = get_radius(ttime - times[i]);
		if (distance(VERTEX, centers[i]) <= radius)
		{
			cnt ++;
		}
	}
	switch (cnt) {
		case 0:
			break;
		case 1:
			pixel_color = vec4(1.0,0.0,0.0,1.0);
			break;
		case 2:
			pixel_color = vec4(0.0,1.0,0.0,1.0);
			break;
		default:
			pixel_color = vec4(0.0,0.0,1.0,1.0);
			break;
	}
	COLOR = pixel_color;
}