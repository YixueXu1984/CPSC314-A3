#version 300 es

out vec3 nb;
out vec3 vb;

out float distToCam;

void main() {

	// TODO: PART 1C
		nb = normalMatrix * normal;
        vb = vec3(modelViewMatrix * vec4(position, 1.0));

        distToCam = vec4(projectionMatrix * viewMatrix * modelMatrix * vec4(position,1.0)).w;

    gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position,1.0);
}
