include <conf.scad>
include <lazy.scad>
include <shapes.scad>

use <y-carriage.scad>

module x_rail_assembly()
    pose([72, 0, 321], [409, 188, -39], d = 600, exploded = true)
    assembly("x_rail") {
  x_rail_left_assembly();
  txyz(fw/2-ew*.5, pos[1]-15, ew*2+y_car_h) rz(90) {
    explode([0, -40, 0], offset = [0, 40, 0]) right_y_carriage_assembly();
    tz(th) {
      // top extrusion screw
      txy(y_car_ext[0], -(y_car_ext[1]-8)) screw(ex_print_screw, 16);
      // bottom extrusion screw
      txyz(y_car_ext[0], -(y_car_ext[1]-8), -y_rail_offset-ew/2-th)
        vflip() screw(ex_print_screw, 10);
    }
    // top extrusion t-nut
    txyz(y_car_ext[0], -(y_car_ext[1]-8), -3-th)
      explode([0,-20,0]) rz(90) vflip() sliding_t_nut(M3_sliding_t_nut);
    // bottom extrusion t-nut
    txyz(y_car_ext[0], -(y_car_ext[1]-8), -th-ew+1)
      explode([0,-20,0]) rz(90) sliding_t_nut(M3_sliding_t_nut);
  }
}

module x_rail_left_assembly()
    pose([63, 0, 21], [-354, 297, -118], d = 800, exploded = true)
    assembly("x_rail_left") {
  tz(x_rail_h) x_rail_carriage_assembly();
  txyz(-(fw/2-ew*.5), pos[1]-15, ew*2+y_car_h) rz(90) {
    explode([0, 40, 0], offset = [0, -40, 0]) left_y_carriage_assembly();
    tz(th) {
      // top extrusion screw
      txy(y_car_ext[0], y_car_ext[1]-8) screw(ex_print_screw, 16);
      // bottom extrusion screw
      txyz(y_car_ext[0], y_car_ext[1]-8, -y_rail_offset-ew/2-th)
        vflip() screw(ex_print_screw, 10);
    }
    // top extrusion t-nut
    txyz(y_car_ext[0], y_car_ext[1]-8, -3-th)
      explode([0,20,0]) rz(90) vflip() sliding_t_nut(M3_sliding_t_nut);
    // bottom extrusion t-nut
    txyz(y_car_ext[0], y_car_ext[1]-8, -th-ew+1)
      explode([0,20,0]) rz(90) sliding_t_nut(M3_sliding_t_nut);
  }
}

module x_rail_carriage_assembly() assembly("x_rail_carriage") {
  tyz(pos[1], ew/2) {
    ty(-ew/2) rx(90) {
      rail_assembly(x_car, x_rail_l, pos = pos[0]);
    rail_screws(x_rail, x_rail_l, 5);
    tz(-2) explode([200, 0, 0])
      rail_hole_positions(x_rail, x_rail_l) vflip()
        sliding_t_nut(M3_sliding_t_nut);
    }
    ry(90) extrusion(e2020, x_bar_l);
  }
}
