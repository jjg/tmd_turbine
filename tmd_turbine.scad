fan_radius = 20;
fan_height = 10;
hub_radius = fan_radius / 5;
blade_width = 1;
blade_count = 6;
blade_angle = 20;
outer_ring_width = 2;

difference(){
	// outer fan ring
	cylinder(r=fan_radius,h=fan_height,$fn=fan_radius*4);

	// outer fan ring hole
	translate([0,0,-1]){
		cylinder(r=fan_radius-outer_ring_width,h=fan_height+2,$fn=fan_radius*4);
	}
}

// hub
cylinder(r=hub_radius,h=fan_height,$fn=hub_radius*6);

// blades
for(i=[0:blade_count]){
	rotate(i*360/blade_count,[0,0,1]){
		translate([0,0,(fan_height/2)]){
			rotate([blade_angle,0,0]){
				translate([0,-blade_width/2,-(fan_height/2)]){
					cube([fan_radius-1,blade_width,fan_height]);
				}
			}
		}
	}
}