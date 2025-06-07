include <conf.scad>
include <lazy.scad>
include <shapes.scad>

module pen_assembly() assembly("pen") {
  //pen_mount_stl();
  //tx(-100) pen_holder_stl();
  txyz(0.5, -servo_shaft_offset()+13.5, servo_boss_height()) {
    tz(-th) servo(-90);
    tz(0) servo_hole_positions() screw(M2_cap_screw, 8);
  }
}

module pen_mount_stl() stl("pen_mount") {
  w = x_carriage_w+servo_width();
  color(print_color) render() difference() {
    union() {
      txy(-servo_width()/2+2+12/2, 6.5) rrcf([servo_width()+4, 46, 4]);
      tx(-w/2+12/2) rrcf([w, 33, 4]);
    }
    txy(2, 12) {
      tz(-eta/2) rcc([12.5, 25.5, 4+eta]);
      ty(-servo_shaft_offset()) servo_hole_positions()
        cylinder(d = 2.2, h = 100, center = true);
    }
      tx(-w/2) carriage_hole_positions(x_car)
        cylinder(d = screw_clearance_d(carriage_screw(x_car)),
                 h = 100, center = true);
  }
}

module pen_holder_stl() stl("pen_holder") {
  h = 40;
  color(print_color) render() difference() {
    ty(-4) rrcf([18, 25, h]);
    tx(2) hull() {
      ty(-5) rz(90) cylinder(d = 16/cos(30), h = h, $fn=6);
      rcc([16, 8, h]);
    }
    tz(h/2) ry(90) carriage_hole_positions(MGN7C_carriage) {
      cylinder(d = screw_clearance_d(carriage_screw(MGN7C_carriage)),
               h = 100, center = true);
    }
    ty(4-eta) tz(h/2) rx(-90)
      cylinder(d = screw_tap_d(M4_cap_screw), h = 40);

    tz(h/2) ry(90) myz(36/2-eta) tz(-9) {
      cylinder(d = screw_clearance_d(M3_cap_screw), h = 100);
      tz(1.5) cylinder(d = 6, h = 100);
    }
  }
}

function servo_width() = 12;
function servo_boss_height() = 6.5;
function servo_shaft_diameter() = 4.8;
function servo_shaft_height() = 4;
function servo_shaft_offset() = -23/2++11.5/2+0.1;

module servo(angle) {
  vitamin(str("mg92b: MG92B Servo"));
  oy = servo_shaft_offset();
  boss_h = servo_boss_height();
  w = servo_width();

  color("black") render() difference() {
    union() {
      tyz(oy, -24-boss_h) rcc([w, 23, 26]);
      tyz(oy, -2-boss_h) rcc([w, 31.3, 2]);
      tz(-eta-boss_h) cylinder(d = 11.5, h = boss_h);
    }
    servo_hole_positions() {
      ty(2) cc([1, 3, 8]);
      cylinder(d = 2.2, h = 8, center = true);
    }
  }
  color("steelblue") render() {
    tyz(oy, -22) rcc([w+eta, 23+eta, 14]);
  }
  color("silver") render() {
    tz(eta)
      cylinder(d = servo_shaft_diameter(), h = servo_shaft_height());
  }
  tyz(oy, -24-boss_h+1.48/2) rx(-90) {
    color("red") cylinder(d= 1.48, h = 12.5);
    tx(-1.48) color("orange") cylinder(d= 1.48, h = 12.5);
    tx(1.48) color("brown") cylinder(d= 1.48, h = 12.5);
  }

  if (!is_undef(angle)) {
    rz(angle) tz(5.5) color("white") render () {
      tz(-1) cylinder(d = 7, h = 4, center = true);
      tz(-1) hull() {
        cylinder(d = 7, h = 2, center = true);
        ty(14) cylinder(d = 4, h = 2, center = true);
      }
    }
  }
}

module servo_hole_positions() {
  oy = servo_shaft_offset();
  gap_y = 27.8;
  tyz(oy, -6.5) mxz(gap_y/2) children();
}
