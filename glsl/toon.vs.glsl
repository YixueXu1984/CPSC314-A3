
#version 300 es

out vec3 n;
out vec3 v;

void main() {
	// TODO: PART 1E

	n = normalMatrix * normal;
    v = vec3(modelViewMatrix * vec4(position, 1.0));

    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}