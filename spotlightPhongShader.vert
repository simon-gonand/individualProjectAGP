// spotlightPhongShader.vert
#version 330

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
uniform vec3 generalLightPos;
uniform vec3 reflectorPosition;
uniform vec3 reflectorNormal;

in vec3 in_Pos;
in vec3 in_Normal;

out vec3 lightDirection;
out vec3 ex_NormalWorld;
out vec3 ex_Pos;

in vec2 in_TexCoord;
out vec2 ex_TexCoord;

void main(void) {
	ex_Pos = vec3(model * vec4(in_Pos,1.0));

	mat3 normalmatrix = transpose(inverse(mat3(model)));
	ex_NormalWorld = in_Normal * normalmatrix;

	lightDirection = reflect(generalLightPos - reflectorPosition, reflectorNormal);
	lightDirection.x = -lightDirection.x;

	ex_TexCoord = in_TexCoord;

    gl_Position = projection * view * vec4(ex_Pos,1.0);

}