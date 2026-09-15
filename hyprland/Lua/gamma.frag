#version 300 es
precision mediump float;
in vec2 v_texcoord;
out vec4 fragColor;
uniform sampler2D tex;

void main() {
    vec4 color = texture(tex, v_texcoord);

    // Adjust gamma (more low  = more darker)
    float gamma = 0.87;
    color.rgb = pow(color.rgb, vec3(1.0 / gamma));

    // Adjust saturation (more high = more vivid)
    float saturation = 1.20;
    vec3 grayscale = vec3(dot(color.rgb, vec3(0.299, 0.587, 0.114)));
    color.rgb = mix(grayscale, color.rgb, saturation);

    // Reduce yellow tint
    vec3 colorBalance = vec3(0.97, 0.97, 1.0);
    color.rgb *= colorBalance;

    fragColor = color;
}
