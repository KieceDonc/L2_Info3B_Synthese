﻿#include "colors.inc"
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
// if dim = 10 you will have 10x10 spheres
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

#macro Couleur(k,col)
      #switch (k)
	#case (00)  #declare  col= Black;
	    #break
	#case (01)  #declare  col= White;
	    #break
	#case (02)  #declare  col= Red;
	    #break
	#case (03)  #declare  col= Green;
	    #break
	#case (04)  #declare  col= Blue;
	    #break
	#case (05)  #declare  col= Yellow;
	    #break
	#case (06)  #declare  col= Cyan;
	    #break
	#case (07)  #declare  col= Magenta;
	    #break
	#case (08)  #declare  col= Black;
	    #break
	#case (09)  #declare  col= Aquamarine;
	    #break
	#case (10)  #declare  col= BlueViolet;
	    #break
	#case (11)  #declare  col= Brown;
	    #break
	#case (12)  #declare  col= CadetBlue;
	    #break
	#case (13)  #declare  col= Coral;
	    #break
	#case (14)  #declare  col= CornflowerBlue;
	    #break
	#case (15)  #declare  col= DarkGreen;
	    #break
	#case (16)  #declare  col= DarkOliveGreen;
	    #break
	#case (17)  #declare  col= DarkOrchid;
	    #break
	#case (18)  #declare  col= DarkSlateBlue;
	    #break
	#case (19)  #declare  col= DarkSlateGray;
	    #break
	#case (20)  #declare  col= DarkTurquoise;
	    #break
	#case (21)  #declare  col= Firebrick;
	    #break
	#case (22)  #declare  col= ForestGreen;
	    #break
	#case (23)  #declare  col= Gold;
	    #break
	#case (24)  #declare  col= Goldenrod;
	    #break
	#case (25)  #declare  col= GreenYellow;
	    #break
	#case (26)  #declare  col= IndianRed;
	    #break
	#case (27)  #declare  col= Khaki;
	    #break
	#case (28)  #declare  col= LightBlue;
	    #break
	#case (29)  #declare  col= LightSteelBlue;
	    #break
	#case (30)  #declare  col= LimeGreen;
	    #break
	#case (31)  #declare  col= Maroon;
	    #break
	#case (32)  #declare  col= MediumAquamarine;
	    #break
	#case (33)  #declare  col= MediumBlue;
	    #break
	#case (34)  #declare  col= MediumForestGreen;
	    #break
	#case (35)  #declare  col= MediumGoldenrod;
	    #break
	#case (36)  #declare  col= MediumOrchid;
	    #break
	#case (37)  #declare  col= MediumSeaGreen;
	    #break
	#case (38)  #declare  col= MediumSlateBlue;
	    #break
	#case (39)  #declare  col= MediumSpringGreen;
	    #break
	#case (40)  #declare  col= MediumTurquoise;
	    #break
	#case (41)  #declare  col= MediumVioletRed;
	    #break
	#case (42)  #declare  col= MidnightBlue;
	    #break
	#case (43)  #declare  col= Navy;
	    #break
	#case (44)  #declare  col= NavyBlue;
	    #break
	#case (45)  #declare  col= Orange;
	    #break
	#case (46)  #declare  col= OrangeRed;
	    #break
	#case (47)  #declare  col= Orchid;
	    #break
	#case (48)  #declare  col= PaleGreen;
	    #break
	#case (49)  #declare  col= Pink;
	    #break
	#case (50)  #declare  col= Plum;
	    #break
	#case (51)  #declare  col= Salmon;
	    #break
	#case (52)  #declare  col= SeaGreen;
	    #break
	#case (53)  #declare  col= Sienna;
	    #break
	#case (54)  #declare  col= SkyBlue;
	    #break
	#case (55)  #declare  col= SlateBlue;
	    #break
	#case (56)  #declare  col= SpringGreen;
	    #break
	#case (57)  #declare  col= SteelBlue;
	    #break
	#case (58)  #declare  col= Tan;
	    #break
	#case (59)  #declare  col= Thistle;
	    #break
	#case (60)  #declare  col= Turquoise;
	    #break
	#case (61)  #declare  col= Violet;
	    #break
	#case (62)  #declare  col= VioletRed;
	    #break
	#case (63)  #declare  col= Wheat;
	    #break
	#case (64)  #declare  col= YellowGreen;
	    #break
	#case (65)  #declare  col= SummerSky;
	    #break
	#case (66)  #declare  col= RichBlue;
	    #break
	#case (67)  #declare  col= Brass;
	    #break
	#case (68)  #declare  col= Copper;
	    #break
	#case (69)  #declare  col= Bronze;
	    #break
	#case (70)  #declare  col= Bronze2;
	    #break
	#case (71)  #declare  col= Silver;
	    #break
	#case (72)  #declare  col= BrightGold;
	    #break
	#case (73)  #declare  col= OldGold;
	    #break
	#case (74)  #declare  col= Feldspar;
	    #break
	#case (75)  #declare  col= Quartz;
	    #break
	#case (76)  #declare  col= NeonPink;
	    #break
	#case (77)  #declare  col= DarkPurple;
	    #break
	#case (78while_index_y*while_index_x*1)  #declare  col= CoolCopper;
	    #break
	#case (80)  #declare  col= MandarinOrange;
	    #break
	#case (81)  #declare  col= LightWood;
	    #break
	#case (82)  #declare  col= MediumWood;
	    #break
	#case (83)  #declare  col= DarkWood;
	    #break
	#case (84)  #declare  col= SpicyPink;
	    #break
	#case (85)  #declare  col= SemiSweetChoc;
	    #break
	#case (86)  #declare  col= BakersChoc;
	    #break
	#case (87)  #declare  col= Flesh;
	    #break
	#case (88)  #declare  col= NewTan;
	    #break
	#case (89)  #declare  col= NewMidnightBlue;
	    #break
	#case (90)  #declare  col= MandarinOrange;
	    #break
	#case (91)  #declare  col= VeryDarkBrown;
	    #break
	#case (92)  #declare  col= DarkBrown;
	    #break
	#case (93)  #declare  col= GreenCopper;
	    #break
	#case (94)  #declare  col= DkGreenCopper;
	    #break
	#case (95)  #declare  col= DustyRose;
	    #break
	#case (96)  #declare  col= HuntersGreen;
	    #break
	#case (97)  #declare  col= Scarlet;
	    #break
	#case (98)  #declare  col= DarkTan;
	    #break
	#case (99)  #declare  col= White;
	    #break
    #end // fin switch
#end //fin macro