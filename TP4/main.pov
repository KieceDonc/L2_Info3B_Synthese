#include "colors.inc"
#include "skies.inc"
#declare boolciel=1;
#if (boolciel)
sky_sphere {
    S_Cloud5
}
#end

background { color rgb<1,1,1> }

camera{
	location <0,-15,0>
	look_at <0,0,0>
    right <-image_width/image_height,0,0>
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
/*
fleche(<0,0,0>,<10,0,0>,radiusCylinder,<15,0,0>,0,color rgb<1,0,0>) // x 
fleche(<0,0,0>,<0,10,0>,radiusCylinder,<0,15,0>,0,color rgb<0,0,1>) // z
fleche(<0,0,0>,<0,0,10>,radiusCylinder,<0,0,15>,0,color rgb<0,1,0>) // y
*/
#declare pigment_color = color rgb<1,1,1>;
#macro circle_twocut(_translate)
    object{
        intersection{
            sphere{
                <0,0,0>,1
                pigment{
                    pigment_color
                }
            }
            plane{
                <1,0,0>, sqrt(2)/2
            }
            plane{
                <-1,0,0>, sqrt(2)/2
            }
        } 
        translate _translate
    }
#end 

#macro circle_onecutleft(_translate)
    object{
        intersection{
            sphere{
                <0,0,0>,1
                pigment{
                    pigment_color
                }
            }
            plane{
                <-1,0,0>, sqrt(2)/2
            }
        } 
        translate _translate
    }
#end

#macro circle_onecutright(_translate)
    object{
        intersection{
            sphere{
                <0,0,0>,1
                pigment{
                    pigment_color
                }
            }
            plane{
                <1,0,0>, sqrt(2)/2
            }
        } 
        translate _translate
    }
#end

circle_twocut(<0,0,0>)
circle_twocut(<4,0,0>)
circle_twocut(<-4,0,0>)
circle_onecutleft(<8,0,0>)
circle_onecutright(<-8,0,0>)

cylinder{
    <0,0,1.5>,<0,0,5.5>,1/8
    pigment_color
}
cylinder{
    <3/2,0,7>,<5/2,0,7>,1/8
    pigment_color
}
intersection{
    torus {
        3/2, 1/8              // major and minor radius
        pigment { pigment_color }
    }
    box{
        <-2,2,2>, <0,-2,0>
        pigment{
            rgbt<0,0,0,1>
        }
    }
    translate<1.5,0,5.5>
}
#declare P0 = 
lathe{
// nombre de points dans
    bezier_spline 
    4,
    P0
    P1
    P2
    P3
    pigment{
        pigment_color
    }
}