#version 300 es

uniform vec3 spotlightPosition;

out vec3 n;
out vec3 v;

void main() {

    // TODO: PART 1A

    n = normalMatrix * normal;
    v = vec3(modelViewMatrix * vec4(position, 1.0));
   
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}