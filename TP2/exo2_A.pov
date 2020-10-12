#include "colors.inc"
#include "skies.inc"
#declare boolciel=1;
#if (boolciel)
sky_sphere {
    S_Cloud5
    rotate <0,0,0>
}
#end

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

fleche(<0,0,0>,<10,0,0>,radiusCylinder,<15,0,0>,0,color rgb<1,0,0>) // x 
fleche(<0,0,0>,<0,10,0>,radiusCylinder,<0,15,0>,0,color rgb<0,0,1>) // z
fleche(<0,0,0>,<0,0,10>,radiusCylinder,<0,0,15>,0,color rgb<0,1,0>) // y



#declare n = 4;
#declare face0 = array[n+1];
#declare rayon = 5;
#declare circle_radius = 0.5;

//#for (Identifier, Start, End [, Step])
#for (k, 0, n, 1)

    #local theta = k/n*2*pi;
    #local face0[k] = <rayon*cos(theta),rayon*sin(theta),0>;

#end // ----------- end of #for loop


#macro constructOneFace(faceArray,faceLength,faceCircleRadius,faceTranslate,faceRotation,faceColor,faceColorWithTransparence)
    #for (k, 0, faceLength-1, 1)

        cylinder{
            faceArray[k],
            faceArray[k+1],
            faceCircleRadius
            open
            pigment{ faceColor }
            rotate faceRotation
            translate faceTranslate
        }
        

        polygon {
            faceLength,
            #declare loop = 0;
            #while (loop < faceLength)
                faceArray[loop]
                #if (loop<faceLength-1)
                ,
                #end
                #declare loop = loop + 1;
            #end
            rotate faceRotation
            translate faceTranslate
            pigment { faceColorWithTransparence }
        }

    #end // ----------- end of #for loop
#end
constructOneFace(face0,n,circle_radius,<0,0,0>,<0,0,45>, color rgb<1,0,0>,color rgbt<1,0,0,0.5>)
constructOneFace(face0,n,circle_radius,<0,0,rayon+circle_radius*4>,<0,0,45>, color rgbf<0,1,0>,color rgbt<0,1,0,0.5>)
constructOneFace(face0,n,circle_radius,<0,rayon/2+circle_radius*2,rayon/2+circle_radius*2>,<90,45,0>, color rgbf<0,0,1>,color rgbt<0,0,1,0.5>) // x,z,y
constructOneFace(face0,n,circle_radius,<0,-rayon/2-circle_radius*2,rayon/2+circle_radius*2>,<90,45,0>, color rgbf<1,0,1>,color rgbt<1,0,1,0.5>) // x,z,y
constructOneFace(face0,n,circle_radius,<-rayon/2-circle_radius*2,0,+rayon/2+circle_radius*2>,<90,45,90>, color rgbf<0,1,1>,color rgbt<0,1,1,0.5>)
constructOneFace(face0,n,circle_radius,<rayon/2+circle_radius*2,0,+rayon/2+circle_radius*2>,<90,45,90>, color rgbf<1,1,0>,color rgbt<1,1,0,0.5>)