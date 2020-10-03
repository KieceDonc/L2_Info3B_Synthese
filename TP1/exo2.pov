background { color rgb<1,1,1> }

camera{
	location <20,20,20>
	look_at <0,0,0>
}

light_source { <20,20,20>, color rgb<1,1,1> }

#macro fleche(cylinderStartPoint, cylinderEndPoint, RadiusCylinder, coneEndPoint, radiusCone, Color)

cylinder{
	cylinderStartPoint,           // center of one end
	cylinderEndPoint,             // center of other end
	radiusCylinder                // radius
	open                          // remove end caps
	pigment { Color }             // color of the cylinder
}
cone{
	cylinderEndPoint, 1           // center and radius of one end
	coneEndPoint, radiusCone      // center and radius of other end
	pigment { Color }             // color of the cone
}

#end

#declare radiusCylinder = 0.5;
#declare u_vector = <(-70/9),(40/9),(-40/9)>;
#declare u_coneEndPoint = <(-70/9)-(35/9),(40/9)+(20/9),(-40/9)+(-20/9)>;
#declare v_vector = <(40/9),(80/9),10>;
#declare v_coneEndPoint = <(40/9)+(20/9),(80/9)+(40/9),10+5>;
#declare w_vector = <(40/9),-10,(80/9)>;
#declare w_coneEndPoint = <(40/9)+(20/9),-10+(-5),(80/9)+(40/9)>;
fleche(<0,0,0>,<10,0,0>,radiusCylinder,<15,0,0>,0,color rgb<1,0,0>) // x 
fleche(<0,0,0>,<0,10,0>,radiusCylinder,<0,15,0>,0,color rgb<0,0,1>) // z
fleche(<0,0,0>,<0,0,10>,radiusCylinder,<0,0,15>,0,color rgb<0,1,0>) // y
fleche(<0,0,0>,u_vector,radiusCylinder,u_coneEndPoint,0,color rgb<1,1,0>) // u 
fleche(<0,0,0>,v_vector,radiusCylinder,v_coneEndPoint,0,color rgb<1,0,1>) // v
fleche(<0,0,0>,w_vector,radiusCylinder,w_coneEndPoint,0,color rgb<0,1,1>) // w


