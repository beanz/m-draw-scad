//! Drawing bot with MGN rails

include <conf.scad>
include <lazy.scad>
include <shapes.scad>

use <frame.scad>
use <motor.scad>
use <idlers.scad>
use <x-carriage.scad>
use <x-rail.scad>

//! Insert PSU

module main_assembly() assembly("main") {
  frame_x_carriage_assembly();
  tz(top_belt_h) top_belt();
  tz(bottom_belt_h) bottom_belt();
}

module frame_x_carriage_assembly() assembly("frame_x_carriage") {
  frame_x_rail_assembly();
  tyz(pos[1]-ew/2, x_rail_h+ew/2) rx(90) tx(pos[0]) {
    tz(x_car_h) x_carriage_assembly();
  }
}

module frame_x_rail_assembly() assembly("frame_x_rail") {
  frame_motor_assembly();
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

module frame_motor_assembly() assembly("frame_motor") {
  frame_idler_assembly();
  left_motor_assembly();
  right_motor_assembly();
}

module frame_idler_assembly() assembly("frame_idler") {
  frame_assembly();
  left_idler_assembly();
  right_idler_assembly();
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
  //x_rail_assembly();
}
