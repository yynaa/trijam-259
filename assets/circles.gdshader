shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

uniform vec2 centers[128];
uniform float times[128];
uniform int amount;

uniform float ttime;
uniform vec2 gpos;

const vec4 defcols[10] = {
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.266,0.266,0.266,1.0),
	vec4(1.0,1.0,1.0,1.0),
	vec4(0.598,0.598,0.598,1.0),
	vec4(0.664,0.664,0.664,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0)
};
const vec4 palettes[50] = {
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.266,0.266,0.266,1.0),
	vec4(1.0,1.0,1.0,1.0),
	vec4(0.598,0.598,0.598,1.0),
	vec4(0.664,0.664,0.664,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0),

	vec4(0.0,0.2,0.0,1.0),
	vec4(0.266,1.0,0.266,1.0),
	vec4(0.8,1.0,0.8,1.0),
	vec4(0.598,1.0,0.598,1.0),
	vec4(0.664,1.0,0.664,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0),

	vec4(0.2,0.0,0.0,1.0),
	vec4(1.0,0.266,0.266,1.0),
	vec4(1.0,0.8,0.8,1.0),
	vec4(1.0,0.598,0.598,1.0),
	vec4(1.0,0.664,0.664,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0),

	vec4(0.5,0.5,0.0,1.0),
	vec4(1.0,1.0,0.266,1.0),
	vec4(1.0,1.0,0.6,1.0),
	vec4(1.0,1.0,0.598,1.0),
	vec4(1.0,1.0,0.664,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0),
	
	vec4(0.5,0.5,1.0,1.0),
	vec4(0.9,0.300,0.5,1.0),
	vec4(1.0,0.410,0.703,1.0),
	vec4(0.598,1.0,0.598,1.0),
	vec4(0.664,1.0,0.664,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0),
	vec4(0.0,0.0,0.0,1.0)
};

float random( float seed )
{
	return fract( 543.2543 * sin( dot( vec2( seed, seed ), vec2( 3525.46, -54.3415 ) ) ) );
}

float get_radius(float t)
{
	return 64.0*0.95*exp(-0.25*t)*atan(4.2*t);
}

vec4 translate_colors(vec4 color, int cnt) 
{
	float md = 10000.0;
	int mi = 0;
	for (int i = 0; i < 10; i++) {
		if (distance(color, defcols[i]) < md) {
			md = distance(color, defcols[i]);
			mi = i;
		}
	}
	
	color = palettes[mi+clamp(cnt, 0, 5)*10];
	return color;
}

void fragment( )
{
	vec2 fixed_uv = SCREEN_UV;
	vec4 pixel_color = textureLod( SCREEN_TEXTURE, fixed_uv, 0.0 );
	int cnt = 0;
	for (int i = 0; i < amount; i++)
	{
		float radius = get_radius(ttime - times[i]);
		if (distance(VERTEX, centers[i]-gpos) <= radius)
		{
			cnt ++;
		}
	}
	pixel_color = translate_colors(pixel_color, cnt);
	COLOR = pixel_color;
}