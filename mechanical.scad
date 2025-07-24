$fn=50*1.0;

//SFF-8432 Rev 5.2a partial params

e=13.55; //module Width
s=8.55; //module Height
t=66.5; //Corrected for sfp-plus-module-1.3 //47.50; //Distance from positive stop to rear of module
k=3.25; //Height of module kick-out spring area
m=2.25; //Distance from bottom of module to printed circuit board
n=2.00; //Distance from rear shoulder to printed circuit board
n_error=0.25;
y=11.90; //Module width of bottom opening


//extension part parameters
e2=24;
t2=8.5;

corner_r=0.4;
union()
{
  difference()
  {
    //cube(size = [e,s,t], center = true);
    hull() {
      translate([-e/2+corner_r,s/2-corner_r,-t/2])
        cylinder(r=corner_r, h=t, $fn=100);
      translate([e/2-corner_r,s/2-corner_r,-t/2])
        cylinder(r=corner_r, h=t, $fn=100);
      translate([-e/2+corner_r,-s/2+corner_r,-t/2])
        cylinder(r=corner_r, h=t, $fn=100);
      translate([e/2-corner_r,-s/2+corner_r,-t/2])
        cylinder(r=corner_r, h=t, $fn=100);
    }
    cube(size = [10.00,s-4,t+1], center = true);
    translate([0,-s/2+n+0.8/2,0]) //
      cube(size = [12.00+0.1,0.8+2*n_error,t+1], center = true);

    translate([0,-s/2-1,-t/2+3])
    rotate([-70,0,0])
      cube(size = [e+0.1,s+0.1,2], center = true);

    translate([0,-4,-t/2+10/2])
      cube(size = [12+0.1,s+0.1,10+0.1], center = true);
  }

  // extension
  translate([0,0,(t+t2)/2])
    difference()
  {
    //cube(size = [e,s,t], center = true);
    hull() {
      translate([-e2/2+corner_r,s/2-corner_r,-t2/2])
        cylinder(r=corner_r, h=t2, $fn=100);
      translate([e2/2-corner_r,s/2-corner_r,-t2/2])
        cylinder(r=corner_r, h=t2, $fn=100);
      translate([-e2/2+corner_r,-s/2+corner_r,-t2/2])
        cylinder(r=corner_r, h=t2, $fn=100);
      translate([e2/2-corner_r,-s/2+corner_r,-t2/2])
        cylinder(r=corner_r, h=t2, $fn=100);
    }
    cube(size = [10.00,s-4,t2+1], center = true);
    translate([0,-s/2+n+0.8/2,0]) //
      cube(size = [22.00+0.4,0.8+2*n_error,t2+1], center = true);

    rotate([90,0,0])
      translate([6,0.75,(-s-0.1)/2])
        cylinder(r=2.5/2, h=s+0.1, $fn=100);

    rotate([90,0,0])
      translate([-6,0.75,(-s-0.1)/2])
        cylinder(r=2.5/2, h=s+0.1, $fn=100);
  }
}
