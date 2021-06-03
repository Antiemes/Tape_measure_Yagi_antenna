$fn=96;

module holes()
{
	circle(d=19.4);
	for (i=[0, 120, 240])
	{
		rotate([0, 0, i])
		{
			translate([15, 0, 0])
			{
				circle(d=4);
			}
		}
	}
}

//cylinder(d=43, h=20);


difference()
{
	linear_extrude(height=20)
	{
		difference()
		{
			minkowski()
			{
				hull()
				{
					holes();
				}
				circle(r=4);
			}
			holes();
		}
	}


	for (i=[0, 120, 240])
	{
		rotate([0, 0, i])
		{
			translate([15, 0, 0])
			{
				cylinder(d1=8, d2=4, h=2);
			}
		}
	}
}

	for (i=[0, 120, 240])
		rotate([0, 0, i])
			translate([15, 0, 0])
translate([0, 0, 2])
mirror([0, 0, 1])
intersection()
{
	rotate_extrude()
		translate([4, 0, 0])
			circle(d=4);

	cylinder(d=8, h=2);
}
