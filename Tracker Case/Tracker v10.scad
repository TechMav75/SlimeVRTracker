$fn=60;

WALL=2;                 //Wall thickness
BOARD=[45.5,51,13];     //X dimension of board 
                        //Y dimension of board (does not include jack 
                        //  overhang)
                        //Z dimension of board and jack
SWITCH=[3,7,4,6];      //X dimension for switch
                        //Y dimension for switch
                        //Z dimension for switch 
JACK=[16,38,16,1,18];   //X dimension of jack  
                        //Y dimension of jack 
                        //Z dimension of jack
                        //X offset from edge of board
                        //Y offset from edge of board
BELT=[26,4];            //Width of belt
                        //Belt Gap
BATTERY=[45.5,40,11];      //X dimension for Battery
                        //Y dimension for Battery
                        //Z dimension for Battery

Case() ;
//Lid() ;
  
//ScrewHole() ;



module Board() {
    union () {
        cube([BOARD[0],BOARD[1],BOARD[2]]);
        translate([JACK[3],JACK[4],0]) cube([JACK[0],JACK[1],JACK[2]]);
        translate([SWITCH[3],-SWITCH[0],0]) cube([SWITCH[1],SWITCH[0],SWITCH[2]]);
        }
    }    

module BeltSlot() {
    hull() {
        cylinder(d=BELT[1],h=25);
        translate([0,BELT[0]-BELT[1],0]) cylinder(d=BELT[1],h=25);
    }
}

module Battery() {
    cube([BATTERY[0],BATTERY[1],BATTERY[2]]);
    translate([WALL*2,0,0]) cube([BATTERY[0]-WALL*4,BOARD[1],BATTERY[2]]);
}

module ScrewHole() {
    hull() {
        cylinder(d=5.5,h=0.1);
        translate([0,0,6]) cylinder(d=6.5,h=0.1);
    }
    hull() {
        translate([0,-6,0]) cylinder(d=2,h=0.1);
        translate([0,-2.5,6]) cylinder(d=2,h=0.1);
    }
}
    

module Case() {
difference() {
hull() {    
translate([(JACK[2]/2+WALL+BATTERY[2]/2),0,(JACK[2]/2)+BATTERY[2]/2]) rotate ([270,0,0]) cylinder(d=JACK[2]+BATTERY[2],h=BOARD[1]+WALL);
translate([(JACK[2]/2+WALL+BOARD[0]+BATTERY[2]/2),0,(JACK[2]/2)+BATTERY[2]/2]) rotate ([270,0,0]) cylinder(d=JACK[2]+BATTERY[2],h=BOARD[1]+WALL);
}

translate([JACK[2]/2+WALL+BATTERY[2]/2,0,WALL+BATTERY[2]-1]) Board() ;
translate([WALL*3,WALL*3+SWITCH[1],0]) BeltSlot() ;
translate([WALL*9+BOARD[0]+BATTERY[2]/2,WALL*3+SWITCH[1],0]) BeltSlot() ;
translate([JACK[2]/2+WALL+BATTERY[2]/2,-1,WALL]) Battery() ;

translate([7.5,0,(JACK[2]/2)+BATTERY[2]/2]) rotate ([270,0,0]) ScrewHole();
translate([(JACK[2]/2+WALL*4+BOARD[0]+BATTERY[2]/2),0,(JACK[2]/2)+BATTERY[2]/2]) rotate ([270,0,0]) ScrewHole();
}
}

module Lid() {
    union () {
    difference() {
hull() {    
translate([(JACK[2]/2+WALL+BATTERY[2]/2),-WALL,(JACK[2]/2)+BATTERY[2]/2]) rotate ([270,0,0]) cylinder(d=JACK[2]+BATTERY[2],h=WALL);
translate([(JACK[2]/2+WALL+BOARD[0]+BATTERY[2]/2),-WALL,(JACK[2]/2)+BATTERY[2]/2]) rotate ([270,0,0]) cylinder(d=JACK[2]+BATTERY[2],h=WALL);
}
translate([JACK[2]/2+WALL+BATTERY[2]/2,0,WALL+BATTERY[2]-1]) Board() ;
translate([20.5,-2,22.5]) rotate([270,0,0]) CJack(5) ;
translate([41,-2,19.25]) rotate([270,0,0]) CJack(8) ;

translate([7.5,-2,(JACK[2]/2)+BATTERY[2]/2]) rotate ([270,0,0]) cylinder(d=3.5,h=BOARD[1]+WALL);
translate([(JACK[2]/2+WALL*4+BOARD[0]+BATTERY[2]/2),-2,(JACK[2]/2)+BATTERY[2]/2]) rotate ([270,0,0]) cylinder(d=3.5,h=BOARD[1]+WALL);

}
translate([37,-2,11.5]) cube([20,8,4]);
}
}


module CJack(D) {
    hull() {
        cylinder(d=D,h=5);
        translate([9,0,0]) cylinder(d=D,h=5);
    }
}