//! Drawing bot with MGN rails

include <conf.scad>
include <lazy.scad>
include <shapes.scad>

//! Insert PSU

module main_assembly()
  assembly("main") {
  tx(-(fw/2-ew*.5)) left_y_rail_assembly();
  tx(fw/2-ew*.5) right_y_rail_assembly();
  ty(-(fd/2-ew*.5)) front_frame_assembly();
  ty(fd/2-ew*.5) back_frame_assembly();
  tz(x_rail_h) x_rail_assembly();
  tz(top_belt_h) top_belt();
  left_motor_assembly();
  tz(bottom_belt_h) bottom_belt();
  right_motor_assembly();
}

module left_motor_assembly() assembly("left_motor") {
  ox = ew*2+pbr+3;
  oy = ew+3+NEMA_width(NEMA17_47)/2;
  oz = motor_z-2*(motor_z-top_belt_h-idler_h/2)-double_idler_h;
  txyz(-motor_x, motor_y, motor_z) {
    rx(180) left_motor_mount_stl();
    tz(-21) pulley(opulley);
    vflip() rz(180) NEMA(NEMA17_47);
    tz(-2*(motor_z-top_belt_h-idler_h/2)-double_idler_h)
      left_lower_motor_mount_stl();
    txyz(-NEMA_hole_pitch(NEMA17_47)/2,
         NEMA_hole_pitch(NEMA17_47)/2,
         -(motor_z-top_belt_h-idler_h/2)-idler_h+washer_h(M3_washer)/2) {
      double_idler_assembly();
    }
    txyz(NEMA_hole_pitch(NEMA17_47)/2,
         NEMA_hole_pitch(NEMA17_47)/2,
         -(motor_z-top_belt_h-idler_h/2)-idler_h/2) {
      idler_assembly();
    }
    mxz(NEMA_hole_pitch(NEMA17_47)/2) myz(NEMA_hole_pitch(NEMA17_47)/2)
      tz(-(motor_z-2*(motor_z-top_belt_h-idler_h/2)-double_idler_h+th))
        vflip() screw_and_washer(motor_screw, 35);
    for (x = [ew*.5, 72/2, 72-ew/2]) {
      txyz(-ox+x, oy-ew*.5, -(motor_z-ew2-th)) {
        screw_and_washer(ex_print_screw, 10);
      }
    }
    tz(-2*(motor_z-top_belt_h-idler_h/2)-double_idler_h)
    myz(NEMA_hole_pitch(NEMA17_47)/2)
      tyz(fd/2-motor_y-ew-th, -oz+ew/2) rx(90)
        screw_and_washer(ex_print_screw, 10);
  }
}

module left_motor_mount_stl() stl("left_motor_mount") {
  ox = ew*2+pbr+3;
  oy = ew+3+NEMA_width(NEMA17_47)/2;
  color(print_color) render() difference() {
    union() {
      ty(-(ew+3)/2)
        rrcf([NEMA_width(NEMA17_47)+th, ew+3+NEMA_width(NEMA17_47), th]);
      txy(-ox/2+(ew+3)/2, -oy+ew/2)
        rrcf([ox+NEMA_width(NEMA17_47)/2+th/2, ew, motor_z-ew2]);
      myz(NEMA_hole_pitch(NEMA17_47)/2) ty(-NEMA_hole_pitch(NEMA17_47)/2)
        cylinder(d = washer_diameter(M3_washer),
                 h = motor_z-top_belt_h-idler_h/2);
      myz(NEMA_hole_pitch(NEMA17_47)/2) ty(NEMA_hole_pitch(NEMA17_47)/2)
        cylinder(d = washer_diameter(M3_washer)+th/2,
                 h = motor_z-top_belt_h-idler_h/2+double_idler_h/2);
    }

    // boss hole
    cylinder(r = NEMA_boss_radius(NEMA17_47)+2, h = 100);

    // extrusion_mount_holes
    for (x = [ew*.5, 72/2, 72-ew/2]) {
      txy(-ox+x, -oy+ew*.5) {
        cylinder(d = screw_clearance_d(ex_print_screw),
                 h = 100, center = true);
        cylinder(r = screw_head_radius(ex_print_screw)+0.5,
                 h = motor_z-ew2+th, center = true);
      }
    }

    // motor screw holes
    NEMA_screw_positions(NEMA17_47)
        cylinder(d = screw_clearance_d(carriage_screw(x_car)),
                 h = 100, center = true);
  }
}

module left_lower_motor_mount_stl() stl("left_lower_motor_mount") {
  ox = ew*2+pbr+3;
  oy = ew+3+NEMA_width(NEMA17_47)/2;
  oz = motor_z-2*(motor_z-top_belt_h-idler_h/2)-double_idler_h;
  color(print_color) render() difference() {
    union() {
      rrcf([NEMA_hole_pitch(NEMA17_47)+th*2,
            NEMA_hole_pitch(NEMA17_47)+th*2, th]);
      tyz(fd/2-motor_y-ew, -oz/2+th/2) rx(90)
        rrcf([NEMA_hole_pitch(NEMA17_47)+th*2, oz+th, th]);
      ty(fd/2-motor_y-ew-th)
        rcc([NEMA_hole_pitch(NEMA17_47)+th*2, 2*th, th]);

      txy(-NEMA_hole_pitch(NEMA17_47)/2, NEMA_hole_pitch(NEMA17_47)/2)
        cylinder(d = washer_diameter(M3_washer),
                 h = motor_z-top_belt_h-idler_h/2);
      myz(NEMA_hole_pitch(NEMA17_47)/2) ty(-NEMA_hole_pitch(NEMA17_47)/2)
        cylinder(d = washer_diameter(M3_washer)+th/2,
                 h = motor_z-top_belt_h-idler_h/2+double_idler_h/2);
      txy(NEMA_hole_pitch(NEMA17_47)/2, NEMA_hole_pitch(NEMA17_47)/2)
        cylinder(d = washer_diameter(M3_washer),
                 h = motor_z-top_belt_h-idler_h/2+double_idler_h/2-washer_thickness(M3_washer)/2);
    }

    // shaft hole
    cylinder(d = NEMA_shaft_dia(NEMA17_47)+4, h = 100);

    // motor screw holes
    NEMA_screw_positions(NEMA17_47)
        cylinder(d = screw_clearance_d(carriage_screw(x_car)),
                 h = 100, center = true);

    myz(NEMA_hole_pitch(NEMA17_47)/2)
      tyz(fd/2-motor_y-ew, -oz+ew/2) rx(90)
      cylinder(d = screw_clearance_d(ex_print_screw),
                 h = 100, center = true);
  }
}

module right_motor_assembly() assembly("right_motor") {
  ox = ew*2+pbr+3;
  oy = ew+3+NEMA_width(NEMA17_47)/2;
  oz = motor_z-2*(motor_z-top_belt_h-idler_h/2)-double_idler_h;
  txyz(motor_x, motor_y, motor_z) {
    rx(180) right_motor_mount_stl();
    tz(-9) vflip() pulley(opulley);
    vflip() rz(180) NEMA(NEMA17_47);
    tz(-2*(motor_z-top_belt_h-idler_h/2)-double_idler_h)
      right_lower_motor_mount_stl();
    txyz(NEMA_hole_pitch(NEMA17_47)/2,
         NEMA_hole_pitch(NEMA17_47)/2,
         -(motor_z-top_belt_h-idler_h/2)-idler_h+washer_h(M3_washer)/2) {
      double_idler_assembly();
    }
    txyz(-NEMA_hole_pitch(NEMA17_47)/2,
         NEMA_hole_pitch(NEMA17_47)/2,
         -(motor_z-top_belt_h-idler_h/2)-idler_h*1.5+washer_thickness(M3_washer)) {
      idler_assembly();
    }
    mxz(NEMA_hole_pitch(NEMA17_47)/2) myz(NEMA_hole_pitch(NEMA17_47)/2)
      tz(-(motor_z-2*(motor_z-top_belt_h-idler_h/2)-double_idler_h+th))
        vflip() screw_and_washer(motor_screw, 35);
    for (x = [ew*.5, 72/2, 72-ew/2]) {
      txyz(ox-x, oy-ew*.5, -(motor_z-ew2-th)) {
        screw_and_washer(ex_print_screw, 10);
      }
    }
    tz(-2*(motor_z-top_belt_h-idler_h/2)-double_idler_h)
    myz(NEMA_hole_pitch(NEMA17_47)/2)
      tyz(fd/2-motor_y-ew-th, -oz+ew/2) rx(90)
        screw_and_washer(ex_print_screw, 10);
  }
}

module right_motor_mount_stl() stl("right_motor_mount") {
  ox = ew*2+pbr+3;
  oy = ew+3+NEMA_width(NEMA17_47)/2;
  color(print_color) render() difference() {
    union() {
      ty(-(ew+3)/2)
        rrcf([NEMA_width(NEMA17_47)+th, ew+3+NEMA_width(NEMA17_47), th]);
      txy(ox/2-(ew+3)/2, -oy+ew/2)
        rrcf([ox+NEMA_width(NEMA17_47)/2+th/2, ew, motor_z-ew2]);
      txy(NEMA_hole_pitch(NEMA17_47)/2, -NEMA_hole_pitch(NEMA17_47)/2)
        cylinder(d = washer_diameter(M3_washer),
                 h = motor_z-top_belt_h-idler_h/2);
      myz(NEMA_hole_pitch(NEMA17_47)/2) ty(NEMA_hole_pitch(NEMA17_47)/2)
        cylinder(d = washer_diameter(M3_washer)+th/2,
                 h = motor_z-top_belt_h-idler_h/2+double_idler_h/2);
      txy(-NEMA_hole_pitch(NEMA17_47)/2, -NEMA_hole_pitch(NEMA17_47)/2)
        cylinder(d = washer_diameter(M3_washer),
                 h = motor_z-top_belt_h-idler_h/2+double_idler_h/2-washer_thickness(M3_washer)/2);
    }

    // boss hole
    cylinder(r = NEMA_boss_radius(NEMA17_47)+2, h = 100);

    // extrusion_mount_holes
    for (x = [ew*.5, 72/2, 72-ew/2]) {
      txy(ox-x, -oy+ew*.5) {
        cylinder(d = screw_clearance_d(ex_print_screw),
                 h = 100, center = true);
        cylinder(r = screw_head_radius(ex_print_screw)+0.5,
                 h = motor_z-ew2+th, center = true);
      }
    }

    // motor screw holes
    NEMA_screw_positions(NEMA17_47)
        cylinder(d = screw_clearance_d(carriage_screw(x_car)),
                 h = 100, center = true);
  }
}

module right_lower_motor_mount_stl() stl("right_lower_motor_mount") {
  ox = ew*2+pbr+3;
  oy = ew+3+NEMA_width(NEMA17_47)/2;
  oz = motor_z-2*(motor_z-top_belt_h-idler_h/2)-double_idler_h;
  color(print_color) render() difference() {
    union() {
      rrcf([NEMA_hole_pitch(NEMA17_47)+th*2,
            NEMA_hole_pitch(NEMA17_47)+th*2, th]);
      tyz(fd/2-motor_y-ew, -oz/2+th/2) rx(90)
        rrcf([NEMA_hole_pitch(NEMA17_47)+th*2, oz+th, th]);
      ty(fd/2-motor_y-ew-th)
        rcc([NEMA_hole_pitch(NEMA17_47)+th*2, 2*th, th]);

      myz(-NEMA_hole_pitch(NEMA17_47)/2) ty(NEMA_hole_pitch(NEMA17_47)/2)
        cylinder(d = washer_diameter(M3_washer),
                 h = motor_z-top_belt_h-idler_h/2);
      myz(NEMA_hole_pitch(NEMA17_47)/2) ty(-NEMA_hole_pitch(NEMA17_47)/2)
        cylinder(d = washer_diameter(M3_washer)+th/2,
                 h = motor_z-top_belt_h-idler_h/2+double_idler_h/2);
    }

    // shaft hole
    cylinder(d = NEMA_shaft_dia(NEMA17_47)+4, h = 100);

    // motor screw holes
    NEMA_screw_positions(NEMA17_47)
        cylinder(d = screw_clearance_d(carriage_screw(x_car)),
                 h = 100, center = true);

    myz(NEMA_hole_pitch(NEMA17_47)/2)
      tyz(fd/2-motor_y-ew, -oz+ew/2) rx(90)
      cylinder(d = screw_clearance_d(ex_print_screw),
                 h = 100, center = true);
  }
}

module x_rail_assembly() assembly("x_rail") {
  tyz(pos[1], ew/2) {
    ty(-ew/2) rx(90) {
      rail(x_rail, x_rail_l);
      tx(pos[0]) {
        carriage(x_car);
        tz(x_car_h) x_carriage_assembly();
      }
    }
    ry(90) extrusion(e2020, x_bar_l);
  }
}

module x_carriage_insert_assembly() assembly("x_carriage_insert") {
  x_carriage_stl();
  x_carriage_insert_positions() insert(M3_Voron_insert);
}

module x_carriage_assembly() assembly("x_carriage") {
  x_carriage_insert_assembly();
  tz(th) myz(x_carriage_insert_hole_width/2) explode([0,0,20], true) {
    x_belt_clamp_stl();
    tz(th) mxz(x_carriage_insert_hole_gap/2) screw(clamp_screw, 10);
  }
}

module x_carriage_stl() stl("x_carriage") {
  cutout_l = 8;
  color(print_color) render() {
    difference() {
      rrcf([60,40,th]);
      carriage_hole_positions(x_car) {
        cylinder(d = screw_clearance_d(carriage_screw(x_car)),
                 h = 100, center = true);
      }
      // belt cutouts
      myz(30) mxz((3.3+6)/2) {
        tx(-cutout_l/2) rcc([cutout_l+0.1,6.5,2]);
        tx(-cutout_l+2/2) cc([2.1,6.5,20]);
      }
    x_carriage_insert_positions()
      rx(180) cylinder(r = insert_hole_radius(M3_Voron_insert), h = 8);
    }
  }
}

module x_belt_clamp_stl() stl("x_belt_clamp") {
  color(print_color) render() {
    difference() {
      hull() {
        mxz(x_carriage_insert_hole_gap/2)
          cylinder(d = 9, h = th);
      }
      mxz(x_carriage_insert_hole_gap/2)
        cylinder(d = screw_clearance_d(M3_cap_screw),
                 h = 100, center = true);
      mxz((3.3+6)/2) {
        rcc([10,6.5,1.2]);
      }
    }
  }
}

module x_carriage_insert_positions() {
  myz(x_carriage_insert_hole_width/2)
  mxz(x_carriage_insert_hole_gap/2)
  tz(th)
  children();
}

module front_frame_assembly() assembly("front_frame") {
  tz(ew) rz(90) rx(90) extrusion(e2040, fw-ew*2);
}

module back_frame_assembly() assembly("back_frame") {
  tz(ew) rz(90) rx(90) extrusion(e2040, fw-ew*2);
}

module y_rail_assembly() assembly("y_rail") {
  tz(ew*2) {
    rz(90) rail(y_rail, y_rail_l);
    ty(pos[1]-15) rz(90) carriage(y_car);
  }
  tz(ew) rx(90) extrusion(e2040, fd);
}

module left_y_rail_assembly() assembly("left_y_rail") {
  y_rail_assembly();
  tz(ew*2+y_car_h) ty(pos[1]-15) rz(90) {
    left_y_carriage_stl();
  }
}

module right_y_rail_assembly() assembly("right_y_rail") {
  y_rail_assembly();
  tz(ew*2+y_car_h) ty(pos[1]-15) rz(90) {
    right_y_carriage_stl();
  }
}

module y_carriage_stl() {
  overhang = 20;
  color(print_color) render() {
    difference() {
      ty(overhang/2) rrcf([y_car_l,y_car_w+overhang,th]);
      carriage_hole_positions(y_car) {
        cylinder(d = screw_clearance_d(carriage_screw(y_car)),
                 h = 100, center = true);
      }
    }
  }
}

module left_y_carriage_stl() stl("left_y_carriage") {
  mirror([0, 1, 0]) y_carriage_stl();
}

module right_y_carriage_stl() stl("right_y_carriage") {
  y_carriage_stl();
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
      explode([0, 0, 10]) tz(idler_h/2-washer_h(M3_washer)) washer(M3_washer);
    }
  }
}


module bottom_belt() {
  nema_spacing = NEMA_hole_pitch(NEMA17_47);
  txy(+inside_x-bbr, pos[1]+car_y-bbr) idler_assembly();
  txy(+inside_x+bbr, front_y-bbr) idler_assembly();
  txy(-inside_x-bbr, pos[1]+car_y+bbr) idler_assembly();
  belt(GT2x6, belt_path, open = true, auto_twist = false,
       belt_colour = bottom_belt_color);
}

module top_belt() {
  txy(-inside_x+bbr, pos[1]+car_y-bbr) idler_assembly();
  txy(-inside_x-bbr, front_y-bbr) idler_assembly();
  txy(inside_x+bbr, pos[1]+car_y+bbr) idler_assembly();
  path = [
    [-belt_path[10][0], belt_path[10][1], belt_path[10][2]],
    [-belt_path[9][0], belt_path[9][1], belt_path[9][2]],
    [-belt_path[8][0], belt_path[8][1], belt_path[8][2]],
    [-belt_path[7][0], belt_path[7][1], belt_path[7][2]],
    [-belt_path[6][0], belt_path[6][1], belt_path[6][2]],
    [-belt_path[5][0], belt_path[5][1], belt_path[5][2]],
    [-belt_path[4][0], belt_path[4][1], belt_path[4][2]],
    [-belt_path[3][0], belt_path[3][1], belt_path[3][2]],
    [-belt_path[2][0], belt_path[2][1], belt_path[2][2]],
    [-belt_path[1][0], belt_path[1][1], belt_path[1][2]],
    [-belt_path[0][0], belt_path[0][1], belt_path[0][2]],
  ];
  belt(GT2x6, path, open = true, auto_twist = false,
       belt_colour = top_belt_color);
}

if ($preview) {
  $explode = 0;
  main_assembly();
  //left_motor_assembly();
  //x_rail_assembly();
  //x_carriage_assembly();
  //double_idler_assembly();
}

