fan_radius = 30;
fan_height = 10;
hub_radius = fan_radius / 5;
blade_width = 1;
blade_count = 12;
blade_angle = 20;
outer_ring_width = 2;
magnet_count = 12;

difference(){
	// outer fan ring
	cylinder(r=fan_radius,h=fan_height,$fn=fan_radius*4);

	// outer fan ring hole
	translate([0,0,-1]){
		cylinder(r=fan_radius-outer_ring_width,h=fan_height+2,$fn=fan_radius*4);
	}

	// magnet holes
	rotate([0,0,50]){	// replace 50 with a parameter
		for(i=[0:magnet_count]){
			rotate(i*360/(magnet_count),[0,0,1]){
				translate([32.5,0,(fan_height/2)]){	// replace 22.5 with a parameter
					rotate([0,90,0]){
						translate([0,-blade_width/2,-(fan_height/2)]){
							cylinder(r=1.5,h=2,$fn=50);
						}
					}
				}
			}
		}
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