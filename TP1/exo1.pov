background { color rgb<1,1,1> }

camera{
	location <20,20,20>
	look_at <0,0,0>
}

light_source { <20,20,20>, color rgb<1,1,1> }

#macro fleche(cylinderStartPoint, cylinderEndPoint, RadiusCylinder, ConeEndPoint, radiusCone, color)

cylinder{
	cylinderStartPoint,           // center of one end
	cylinderEndPoint,             // center of other end
	radiusCylinder                // radius
	open                          // remove end caps
	pigment{ color }              // color of the cylinder
}
cone{
	cylinderEndPoint,             // center and radius of one end
	coneEndPoint, radiusCone      // center and radius of other end
	pigment{ color }              // color of the cone
}

#end

#declare radiusCylinder = 0.5
fleche(<0,0,0>,radiusCylinder,<15,0,0>,0,color rgb<1,0,0>)
fleche(<0,0,0>,radiusCylinder,<0,15,0>,0,color rgb<0,1,0>)
fleche(<0,0,0>,radiusCylinder,<0,0,15>,0,color rgb<0,0,1>)		

