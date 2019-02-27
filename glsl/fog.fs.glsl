#version 300 es

uniform float fogDensity;
uniform vec3 spotlightPosition;
uniform vec3 lightDirectionUniform;

uniform float kSpecularUniform;
uniform float shininessUniform;
uniform float kAmbientUniform;
uniform float kDiffuseUniform;

in vec3 nb;
in vec3 vb;
in float distToCam;


out vec4 out_FragColor;

void main() {

	// TODO: PART 1C

		vec3 lightFogColor = vec3(0.5, 0.5, 0.5);

			vec3 nbn = normalize(nb);
        	vec3 lb = normalize(vec3(viewMatrix * vec4(lightDirectionUniform, 0.0)));
        	vec3 vbv = normalize(-vb);

    	//AMBIENT
    		vec3 ambientColor = vec3(0.4, 0.4, 0.4);
        	vec3 lightColor = vec3(1.0, 1.0, 1.0);
        	vec3 light_AMB = ambientColor * kAmbientUniform;

    	//DIFFUSE
    	float diffuse = max(0.0, dot(nbn,lb));
        vec3 dIntensity = lightColor * diffuse;
        vec3 light_DFF = dIntensity * kDiffuseUniform;

        float fogLevel = 1.0/(exp(distToCam * fogDensity));



	vec3 TOTAL = light_AMB + light_DFF ;
	out_FragColor = mix(vec4(TOTAL, 1.0), vec4(lightFogColor, 1.0), 1.0 - fogLevel);

	//out_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
}
