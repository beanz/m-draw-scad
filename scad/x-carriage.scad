include <conf.scad>
include <lazy.scad>
include <shapes.scad>

use <pen.scad>

module x_carriage_assembly() assembly("x_carriage") {
  x_carriage_insert_assembly();
  tz(th) myz(x_carriage_insert_hole_width/2) explode([0,0,20], true) {
    x_belt_clamp_stl();
    tz(th) mxz(x_carriage_insert_hole_gap/2) screw(clamp_screw, 10);
  }
  tyz(x_carriage_w/2+servo_width()/2, th) rz(90) pen_assembly();
}

module x_carriage_insert_assembly() assembly("x_carriage_insert") {
  x_carriage_stl();
  x_carriage_insert_positions() insert(M3_Voron_insert);
}

module x_carriage_stl() stl("x_carriage") {
  cutout_l = 8;
  lift_block_h = 15;
  color(print_color) render() {
    difference() {
      union() {
        // carriage
        rrcf([60, x_carriage_w, th]);

        // lift block
        tx(5.5) rcc([30, lift_block_h, 13]);

        // servo holder
        txy(-13, (servo_width()+2)/2)
          rrcf([34, servo_width()+x_carriage_w+2, th]);
      }
      carriage_hole_positions(x_car) {
        tz(-x_car_h-eta)
          cylinder(d = screw_clearance_d(carriage_screw(x_car)),
                   h = 10);
        tz(-x_car_h+3)
          cylinder(r = screw_head_radius(M3_dome_screw)+0.25,
                   h = 10);
      }

      // lift holes
      tx(2) myz(8) tz(10) rx(90) {
        cylinder(d = 4.5, h = 100, center = true);
        tz(lift_block_h/2-6) rz(90) cylinder(d = 6.8, h = 100, $fn = 6);
      }
      tx(8.5) myz(8) tz(10) rx(-90) {
        cylinder(d = 4.5, h = 100, center = true);
        tz(lift_block_h/2-6) rz(90) cylinder(d = 6.8, h = 100, $fn = 6);
      }

      // belt cutouts
      myz(30) mxz((3.3+6)/2) {
        tx(-cutout_l/2) rcc([cutout_l+0.1, 6.5, 2]);
        tx(-cutout_l+2/2) cc([2.1, 6.5, 20]);
        tz(th-belt_tooth_height(GT2x6)) for(i = [1:10]) {
          tx(i*belt_pitch(GT2x6)-cutout_l)
            rcc([1.3, 6.5, 2]);
        }
      }
      x_carriage_insert_positions()
        rx(180) cylinder(r = insert_hole_radius(M3_Voron_insert), h = 8);

      // servo cutout and mount holes
      txy(-14, x_carriage_w/2+servo_width()/2+0.5) {
        tz(-eta/2) rcc([25.5, 12.5, 5+eta]);
        rz(90) ty(-servo_shaft_offset()) servo_hole_positions() {
          cylinder(d = 2.2, h = 100, center = true);
          tz(9) cylinder(d = 5.3, h = 10);
        }
      }
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
        rcc([10, 6.5, 0.4]);
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
