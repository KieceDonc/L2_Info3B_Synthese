background { color rgb<1,1,1> }

camera{
	location <10,0,40> // x,z,y
	look_at <10,0,0>
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
fleche(<0,0,0>,<10,0,0>,radiusCylinder,<15,0,0>,0,color rgb<1,0,0>) // x 
fleche(<0,0,0>,<0,10,0>,radiusCylinder,<0,15,0>,0,color rgb<0,0,1>) // z
fleche(<0,0,0>,<0,0,10>,radiusCylinder,<0,0,15>,0,color rgb<0,1,0>) // y

#macro _torus(_translate,_rotate,_color)
  torus {
    5, 0.5              // major and minor radius
    rotate _rotate       // so we can see it from the top
    translate _translate
    pigment { _color }
  }
#end

_torus(<0,4,0>,<95,5,0>,color rgb<1,0,0>)
_torus(<7,0,0>,<90,0,0>,color rgb<100/256,1,100/256>)
_torus(<14,4,0>,<95,5,0>,color rgb<0,0,0>)
_torus(<21,0,0>,<90,0,0>,color rgb<1,1,0>)
_torus(<28,4,0>,<95,5,0>,color rgb<0,100/256,1>)
