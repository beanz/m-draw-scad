include <conf.scad>
include <lazy.scad>
include <shapes.scad>

use <idlers.scad>

module left_y_carriage_assembly() assembly("left_y_carriage") {
  left_y_carriage_stl();
  left_lower_y_carriage_stl();
  
  tz(th) {
    // idler screws
    for (i = y_car_idlers) txy(-i[1], -i[0]) {
      screw_and_washer(idler_screw, 45);
      tz(-y_rail_offset-ew/2-th) vflip() nut_and_washer(M4_nut);
    }

    // idlers
    txyz(-y_car_idlers[0][1], -y_car_idlers[0][0], -y_car_idler_h[0]-idler_h/2)
      idler_assembly();
    txyz(-y_car_idlers[1][1], -y_car_idlers[1][0], -y_car_idler_h[1]-idler_h/2)
      idler_assembly();
  }
}

module left_y_carriage_stl() stl("left_y_carriage") {
  color(print_color) render() {
    difference() {
      union() {
        txy((ew+th*2)/2, -y_car_overhang/2)
          rrcf([ew+th*2, y_car_w+y_car_overhang, th]);
        difference() {
          txyz((ew+th*2)/2,
               -(y_car_w/2+y_car_overhang-(y_car_overhang-3)/2),
               -y_rail_offset+th)
            rrcf([ew+th*2, y_car_overhang-3, y_rail_offset]);
          txyz(-y_car_idlers[1][1], -y_car_idlers[1][0],
               -y_car_idler_h[1])
            cylinder(d = bbr*2+3, h = idler_h+th/2, center = true);
        }
        hull() {
          rrcf([y_car_l, y_car_w, th]);
          txy((ew+th*2)/2,
              -(y_car_w/2+y_car_overhang-(y_car_overhang-3)/2))
            rrcf([ew+th*2, y_car_overhang-3, th]);
          txy(-y_car_idlers[0][1], -y_car_idlers[0][0])
            cylinder(d = bbr+th*2, h = th);
        }

        // idler pillars
        txyz(-y_car_idlers[0][1], -y_car_idlers[0][0],
             th-y_car_idler_h[0])
          cylinder(d = washer_diameter(M3_washer), h = y_car_idler_h[0]);
        txyz(-y_car_idlers[1][1], -y_car_idlers[1][0],
             th-y_car_idler_h[1])
          cylinder(d = washer_diameter(M3_washer), h = y_car_idler_h[1]);
      }

      // extrusion cut
      txyz(y_car_ext[0], 0.5+y_car_ext[1]-40/2, y_car_ext[2])
        cc([20.5, 40, 20.5]);

      // extrusion screw
      txy(y_car_ext[0], y_car_ext[1]-8)
        cylinder(d = screw_clearance_d(ex_print_screw),
                 h = 100, center = true);

      // carriage holes
      carriage_hole_positions(y_car) {
        cylinder(d = screw_clearance_d(carriage_screw(y_car)),
                 h = 100, center = true);
      }

      // idler screws
      for (i = y_car_idlers) {
        txy(-i[1], -i[0])
          cylinder(d = screw_clearance_d(idler_screw),
                   h = 100, center = true);
      }
    }
  }
}

module left_lower_y_carriage_stl() stl("left_lower_y_carriage") {
  color(alt_print_color) render() {
    difference() {
      union() {
        difference() {
          txyz((ew+th*2)/2,
                -(y_car_w/2+y_car_overhang-(y_car_overhang-3)/2),
                -y_rail_offset-ew/2)
            rrcf([ew+th*2, y_car_overhang-3, ew/2+th]);
          txyz(-y_car_idlers[1][1], -y_car_idlers[1][0],
               -y_car_idler_h[1])
            cylinder(d = bbr*2+3, h = idler_h+th/2, center = true);
        }
        tz(-y_rail_offset-ew/2) hull() {
          txy((ew+th*2)/2,
              -(y_car_w/2+y_car_overhang-(y_car_overhang-3)/2))
            rrcf([ew+th*2, y_car_overhang-3, th]);
          txy(-y_car_idlers[0][1], -y_car_idlers[0][0])
            cylinder(d = bbr+th*2, h = th);
          txy(-y_car_idlers[1][1], -y_car_idlers[1][0])
            cylinder(d = bbr+th*2, h = th);
        }

        // idler pillars
        txyz(-y_car_idlers[0][1], -y_car_idlers[0][0],
             -y_rail_offset-ew/2)
          cylinder(d = washer_diameter(M3_washer),
                   h = y_rail_offset+ew/2+th-(y_car_idler_h[0]+idler_h));
        txyz(-y_car_idlers[1][1], -y_car_idlers[1][0],
             -y_rail_offset-ew/2)
          cylinder(d = washer_diameter(M3_washer),
                   h = y_rail_offset+ew/2+th-(y_car_idler_h[1]+idler_h));
      }

      // extrusion cut
      txyz(y_car_ext[0], 0.5+y_car_ext[1]-40/2, y_car_ext[2])
        cc([20.5, 40, 20.5]);

      // extrusion screw
      txy(y_car_ext[0], y_car_ext[1]-8)
        cylinder(d = screw_clearance_d(ex_print_screw),
                 h = 100, center = true);

      // idler screws
      for (i = y_car_idlers) {
        txy(-i[1], -i[0])
          cylinder(d = screw_clearance_d(idler_screw),
                   h = 100, center = true);
      }
    }
  }
}

module right_y_carriage_assembly() assembly("right_y_carriage") {
  right_y_carriage_stl();
  right_lower_y_carriage_stl();
  
  tz(th) {
    // idler screws
    for (i = y_car_idlers) txy(-i[1], i[0]) {
      screw_and_washer(idler_screw, 45);
      tz(-y_rail_offset-ew/2-th) vflip() nut_and_washer(M4_nut);
    }

    // idlers
    txyz(-y_car_idlers[0][1], y_car_idlers[0][0],
         -y_car_idler_h[1]-idler_h/2)
      idler_assembly();
    txyz(-y_car_idlers[1][1], y_car_idlers[1][0],
         -y_car_idler_h[0]-idler_h/2)
      idler_assembly();
  }
}

module right_y_carriage_stl() stl("right_y_carriage") {
  color(print_color) render() {
    difference() {
      union() {
        txy((ew+th*2)/2, +y_car_overhang/2)
          rrcf([ew+th*2, y_car_w+y_car_overhang, th]);
        difference() {
          txyz((ew+th*2)/2,
               (y_car_w/2+y_car_overhang-(y_car_overhang-3)/2),
               -y_rail_offset+th)
            rrcf([ew+th*2, y_car_overhang-3, y_rail_offset]);
          txyz(-y_car_idlers[1][1], y_car_idlers[1][0], -y_car_idler_h[0])
            cylinder(d = bbr*2+3, h = idler_h+th/2, center = true);
        }
        hull() {
          rrcf([y_car_l, y_car_w, th]);
          txy((ew+th*2)/2, y_car_w/2+y_car_overhang-(y_car_overhang-3)/2)
            rrcf([ew+th*2, y_car_overhang-3, th]);
          txy(-y_car_idlers[0][1], y_car_idlers[0][0])
            cylinder(d = bbr+th*2, h = th);
        }

        // idler pillars
        txyz(-y_car_idlers[0][1], y_car_idlers[0][0], th-y_car_idler_h[1])
          cylinder(d = washer_diameter(M3_washer), h = y_car_idler_h[1]);
        txyz(-y_car_idlers[1][1], y_car_idlers[1][0], th-y_car_idler_h[0])
          cylinder(d = washer_diameter(M3_washer), h = y_car_idler_h[0]);
      }

      // extrusion cut
      txyz(y_car_ext[0], -(0.5+y_car_ext[1]-40/2), y_car_ext[2])
        cc([20.5, 40, 20.5]);

      // extrusion screw
      txy(y_car_ext[0], -(y_car_ext[1]-8))
        cylinder(d = screw_clearance_d(ex_print_screw),
                 h = 100, center = true);

      // carriage holes
      carriage_hole_positions(y_car) {
        cylinder(d = screw_clearance_d(carriage_screw(y_car)),
                 h = 100, center = true);
      }

      // idler screws
      for (i = y_car_idlers) {
        txy(-i[1], i[0])
          cylinder(d = screw_clearance_d(idler_screw),
                   h = 100, center = true);
      }
    }
  }
}

module right_lower_y_carriage_stl() stl("right_lower_y_carriage") {
  color(alt_print_color) render() {
    difference() {
      union() {
        difference() {
          txyz((ew+th*2)/2,
                y_car_w/2+y_car_overhang-(y_car_overhang-3)/2,
                -y_rail_offset-ew/2)
            rrcf([ew+th*2, y_car_overhang-3, ew/2+th]);
          txyz(-y_car_idlers[1][1], y_car_idlers[1][0], -y_car_idler_h[0])
            cylinder(d = bbr*2+3,
                     h = idler_h+th/2, center = true);
        }
        tz(-y_rail_offset-ew/2) hull() {
          txy((ew+th*2)/2, y_car_w/2+y_car_overhang-(y_car_overhang-3)/2)
            rrcf([ew+th*2, y_car_overhang-3, th]);
          txy(-y_car_idlers[0][1], y_car_idlers[0][0])
            cylinder(d = bbr+th*2, h = th);
          txy(-y_car_idlers[1][1], y_car_idlers[1][0])
            cylinder(d = bbr+th*2, h = th);
        }

        // idler pillars
        txyz(-y_car_idlers[0][1], y_car_idlers[0][0], -y_rail_offset-ew/2)
          cylinder(d = washer_diameter(M3_washer),
                   h = y_rail_offset+ew/2+th-(y_car_idler_h[1]+idler_h));
        txyz(-y_car_idlers[1][1], y_car_idlers[1][0], -y_rail_offset-ew/2)
          cylinder(d = washer_diameter(M3_washer),
                   h = y_rail_offset+ew/2+th-(y_car_idler_h[0]+idler_h));
      }

      // extrusion cut
      txyz(y_car_ext[0], -(0.5+y_car_ext[1]-40/2), y_car_ext[2])
        cc([20.5, 40, 20.5]);

      // extrusion screw
      txy(y_car_ext[0], -(y_car_ext[1]-8))
        cylinder(d = screw_clearance_d(ex_print_screw),
                 h = 100, center = true);

      // idler screws
      for (i = y_car_idlers) {
        txy(-i[1], i[0])
          cylinder(d = screw_clearance_d(idler_screw),
                   h = 100, center = true);
      }
    }
  }
}

