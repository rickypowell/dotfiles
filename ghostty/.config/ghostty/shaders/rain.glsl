// Simple rain shader effect

#define LIGHT_RAIN

#ifdef LIGHT_RAIN
	#define LAYERS 50
	#define DEPTH .3
	#define WIDTH .4
	#define SPEED .8
#else // HEAVY RAIN
	#define LAYERS 100
	#define DEPTH .2
	#define WIDTH .6
	#define SPEED 1.2
#endif

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	const mat3 p = mat3(13.323122,23.5112,21.71123,21.1212,28.7312,11.9312,21.8112,14.7212,61.3934);
	vec2 uv = fragCoord.xy / iResolution.xy;

	vec3 acc = vec3(0.0);
	for (int i = 0; i < LAYERS; i++) {
		float fi = float(i);
		vec2 q = uv * (1.0 + fi * DEPTH);
		q += vec2(q.x * (WIDTH * mod(fi * 7.238917, 1.0) - WIDTH * 0.5), SPEED * iTime / (1.0 + fi * DEPTH * 0.03));
		vec3 n = vec3(floor(q), 31.189 + fi);
		vec3 m = floor(n) * 0.00001 + fract(n);
		vec3 mp = (31415.9 + m) / fract(p * m);
		vec3 r = fract(mp);
		vec2 s = abs(mod(q, 1.0) - 0.5 + 0.9 * r.xy - 0.45);
		s += 0.01 * abs(2.0 * fract(10.0 * q.yx) - 1.0);
		float d = 0.5 * max(s.x - s.y, s.x + s.y) + max(s.x, s.y) - 0.01;
		float edge = 0.003 + 0.04 * min(0.5 * fi, 1.0);
		acc += vec3(smoothstep(edge, -edge, d) * (r.x / (1.0 + 0.015 * fi * DEPTH)));
	}

	// Sample the terminal screen texture including alpha channel
	vec4 terminalColor = texture(iChannel0, uv);

	// Rain color (light blue-ish)
	vec3 rainColor = vec3(0.7, 0.8, 1.0);

	// Combine the rain effect with the terminal color
	vec3 blendedColor = terminalColor.rgb + acc * rainColor;

	// Use the terminal's original alpha
	fragColor = vec4(blendedColor, terminalColor.a);
}
