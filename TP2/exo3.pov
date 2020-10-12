#include "colors.inc"
#include "skies.inc"
//#include "choixCouleur.inc"
#declare boolciel=1;
#if (boolciel)
sky_sphere {
    S_Cloud5
    rotate <0,0,0>
}
#end

background { color rgb<1,1,1> }

camera{
	location <30,30,30>
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


#declare sphere_radius = 0.5;
#declare dim = 10;
#declare distance_scale_factor = 2;
#declare start_distance = 1.5;

#declare while_index_x = 0; // array dim x
#declare current_coord_x = start_distance;
// basically create point which are the center of the sphere
// you start at x=2.5 and shift x by 7.5 every time to generate the next sphere center point
// you start at y=2.5 and shift y by 7.5 every time to generate the next sphere center point
// if dim = 10 you will have 10x10 sphere
#while(while_index_x < dim)
  
    #declare while_index_y = 0; // array dim y
    #declare current_coord_y = start_distance;
    #while(while_index_y < dim)

        #declare random0 = rand(seed(while_index_y*while_index_x*1));//int(seed(100)); random_color_index
        #declare random1 = rand(seed(while_index_y*while_index_x*2));//int(seed(100)); random_color_index
        #declare random2 = rand(seed(while_index_y*while_index_x*3));//int(seed(100)); random_color_index
        sphere{
            <current_coord_x,0,current_coord_y>, sphere_radius
            pigment{
                color rgbt<random0,random1,random2,0>
            }
        }

        #declare while_index_y = while_index_y + 1;
        #declare current_coord_y = current_coord_y + 0.75*distance_scale_factor ;
    #end
 
    #declare while_index_x = while_index_x + 1;
    #declare current_coord_x = current_coord_x + 0.75*distance_scale_factor;
#end


