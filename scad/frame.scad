include <conf.scad>
include <lazy.scad>
include <shapes.scad>

use <corners.scad>

module frame_assembly()
    pose([37, 0, 301], [-16, -214, 60], d = 1300, exploded = true)
    assembly("frame") {
  back_and_y_assembly();
  ty(-fd/2) explode([0, -40, 0], true) {
    front_frame_assembly();
  }
  txy(-fw/2+ew/2, -fd/2+ew/2) explode([0, -40, 0], true) {
    tyz(-ew/2-th, ew*.5) rx(90) screw(ex_tap_screw, 10);
    tyz(-ew/2-th, ew*1.5) rx(90) screw(alt_ex_tap_screw, 10);
    tz(ew2-2) rz(90) vflip() sliding_t_nut(M4_sliding_t_nut);
  }
  txy(fw/2-ew/2, -fd/2+ew/2) explode([0, -40, 0], true) {
    tyz(-ew/2-th, ew*.5) rx(90) screw(ex_tap_screw, 10);
    tyz(-ew/2-th, ew*1.5) rx(90) screw(alt_ex_tap_screw, 10);
    tz(ew2-2) rz(90) vflip() sliding_t_nut(M4_sliding_t_nut);
  }
}

//! Repeat for both back corners

module back_and_y_assembly()
    pose([43, 0, 76], [146, 228, -71], d = 600, exploded = true)
    assembly("back_and_y") {
  tx(-(fw/2-ew*.5)) y_rail_assembly();
  tx(fw/2-ew*.5) y_rail_assembly();
  ty(fd/2-ew*.5) explode([0, 40, 0], true) {
    back_frame_assembly();
  }
  txy(-fw/2+ew/2, fd/2-ew*.5) explode([0, 40, 0], true) {
    tyz(ew/2+th, ew*.5) rx(-90) screw(ex_tap_screw, 10);
    tyz(ew/2+th, ew*1.5) rx(-90) screw(ex_tap_screw, 10);
    tz(ew2-2) rz(90) vflip() sliding_t_nut(M4_sliding_t_nut);
  }
  txy(fw/2-ew/2, fd/2-ew*.5) explode([0, 40, 0], true) {
    tyz(ew/2+th, ew*.5) rx(-90) screw(ex_tap_screw, 10);
    tyz(ew/2+th, ew*1.5) rx(-90) screw(ex_tap_screw, 10);
    tz(ew2-2) rz(90) vflip() sliding_t_nut(M4_sliding_t_nut);
  }
}

module y_rail_assembly() assembly("y_rail") {
  tz(ew*2) rz(90) {
    rail_assembly(y_car, y_rail_l, pos = pos[1]-15);
    rail_screws(y_rail, y_rail_l, 5);
    tz(-2) explode([200, 0, 0]) rail_hole_positions(y_rail, y_rail_l) vflip()
      sliding_t_nut(M3_sliding_t_nut);
  }
  tz(ew) rx(90) extrusion(e2040, fd);
}

module front_frame_assembly()
    pose([45, 0, 332], [-258, -25, 47], d = 300, exploded = true)
    assembly("front_frame") {
  front_frame_left_assembly();
  tx(-fw/2) explode([-40, 0, 0], explode_children = true,
                    offset = [ew*2.2, -ew, ew-th/2]) {
    rx(90) right_front_corner_stl();
    txyz(ew-tth, -ew/2, ew*1.5) ry(-90) screw(alt_ex_tap_screw, 10);
    txyz(ew*1.5, -ew/2, ew+2) sliding_t_nut(M4_sliding_t_nut);
    txyz(ew*1.5, ew/2, ew+2) vflip() sliding_t_nut(M4_sliding_t_nut);
    txyz(ew*1.5, ew/2, ew*2-2) vflip() sliding_t_nut(M4_sliding_t_nut);
    txyz(ew*2.5, ew/2, ew*2-2) vflip() sliding_t_nut(M4_sliding_t_nut);
  }
  txyz(-fw/2+ew*1.5, -ew/2, ew-th) vflip() screw(ex_print_screw, 10);
}

module front_frame_left_assembly()
    pose([50, 0, 24], [205, 70, -47], d = 450, exploded = true)
    assembly("front_frame_left") {
  tz(ew*1.5) ry(90) extrusion(e2040, fw-ew*2);
  tx(fw/2) explode([40, 0, 0], explode_children = true,
                   offset = [-ew*2.2, -ew, ew-th/2]) {
    rx(90) left_front_corner_stl();
    txyz(-ew+tth, -ew/2, ew*1.5) ry(90) screw(alt_ex_tap_screw, 10);
    txyz(-ew*1.5, -ew/2, ew+2) sliding_t_nut(M4_sliding_t_nut);
    txyz(-ew*1.5, ew/2, ew+2) sliding_t_nut(M4_sliding_t_nut);
    txyz(-ew*1.5, ew/2, ew*2-2) vflip() sliding_t_nut(M4_sliding_t_nut);
    txyz(-ew*2.5, ew/2, ew*2-2) vflip() sliding_t_nut(M4_sliding_t_nut);
  }
  txyz(fw/2-ew*1.5, -ew/2, ew-th) vflip() screw(ex_print_screw, 10);
}

module back_frame_assembly()
    pose([28, 0, 315], [-307, -68, 181], d = 325, exploded = true)
    assembly("back_frame") {
  back_frame_left_assembly();
  tx(-fw/2) explode([-60, 0, 0], explode_children = true,
                   offset = [ew*3.2, ew/2, ew-th/2]) {
    ty(ew/2) rx(-90) right_back_corner_stl();
    txyz(ew*2.5, 0, ew2-2) vflip() sliding_t_nut(M4_sliding_t_nut);
    txyz(ew*1.5, 0, ew2-2) vflip() sliding_t_nut(M4_sliding_t_nut);
    txyz(ew*2.5, +ew/2-2, ew/2) rx(90) sliding_t_nut(M4_sliding_t_nut);
    txyz(ew*1.5, +ew/2-2, ew/2) rx(90) sliding_t_nut(M4_sliding_t_nut);
    txyz(ew*1.5, +ew/2-2, ew*1.5) rx(90) sliding_t_nut(M4_sliding_t_nut);
    txyz(ew*2.5, -ew/2+2, ew/2) rx(-90) sliding_t_nut(M4_sliding_t_nut);
    txyz(ew*1.5, -ew/2+2, ew/2) rx(-90) sliding_t_nut(M4_sliding_t_nut);
  }
  txyz(-fw/2+ew*2.5, ew/2+th, ew/2) explode([0,30,0], false)
    rx(-90) screw(ex_print_screw, 10);
  txyz(-fw/2+ew*1.5, ew/2+th, ew/2) explode([0,30,0], false)
    rx(-90) screw(ex_print_screw, 10);
  txyz(-fw/2+ew*1.5, ew/2+th, ew*1.5) explode([0,30,0], false)
    rx(-90) screw(ex_print_screw, 10);
}

module back_frame_left_assembly()
    pose([39, 0, 47], [294, -7, 60], d = 325, exploded = true)
    assembly("back_frame_left") {
  tz(ew) rz(90) rx(90) extrusion(e2040, fw-ew*2);
  tx(fw/2) explode([60, 0, 0], explode_children = true,
                   offset = [-ew*3.2, ew/2, ew-th/2]) {
    ty(ew/2) rx(-90) left_back_corner_stl();
    txyz(-ew*2.5, 0, ew2-2) vflip() sliding_t_nut(M4_sliding_t_nut);
    txyz(-ew*1.5, 0, ew2-2) vflip() sliding_t_nut(M4_sliding_t_nut);
    txyz(-ew*2.5, +ew/2-2, ew/2) rx(90) sliding_t_nut(M4_sliding_t_nut);
    txyz(-ew*1.5, +ew/2-2, ew/2) rx(90) sliding_t_nut(M4_sliding_t_nut);
    txyz(-ew*1.5, +ew/2-2, ew*1.5) rx(90) sliding_t_nut(M4_sliding_t_nut);
    txyz(-ew*2.5, -ew/2+2, ew/2) rx(-90) sliding_t_nut(M4_sliding_t_nut);
    txyz(-ew*1.5, -ew/2+2, ew/2) rx(-90) sliding_t_nut(M4_sliding_t_nut);
  }
  txyz(fw/2-ew*2.5, ew/2+th, ew/2) explode([0,30,0], false)
    rx(-90) screw(ex_print_screw, 10);
  txyz(fw/2-ew*1.5, ew/2+th, ew/2) explode([0,30,0], false)
    rx(-90) screw(ex_print_screw, 10);
  txyz(fw/2-ew*1.5, ew/2+th, ew*1.5) explode([0,30,0], false)
    rx(-90) screw(ex_print_screw, 10);
}
