// Peristaltic Planetary Gear Pump

include <MCAD/involute_gears.scad>

roller_axle_d=3.0+1.0;
motor_axle_d=5.0+1.0;
function Bearing_623_OD()=10.0+1.0; // outer diameter
function Bearing_623_ID()=3.0+1.0; // inner diameter
function Bearing_623_TH()=4.0; // thickness

render_part=0; // full_assembly
plate_number=0; // no plates.
plate_number=1; // small gears and coupler parts
 render_part=1; // drive_gears
// render_part=2; // alignment_gears
// render_part=3; // pressure_rollers
// render_part=4; // outer_pressure_ring
// render_part=5; // roller_retainer_ring
// render_part=6; // roller_gear_coupler2bearing_group
// render_part=7; // pressure_roller_coupler2bearing_group 
// render_part=8; // pump_body

module spider_coupler(
	thickness=5.0
	, outer_d=12.0
	, axle_d=3.0
	, bevel_dr=0.5
	, shrink=0.2
	) {
  intersection() {
    union() {
      cylinder(r=outer_d/2,h=thickness-bevel_dr,center=false);
      translate([0,0,thickness-bevel_dr])
        cylinder(r1=outer_d/2,r2=outer_d/2-bevel_dr,h=bevel_dr,center=false);
    }
    difference() {
      union() {
	  translate([shrink,shrink])
		cube(size=[outer_d/2-shrink,outer_d/2-shrink,thickness],center=false);
	  rotate([0,0,180]) translate([shrink,shrink,0])
		cube(size=[outer_d/2-shrink,outer_d/2-shrink,thickness],center=false);
	 }
	 union() {
	  translate([0,0,-bevel_dr]) cylinder(r=axle_d/2,h=thickness+2*bevel_dr,center=false);
	  translate([0,0,thickness-bevel_dr])  cylinder(r2=axle_d/2+2*bevel_dr,r1=axle_d/2,h=2*bevel_dr,center=false);
	  translate([0,0,thickness]) rotate([45,0,0]) cube(size=[outer_d,2*bevel_dr,2*bevel_dr],center=true);
	  translate([0,0,thickness]) rotate([45,0,90]) cube(size=[outer_d,2*bevel_dr,2*bevel_dr],center=true);
	 }
    }
  }
}

module motor_drive_gear(
	gear_d=20.0, gear_num_teeth=17, gear_spacing=1.0
	, roller_gear_thickness=10.0, motor_gear_thickness=12.0
	, roller_gear_hub_thickness=15.0, motor_gear_hub_thickness=17.0
	, roller_gear_hub_d=12.0, motor_gear_hub_d=15.0
	, roller_axle_d=3.0, motor_axle_d=5.0
	, roller_gear_count=3
	, gear_clearance=0.4
	, bevel_dr=0.5
	) {
  $fs=0.1;
  // Motor gear at center
  gear_circular_pitch=gear_d * 180 / gear_num_teeth;
  intersection() {
    gear(number_of_teeth=gear_num_teeth
	, circular_pitch=gear_circular_pitch
	, gear_thickness=motor_gear_thickness, rim_thickness=motor_gear_thickness
	, bore_diameter=motor_axle_d
	, clearance=gear_clearance/2
	, hub_thickness=motor_gear_hub_thickness
	, hub_diameter=motor_gear_hub_d
	);
    cylinder(r1=gear_d/2,r2=gear_d/2+motor_gear_hub_thickness,h=motor_gear_hub_thickness,center=false);
//    cylinder(r2=gear_d/2,r1=gear_d/2+motor_gear_thickness,h=motor_gear_thickness,center=false);
  }
}

module roller_drive_gear(
	gear_d=20.0, gear_num_teeth=17, gear_spacing=1.0
	, roller_gear_thickness=5.0, motor_gear_thickness=12.0
	, roller_gear_hub_thickness=5+5, motor_gear_hub_thickness=12+5
	, roller_gear_hub_d=12.0, motor_gear_hub_d=15.0
	, roller_axle_d=3.0, motor_axle_d=5.0
	, roller_gear_count=3
	, gear_clearance=0.4
	, bevel_dr=0.5
	) {
  $fs=0.1;
  gear_circular_pitch=gear_d * 180 / gear_num_teeth;
  difference() {
    intersection() {
	gear(number_of_teeth=gear_num_teeth
		, circular_pitch=gear_circular_pitch
		, gear_thickness=roller_gear_thickness, rim_thickness=roller_gear_thickness
		, bore_diameter=roller_axle_d
		, clearance=gear_clearance/2
		, hub_thickness=0
		, hub_diameter=roller_gear_hub_d
		);
	cylinder(r1=gear_d/2,r2=gear_d/2+roller_gear_thickness,h=roller_gear_thickness,center=false);
	cylinder(r2=gear_d/2,r1=gear_d/2+roller_gear_thickness,h=roller_gear_thickness,center=false);
    }
    translate([0,0,roller_gear_thickness+bevel_dr]) rotate([180,0,0])
	    translate([0,0,-bevel_dr]) spider_coupler( thickness=(roller_gear_hub_thickness-roller_gear_thickness)/2+2*bevel_dr
		, outer_d=gear_hub_d+2*bevel_dr, axle_d=roller_axle_d-2*bevel_dr, bevel_dr=bevel_dr/2,shrink=-0.2 );
  }
  translate([0,0,roller_gear_thickness]) 
	  spider_coupler( thickness=(roller_gear_hub_thickness-roller_gear_thickness)/2
		, outer_d=gear_hub_d, axle_d=roller_axle_d, bevel_dr=bevel_dr,shrink=0.2 );
}

module drive_gears(
	gear_d=20.0, gear_num_teeth=17, gear_spacing=1.0
	, roller_gear_thickness=5.0, motor_gear_thickness=12.0
	, roller_gear_hub_thickness=10.0, motor_gear_hub_thickness=17.0
	, roller_gear_hub_d=12.0, motor_gear_hub_d=15.0
	, roller_axle_d=3.0, motor_axle_d=5.0
	, roller_gear_count=3
	, gear_clearance=0.4
	, bevel_dr=0.5
	) {
  $fs=0.1;
  // Motor gear at center
  gear_circular_pitch=gear_d * 180 / gear_num_teeth;
  motor_drive_gear(
		gear_d=gear_d, gear_num_teeth=gear_num_teeth, motor_gear_thickness=motor_gear_thickness, gear_spacing=gear_spacing
		, motor_gear_hub_thickness=motor_gear_hub_thickness, motor_gear_hub_d=motor_gear_hub_d, motor_axle_d=motor_axle_d
		, gear_clearance=gear_clearance, bevel_dr=bevel_dr
	  );
  for(i=[0:roller_gear_count-1]) assign( rotAngle=360*i/roller_gear_count ) {
    rotate([0,0,rotAngle]) translate([gear_d+gear_clearance+gear_spacing,0,0]) rotate([0,0,-2*rotAngle])
	  roller_drive_gear(
		gear_d=gear_d, gear_num_teeth=gear_num_teeth, gear_thickness=roller_gear_thickness, gear_spacing=gear_spacing
		, gear_hub_thickness=roller_gear_hub_thickness, gear_hub_d=roller_gear_hub_d, roller_axle_d=roller_axle_d
		, gear_clearance=gear_clearance, bevel_dr=bevel_dr
	  );

  }
}

if(render_part==1) {
  echo("Rendering drive_gears()...");
  drive_gears(gear_spacing=2.0,roller_axle_d=roller_axle_d,motor_axle_d=motor_axle_d);
}

module alignment_gear_middle(
	gear_d=20.0, gear_num_teeth=17, gear_thickness=12.0, gear_spacing=1.0
	, gear_hub_thickness=15.0, gear_hub_d=12.0, middle_axle_d=5.0
	, gear_clearance=0.4, twist_ratio=0.5, bevel_dr=0.5
	) {
  $fs=0.1;
  gear_circular_pitch=gear_d * 180 / gear_num_teeth;
  union() {
    intersection() {
	gear(number_of_teeth=gear_num_teeth
	  , circular_pitch=gear_circular_pitch
	  , gear_thickness=gear_thickness/2, rim_thickness=gear_thickness/2
	  , bore_diameter=middle_axle_d
	  , clearance=gear_clearance/2
	  , hub_thickness=0
	  , hub_diameter=gear_hub_d
	  , twist=twist_ratio*180/gear_num_teeth
	  );
	cylinder(r1=gear_d/2,r2=gear_d/2+gear_thickness/2,h=gear_thickness/2,center=false);
	cylinder(r2=gear_d/2,r1=gear_d/2+gear_thickness/2,h=gear_thickness/2,center=false);
    }
    translate([0,0,gear_thickness/2]) rotate([0,0,-twist_ratio*180/gear_num_teeth]) difference() {
	intersection() {
	  gear(number_of_teeth=gear_num_teeth
		, circular_pitch=gear_circular_pitch
		, gear_thickness=gear_thickness/2, rim_thickness=gear_thickness/2
		, bore_diameter=middle_axle_d
		, clearance=gear_clearance/2
		, hub_thickness=0
		, hub_diameter=gear_hub_d
		, twist=-twist_ratio*180/gear_num_teeth
		);
	  cylinder(r1=gear_d/2,r2=gear_d/2+gear_thickness/2,h=gear_thickness/2,center=false);
	  cylinder(r2=gear_d/2,r1=gear_d/2+gear_thickness/2,h=gear_thickness/2,center=false);
	}
	  translate([0,0,gear_thickness/2]) rotate([180,0,twist_ratio*180/gear_num_teeth])
	    translate([0,0,-bevel_dr]) spider_coupler( thickness=(gear_hub_thickness-gear_thickness)/2+2*bevel_dr
		, outer_d=gear_hub_d+2*bevel_dr, axle_d=middle_axle_d-2*bevel_dr, bevel_dr=bevel_dr/2,shrink=-0.2 );
	}
	translate([0,0,gear_thickness]) 
	  spider_coupler( thickness=(gear_hub_thickness-gear_thickness)/2
		, outer_d=gear_hub_d, axle_d=middle_axle_d, bevel_dr=bevel_dr,shrink=0.2 );
  }
}

module alignment_gear_roller(
	gear_d=20.0, gear_num_teeth=17, gear_thickness=12.0, gear_spacing=1.0
	, gear_hub_thickness=15.0, gear_hub_d=12.0
	, roller_axle_d=3.0
	, roller_gear_count=3
	, gear_clearance=0.4
	, twist_ratio=0.5
	, bevel_dr=0.5
	) {
  $fs=0.1;
  gear_circular_pitch=gear_d * 180 / gear_num_teeth;
  intersection() {
	gear(number_of_teeth=gear_num_teeth
		, circular_pitch=gear_circular_pitch
		, gear_thickness=gear_thickness/2, rim_thickness=gear_thickness/2
		, bore_diameter=roller_axle_d
		, clearance=gear_clearance/2
		, hub_thickness=0
		, hub_diameter=gear_hub_d
		, twist=-twist_ratio*180/gear_num_teeth
		);
	cylinder(r1=gear_d/2,r2=gear_d/2+gear_thickness/2,h=gear_thickness/2,center=false);
	cylinder(r2=gear_d/2,r1=gear_d/2+gear_thickness/2,h=gear_thickness/2,center=false);
  }
  translate([0,0,gear_thickness/2]) rotate([0,0,twist_ratio*180/gear_num_teeth]) difference() {
    intersection() {
	  gear(number_of_teeth=gear_num_teeth
		, circular_pitch=gear_circular_pitch
		, gear_thickness=gear_thickness/2, rim_thickness=gear_thickness/2
		, bore_diameter=roller_axle_d
		, clearance=gear_clearance/2
		, hub_thickness=0
		, hub_diameter=gear_hub_d
		, twist=twist_ratio*180/gear_num_teeth
	  );
	cylinder(r1=gear_d/2,r2=gear_d/2+gear_thickness/2,h=gear_thickness/2,center=false);
	cylinder(r2=gear_d/2,r1=gear_d/2+gear_thickness/2,h=gear_thickness/2,center=false);
    }
    translate([0,0,gear_thickness/2]) rotate([180,0,-twist_ratio*180/gear_num_teeth])
      translate([0,0,-bevel_dr]) spider_coupler( thickness=(gear_hub_thickness-gear_thickness)/2+2*bevel_dr
		, outer_d=gear_hub_d+2*bevel_dr, axle_d=roller_axle_d-2*bevel_dr, bevel_dr=bevel_dr/2,shrink=-0.2 );
  }
	translate([0,0,gear_thickness]) 
	  spider_coupler( thickness=(gear_hub_thickness-gear_thickness)/2
		, outer_d=gear_hub_d, axle_d=roller_axle_d, bevel_dr=bevel_dr );
}

module alignment_gears(
	gear_d=20.0, gear_num_teeth=17, gear_thickness=12.0, gear_spacing=1.0
	, gear_hub_thickness=15.0, gear_hub_d=12.0
	, roller_axle_d=3.0, middle_axle_d=5.0
	, roller_gear_count=3
	, gear_clearance=0.4
	, twist_ratio=0.5
	, bevel_dr=0.5
	) {
  $fs=0.1;
  gear_circular_pitch=gear_d * 180 / gear_num_teeth;
  // Motor gear at center
  alignment_gear_middle(
	gear_d=gear_d, gear_num_teeth=gear_num_teeth, gear_thickness=gear_thickness, gear_spacing=gear_spacing
	, gear_hub_thickness=gear_hub_thickness, gear_hub_d=gear_hub_d, middle_axle_d=middle_axle_d
	, gear_clearance=gear_clearance, twist_ratio=twist_ratio, bevel_dr=bevel_dr
	);
  for(i=[0:roller_gear_count-1]) assign( rotAngle=360*i/roller_gear_count ) {
    rotate([0,0,rotAngle]) translate([gear_d+gear_clearance+gear_spacing,0,0]) rotate([0,0,-2*rotAngle])
	  alignment_gear_roller(
		gear_d=gear_d, gear_num_teeth=gear_num_teeth, gear_thickness=gear_thickness, gear_spacing=gear_spacing
		, gear_hub_thickness=gear_hub_thickness, gear_hub_d=gear_hub_d, roller_axle_d=roller_axle_d
		, gear_clearance=gear_clearance, twist_ratio=twist_ratio, bevel_dr=bevel_dr
	  );
  }
}

if(render_part==2) {
  echo("Rendering alignment_gears()...");
  alignment_gears(gear_spacing=2.0,roller_axle_d=roller_axle_d,motor_axle_d=motor_axle_d);
}

module pressure_roller(
	roller_axle_d=3.0, roller_thickness=15.0
	, roller_coupler_thickness=3.0, roller_coupler_d=12.0
	, roller_shield_d=20.0, roller_shield_thickness=3.0
	, roller_min_d=15.0, roller_max_d=18.0
	, bevel_dr=0.5
	) {
  $fs=0.1;
  difference() {
    union() {
	cylinder(r=roller_max_d/2,h=roller_shield_thickness,center=false);
	translate([0,0,roller_shield_thickness])
	  cylinder($fn=128,r1=roller_max_d/2,r2=roller_min_d/2,h=roller_thickness,center=false);
	translate([0,0,roller_shield_thickness+roller_thickness])
	  cylinder(r=roller_min_d/2,h=roller_shield_thickness,center=false);
//	translate([0,0,roller_shield_thickness+roller_thickness+(roller_shield_d/2-roller_min_d/2)])
//	  cylinder(r=roller_shield_d/2,h=roller_shield_thickness-(roller_shield_d/2-roller_min_d/2),center=false);
	translate([0,0,2*roller_shield_thickness+roller_thickness])
	  spider_coupler( thickness=roller_coupler_thickness/2
		, outer_d=roller_coupler_d, axle_d=roller_axle_d, bevel_dr=bevel_dr,shrink=0.2 );
    }
    translate([0,0,-bevel_dr]) cylinder(r=roller_axle_d/2
	,h=2*bevel_dr+2*roller_shield_thickness+roller_thickness,center=false);
    translate([0,0,-bevel_dr]) spider_coupler( thickness=roller_coupler_thickness/2+2*bevel_dr
		, outer_d=roller_coupler_d+2*bevel_dr, axle_d=roller_axle_d-2*bevel_dr, bevel_dr=bevel_dr/2,shrink=-0.2 );
    translate([0,0,2*roller_shield_thickness+roller_thickness+bevel_dr]) rotate([180,0,0])
	  spider_coupler( thickness=roller_coupler_thickness/2+2*bevel_dr
		, outer_d=roller_coupler_d+2*bevel_dr, axle_d=roller_axle_d-2*bevel_dr, bevel_dr=bevel_dr/2,shrink=-0.2 );
  }
}

module pump_pressure_rollers(
	roller_axle_d=3.0, roller_thickness=15.0
	, roller_coupler_thickness=3.0, roller_coupler_d=12.0
	, roller_shield_d=20.0, roller_shield_thickness=3.0
	, roller_min_d=15.0, roller_max_d=18.0
	, pressure_roller_count=3
	, bevel_dr=0.5
	, gear_d=20.0, gear_clearance=0.4, gear_spacing=1.0
	) {
  $fs=0.1;
  for(i=[0:pressure_roller_count-1]) assign( rotAngle=360*i/pressure_roller_count ) {
    rotate([0,0,rotAngle]) translate([gear_d+gear_clearance+gear_spacing,0,0]) rotate([0,0,-2*rotAngle])
	  pressure_roller(
		roller_axle_d=roller_axle_d, roller_thickness=roller_thickness
		, roller_coupler_thickness=roller_coupler_thickness, roller_coupler_d=roller_coupler_d
		, roller_shield_d=roller_shield_d, roller_shield_thickness=roller_shield_thickness
		, roller_min_d=roller_min_d, roller_max_d=roller_max_d
		, bevel_dr=bevel_dr
	  );
  }
}

if(render_part==3) {
  echo("Rendering pump_pressure_rollers()...");
  pump_pressure_rollers(gear_spacing=2.0,roller_axle_d=roller_axle_d,motor_axle_d=motor_axle_d);
}

function Tygon_B_44_3_OD()=25.4*3/16; // Outer Diameter
function Tygon_B_44_3_ID()=25.4*1/16; // Inner Diameter
function Tygon_B_44_3_WT()=25.4*1/16; // Wall Thickness
function Tygon_B_44_3_minBR()=25.4*1/8; // minimum Bend Radius

module outer_pressure_ring(
	roller_axle_d=3.0, roller_thickness=15.0
	, roller_coupler_thickness=3.0, roller_coupler_d=12.0
	, roller_shield_d=20.0, roller_shield_thickness=3.0
	, roller_min_d=15.0, roller_max_d=18.0
	, pressure_roller_count=3
	, bevel_dr=0.5
	, gear_d=20.0, gear_clearance=0.4, gear_spacing=1.0
	, tube_outer_d=Tygon_B_44_3_OD()
	, tube_inner_d=Tygon_B_44_3_ID()
	, hole_ext=0.01
	) {
  $fs=0.1;
  dr1=gear_d+roller_min_d/2+tube_outer_d-tube_inner_d;
  dr2=gear_d+roller_max_d/2+tube_outer_d-tube_inner_d;
  difference() {
    cylinder(r=gear_d+3*roller_shield_d/4,h=3*roller_thickness/2,center=false);
    translate([0,0,-hole_ext]) cylinder(r=dr2,h=3*roller_thickness/2+2*hole_ext,center=false);
    translate([0,0,roller_thickness/8+roller_thickness/2-tube_outer_d])
	cube(size=[gear_d+roller_shield_d+2*bevel_dr,gear_d+roller_shield_d+2*bevel_dr,2*tube_outer_d+roller_thickness],center=false);
  }
  // bottom section
  difference() {
    cylinder(r=gear_d+roller_shield_d,h=roller_thickness/8,center=false);
    translate([0,0,-hole_ext]) cylinder(r=gear_d+roller_min_d/2+bevel_dr,h=roller_thickness/8+2*hole_ext,center=false);
  }
  translate([0,0,roller_thickness/8]) difference() {
    cylinder(r=gear_d+3*roller_shield_d/4,h=roller_thickness/2-tube_outer_d,center=false);
    cylinder(r1=gear_d+roller_min_d/2+bevel_dr,r2=dr1+(dr2-dr1)*(roller_thickness/2-tube_outer_d)/roller_thickness
	  ,h=roller_thickness/2-tube_outer_d,center=false);
    cylinder(r=gear_d+roller_min_d/2+bevel_dr,h=hole_ext,center=true);
    translate([0,0,roller_thickness/2-tube_outer_d]) cylinder(r=dr1+(dr2-dr1)*(roller_thickness/2-tube_outer_d)/roller_thickness,h=hole_ext,center=true);
  }
  translate([0,0,roller_thickness/8+roller_thickness/2-tube_outer_d]) difference() {
    cylinder(r=gear_d+3*roller_shield_d/4,h=2*tube_outer_d,center=false);
    translate([0,0,tube_outer_d]) cylinder($fn=128,r1=dr1,r2=dr2,h=roller_thickness,center=true);
    cube(size=[gear_d+roller_shield_d+2*bevel_dr,gear_d+roller_shield_d+2*bevel_dr,2*tube_outer_d+roller_thickness],center=false);
  }
//  translate([0,0,roller_thickness/8+roller_thickness/2+tube_outer_d]) difference() {
//    cylinder(r=gear_d+3*roller_shield_d/4,h=roller_thickness/2-tube_outer_d, center=false);
//    cylinder(r1=dr1+(dr2-dr1)*(roller_thickness/2+tube_outer_d)/roller_thickness
//	    ,r2=gear_d+roller_max_d/2+bevel_dr,h=roller_thickness/2-tube_outer_d+bevel_dr,center=false);
//  }
//  translate([0,0,9*roller_thickness/8]) difference() {
//    cylinder(r=gear_d+3*roller_shield_d/4,h=roller_thickness/4,center=false);
//    translate([0,0,-bevel_dr]) cylinder(r=gear_d+roller_max_d/2+2*bevel_dr,h=roller_thickness/4+2*bevel_dr,center=false);
//  }
}

if(render_part==4) {
  echo("Rendering outer_pressure_ring()...");
  % translate([0,0,23]) rotate([180,0,0]) pump_pressure_rollers(gear_spacing=0.0);
  outer_pressure_ring(gear_spacing=0.0,roller_axle_d=roller_axle_d,motor_axle_d=motor_axle_d);
}



module roller_retainer_ring(
	roller_axle_d=3.0, roller_thickness=15.0
	, roller_coupler_thickness=3.0, roller_coupler_d=12.0
	, roller_shield_d=20.0, roller_shield_thickness=3.0
	, roller_min_d=15.0, roller_max_d=18.0
	, pressure_roller_count=3
	, bevel_dr=0.5
	, gear_d=20.0, gear_clearance=0.4, gear_spacing=1.0
	, tube_outer_d=Tygon_B_44_3_OD()
	, tube_inner_d=Tygon_B_44_3_ID()
	, hole_ext=0.01
	, roller_bearing_od=Bearing_623_OD(), roller_bearing_th=Bearing_623_TH()
	) {
  $fs=0.1;
  difference() {
    cylinder(r=gear_d+roller_min_d/2,h=roller_bearing_th,center=false);
    cylinder(r=gear_d-roller_shield_d/2,h=roller_bearing_th,center=false);
    cylinder(r1=gear_d-roller_shield_d/2+3*bevel_dr,r2=gear_d-roller_shield_d/2,h=3*bevel_dr,center=true);
    translate([0,0,roller_bearing_th])
      cylinder(r2=gear_d-roller_shield_d/2+3*bevel_dr,r1=gear_d-roller_shield_d/2,h=3*bevel_dr,center=true);

    for(i=[0:pressure_roller_count-1]) assign( rotAngle=360*i/pressure_roller_count ) {
      rotate([0,0,rotAngle]) translate([gear_d,0,0]) {
	  cylinder(r=roller_bearing_od/2,h=roller_bearing_th,center=false);
	  cylinder(r1=roller_bearing_od/2+2*bevel_dr,r2=roller_bearing_od/2,h=2*bevel_dr,center=true);
	  translate([0,0,roller_bearing_th])
	    cylinder(r2=roller_shield_d/2+3*bevel_dr,r1=roller_shield_d/2+bevel_dr,h=2*bevel_dr,center=true);
      }
    }
  }
}

if(render_part==5) {
  echo("Rendering roller_retainer_ring()...");
  % translate([0,0,30]) rotate([180,0,0]) pump_pressure_rollers(gear_spacing=0.0);
  roller_retainer_ring(gear_spacing=0.0,roller_axle_d=roller_axle_d,motor_axle_d=motor_axle_d);
}

module roller_gear_coupler2bearing(
	roller_axle_d=3.0, roller_thickness=15.0
	, roller_coupler_thickness=3.0, roller_coupler_d=12.0
	, roller_shield_d=20.0, roller_shield_thickness=3.0
	, roller_min_d=15.0, roller_max_d=18.0
	, pressure_roller_count=3
	, bevel_dr=0.5
	, gear_d=20.0, gear_clearance=0.4, gear_spacing=1.0
	, tube_outer_d=Tygon_B_44_3_OD()
	, tube_inner_d=Tygon_B_44_3_ID()
	, hole_ext=0.01
	, roller_bearing_od=Bearing_623_OD(), roller_bearing_th=Bearing_623_TH()
	) {
  $fs=0.1;
  difference() {
    union() {
      cylinder(r=roller_max_d/2,h=roller_shield_thickness/2,center=false);
      translate([0,0,roller_shield_thickness/2])
		cylinder(r1=roller_max_d/2,r2=(roller_axle_d+(roller_bearing_od-roller_axle_d)/2)/2,h=roller_shield_thickness/2,center=false);
	 // translate([0,0,roller_shield_thickness]) 
	 //   spider_coupler( thickness=roller_coupler_thickness/2
	 //     , outer_d=roller_coupler_d, axle_d=roller_axle_d, bevel_dr=bevel_dr,shrink=0.2 );
    }
    translate([0,0,-hole_ext]) cylinder(r=roller_axle_d/2,h=roller_shield_thickness+2*hole_ext,center=false);
    translate([0,0,-bevel_dr]) spider_coupler( thickness=roller_coupler_thickness/2+2*bevel_dr
		, outer_d=roller_coupler_d+2*bevel_dr, axle_d=roller_axle_d-2*bevel_dr, bevel_dr=bevel_dr/2,shrink=-0.2 );
  }
}

module roller_gear_coupler2bearing_group(
	roller_axle_d=3.0, roller_thickness=15.0
	, roller_coupler_thickness=3.0, roller_coupler_d=12.0
	, roller_shield_d=20.0, roller_shield_thickness=3.0
	, roller_min_d=15.0, roller_max_d=18.0
	, pressure_roller_count=3
	, bevel_dr=0.5
	, gear_d=20.0, gear_clearance=0.4, gear_spacing=1.0
	, tube_outer_d=Tygon_B_44_3_OD()
	, tube_inner_d=Tygon_B_44_3_ID()
	, hole_ext=0.01
	, roller_bearing_od=Bearing_623_OD(), roller_bearing_th=Bearing_623_TH()
	) {
  $fs=0.1;
  for(i=[0:pressure_roller_count-1]) assign( rotAngle=360*i/pressure_roller_count ) {
    rotate([0,0,rotAngle]) translate([gear_d+gear_clearance+gear_spacing,0,0]) rotate([0,0,-2*rotAngle])
	  roller_gear_coupler2bearing(
		roller_axle_d=roller_axle_d, roller_thickness=roller_thickness
		, roller_coupler_thickness=roller_coupler_thickness, roller_coupler_d=roller_coupler_d
		, roller_shield_d=roller_shield_d, roller_shield_thickness=roller_shield_thickness
		, roller_min_d=roller_min_d, roller_max_d=roller_max_d
		, bevel_dr=bevel_dr
		, gear_d=gear_d, gear_clearance=gear_clearance, gear_spacing=gear_spacing
		, tube_outer_d=tube_outer_d
		, tube_inner_d=tube_inner_d
		, hole_ext=hole_ext
		, roller_bearing_od=roller_bearing_od, roller_bearing_th=roller_bearing_th
	  );
  }
}

if(render_part==6) {
  echo("Rendering roller_gear_coupler2bearing_group()...");
  roller_gear_coupler2bearing_group(gear_spacing=2.0,roller_axle_d=roller_axle_d,motor_axle_d=motor_axle_d);
}

module pressure_roller_coupler2bearing(
	roller_axle_d=3.0, roller_thickness=15.0
	, roller_coupler_thickness=3.0, roller_coupler_d=12.0
	, roller_shield_d=20.0, roller_shield_thickness=3.0
	, roller_min_d=15.0, roller_max_d=18.0
	, pressure_roller_count=3
	, bevel_dr=0.5
	, gear_d=20.0, gear_clearance=0.4, gear_spacing=1.0
	, tube_outer_d=Tygon_B_44_3_OD()
	, tube_inner_d=Tygon_B_44_3_ID()
	, hole_ext=0.01
	, roller_bearing_od=Bearing_623_OD(), roller_bearing_th=Bearing_623_TH()
	) {
  $fs=0.1;
  intersection() {
   rotate([0,0,45]) translate([0,0,(roller_coupler_thickness/2+roller_shield_thickness)/2])
	cube(size=[roller_max_d/2-bevel_dr,roller_max_d,roller_coupler_thickness/2+roller_shield_thickness],center=true);
   difference() {
    union() {
      translate([0,0,roller_coupler_thickness/2]) {
	  rotate([180,0,0]) translate([0,0,-hole_ext]) spider_coupler( thickness=roller_coupler_thickness/2+hole_ext
		, outer_d=roller_coupler_d, axle_d=roller_axle_d-2*bevel_dr, bevel_dr=bevel_dr/2,shrink=2*hole_ext );
	  intersection() {
	    cylinder(r=roller_coupler_d/2,h=roller_shield_thickness,center=false);
	    union() {
		  cylinder(r=roller_max_d/2,h=roller_shield_thickness/2,center=false);
		  translate([0,0,roller_shield_thickness/2])
			cylinder(r1=roller_max_d/2,r2=(roller_axle_d+(roller_bearing_od-roller_axle_d)/2)/2,h=roller_shield_thickness/2,center=false);
	    }
	  }
	 // translate([0,0,roller_shield_thickness]) 
	 //   spider_coupler( thickness=roller_coupler_thickness/2
	 //     , outer_d=roller_coupler_d, axle_d=roller_axle_d, bevel_dr=bevel_dr,shrink=2*hole_ext );
	}
    }
    translate([0,0,roller_coupler_thickness/2-hole_ext]) cylinder(r=roller_axle_d/2,h=roller_shield_thickness+2*hole_ext,center=false);
    // translate([0,0,roller_coupler_thickness/2-bevel_dr]) spider_coupler( thickness=roller_coupler_thickness/2+2*bevel_dr
	//	, outer_d=roller_coupler_d+2*bevel_dr, axle_d=roller_axle_d-2*bevel_dr, bevel_dr=bevel_dr/2,shrink=-2*hole_ext );
   }
  }
}


module pressure_roller_coupler2bearing_group(
	roller_axle_d=3.0, roller_thickness=15.0
	, roller_coupler_thickness=3.0, roller_coupler_d=12.0
	, roller_shield_d=20.0, roller_shield_thickness=3.0
	, roller_min_d=15.0, roller_max_d=18.0
	, pressure_roller_count=3
	, bevel_dr=0.5
	, gear_d=20.0, gear_clearance=0.4, gear_spacing=1.0
	, tube_outer_d=Tygon_B_44_3_OD()
	, tube_inner_d=Tygon_B_44_3_ID()
	, hole_ext=0.01
	, roller_bearing_od=Bearing_623_OD(), roller_bearing_th=Bearing_623_TH()
	) {
  $fs=0.1;
  for(i=[0:pressure_roller_count-1]) assign( rotAngle=360*i/pressure_roller_count ) {
    rotate([0,0,rotAngle]) translate([gear_d+gear_clearance+gear_spacing,0,0]) rotate([0,0,-2*rotAngle])
	  pressure_roller_coupler2bearing(
		roller_axle_d=roller_axle_d, roller_thickness=roller_thickness
		, roller_coupler_thickness=roller_coupler_thickness, roller_coupler_d=roller_coupler_d
		, roller_shield_d=roller_shield_d, roller_shield_thickness=roller_shield_thickness
		, roller_min_d=roller_min_d, roller_max_d=roller_max_d
		, bevel_dr=bevel_dr
		, gear_d=gear_d, gear_clearance=gear_clearance, gear_spacing=gear_spacing
		, tube_outer_d=tube_outer_d
		, tube_inner_d=tube_inner_d
		, hole_ext=hole_ext
		, roller_bearing_od=roller_bearing_od, roller_bearing_th=roller_bearing_th
	  );
  }
}

if(render_part==7) {
  echo("Rendering pressure_roller_coupler2bearing_group()...");
  pressure_roller_coupler2bearing_group(gear_spacing=2.0,roller_axle_d=roller_axle_d,motor_axle_d=motor_axle_d);
}

module pump_body(
	roller_axle_d=3.0, roller_thickness=15.0
	, roller_coupler_thickness=3.0, roller_coupler_d=12.0
	, roller_shield_d=20.0, roller_shield_thickness=3.0
	, roller_min_d=15.0, roller_max_d=18.0
	, pressure_roller_count=3
	, bevel_dr=0.5
	, gear_d=20.0, gear_clearance=0.4, gear_spacing=1.0
	, tube_outer_d=Tygon_B_44_3_OD()
	, tube_inner_d=Tygon_B_44_3_ID()
	, hole_ext=0.01
	) {
  $fs=0.1;
  dr1=gear_d+roller_min_d/2+tube_outer_d-tube_inner_d;
  dr2=gear_d+roller_max_d/2+tube_outer_d-tube_inner_d;
  difference() {
    cylinder(r=gear_d+roller_shield_d,h=2*roller_thickness,center=false);
    translate([0,0,-hole_ext]) cylinder(r=gear_d+roller_min_d/2+bevel_dr,h=2*roller_thickness+2*hole_ext,center=false);
    difference() {
	translate([0,0,roller_thickness/2]) cylinder(r=gear_d+3*roller_shield_d/4,h=roller_thickness+hole_ext,center=false);
	translate([0,0,roller_thickness/2-hole_ext])
	  cylinder(r=dr2-2*bevel_dr,h=2*roller_thickness+2*hole_ext,center=false);
    }
    translate([0,0,roller_thickness]) cylinder(r=gear_d+3*roller_shield_d/4,h=roller_thickness+hole_ext,center=false);
    translate([0,0,3*roller_thickness/3+roller_thickness/2-tube_outer_d]) rotate([0,0,-90]) 
	cube(size=[gear_d+roller_shield_d+2*bevel_dr,gear_d+roller_shield_d+2*bevel_dr,roller_thickness],center=false);
  }
}

if(render_part==8) assign(roller_thickness=15.0,roller_shield_thickness=3.0) {
  echo("Rendering pump_body()...");
  % translate([0,0,2*roller_thickness+roller_thickness/8]) rotate([180,0,90]) outer_pressure_ring(gear_spacing=0.0);
  pump_body(gear_spacing=0.0,roller_axle_d=roller_axle_d,motor_axle_d=motor_axle_d);
}

if(render_part==0) assign(
	gear_d=20.0, gear_num_teeth=17, gear_spacing=1.0
	, roller_gear_thickness=10.0, motor_gear_thickness=12.0
	, roller_gear_hub_thickness=15.0, motor_gear_hub_thickness=17.0
	, roller_gear_hub_d=12.0, motor_gear_hub_d=15.0
	, roller_axle_d=roller_axle_d, motor_axle_d=motor_axle_d
	, roller_gear_count=3
	, gear_clearance=0.4
	, bevel_dr=0.5
	, roller_thickness=15.0
	, roller_coupler_thickness=3.0, roller_coupler_d=12.0
	, roller_shield_d=20.0, roller_shield_thickness=3.0
	, roller_min_d=15.0, roller_max_d=18.0
	, pressure_roller_count=3
	, gear_d=20.0, gear_clearance=0.4, gear_spacing=1.0
	, tube_outer_d=Tygon_B_44_3_OD()
	, tube_inner_d=Tygon_B_44_3_ID()
	, hole_ext=0.01
	, gear_hub_thickness=15.0, gear_hub_d=12.0, gear_thickness=12.0
	, middle_axle_d=motor_axle_d
	, twist_ratio=0.5
	, roller_bearing_od=Bearing_623_OD(), roller_bearing_th=Bearing_623_TH()
	) {
  if(plate_number==0) {
    echo("Rendering full assembly...");
    drive_gears(gear_spacing=0.0);
    translate([0,0,13]) roller_gear_coupler2bearing_group(gear_spacing=0.0);
    translate([0,0,17]) roller_retainer_ring(gear_spacing=0.0);
    translate([0,0,26]) rotate([180,0,0]) pressure_roller_coupler2bearing_group(gear_spacing=0.0);
    translate([0,0,50]) rotate([180,0,0]) pump_pressure_rollers(gear_spacing=0.0);
    translate([0,0,29]) outer_pressure_ring(gear_spacing=0.0);
    translate([0,0,53]) roller_gear_coupler2bearing_group(gear_spacing=0.0);
    translate([0,0,60]) rotate([180,0,0]) roller_retainer_ring(gear_spacing=0.0);
    translate([0,0,65]) rotate([180,0,0]) roller_gear_coupler2bearing_group(gear_spacing=0.0);
    translate([0,0,100]) rotate([180,0,0]) alignment_gears(gear_spacing=0.0);
    translate([0,0,80]) rotate([180,0,0]) pump_body(gear_spacing=0.0);
  }
  if(plate_number>0) {
    % translate([50,50,-1.0]) cube(size=[100,100,2.0],center=true);
  }
  if(plate_number==1) {
    echo("Rendering printing plate 1...");
	translate([gear_d/2,gear_d/2,0]) {
	  motor_drive_gear(
		gear_d=gear_d, gear_num_teeth=gear_num_teeth, motor_gear_thickness=motor_gear_thickness, gear_spacing=gear_spacing
		, motor_gear_hub_thickness=motor_gear_hub_thickness, motor_gear_hub_d=motor_gear_hub_d, motor_axle_d=motor_axle_d
		, gear_clearance=gear_clearance, bevel_dr=bevel_dr
	  );
	  for(i=[1:roller_gear_count]) translate([i*(gear_d+3*gear_spacing),0,0]) roller_drive_gear(
		gear_d=gear_d, gear_num_teeth=gear_num_teeth, gear_thickness=roller_gear_thickness, gear_spacing=gear_spacing
		, gear_hub_thickness=roller_gear_hub_thickness, gear_hub_d=roller_gear_hub_d, roller_axle_d=roller_axle_d
		, gear_clearance=gear_clearance, bevel_dr=bevel_dr
	  );
	}

	translate([gear_d, 3*gear_d/2,0]) {
	  alignment_gear_middle(
		gear_d=gear_d, gear_num_teeth=gear_num_teeth, gear_thickness=gear_thickness, gear_spacing=gear_spacing
		, gear_hub_thickness=gear_hub_thickness, gear_hub_d=gear_hub_d, middle_axle_d=middle_axle_d
		, gear_clearance=gear_clearance, twist_ratio=twist_ratio, bevel_dr=bevel_dr
		);
	  for(i=[1:roller_gear_count]) translate([i*(gear_d+3*gear_spacing),0,0])
	    alignment_gear_roller(
		gear_d=gear_d, gear_num_teeth=gear_num_teeth, gear_thickness=gear_thickness, gear_spacing=gear_spacing
		, gear_hub_thickness=gear_hub_thickness, gear_hub_d=gear_hub_d, roller_axle_d=roller_axle_d
		, gear_clearance=gear_clearance, twist_ratio=twist_ratio, bevel_dr=bevel_dr
	    );
	}

	translate([gear_d/2,5*gear_d/2,0]) {
	  pressure_roller_coupler2bearing(
		roller_axle_d=roller_axle_d, roller_thickness=roller_thickness
		, roller_coupler_thickness=roller_coupler_thickness, roller_coupler_d=roller_coupler_d
		, roller_shield_d=roller_shield_d, roller_shield_thickness=roller_shield_thickness
		, roller_min_d=roller_min_d, roller_max_d=roller_max_d
		, bevel_dr=bevel_dr
		, gear_d=gear_d, gear_clearance=gear_clearance, gear_spacing=gear_spacing
		, tube_outer_d=tube_outer_d
		, tube_inner_d=tube_inner_d
		, hole_ext=hole_ext
		, roller_bearing_od=roller_bearing_od, roller_bearing_th=roller_bearing_th
	  );
	  for(i=[1:roller_gear_count]) translate([i*(gear_d+3*gear_spacing),0,0])
	    roller_gear_coupler2bearing(
		roller_axle_d=roller_axle_d, roller_thickness=roller_thickness
		, roller_coupler_thickness=roller_coupler_thickness, roller_coupler_d=roller_coupler_d
		, roller_shield_d=roller_shield_d, roller_shield_thickness=roller_shield_thickness
		, roller_min_d=roller_min_d, roller_max_d=roller_max_d
		, bevel_dr=bevel_dr
		, gear_d=gear_d, gear_clearance=gear_clearance, gear_spacing=gear_spacing
		, tube_outer_d=tube_outer_d
		, tube_inner_d=tube_inner_d
		, hole_ext=hole_ext
		, roller_bearing_od=roller_bearing_od, roller_bearing_th=roller_bearing_th
	  );
	}
	translate([gear_d,7*gear_d/2,0]) {
	  pressure_roller_coupler2bearing(
		roller_axle_d=roller_axle_d, roller_thickness=roller_thickness
		, roller_coupler_thickness=roller_coupler_thickness, roller_coupler_d=roller_coupler_d
		, roller_shield_d=roller_shield_d, roller_shield_thickness=roller_shield_thickness
		, roller_min_d=roller_min_d, roller_max_d=roller_max_d
		, bevel_dr=bevel_dr
		, gear_d=gear_d, gear_clearance=gear_clearance, gear_spacing=gear_spacing
		, tube_outer_d=tube_outer_d
		, tube_inner_d=tube_inner_d
		, hole_ext=hole_ext
		, roller_bearing_od=roller_bearing_od, roller_bearing_th=roller_bearing_th
	  );
	  for(i=[1:roller_gear_count]) translate([i*(gear_d+3*gear_spacing),0,0])
	    roller_gear_coupler2bearing(
		roller_axle_d=roller_axle_d, roller_thickness=roller_thickness
		, roller_coupler_thickness=roller_coupler_thickness, roller_coupler_d=roller_coupler_d
		, roller_shield_d=roller_shield_d, roller_shield_thickness=roller_shield_thickness
		, roller_min_d=roller_min_d, roller_max_d=roller_max_d
		, bevel_dr=bevel_dr
		, gear_d=gear_d, gear_clearance=gear_clearance, gear_spacing=gear_spacing
		, tube_outer_d=tube_outer_d
		, tube_inner_d=tube_inner_d
		, hole_ext=hole_ext
		, roller_bearing_od=roller_bearing_od, roller_bearing_th=roller_bearing_th
	  );
	}
	translate([gear_d/2,9*gear_d/2,0]) {
	  pressure_roller_coupler2bearing(
		roller_axle_d=roller_axle_d, roller_thickness=roller_thickness
		, roller_coupler_thickness=roller_coupler_thickness, roller_coupler_d=roller_coupler_d
		, roller_shield_d=roller_shield_d, roller_shield_thickness=roller_shield_thickness
		, roller_min_d=roller_min_d, roller_max_d=roller_max_d
		, bevel_dr=bevel_dr
		, gear_d=gear_d, gear_clearance=gear_clearance, gear_spacing=gear_spacing
		, tube_outer_d=tube_outer_d
		, tube_inner_d=tube_inner_d
		, hole_ext=hole_ext
		, roller_bearing_od=roller_bearing_od, roller_bearing_th=roller_bearing_th
	  );
	  for(i=[1:roller_gear_count]) translate([i*(gear_d+3*gear_spacing),0,0])
	    roller_gear_coupler2bearing(
		roller_axle_d=roller_axle_d, roller_thickness=roller_thickness
		, roller_coupler_thickness=roller_coupler_thickness, roller_coupler_d=roller_coupler_d
		, roller_shield_d=roller_shield_d, roller_shield_thickness=roller_shield_thickness
		, roller_min_d=roller_min_d, roller_max_d=roller_max_d
		, bevel_dr=bevel_dr
		, gear_d=gear_d, gear_clearance=gear_clearance, gear_spacing=gear_spacing
		, tube_outer_d=tube_outer_d
		, tube_inner_d=tube_inner_d
		, hole_ext=hole_ext
		, roller_bearing_od=roller_bearing_od, roller_bearing_th=roller_bearing_th
	  );
	}
  }
	// translate([gear_d,0,0]) alignment_gears(gear_spacing=gear_spacing);
}
