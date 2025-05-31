include <conf.scad>
include <lazy.scad>
include <shapes.scad>

use <idlers.scad>

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

