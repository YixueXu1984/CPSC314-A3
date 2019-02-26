#version 300 es

out vec3 nb;
out vec3 vb;

void main() {

	// TODO: PART 1B
	nb = normalMatrix * normal;
    vb = vec3(modelViewMatrix * vec4(position, 1.0));
   
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}