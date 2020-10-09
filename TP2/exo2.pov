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
#declare points0 = array[n+1];
#declare points1 = array[n+1];
#declare rayon = 5;
#declare circle_color0 = color rgb<0,1,0>;
#declare circle_color1 = color rgb<1,0,0>;
#declare circle_radius = 0.5;

//#for (Identifier, Start, End [, Step])
#for (k, 0, n, 1)

    #local theta = k/n*2*pi;
    #local points0[k] = <rayon*cos(theta),rayon*sin(theta),0>;
    #local points1[k] = <rayon*cos(theta),rayon*sin(theta),0>;

#end // ----------- end of #for loop

//#for (Identifier, Start, End [, Step])
#for (k, 0, n-1, 1)

intersection {
    cylinder{
        points0[k],
        points0[k+1],
        circle_radius
        open
        pigment{ circle_color0 }
        rotate<0,0,45>
    }
    
}

    cylinder{
        points0[k],
        points0[k+1],
        circle_radius
        open
        pigment{ circle_color1 }
        translate<0,0,rayon>
        rotate<0,0,45>
    }

#end // ----------- end of #for loop

    
