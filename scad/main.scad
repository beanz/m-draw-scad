//! Drawing bot with MGN rails

include <conf.scad>
include <lazy.scad>
include <shapes.scad>

use <frame.scad>
use <motor.scad>
use <idlers.scad>
use <x-carriage.scad>
use <y-carriage.scad>
use <x-rail.scad>

//! Put the belts in with front idlers as loose then
//! tighten the clamps. Finally, tighten the idlers
//! evenly.

module main_assembly() assembly("main") {
  frame_electrical_assembly();
  tz(top_belt_h) top_belt();
  tz(bottom_belt_h) bottom_belt();
}

module frame_electrical_assembly()
    pose([81, 0, 137], [3, 172, 32], d = 500, exploded = true)
    assembly("frame_electrical") {
  frame_x_carriage_assembly();
  sc = pcb_screw(grbl_esp32);
  ty(fd/2) rx(-90) {
    pcb_mount_stl();
    ty(-32+2) myz(30) tz(th/2) screw(ex_print_screw, 8);
    explode([0, 0, 30], explode_children = true) {
      ty(-32) tz(8) espdraw_pcb();
      ty(-32) tz(10) pcb_screw_positions(grbl_esp32) {
        screw(sc, 10);
      }
    }
  }
}

module frame_x_carriage_assembly()
    pose([67, 0, 30], [-35, 54, -3], d = 500, exploded = true)
    assembly("frame_x_carriage") {
  frame_x_rail_assembly();
  tyz(pos[1]-ew/2, x_rail_h+ew/2) rx(90) tx(pos[0]) {
    tz(x_car_h) x_carriage_assembly();
    tz(th) carriage_hole_positions(x_car) {
      screw_and_washer(carriage_screw(x_car), 10);
    }
  }
}

//! Repeat at both y carriages

module frame_x_rail_assembly()
    pose([67, 0, 30], [147, 150, -22], d = 500, exploded = true)
    assembly("frame_x_rail") {
  frame_motor_assembly();
  explode([0, 0, 20], true) {
    x_rail_assembly();
    // right y carriage screws
    txyz(fw/2-ew*.5, pos[1]-15, ew*2+th) rz(90) {
      carriage_hole_positions(y_car) {
        screw_and_washer(carriage_screw(y_car), 10);
      }
    }
    // left y carriage screws
    txyz(-(fw/2-ew*.5), pos[1]-15, ew*2+th) rz(90) {
      carriage_hole_positions(y_car) {
        screw_and_washer(carriage_screw(y_car), 10);
      }
    }
  }
}

//! Repeat at both motor mounts

module frame_motor_assembly()
    pose([72, 0, 280], [-53, 96, 162], d = 250, exploded = true)
    assembly("frame_motor") {
  frame_idler_assembly();
  explode([0, 0, 40], explode_children = true) {
    left_motor_assembly();
    txyz(-motor_x, motor_y, motor_z) {
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
  explode([0, 0, 40], explode_children = true) {
    right_motor_assembly();
    txyz(motor_x, motor_y, motor_z) {
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
}

//! Repeat at both front idler mounts

module frame_idler_assembly()
    pose([60, 0, 285], [-35, -203, 164], d = 300, exploded = true)
    assembly("frame_idler") {
  frame_assembly();
  txyz(-motor_x, -motor_y, ew2) {
    explode([40, 40, 0], offset = [-40,-40,0],
            explode_children = true) {
      left_idler_assembly();
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
  txyz(motor_x, -motor_y, ew2) {
    explode([-40, 40, 0], offset = [40, -40, 0],
            explode_children = true) {
      right_idler_assembly();
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

module pcb_mount_stl() stl("pcb_mount") {
  sc = pcb_screw(grbl_esp32);
  ir = screw_tap_d(sc)/2;
  color(print_color) render() ty(-32) difference() {
    union() {
      linear_extrude(th) {
        difference() {
          hull() pcb_screw_positions(grbl_esp32) {
            circle(r = ir+th/2);
          }
          pcb_screw_positions(grbl_esp32) {
            circle(r = ir);
          }
          ty(2) myz(30) circle(d = screw_clearance_d(ex_print_screw));
        }
      }
      pcb_screw_positions(grbl_esp32) {
        pcb_spacer(sc, th+3, taper = 4);
      }
    }

    // clearance for screw head
    tz(th/2) ty(2) myz(30)
      cylinder(r = 0.5+screw_head_radius(ex_print_screw), h = 100);
  }
}

module espdraw_pcb() {
  pcb(grbl_esp32);
  comp = [20, 3, -90, "usb_uA"];
  p = pcb_coord(grbl_esp32, comp);
  txyz(p.x, p.y, 14) pcb_component(comp, false, 0);
}

if ($preview) {
  $explode = 0;
  main_assembly();
}
