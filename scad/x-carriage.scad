include <conf.scad>
include <lazy.scad>
include <shapes.scad>

module x_carriage_assembly() assembly("x_carriage") {
  x_carriage_insert_assembly();
  tz(th) myz(x_carriage_insert_hole_width/2) explode([0,0,20], true) {
    x_belt_clamp_stl();
    tz(th) mxz(x_carriage_insert_hole_gap/2) screw(clamp_screw, 10);
  }
}

module x_carriage_insert_assembly() assembly("x_carriage_insert") {
  x_carriage_stl();
  x_carriage_insert_positions() insert(M3_Voron_insert);
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
        tx(-cutout_l/2) rcc([cutout_l+0.1, 6.5, 2]);
        tx(-cutout_l+2/2) cc([2.1, 6.5, 20]);
        tz(th-belt_tooth_height(GT2x6)) for(i = [1:10]) {
          tx(i*belt_pitch(GT2x6)-cutout_l)
            rcc([1.3, 6.5, 2]);
        }
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
