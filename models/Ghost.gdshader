shader_type spatial;
render_mode cull_disabled;

uniform float Amplitude = 0.3;
uniform float Speed = 1.0;
uniform float Frequency = 3.0;
uniform float CFrequency = 3.0;
uniform vec3 Modifier = vec3(1.0,1.0,1.0);
uniform vec4 color: source_color;

vec2 cart2polar(vec2 cart){
	vec2 polar =  vec2(0.0);
	polar.x = length(cart);
	polar.y = atan(cart.y,cart.x);
	return polar;
}

void vertex() {
	vec2 uv = cart2polar(UV - 0.5);
	VERTEX.y += (Amplitude  * pow(uv.x,2.0 )) * cos(Frequency *( uv.x) - TAU * Speed * TIME);
}

void fragment() {
	vec2 uv = cart2polar(UV - 0.5);
	float rip = cos(CFrequency *( uv.x) - TAU * Speed * TIME);
	
	ALBEDO = vec3(rip * .5 + 1.0) * color.rgb;
	ALPHA = max(rip * .5 + .5, 0.1);
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
