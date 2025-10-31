shader_type canvas_item;

uniform sampler2D screen_tex : hint_screen_texture;
uniform float saturation : hint_range(0.0, 1.0) = 0.0;

void fragment() {
    vec4 c = texture(screen_tex, SCREEN_UV);
    float g = dot(c.rgb, vec3(0.299, 0.587, 0.114));
    c.rgb = mix(vec3(g), c.rgb, saturation);
    COLOR = c;
}