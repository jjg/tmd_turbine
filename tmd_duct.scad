fan_radius = 30;
fan_height = 10;
em_box = 15.5;

difference(){

	// duct body
	translate([-((fan_radius+(em_box/2))+1),-((fan_radius+(em_box/2))+1),0]){
		cube([((fan_radius*2)+em_box)+2,((fan_radius*2)+em_box)+2,fan_height + 1]);
	}

	// duct hole
	translate([0,0,-1]){
		cylinder(r=fan_radius+.5,h=fan_height+5,$fn=fan_radius*4);
	}

	// electromagnet holes
	for(i=[0:4]){
		rotate(i*360/4,[0,0,1]){
			translate([(fan_radius - (em_box/2))-1,(fan_radius-(em_box/2))-1,.5]){
				rotate([0,0,45]){
					translate([0,-em_box/2,0]){
						cube([em_box,em_box,(fan_height*2)]);
					}
				}
			}
		}
	}
}