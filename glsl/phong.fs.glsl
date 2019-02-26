#version 300 es

uniform vec3 spotlightPosition;
uniform vec3 lightDirectionUniform;

uniform float kSpecularUniform;
uniform float shininessUniform;
uniform float kAmbientUniform;
uniform float kDiffuseUniform;

in vec3 n;
in vec3 v;

out vec4 out_FragColor;


void main() {
	//TODO: PART 1A
	vec3 nn = normalize(n);
	vec3 l = normalize(vec3(viewMatrix * vec4(lightDirectionUniform, 0.0)));
	vec3 vv = normalize(-v);

	//AMBIENT
	vec3 ambientColor = vec3(0.4, 0.4, 0.4);
	vec3 lightColor = vec3(1.0, 1.0, 1.0);

	vec3 light_AMB = ambientColor * kAmbientUniform;

	//DIFFUSE
	float diffuse = max(0.0, dot(nn,l));
	vec3 dIntensity = lightColor * diffuse;
	vec3 light_DFF = dIntensity * kDiffuseUniform;

	//SPECULAR
	vec3 b = normalize(-l + (2.0 * dot(l,nn) * n));
	float specular = max(0.0, dot(b,vv));
	float sIntensity = pow(specular, shininessUniform);
	vec3 light_SPC = sIntensity * lightColor * kSpecularUniform;

	//TOTAL
	vec3 TOTAL = light_AMB + light_DFF + light_SPC;
	out_FragColor = vec4(TOTAL, 1.0);
	}