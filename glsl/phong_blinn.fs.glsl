#version 300 es

uniform vec3 spotlightPosition;
uniform vec3 lightDirectionUniform;

uniform float kSpecularUniform;
uniform float shininessUniform;
uniform float kAmbientUniform;
uniform float kDiffuseUniform;

in vec3 nb;
in vec3 vb;

out vec4 out_FragColor;

void main() {

	//TODO: PART 1B
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

	//SPECULAR
	vec3 bv = normalize(lb+vbv);
	float specular = max(0.0, dot(bv, nbn));
	float sIntensity = pow(specular,shininessUniform);
	vec3 light_SPC = vec3(sIntensity) * kSpecularUniform;

	//TOTAL
	vec3 TOTAL = light_AMB + light_DFF + light_SPC;
	out_FragColor = vec4(TOTAL, 1.0);
	}