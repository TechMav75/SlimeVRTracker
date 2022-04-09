$fn=360;

WALL=2;  //Wall thickness
BOARD=[27,32,12];;      //X dimension of board 
                        //Y dimension of board (does not include jack overhang)
                        //Z dimension of board and jack
JACK=[16,18,16,6,-4];   //X dimension of jack  
                        //Y dimension of jack 
                        //Z dimension of jack
                        //X offset from edge of board
                        //Y offset from edge of board
BELT=[26,4];            //Width of belt
                        //Belt Gap
    
Case() ;
//Lid() ;

    
module Aux_Board() {
    union () {
        cube([BOARD[0],BOARD[1],BOARD[2]]);
        translate([JACK[3],JACK[4]-WALL*3,0]) cube([JACK[0],JACK[1]+WALL*3,JACK[2]+WALL]);
        }
    }    

module BeltSlot() {
    hull() {
        cylinder(d=BELT[1],h=25);
        translate([0,BELT[0]-BELT[1],0]) cylinder(d=BELT[1],h=25);
    }
}

//color ("red") Aux_Board() ;

module Case() {
difference() {
hull() {    
translate([(JACK[2]/2+WALL),0,(JACK[2]/2)]) rotate ([270,0,0]) cylinder(d=JACK[2],h=BOARD[1]+WALL);
translate([(JACK[2]/2+WALL+BOARD[0]),0,(JACK[2]/2)]) rotate ([270,0,0]) cylinder(d=JACK[2],h=BOARD[1]+WALL);
}
translate([JACK[2]/2+WALL,0,WALL]) Aux_Board() ;
translate([WALL*3,WALL*4,0]) BeltSlot() ;
translate([WALL*7+BOARD[0],WALL*4,0]) BeltSlot() ;
translate([(JACK[2]+BOARD[0])/2+WALL,BOARD[1]-WALL,0]) cylinder(d=2,h=WALL*2);

translate([(JACK[2]/2-2),0,(JACK[2]/2)]) rotate ([270,0,0]) ScrewHole();
translate([(JACK[2]/2+WALL*3+BOARD[0]),0,(JACK[2]/2)]) rotate ([270,0,0]) ScrewHole();
}
}

module ScrewHole() {
    hull() {
        cylinder(d=5.5,h=0.1);
        translate([0,0,6]) cylinder(d=6.5,h=0.1);
    }
}

module Lid() {
    union() {
difference() {
translate([0,-WALL,0]) hull() {    
translate([(JACK[2]/2+WALL),0,(JACK[2]/2)]) rotate ([270,0,0]) cylinder(d=JACK[2],h=WALL);
translate([(JACK[2]/2+WALL+BOARD[0]),0,(JACK[2]/2)]) rotate ([270,0,0]) cylinder(d=JACK[2],h=WALL);
}
translate([JACK[2]/2+WALL,0,WALL+3]) Aux_Board() ;

translate([(JACK[2]/2-2),-2,(JACK[2]/2)]) rotate ([270,0,0]) cylinder(d=3.5,h=5);
translate([(JACK[2]/2+WALL*3+BOARD[0]),-2,(JACK[2]/2)]) rotate ([270,0,0]) cylinder(d=3.5,h=5);

}
translate([11,-2,5.5]) cube ([5,7,5]);
translate([32,-2,5.5]) cube ([4,7,5]);
}
}