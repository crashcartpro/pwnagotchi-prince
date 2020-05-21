/* Pwnagotchi Prince of the cosmos
 * By Tim Heath
 * Version 1.0
 *
 * Designed for housing pwnagotchi built from rPi 0w,
 * Waveshare 2.13in e-ink hat, and UPS-Lite battery pack.
 * https://pwnagotchi.ai
 *
 * Comment and uncomment blocks bellow labeled "View" and "Print"
 * You can also use individual modules to export those to STL
 *
 * Did my best, but many parts will need to be printed with support material.
 * In Cura, had to tweak `support X/Y distance` and `support horizontal Expansion`
 * multiple pieces for easier printing, and could be printed in colors
 */

$fn=50;

// used by pwn_stack()
module round_box(x,y,z,r) {
    hull(){
        translate([r,r,0])cylinder(r=r,h=z);
        translate([r,y-r,0])cylinder(r=r,h=z);
        translate([x-r,r,0])cylinder(r=r,h=z);
        translate([x-r,y-r,0])cylinder(r=r,h=z);
    }
}

// used for visual representation only
module pwn_stack() {
    // length: 70.5mm
    // width:  30mm
    // height: 24.5mm (26mm with screws)
    union() {
        color("lightblue",0.5)
        translate([2.5,5,-3])cube([25,50,3.1]); //window
        translate([0,2.75,0])cube([30,59.75,1.1]); //screen
        difference() {
            translate([7.5,62.4,0])cube([15,5.1,1.1]); //screen ribbon
            translate([7.4,66.25,0])rotate([-45,0,0])cube([16,2,2]);
        }
        translate([0,0,1])round_box(30,68,18,3); //body
        translate([0,0,17.5])round_box(30,70.5,7,3); //batt body
        color("gold",0.5) {
        translate([11.3,70,20])cube([8,5,3.2]); //usb pwr
        translate([28,7.4,9.5])cube([5,8,3.2]); //usb 1
        translate([28,19.9,9.5])cube([5,8,3.2]); //usb 2
        translate([11.3,-4,20])cube([8,5,3.2]); //power sw
        }
    }
}

// half sphere ends of head
// print 2
module cap() {
    color("green")
    difference() {
        union() {
            difference() {
                translate([0,0,0])sphere(r=21); //outer shell
                translate([0,0,0])sphere(r=19); //inner shell
                translate([14.5,-20,-1])cube([10,40,20]); //face cut
                translate([0,0,-0.75])cylinder(r=20,h=2); //bottom ledge cut
            }
            difference() {
                translate([12.5,0,0])rotate([0,90,0])cylinder(r=15,h=2);
                translate([11.5,-16,-0.75])cube([2,32,2]); //face ledge
            }
        }
        translate([-25,-25,-21])cube([50,50,21]); //bottom cut
    }
}

// Middle of head, cutout for screen
// print 1
module main_shell() {
    color([0.5,0.7,0.2])
    difference() { // cut away window, peg hole, and any left over edges.
        union() { // join a cube for the face
            difference() { // remove the inside of the tube
                union() { // cylinder with a raised bit
                    translate([0,0,1])cylinder(r=21,h=50); //outer shell
                    cylinder(r=20,h=52); //raised tab
                }
                translate([0,0,-1])cylinder(r=19,h=54); //inner cut
            }
            translate([12.5,-14.5,1])cube([2,29,50]); //face plate;
        }
        translate([11,-12.25,-1])cube([10,24.5,54]); //window cut
        translate([14.2,-20,-1])cube([10,40,54]); //face cut
        translate([12.3,-17,-1])cube([3,34,2]); //face tab fix
        translate([12.3,-17,51])cube([33,34,2]); //face tab fix
        translate([0,18,26])rotate([-90,0,0])cylinder(r=2,h=4); //hat peg
        rotate([0,0,-10])translate([0,-18,26])rotate([90,0,0])cylinder(r=2,h=4); //neck peg

    }
}

// connects main shell to caps
// also fully wraps around pwnagotchi and does most of the holding
// print 2
module side_shell() {
    color("GreenYellow")
    union() {
        difference() {
            union() {
                translate([0,0,0])cylinder(r=21,h=10); //outer shell
                translate([0,0,9])cylinder(r=20,h=2); //raised tab
            }
            translate([0,0,-1])cylinder(r=19,h=14); //inner cut
            translate([0,0,-0.75])cylinder(r=20,h=2); //bottom ledge cut
            translate([14.5,-20,-1])cube([10,40,14]); //face cut
            translate([13.5,-15,10])cube([2,30,2]); //face tab

        }
        difference() {
            translate([12.5,-15,0])cube([2,30,10]); //face plate 2
        }
        translate([12.5,-14.5,9])cube([1,29,2]); //face tab
    }
}

// used by bottom()
module leg() {
    difference() {
        union() {
            translate([0,0,1.4])rotate([0,90,0])cylinder(r=2.5,h=35);
            translate([35,0,3])rotate([0,10,0])scale([0.6,0.8,1])sphere(r=5);
        }
        translate([-15,-20,-4])cube([60,40,4]); //bottom cut
        translate([36.5,-5,-1])rotate([0,10,0])cube([6,10,10]); //foot cut
    }
}

//
// print 1
module bottom() {
    color("Purple")
    union() {
        cylinder(r1=16,r2=17,h=4);
        rotate([0,0,-25])leg();
        rotate([0,0,25])leg();
        translate([0,0,3])cylinder(r=2.9,h=5.75); //peg
    }
}

// used by body()
module arm() {
    union(){
        scale([0.8,0.6,1])sphere(r=5);
        translate([0,0,0])difference(){
            rotate([0,-10,0])cylinder(r=2.5,h=15);
            translate([-5.5,-3,14.33])cube([6,6,1]);
        }
        translate([-2.59,0,13.9])difference(){
            rotate([0,10,0])cylinder(r=2.5,h=15);
            translate([-3,-3,-0.58])cube([6,6,1]);
        }
    }
}

// print 1
module body() {
    color([0.5,0.7,0.2])
    union() {
        difference() {
            cylinder(r1=17,r2=12,h=40); //main body
            translate([0,-35,58])rotate([-90,0,0])cylinder(r=21,h=70);
            translate([0,0,-1])cylinder(r=3,h=6); //bottom peg hole
        }
        rotate_extrude()translate([16.5,1,0])circle(r=1); //bottom flare
        translate([0,-16.25,6])rotate([-12.1,0,0])arm(); //arm
        translate([0,16.25,6])rotate([12.1,0,0])arm(); //arm
        translate([0,0,36])cylinder(r=1.9,h=3); // head peg
    }
}

// print 1
module hat() {
    color("gold")cylinder(r1=3.5,r2=1,h=10);
    color("gold")translate([0,0,-2])cylinder(r=1.9,h=3);
    color("firebrick")translate([0,0,11])sphere(r=2);
}

/* To View assembled:
translate([0,0,0])bottom();
translate([0,0,4])body();
translate([0,26,61.5])rotate([90,0,0])rotate([0,0,10])main_shell();
translate([-0.1,-35.1,61.5])rotate([-90,0,0])rotate([0,0,-10])side_shell();
translate([-0.1,25.1,61.5])rotate([-90,0,0])rotate([0,0,-10])side_shell();
translate([-0.2,-35.2,61.5])rotate([90,0,0])rotate([0,0,10])cap();
translate([-0.2,35.2,61.5])rotate([-90,0,0])rotate([0,0,-10])cap();
translate([-3.5,0,82.25])rotate([0,-10,0])hat();
translate([14.8,-30,48.9])rotate([0,-100,0])pwn_stack();
//*/

//* To Print full set of parts:
translate([0,0,0])main_shell();
translate([80,0,0])rotate([0,0,90])bottom();
translate([36,0,0])body();
translate([40,45,0])side_shell();
translate([40,90,0])side_shell();
translate([0,45,0])cap();
translate([0,90,0])cap();
translate([80,45,0])hat();
//*/
