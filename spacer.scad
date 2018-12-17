$fn=360;

tape_width=18;
tape_height=3.5;

cutout_depth=1;

base_height=30;

cut_r = (pow(tape_height,2) + pow(tape_width,2)/4)/(2*tape_height);


//echo(cut_r);



module cutout()
{
  translate([0, 0, cut_r])
  {
    intersection()
    {
      rotate([0, 90, 0])
        cylinder(h=50, r=cut_r, center=true);
      cube([50, tape_width, cut_r*2], center=true);
    }
  }
}

difference()
{
  cube([40, 20, base_height], center=true);
  rotate([90, 0, 0]) cylinder(h=30, d=20, center=true);
  translate([10, 0, 5]) cylinder(h=15, d=3, center=false);
  translate([-10, 0, 5]) cylinder(h=15, d=3, center=false);
  translate([0, 0, -18]) cylinder(h=10, d=3, center=false);
  translate([0, 0, base_height/2-(tape_height+cutout_depth)]) cutout();
}

