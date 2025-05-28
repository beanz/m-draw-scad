//! Drawing bot with MGN rails

include <conf.scad>
include <lazy.scad>
include <shapes.scad>

//! Insert PSU

module main_assembly()
  assembly("main") {
  tx(-(fw/2-ew*1.5)) left_y_rail_assembly();
  tx(fw/2-ew*1.5) right_y_rail_assembly();
  ty(-(fd/2-ew*1.5)) front_frame_assembly();
  ty(fd/2-ew*1.5) back_frame_assembly();
  tz(x_rail_h) x_rail_assembly();
  tz(x_rail_h+ew/2+belt_width(GT2x6)/2+1.5) top_belt();
  txyz(-motor_x, motor_y, motor_z) {
    tz(-21) pulley(opulley);
    vflip() rz(180) NEMA(NEMA17_47);
  }
  tz(x_rail_h+ew/2-belt_width(GT2x6)/2-1.5) bottom_belt();
  txyz(motor_x, motor_y, motor_z) {
    tz(-9) vflip() pulley(opulley);
    vflip() rz(180) NEMA(NEMA17_47);
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
  tz(ew) rz(90) rx(90) extrusion(e2040, fw-ew*4);
}

module back_frame_assembly() assembly("back_frame") {
  tz(ew) rz(90) rx(90) extrusion(e2040, fw-ew*4);
}

module y_rail_assembly() assembly("y_rail") {
  tz(ew*2) {
    rz(90) rail(y_rail, y_rail_l);
    ty(pos[1]-15) rz(90) carriage(y_car);
  }
  tz(ew) rx(90) extrusion(e2040, fd-ew*2);
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

module bottom_belt() {
  txy(+inside_x-bbr, pos[1]+car_y-bbr) idler_assembly();
  txy(+inside_x+bbr, front_y-bbr) idler_assembly();
  txy(+inside_x+bbr, back_y-bbr) idler_assembly();
  txy(+inside_x+bbr-30, back_y-bbr) idler_assembly();
  txy(-inside_x-bbr, back_y-bbr) idler_assembly();
  txy(-inside_x-bbr, pos[1]+car_y+bbr) idler_assembly();
  path = [
    [pos[0]+30, pos[1]+car_y-6, 0],
    [pos[0]+30-8+clamp_r, pos[1]+car_y-clamp_r, clamp_r],
    [+inside_x-bbr, pos[1]+car_y-bbr, bbr],
    [+outside_x-bbr, front_y-bbr, -bbr],
    [+outside_x-bbr, back_y-bbr, -bbr],
    [+inside_x-3-pbr, back_y-10-pbr, pbr],
    [+inside_x-30+bbr, back_y-bbr, -bbr],
    [-outside_x+bbr, back_y-bbr, -bbr],
    [-outside_x+bbr, pos[1]+car_y+bbr, -bbr],
    [pos[0]-30+8-clamp_r, pos[1]+car_y-clamp_r, clamp_r],
    [pos[0]-30, pos[1]+car_y-6, 0],
  ];
  belt(GT2x6, path, open = true, auto_twist = false,
       belt_colour = bottom_belt_color);
}

module top_belt() {
  txy(-inside_x+bbr, pos[1]+car_y-bbr) idler_assembly();
  txy(-inside_x-bbr, front_y-bbr) idler_assembly();
  txy(-inside_x-bbr, back_y-bbr) idler_assembly();
  txy(-inside_x-bbr+30, back_y-bbr) idler_assembly();
  txy(inside_x+bbr, back_y-bbr) idler_assembly();
  txy(inside_x+bbr, pos[1]+car_y+bbr) idler_assembly();
  path = [
    [pos[0]+30, pos[1]+car_y-6, 0],
    [pos[0]+30-8+clamp_r, pos[1]+car_y-clamp_r, clamp_r],
    [+outside_x-bbr, pos[1]+car_y+bbr, -bbr],
    [+outside_x-bbr, back_y-bbr, -bbr],
    [-inside_x+30-bbr, back_y-bbr, -bbr],
    [-inside_x+3+pbr, back_y-10-pbr, pbr],
    [-outside_x+bbr, back_y-bbr, -bbr],
    [-outside_x+bbr, front_y-bbr, -bbr],
    [-inside_x+bbr, pos[1]+car_y-bbr, bbr],
    [pos[0]-30+8-clamp_r, pos[1]+car_y-clamp_r, clamp_r],
    [pos[0]-30, pos[1]+car_y-6, 0],
  ];
  belt(GT2x6, path, open = true, auto_twist = false,
       belt_colour = top_belt_color);
}

if ($preview) {
  $explode = 0;
  main_assembly();
  //x_rail_assembly();
  //tyz(-x_car_h-10, -4) rx(90) x_carriage_assembly();
}

