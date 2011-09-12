// Finger variant constructed with triangle cross-sections.
//render_part=0; // tri_equ, equilateral triangle
// render_part=1; // joint_core()
render_part=2; // joint1()

module tri_equ(l=3.0) {
  scale([l,l])
    polygon(points=[[-0.5,0],[0.5,0],[0,sqrt(3)/2]], paths=[[0,1,2]]);
}

if(render_part==0) {
  echo("Rendering tri_equ()...");
  tri_equ();
}

module joint_core(l=8.0,d=3.0,s=0.1) {
  difference() {
    union() {
      translate([-d/4,0,0]) rotate([-90,0,0]) cylinder($fn=6,r=d/4,h=l,center=false);
      translate([d/4,0,0]) rotate([-90,0,0]) cylinder($fn=6,r=d/4,h=l,center=false);
      translate([0,0,(sqrt(3)/3)*d/4]) rotate([-90,0,0]) cylinder($fn=6,r=d/3,h=l,center=false);
      translate([0,0,(sqrt(3)/2)*d/2]) rotate([-90,0,0]) cylinder($fn=6,r=d/4,h=l,center=false);
    }
    mirror([0,0,1]) translate([-d/2-s,-s,0]) cube(size=[d+2*s,l+2*s,d],center=false);
    translate([0,-s,(sqrt(3)/2)*d/2]) rotate([-90,0,0]) cylinder($fn=6,r=d/8,h=l+2*s,center=false);
    translate([-d/4,-s,0]) rotate([-90,0,0]) cylinder($fn=6,r=d/8,h=l+2*s,center=false);
    translate([d/4,-s,0]) rotate([-90,0,0]) cylinder($fn=6,r=d/8,h=l+2*s,center=false);
    // translate([0,-s,(sqrt(3)/3)*d/4]) rotate([-90,0,0]) cylinder($fn=6,r=d/8,h=l+2*s,center=false);
    translate([0,-s,(sqrt(3)/3)*d/4]) rotate([-90,90,0]) cylinder($fn=3,r=(sqrt(3)/3)*d/4,h=l+2*s,center=false);
    translate([0,l/2,0]) rotate([-90,0,90]) cylinder($fn=6,r=d/8,h=l+2*s,center=true);
  }
}

if(render_part==1) {
  echo("Rendering joint_core()...");
  joint_core(l=8*(8+5+3)/16,d=3.0);
}


module joint_side(l=8.0,d=0.3,s=0.1) {
  difference() {
    rotate([90,0,180]) linear_extrude(height=l) tri_equ(l=d/2);
    translate([0,-0.1,0]) rotate([-90,0,0])
      cylinder($fn=6,r=d/8,h=l+0.2,center=false);
    translate([0,l/2,0]) rotate([-90,0,90])
      cylinder($fn=6,r=d/8,h=l+0.2,center=true);
  }
}

module joint_end(l=8.0,d=0.3,s=0.1) {
  difference() {
    union() {
      rotate([90,0,180]) linear_extrude(height=l) tri_equ(l=d/2);
      translate([d/4,0,0]) rotate([90,60,180]) translate([-d/4,0,0]) linear_extrude(height=l) tri_equ(l=d/2);
    }
    translate([0,-0.1,0]) rotate([-90,0,0])
      cylinder($fn=6,r=d/8,h=l+0.2,center=false);
    translate([0,l/2,0]) rotate([-90,0,90])
      cylinder($fn=6,r=d/8,h=l+0.2,center=true);
  }
}

module joint1(l=8.0,d=3.0,s=0.1) {
  joint_core(l=l,d=d,s=s);
  translate([d/2+s+d/4,0,0]) joint_side(l=l,d=d,s=s);
  translate([d/2+s+d/2+s+d/4,0,0]) joint_end(l=l,d=d,s=s);
  translate([-d/2-s-d/4,0,0]) mirror([1,0,0]) joint_side(l=l,d=d,s=s);
  translate([-d/2-s-d/2-s-d/4,0,0]) mirror([1,0,0]) joint_end(l=l,d=d,s=s);
}

if(render_part==2) {
  echo("Rendering joint1()...");
  joint1(l=8*(8+5+3)/16,d=3.0);
}

