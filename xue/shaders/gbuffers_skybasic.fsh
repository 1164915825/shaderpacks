#version 120

uniform int fogMode;

varying vec4 color;
varying vec2 normal;

/* DRAWBUFFERS:02 */
void main() {
	gl_FragData[0] = color;
	if(fogMode == 9729)
		gl_FragData[0].rgb = mix(gl_Fog.color.rgb, gl_FragData[0].rgb, clamp((gl_Fog.end - gl_FogFragCoord) / (gl_Fog.end - gl_Fog.start), 0.0, 1.0));
	else if(fogMode == 2048)
		gl_FragData[0].rgb = mix(gl_Fog.color.rgb, gl_FragData[0].rgb, clamp(exp(-gl_FogFragCoord * gl_Fog.density), 0.0, 1.0));
	gl_FragData[1] = vec4(normal, 0.0, 1.0);
}