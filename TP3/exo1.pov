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
	location <10,10,10>
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

#declare radiusCylinder = 0.5;

fleche(<0,0,0>,<10,0,0>,radiusCylinder,<15,0,0>,0,color rgb<1,0,0>) // x 
fleche(<0,0,0>,<0,10,0>,radiusCylinder,<0,15,0>,0,color rgb<0,0,1>) // z
fleche(<0,0,0>,<0,0,10>,radiusCylinder,<0,0,15>,0,color rgb<0,1,0>) // y


#declare P0=<0.6,4>;
#declare P1=<1,1>;
#declare P2=<2,1>;
#declare P3=<2.5,0>;
#declare M0=P3;
#declare M1=<3,-1>;
#declare M2=<3,-3>;
#declare M3=<0.5,-2>;

lathe{
// nombre de points dans 
    bezier_spline
    4,
    P0
    P1
    P2
    P3
    pigment{
        color rgb<1,0,0>
    }
}
lathe{
// nombre de points dans
    bezier_spline 
    4,
    M0
    M1
    M2
    M3
    pigment{
        color rgb<0.5,0.5,0.5>
    }
}

#declare cylinder_radius = 0.1;
#macro create_cylinder(_P0,_P1,_color)

    cylinder{
        _P0,
        _P1,
        cylinder_radius
        open
        pigment{ _color }
    }

#end

#declare default_cylinder_color = color rgb<0.75,0.75,0.75>;
create_cylinder(P0,P1,default_cylinder_color)
create_cylinder(P1,P2,default_cylinder_color)
create_cylinder(P2,P3,default_cylinder_color)
create_cylinder(M0,M1,default_cylinder_color)
create_cylinder(M1,M2,default_cylinder_color)
create_cylinder(M2,M3,default_cylinder_color)

#declare blue_cylinder_color = color rgb<0,0,1>;
#declare precision_n = 10;
#macro create_bezier(_P0,_P1,_P2,_P3)
    #for (_t, 0, 1,1/precision_n)
        #declare _x0 = pow((1-_t),3)*_P0.x + 3*_t*pow((1-_t),2)*_P1.x+3*pow(_t,2)*(1-_t)*_P2.x+pow(_t,3)*_P3.x;
        #declare _y0 = pow((1-_t),3)*_P0.y + 3*_t*pow((1-_t),2)*_P1.y+3*pow(_t,2)*(1-_t)*_P2.y+pow(_t,3)*_P3.y;
        //#declare _x1 = pow((1-_t+1/precision_n),3)*_P0.x + 3*_t*pow((1-_t+1/precision_n),2)*_P1.x+3*pow(_t+1/precision_n,2)*(1-_t)*_P2.x+pow(_t+1/precision_n,3)*_P3.x;
        //#declare _y1 = pow((1-_t+1/precision_n),3)*_P0.y + 3*_t*pow((1-_t+1/precision_n),2)*_P1.y+3*pow(_t+1/precision_n,2)*(1-_t)*_P2.y+pow(_t+1/precision_n,3)*_P3.y;
        #declare temp_t = _t+1/precision_n;
        #declare _x1 = pow((1-temp_t),3)*_P0.x + 3*temp_t*pow((1-temp_t),2)*_P1.x+3*pow(temp_t,2)*(1-temp_t)*_P2.x+pow(temp_t,3)*_P3.x;
        #declare _y1 = pow((1-temp_t),3)*_P0.y + 3*temp_t*pow((1-temp_t),2)*_P1.y+3*pow(temp_t,2)*(1-temp_t)*_P2.y+pow(temp_t,3)*_P3.y;
        create_cylinder(<_x0,_y0,0>,<_x1,_y1,0>,blue_cylinder_color)
    #end
#end 

create_bezier(P0,P1,P2,P3)
create_bezier(M0,M1,M2,M3)