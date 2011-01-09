// Planetary Gears
use <parametric_involute_gear.scad>
debug_flag=1;
// render_part=1; // gear_shape_evolute_mask();
// render_part=2; // PlanetaryGear_2D();
render_part=3; // PlanetaryGear_2D_Animated();

module gear_shape_evolute_mask(
	clearance=0.2
	, res_steps=2*48
	, outer_wall_th=5.0
	, roller_gear_pitch_d=20.0
	, roller_gear_num_teeth=10
	, roller_gear_axle_d=3.0
	, roller_n=2
	, drive_gear_pitch_d=32.0
	, drive_gear_num_teeth=16
	, drive_gear_axle_d=3.0
	, pressure_angle=30
	, shrink=0.1
	) {
  outer_d=2*roller_gear_pitch_d+drive_gear_pitch_d;
  outer_num_teeth=outer_d*drive_gear_num_teeth/drive_gear_pitch_d;
  union() {
    circle(r=roller_gear_pitch_d/2+drive_gear_pitch_d/2);
    for(j=[0:res_steps-1]) assign(rotAngle=360*j/res_steps) {
      rotate(rotAngle) translate([drive_gear_pitch_d/2+roller_gear_pitch_d/2,0])
	 rotate(-rotAngle-360*(2/roller_gear_num_teeth)*(outer_num_teeth*rotAngle/360))
	  gear_shape(
	    circular_pitch=pitch_diameter2circular_pitch(roller_gear_num_teeth,roller_gear_pitch_d+clearance,shrink=shrink)
	    , number_of_teeth=roller_gear_num_teeth
	    , pressure_angle=pressure_angle
	    , clearance=-clearance
	  );
    }
  }
}

// Need to work out periodicity criteria
module PlanetaryGear_2D(
	clearance=0.2
	, outer_wall_th=5.0
	, roller_gear_pitch_d=18.0
	, roller_gear_num_teeth=9
	, roller_gear_axle_d=3.0
	, roller_n=2
	, drive_gear_pitch_d=30.0
	, drive_gear_num_teeth=15
	, drive_gear_axle_d=3.0
	, pressure_angle=30
	) {
  outer_d=2*roller_gear_pitch_d+drive_gear_pitch_d;
  outer_num_teeth=outer_d*drive_gear_num_teeth/drive_gear_pitch_d;
  difference() {
    circle(r=(outer_d+2*outer_wall_th)/2);
    //gear_shape(
	//circular_pitch=pitch_diameter2circular_pitch(outer_num_teeth,outer_d+clearance)
	//, number_of_teeth=outer_num_teeth
	//);
    // import_dxf(file="gear_shape_evolute_mask.dxf");
    gear_shape_evolute_mask(clearance=clearance
	, res_steps=2*48
	, outer_wall_th=outer_wall_th
	, roller_gear_pitch_d=roller_gear_pitch_d
	, roller_gear_num_teeth=roller_gear_num_teeth
	, roller_gear_axle_d=roller_gear_axle_d
	, roller_n=roller_n
	, drive_gear_pitch_d=drive_gear_pitch_d
	, drive_gear_num_teeth=driver_gear_num_teeth
	, drive_gear_axle_d=drive_gear_axle_d
	, pressure_angle=pressure_angle
	);
  }
  difference() {
    gear_shape(
	circular_pitch=pitch_diameter2circular_pitch(drive_gear_num_teeth,drive_gear_pitch_d)
	, number_of_teeth=drive_gear_num_teeth
	);
    circle($fs=0.1,r=drive_gear_axle_d/2);
  }
  for( i=[0:roller_n-1] ) {
    rotate(360*i/roller_n) translate([drive_gear_pitch_d/2+roller_gear_pitch_d/2,0])
	rotate(-360*i/roller_n-360*(2/roller_gear_num_teeth)*(outer_num_teeth*i/roller_n)) difference() {
	  gear_shape(
	    circular_pitch=pitch_diameter2circular_pitch(roller_gear_num_teeth,roller_gear_pitch_d)
	    , number_of_teeth=roller_gear_num_teeth
	  );
	  //circle(r=roller_gear_axle_d/2);
	  translate([roller_gear_pitch_d/4,0]) circle($fs=0.1,r=roller_gear_pitch_d/20);
	}
  }
}

// rotated planetary gear
module PlanetaryGear_2D_Rotated(
	clearance=0.1
	, outer_wall_th=5.0
	, roller_gear_pitch_d=15
	, roller_gear_num_teeth=15
	, roller_gear_axle_d=3.0
	, roller_n=6
	, drive_gear_pitch_d=21
	, drive_gear_num_teeth=21
	, drive_gear_axle_d=3.0
	, drive_gear_angle=0
	, pressure_angle=26
	, shrink=1
	) {
  $fs=0.1;
  outer_d=2*roller_gear_pitch_d+drive_gear_pitch_d;
  outer_num_teeth=outer_d*drive_gear_num_teeth/drive_gear_pitch_d;
  roller_gear_angle_ratio=(drive_gear_pitch_d/(drive_gear_pitch_d+roller_gear_pitch_d))*(outer_d/(2*roller_gear_pitch_d))*(roller_gear_num_teeth/outer_num_teeth);
  if(debug_flag==1) {
    echo("PlanetaryGear_2D_Rotated:");
    echo("  roller_gear_pitch_d:",roller_gear_pitch_d);
    echo("  roller_gear_num_teeth:",roller_gear_num_teeth);
    echo("  drive_gear_pitch_d:",drive_gear_pitch_d);
    echo("  drive_gear_num_teeth:",drive_gear_num_teeth);
    echo("  outer_d:",outer_d);
    echo("  outer_num_teeth:",outer_num_teeth);
  }
  difference() {
    circle(r=(outer_d+2*outer_wall_th)/2);
    gear_shape(
	circular_pitch=pitch_diameter2circular_pitch(outer_num_teeth,outer_d+2*clearance,shrink=-shrink)
	, number_of_teeth=outer_num_teeth
	, clearance=-2*clearance
	, pressure_angle=pressure_angle
	);
  }
  rotate(drive_gear_angle) difference() {
    gear_shape(
	circular_pitch=pitch_diameter2circular_pitch(drive_gear_num_teeth,drive_gear_pitch_d,shrink)
	, number_of_teeth=drive_gear_num_teeth
	, clearance=clearance
	, pressure_angle=pressure_angle
	);
    circle($fs=0.1,r=drive_gear_axle_d/2);
    translate([drive_gear_pitch_d/4,0]) circle($fs=0.1,r=drive_gear_pitch_d/20);
  }
  for( i=[0:roller_n-1] ) assign(roller_gear_angle=drive_gear_angle*roller_gear_angle_ratio
	, delta_angle=360.0*i/roller_n) {
    rotate(-delta_angle+roller_gear_angle) translate([drive_gear_pitch_d/2+roller_gear_pitch_d/2,0])
	rotate(-(roller_gear_angle-delta_angle)*(outer_d/roller_gear_pitch_d) ) difference() {
	  gear_shape(
	    circular_pitch=pitch_diameter2circular_pitch(roller_gear_num_teeth,roller_gear_pitch_d,shrink)
	    , number_of_teeth=roller_gear_num_teeth
	    , clearance=clearance
	    , pressure_angle=pressure_angle
	  );
	  //circle(r=roller_gear_axle_d/2);
	  translate([roller_gear_pitch_d/4,0]) circle($fs=0.1,r=roller_gear_pitch_d/20);
	}
  }
}

if(render_part==1) {
  echo("Rendering gear_shape_evolute_mask()...");
  gear_shape_evolute_mask();
}


if(render_part==2) {
  echo("Rendering PlanetaryGear_2D()...");
  PlanetaryGear_2D();
}

if(render_part==3) {
  echo("Rendering PlanetaryGear_2D_Rotated()...");
  PlanetaryGear_2D_Rotated(drive_gear_angle=360*$t);
}
