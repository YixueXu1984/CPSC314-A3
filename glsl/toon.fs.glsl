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


	//TOTAL INTENSITY
	//TODO PART 1E: calculate light intensity (ambient+diffuse+speculars' intensity term)

	vec3 nbn = normalize(n);
    vec3 lb = normalize(vec3(viewMatrix * vec4(lightDirectionUniform, 0.0)));
    vec3 vbv = normalize(-v);

	float lightIntensity = max(0.0, dot(lb,nbn));

   	vec4 resultingColor = vec4(0.0,0.0,0.0,0.0);

   	//TODO PART 1E: change resultingColor based on lightIntensity (toon shading)

   	if (lightIntensity > 0.8) {
   	resultingColor = vec4(0.9,0.0,0.0,1.0);
   	}
   	else if (lightIntensity > 0.6) {
    resultingColor = vec4(0.75,0.0,0.0,1.0);
    }
   	else if (lightIntensity > 0.4) {
   	resultingColor = vec4(0.5,0.0,0.0,1.0);
   	}
   	else if (lightIntensity > 0.2)  {
   	resultingColor = vec4(0.3,0.0,0.0,1.0);
   	}
   	else {
   	   	resultingColor = vec4(0.1,0.0,0.0,1.0);
   	}


   	//TODO PART 1E: change resultingColor to silhouette objects

	out_FragColor = resultingColor;
}
