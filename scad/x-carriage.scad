include <conf.scad>
include <lazy.scad>
include <shapes.scad>

module x_carriage_assembly() assembly("x_carriage") {
  x_carriage_insert_assembly();
  tz(th) myz(x_carriage_insert_hole_width/2) explode([0,0,20], true) {
    x_belt_clamp_stl();
    tz(th) mxz(x_carriage_insert_hole_gap/2) screw(clamp_screw, 10);
  }
  tyz(x_carriage_w/2+servo_width()/2, th) rz(90) {
    txyz(0.5, -servo_shaft_offset()+13.9, servo_boss_height()) {
      tz(-th) servo(pos[2] > 0 ? -160 : -200);
      tz(-2) servo_hole_positions() screw(M2_cap_screw, 8);
    }
  }
  txyz(2, 5.5, th) rz(90)
    rail_assembly(z_car, z_rail_l, pos = pos[2]-10);
  txyz(2, pos[2]-10+5.5, z_car_h+th) rz(90) z_carriage_stl();
}

module x_carriage_insert_assembly() assembly("x_carriage_insert") {
  x_carriage_stl();
  x_carriage_insert_positions() insert(M3_Voron_insert);
}

module x_carriage_stl() stl("x_carriage") {
  cutout_l = 8;
  color(print_color) render() {
    difference() {
      union() {
        // carriage
        ty(-2) rrcf([60, x_carriage_w+2, th]);

        // servo holder
        txy(-13, (servo_width()+2)/2)
          rrcf([34, servo_width()+x_carriage_w+2, th]);

        // carriage stops
        txy(2, -2) mxz((x_carriage_w+2-th*.75)/2)
          myz((th/2+rail_width(z_rail))/2+1)
            rrc([th/2, th/2, th+rail_height(z_rail)]);

      }
      carriage_hole_positions(x_car) {
        tz(-x_car_h-eta)
          cylinder(d = screw_clearance_d(carriage_screw(x_car)),
                   h = 10);
        tz(-x_car_h+3)
          cylinder(r = screw_head_radius(M3_dome_screw)+0.25,
                   h = 10);
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

      // carriage holes
      txy(2, 5.5) rz(90) rail_hole_positions(z_rail, z_rail_l)
        cylinder(d = screw_tap_d(rail_screw(z_rail)),
                 h = 100, center = true);
    }
  }
}

module x_belt_clamp_stl() stl("x_belt_clamp") {
  color(alt_print_color) render() {
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

module z_carriage_stl() stl("z_carriage") {
  pen_d = 18;
  color(print_color) render() difference() {
    // carriage
    rrcf([z_carriage_l, z_carriage_w, th+4]);

    // carriage_screws
    tz(-z_car_h) carriage_hole_positions(z_car) {
      tz(-eta)
        cylinder(d = screw_clearance_d(carriage_screw(z_car)),
                 h = 10);
      tz(th-2)
        cylinder(r = screw_head_radius(M2_cap_screw)+0.25,
                 h = 10);
    }

    // pen groove
    tz(th+pen_d/2-th/4) ry(90)
      cylinder(d = pen_d+.5, h = z_carriage_l+eta,
               center = true, $fn = 9);

    // band notches
    tx(-th/2) myz(z_carriage_l/2-th*2) myz(th/2) mxz(z_carriage_w/2)
      cc([3, 4, 100]);
    
    // servo catch
    txy(z_carriage_l/2-th, z_carriage_w/2-th/2)
      cylinder(d = screw_tap_d(M3_cap_screw), h = 100, center = true);
  }
}

function servo_width() = 12;
function servo_boss_height() = 6.5;
function servo_shaft_diameter() = 4.8;
function servo_shaft_height() = 4;
function servo_shaft_offset() = -23/2++11.5/2+0.1;

module servo(angle) {
  vitamin(str("mg92b: MG92B Servo"));
  oy = servo_shaft_offset();
  boss_h = servo_boss_height();
  w = servo_width();

  color("black") render() difference() {
    union() {
      tyz(oy, -24-boss_h) rcc([w, 23, 26]);
      tyz(oy, -2-boss_h) rcc([w, 31.3, 2]);
      tz(-eta-boss_h) cylinder(d = 11.5, h = boss_h);
    }
    servo_hole_positions() {
      ty(2) cc([1, 3, 8]);
      cylinder(d = 2.2, h = 8, center = true);
    }
  }
  color("steelblue") render() {
    tyz(oy, -22) rcc([w+eta, 23+eta, 14]);
  }
  color("silver") render() {
    tz(eta)
      cylinder(d = servo_shaft_diameter(), h = servo_shaft_height());
  }
  tyz(oy, -24-boss_h+1.48/2) rx(-90) {
    color("red") cylinder(d= 1.48, h = 12.5);
    tx(-1.48) color("orange") cylinder(d= 1.48, h = 12.5);
    tx(1.48) color("brown") cylinder(d= 1.48, h = 12.5);
  }

  if (!is_undef(angle)) {
    rz(angle) tz(5.5) color("white") render () {
      tz(-1) cylinder(d = 7, h = 4, center = true);
      tz(-1) hull() {
        cylinder(d = 7, h = 2, center = true);
        ty(14) cylinder(d = 4, h = 2, center = true);
      }
    }
  }
}

module servo_hole_positions() {
  oy = servo_shaft_offset();
  gap_y = 27.8;
  tyz(oy, -6.5) mxz(gap_y/2) children();
}
