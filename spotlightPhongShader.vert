// spotlightPhongShader.vert
#version 330

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform vec3 generalBlueLightPos;
uniform vec3 reflectorBluePosition;

uniform vec3 generalYellowLightPos;
uniform vec3 reflectorYellowPosition;


uniform vec3 reflectorNormal;

in vec3 in_Pos;
in vec3 in_Normal;

out vec3 lightBlueDirection;
out vec3 lightYellowDirection;
out vec3 ex_NormalWorld;
out vec3 ex_Pos;

in vec2 in_TexCoord;
out vec2 ex_TexCoord;

void main(void) {
	ex_Pos = vec3(model * vec4(in_Pos,1.0));

	mat3 normalmatrix = transpose(inverse(mat3(model)));
	ex_NormalWorld = in_Normal * normalmatrix;

	lightBlueDirection = reflect(generalBlueLightPos - reflectorBluePosition, reflectorNormal);
	lightBlueDirection.x = -lightBlueDirection.x;

	lightYellowDirection = reflect(generalYellowLightPos - reflectorYellowPosition, reflectorNormal);
	lightYellowDirection.x = -lightYellowDirection.x;

	ex_TexCoord = in_TexCoord;

    gl_Position = projection * view * vec4(ex_Pos,1.0);

}