// phongShader.frag
#version 330

precision highp float;

struct lightStruct {
	vec4 ambient;
	vec4 diffuse;
	vec4 specular;
	vec3 direction;
	float cutOff;
};

struct materialStruct {
	vec4 ambient;
	vec4 diffuse;
	vec4 specular;
	float shininess;
};

uniform lightStruct light;
uniform vec3 lightDirection;
uniform float lightCutOff;
uniform materialStruct material;
uniform sampler2D textureUnit0;

in vec2 ex_TexCoord;

in vec3 ex_N;
in vec3 ex_V;
in vec3 ex_L;

layout(location = 0) out vec4 out_Color;

void main (void){
	float theta = dot(-ex_L, normalize(lightDirection));

	if (theta > 0.8){
		//vec4 ambientI = light.ambient * material.ambient;
		//vec4 diffuseI = light.diffuse * material.diffuse;
		//diffuseI = diffuseI * max(dot(normalize(ex_N),normalize(ex_L)),0);

		//vec3 R = normalize(reflect(normalize(-ex_L),normalize(ex_N)));

		//vec4 specularI = light.specular * material.specular;
		//specularI = specularI * pow(max(dot(R,ex_V),0), material.shininess);

		//out_Color = (ambientI + diffuseI + specularI) * texture(textureUnit0, ex_TexCoord);
		out_Color = vec4(1.0, 1.0, 1.0, 1.0);
	}
	else
		out_Color = vec4(light.ambient.xyz * vec3(texture (textureUnit0, ex_TexCoord)), 1.0);

	//out_Color = vec4(theta,theta,theta,1.0);

}