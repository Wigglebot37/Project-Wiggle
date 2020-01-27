varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float blur;///Best set between 1 and 0
void main()
{
    gl_FragColor = texture2D( gm_BaseTexture,v_vTexcoord) * v_vColour;
    gl_FragColor += texture2D( gm_BaseTexture,v_vTexcoord+vec2(blur/100.0)) * v_vColour;
    gl_FragColor += texture2D( gm_BaseTexture,v_vTexcoord-vec2(blur/100.0)) * v_vColour;
    gl_FragColor += texture2D( gm_BaseTexture,v_vTexcoord+vec2(blur/100.0,0.0)) * v_vColour;
    gl_FragColor += texture2D( gm_BaseTexture,v_vTexcoord+vec2(0.0,blur/100.0)) * v_vColour;
    gl_FragColor += texture2D( gm_BaseTexture,v_vTexcoord+vec2(-blur/100.0,blur/100.0)) * v_vColour;
    gl_FragColor += texture2D( gm_BaseTexture,v_vTexcoord+vec2(blur/100.0,-blur/100.0)) * v_vColour;
    gl_FragColor += texture2D( gm_BaseTexture,v_vTexcoord+vec2(-blur/100.0,0.0)) * v_vColour;
    gl_FragColor += texture2D( gm_BaseTexture,v_vTexcoord+vec2(0.0,-blur/100.0)) * v_vColour;
    gl_FragColor.rgb /= 8.0;
}