//! Drawing bot with MGN rails

include <conf.scad>
include <lazy.scad>
include <shapes.scad>

//! Insert PSU

module main_assembly()
  assembly("main") {
  tx(-(fw/2-ew*.5)) left_y_rail_assembly();
  tx(fw/2-ew*.5) right_y_rail_assembly();
  ty(-(fd/2)) front_frame_assembly();
  ty(fd/2-ew*.5) back_frame_assembly();
  tz(x_rail_h) x_rail_assembly();
  left_motor_assembly();
  left_idler_assembly();
  right_motor_assembly();
  right_idler_assembly();
  tz(top_belt_h) top_belt();
  tz(bottom_belt_h) bottom_belt();
}

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
      txyz(-ew/2, ew/2-th/2, ew/2) ry(90) rrcf([ew, ew+th, th]);
      txyz(-ew+th/2, 0, ew/2) rx(90) rrcf([ew+th, ew, th]);
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

module left_motor_assembly() assembly("left_motor") {
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
      txyz(-motor_x_offset+x, motor_y_offset-ew*.5, -(motor_z-ew2-th)) {
        screw(ex_print_screw, 10);
      }
    }
    tz(-2*(motor_z-top_belt_h-idler_h/2)-double_idler_h)
    myz(NEMA_hole_pitch(NEMA17_47)/2)
      tyz(fd/2-motor_y-ew-th, -motor_z_offset+ew/2) rx(90)
        screw(ex_print_screw, 10);
  }
}

module left_motor_mount_stl() stl("left_motor_mount") {
  color(print_color) render() difference() {
    union() {
      ty(-(ew+3)/2)
        rrcf([NEMA_width(NEMA17_47)+th, ew+3+NEMA_width(NEMA17_47), th]);
      txy(-motor_mount_w/2+NEMA_width(NEMA17_47)/2+th/2,
          -motor_y_offset+ew/2)
        rrcf([motor_x_offset+NEMA_width(NEMA17_47)/2+th/2,
              ew, motor_z-ew2]);
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
      txy(-motor_x_offset+x, -motor_y_offset+ew*.5) {
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
  color(alt_print_color) render() difference() {
    union() {
      rrcf([NEMA_hole_pitch(NEMA17_47)+th*2,
            NEMA_hole_pitch(NEMA17_47)+th*2, th]);
      tyz(fd/2-motor_y-ew, -motor_z_offset/2+th/2) rx(90)
        rrcf([NEMA_hole_pitch(NEMA17_47)+th*2, motor_z_offset+th, th]);
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
      tyz(fd/2-motor_y-ew, -motor_z_offset+ew/2) rx(90)
      cylinder(d = screw_clearance_d(ex_print_screw),
                 h = 100, center = true);
  }
}

module right_motor_assembly() assembly("right_motor") {
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
      txyz(motor_x_offset-x, motor_y_offset-ew*.5, -(motor_z-ew2-th)) {
        screw(ex_print_screw, 10);
      }
    }
    tz(-2*(motor_z-top_belt_h-idler_h/2)-double_idler_h)
    myz(NEMA_hole_pitch(NEMA17_47)/2)
      tyz(fd/2-motor_y-ew-th, -motor_z_offset+ew/2) rx(90)
        screw(ex_print_screw, 10);
  }
}

module right_motor_mount_stl() stl("right_motor_mount") {
  color(print_color) render() difference() {
    union() {
      ty(-(ew+3)/2)
        rrcf([NEMA_width(NEMA17_47)+th, ew+3+NEMA_width(NEMA17_47), th]);
      txy(motor_x_offset/2-(ew+3)/2, -motor_y_offset+ew/2)
        rrcf([motor_x_offset+NEMA_width(NEMA17_47)/2+th/2,
              ew, motor_z-ew2]);
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
      txy(motor_x_offset-x, -motor_y_offset+ew*.5) {
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
  color(alt_print_color) render() difference() {
    union() {
      rrcf([NEMA_hole_pitch(NEMA17_47)+th*2,
            NEMA_hole_pitch(NEMA17_47)+th*2, th]);
      tyz(fd/2-motor_y-ew, -motor_z_offset/2+th/2) rx(90)
        rrcf([NEMA_hole_pitch(NEMA17_47)+th*2, motor_z_offset+th, th]);
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
      tyz(fd/2-motor_y-ew, -motor_z_offset+ew/2) rx(90)
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

module front_frame_assembly()
  pose([45, 0, 332], [-258, -25, 47], d = 192, exploded = true)
  assembly("front_frame") {
  front_frame_left_assembly();
  tx(-fw/2) explode([-40, 0, 0], explode_children = true,
                    offset = [ew*2.2, -ew, ew-th/2]) {
    rx(90) right_front_corner_stl();
    txyz(ew-th, -ew/2, ew*1.5) ry(-90) screw(alt_ex_tap_screw, 10);
    txyz(ew*1.5, -ew/2, ew+2) sliding_t_nut(M4_sliding_t_nut);
    txyz(ew*1.5, ew/2, ew+2) vflip() sliding_t_nut(M4_sliding_t_nut);
    txyz(ew*1.5, ew/2, ew*2-2) vflip() sliding_t_nut(M4_sliding_t_nut);
    txyz(ew*2.5, ew/2, ew*2-2) vflip() sliding_t_nut(M4_sliding_t_nut);
  }
  txyz(-fw/2+ew*1.5, -ew/2, ew-th) vflip() screw(ex_print_screw, 10);
}

module front_frame_left_assembly()
  pose([50, 0, 24], [205, 70, -47], d = 213, exploded = true)
  assembly("front_frame_left") {
  tz(ew*1.5) ry(90) extrusion(e2040, fw-ew*2);
  tx(fw/2) explode([40, 0, 0], explode_children = true,
                   offset = [-ew*2.2, -ew, ew-th/2]) {
    rx(90) left_front_corner_stl();
    txyz(-ew+th, -ew/2, ew*1.5) ry(90) screw(alt_ex_tap_screw, 10);
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
    left_y_carriage_assembly();
    
    // carriage screws
    tz(-y_car_h+th) carriage_hole_positions(y_car) {
      screw_and_washer(carriage_screw(y_car), 10);
    }
  }
}

module right_y_rail_assembly() assembly("right_y_rail") {
  y_rail_assembly();
  tz(ew*2+y_car_h) ty(pos[1]-15) rz(90) {
    right_y_carriage_assembly();

    // carriage screws
    tz(-y_car_h+th) carriage_hole_positions(y_car) {
      screw_and_washer(carriage_screw(y_car), 10);
    }
  }
}

module left_y_carriage_assembly() assembly("left_y_carriage") {
  left_y_carriage_stl();
  left_lower_y_carriage_stl();
  
  tz(th) {
    // top extrusion screw
    txy(y_car_ext[0], y_car_ext[1]-8)
      screw(ex_print_screw, 16);

    // bottom extrusion screw
    txyz(y_car_ext[0], y_car_ext[1]-8, -y_rail_offset-ew/2-th)
      vflip() screw(ex_print_screw, 10);

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
    // top extrusion screw
    txy(y_car_ext[0], -(y_car_ext[1]-8))
      screw(ex_print_screw, 16);

    // bottom extrusion screw
    txyz(y_car_ext[0], -(y_car_ext[1]-8), -y_rail_offset-ew/2-th)
      vflip() screw(ex_print_screw, 10);

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

module bottom_belt() {
  belt(GT2x6, belt_path, open = true, auto_twist = false,
       belt_colour = bottom_belt_color);
}

module top_belt() {
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
  //front_frame_assembly();
  //back_frame_assembly();
}
