include <conf.scad>
include <lazy.scad>
include <shapes.scad>

module left_idler_assembly() assembly("left_idler") {
  txyz(-motor_x, -motor_y, ew2) {
    left_idler_mount_stl();
    txyz(-NEMA_hole_pitch(NEMA17_47)/2,
         -10,
         -(ew2-top_belt_h-idler_h/2)-idler_h/2) {
      left_inner_idler_assembly();
      for (z = [12, -20-(top_belt_h-bottom_belt_h)])
        tz(z) rx(-90) tz(-4-45/2-nut_thickness(tensioning_nut)/2)
          nut(tensioning_nut);
    }
    for (x = [ew*.5, 72-ew/2]) {
      txyz(-motor_x_offset+x, -motor_y_offset+ew*.5, th) {
        screw(ex_print_screw, 10);
      }
    }
    txyz(-(motor_x_offset-72+ew/2), -motor_y_offset+ew*.5, -ew-th) {
      vflip() screw(ex_print_screw, 10);
    }
  }
}

module left_idler_mount_stl() stl("left_idler_mount") {
  color(print_color) render() difference() {
    union() {
      txy(-motor_x_offset/2+(ew+3)/2, -motor_y_offset+ew/2)
        rrcf([motor_x_offset+NEMA_width(NEMA17_47)/2+th/2, ew, th]);
      txyz(-NEMA_hole_pitch(NEMA17_47)/2,
           -10,
           -(ew2-top_belt_h-idler_h/2)-idler_h/2) {
        tyz(-8,-4-(top_belt_h-bottom_belt_h)/2)
          rc([24,34,48+(top_belt_h-bottom_belt_h)]);
      }
      txyz(-motor_x_offset/2+(ew+3)/2+ew/2, -motor_y_offset+ew/2, -ew-th)
        rrcf([motor_x_offset+NEMA_width(NEMA17_47)/2+th/2-ew, ew, th]);
    }

    // idler slot
    hull() for (y = [10,-4]) {
      txyz(-NEMA_hole_pitch(NEMA17_47)/2,
           y-10,
           -(ew2-top_belt_h-idler_h/2)-idler_h/2) {
        tz(-4-(top_belt_h-bottom_belt_h)/2)
          rc([21,21,45+(top_belt_h-bottom_belt_h)]);
      }
    }
    // tensioning screw holes
    txyz(-NEMA_hole_pitch(NEMA17_47)/2,
           -10,
           -(ew2-top_belt_h-idler_h/2)-idler_h/2) {
      for (z = [12, -20-(top_belt_h-bottom_belt_h)]) {
        tz(z) rx(-90) {
          cylinder(d = screw_clearance_d(tensioning_screw),
                   h = 80, center = true);
          tz(-4-45/2-nut_thickness(M4_nut)/2)
            cylinder(r = nut_radius(M4_nut)+1,
                     h = nut_thickness(M4_nut) + 1);
        }
      }
    }

    txyz(-motor_x_offset/2+(ew+3)/2, -motor_y_offset+ew/2, -ew/2)
      cc([100, ew, ew]);

    // top extrusion_mount_holes
    for (x = [ew*.5, 72-ew/2]) {
      txy(-motor_x_offset+x, -motor_y_offset+ew*.5) {
        cylinder(d = screw_clearance_d(ex_print_screw),
                 h = 100, center = true);
      }
    }
  }
}

module left_inner_idler_assembly() assembly("left_inner_idler") {
  idler_assembly();
  left_front_idler_stl();
  for (z = [12, -20-(top_belt_h-bottom_belt_h)])
    tz(z) rx(-90) tz(10) screw(tensioning_screw, 45);
  tz(9) screw(front_idler_screw, 20);
}

module left_front_idler_stl() stl("left_front_idler") {
  color(print_color) render() difference() {
    tz(-4-(top_belt_h-bottom_belt_h)/2)
      rc([20,20,44+(top_belt_h-bottom_belt_h)]);
    // belt hole
    hull() {
      cylinder(d = 15, h = idler_h+1, center = true);
      ty(10) cylinder(d = 15, h = idler_h+1, center = true);
    }

    // axle hole
    tz(-11) cylinder(d = 3.5, h = 32);

    // tensioning screw holes
    for (z = [12, -20-(top_belt_h-bottom_belt_h)]) {
      tz(z) rx(-90)
        cylinder(d = screw_clearance_d(tensioning_screw),
                 h = 100, center = true);
    }
  }
}

module right_idler_assembly() assembly("right_idler") {
  txyz(motor_x, -motor_y, ew2) {
    right_idler_mount_stl();
    txyz(NEMA_hole_pitch(NEMA17_47)/2,
         -10,
         -(ew2-bottom_belt_h-idler_h/2)-idler_h/2) {
      right_inner_idler_assembly();
      for (z = [12, -20])
        tz(z) rx(-90) tz(-4-45/2-nut_thickness(tensioning_nut)/2)
          nut(tensioning_nut);
    }
    for (x = [ew*.5, 72-ew/2]) {
      txyz(motor_x_offset-x, -motor_y_offset+ew*.5, th) {
        screw(ex_print_screw, 10);
      }
    }
    txyz(motor_x_offset-72+ew/2, -motor_y_offset+ew*.5, -ew-th) {
      vflip() screw(ex_print_screw, 10);
    }
  }
}

module right_idler_mount_stl() stl("right_idler_mount") {
  color(print_color) render() difference() {
    union() {
      txy(+motor_x_offset/2-(ew+3)/2, -motor_y_offset+ew/2)
        rrcf([motor_x_offset+NEMA_width(NEMA17_47)/2+th/2, ew, th]);
      txyz(NEMA_hole_pitch(NEMA17_47)/2,
           -10,
           -(ew2-bottom_belt_h-idler_h/2)-idler_h/2) {
        tyz(-8,-4) rc([24,34,48]);
      }
      txyz(+motor_x_offset/2-(ew+3)/2-ew/2, -motor_y_offset+ew/2, -ew-th)
        rrcf([motor_x_offset+NEMA_width(NEMA17_47)/2+th/2-ew, ew, th]);
    }

    // idler slot
    hull() for (y = [10,-4]) {
      txyz(NEMA_hole_pitch(NEMA17_47)/2,
           y-10,
           -(ew2-bottom_belt_h-idler_h/2)-idler_h/2) {
        tz(-4) rc([21,21,45]);
      }
    }
    // tensioning screw holes
    txyz(NEMA_hole_pitch(NEMA17_47)/2,
           -10,
           -(ew2-bottom_belt_h-idler_h/2)-idler_h/2) {
      for (z = [12, -20]) {
        tz(z) rx(-90) {
          cylinder(d = screw_clearance_d(tensioning_screw),
                   h = 80, center = true);
          tz(-4-45/2-nut_thickness(M4_nut)/2)
            cylinder(r = nut_radius(M4_nut)+1,
                     h = nut_thickness(M4_nut) + 1);
        }
      }
    }

    txyz(+motor_x_offset/2-(ew+3)/2, -motor_y_offset+ew/2, -ew/2)
      cc([100, ew, ew]);

    // top extrusion_mount_holes
    for (x = [ew*.5, 72-ew/2]) {
      txy(motor_x_offset-x, -motor_y_offset+ew*.5) {
        cylinder(d = screw_clearance_d(ex_print_screw),
                 h = 100, center = true);
      }
    }
  }
}

module right_inner_idler_assembly() assembly("right_inner_idler") {
  idler_assembly();
  right_front_idler_stl();
  for (z = [12, -20])
    tz(z) rx(-90) tz(10) screw(tensioning_screw, 45);
  tz(9) screw(front_idler_screw, 20);
}

module right_front_idler_stl() stl("right_front_idler") {
  color(print_color) render() difference() {
    tz(-4) rc([20,20,44]);
    // belt hole
    hull() {
      cylinder(d = 15, h = idler_h+1, center = true);
      ty(10) cylinder(d = 15, h = idler_h+1, center = true);
    }

    // axle hole
    tz(-11) cylinder(d = 3.5, h = 32);

    // tensioning screw holes
    for (z = [12, -20]) {
      tz(z) rx(-90)
        cylinder(d = screw_clearance_d(tensioning_screw),
                 h = 100, center = true);
    }
  }
}

module idler_assembly() assembly("idler") {
  tz(-washer_h(M3_washer)/2) washer(M3_washer);
  mxy(washer_h(M3_washer)/2) {
    explode([0, 0, 5], true) {
      tz(ball_bearing_h(BBF623)/2) {
        mirror([0,0,1]) ball_bearing(BBF623);
        explode([0, 0, 5], true) {
          tz(ball_bearing_h(BBF623)/2) {
            washer(M3_washer);
          }
        }
      }
    }
  }
}

module double_idler_assembly() assembly("double_idler") {
  tz(-washer_h(M3_washer)/2) washer(M3_washer);
  mxy(idler_h/2-washer_h(M3_washer)/2) {
    explode([0, 0, 10], true) {
      mxy(washer_h(M3_washer)/2) {
        tz(-washer_h(M3_washer)/2) washer(M3_washer);
        explode([0, 0, 5], true) {
          tz(ball_bearing_h(BBF623)/2) {
            mirror([0,0,1]) ball_bearing(BBF623);
          }
        }
      }
      explode([0, 0, 10]) tz(idler_h/2-washer_h(M3_washer))
        washer(M3_washer);
    }
  }
}

