include <conf.scad>
include <lazy.scad>
include <shapes.scad>

module back_corner() color(print_color) render() {
  txy(-ew*1.5, -ew) difference() {
    hull() {
      ty(ew/2) rrcf([ew*3, ew, th]);
      tx(ew/2) rrcf([ew*2, ew*2, th]);
    }
    mxz(ew/2)
      cylinder(d = screw_clearance_d(ex_print_screw),
               h = 100, center = true);
    txy(-ew, ew/2)
      cylinder(d = screw_clearance_d(ex_print_screw),
               h = 100, center = true);
    tx(ew) mxz(ew/2)
      cylinder(d = screw_clearance_d(ex_tap_screw),
               h = 100, center = true);
  }
}

module left_back_corner_stl() stl("left_back_corner") {
  back_corner();
}

module right_back_corner_stl() stl("right_back_corner") {
  mirror([1,0,0]) back_corner();
}

module front_corner() color(print_color) render() {
  txy(-ew/2, ew) difference() {
    union() {
      rrcf([ew, ew*2, th]);
      txyz(-ew/2, ew/2-th/2, ew/2) ry(90) rrcf([ew, ew+th, tth]);
      txyz(-ew+tth/2, 0, ew/2) rx(90) rrcf([ew+tth, ew, th]);
    }
    mxz(ew/2)
      cylinder(d = screw_clearance_d(ex_tap_screw),
               h = 100, center = true);
    txz(-ew, ew/2)
      rx(90) cylinder(d = screw_clearance_d(ex_print_screw),
               h = 100, center = true);
    tyz(ew/2, ew/2)
      ry(90) cylinder(d = screw_clearance_d(ex_tap_screw),
                      h = 100, center = true);
  }
}

module left_front_corner_stl() stl("left_front_corner") {
  front_corner();
}

module right_front_corner_stl() stl("right_front_corner") {
  mirror([1,0,0]) front_corner();
}
