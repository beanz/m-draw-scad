include <NopSCADlib/core.scad>
include <NopSCADlib/vitamins/extrusions.scad>
include <NopSCADlib/vitamins/psus.scad>
include <NopSCADlib/vitamins/rails.scad>
include <NopSCADlib/vitamins/stepper_motors.scad>
include <NopSCADlib/vitamins/pcbs.scad>
include <NopSCADlib/vitamins/pulleys.scad>
include <NopSCADlib/vitamins/ball_bearings.scad>
include <NopSCADlib/vitamins/extrusion_brackets.scad>
include <NopSCADlib/vitamins/spools.scad>
include <NopSCADlib/vitamins/inserts.scad>
use <NopSCADlib/vitamins/rod.scad>

$fn = 24;
eta = 0.01;
th = 5;
tth = 4; // thin print thickness
pw = 300;
pd = 200;
o_insert = [ "F1BM3",   5, 5.4, 5, 3, 5.4, 1.5, 4, 5.4 ];
M3_Voron_insert = [ "M3 Voron Insert",
                    4, 5, 4.5, 3,   4.25, 1.0, 4.6, 4.3 ];

e2020 = E2020;
e2040 = E2040;

ew = extrusion_width(E2020);
ew2 = extrusion_height(E2040);

ms = medium_microswitch;
car_screw = M3_cap_screw;
clamp_screw = M3_cap_screw;

function screw_clearance_d(t) = 2 * screw_clearance_radius(t);
function screw_d(t) = 2 * screw_radius(t);
function screw_head_d(t) = 2 * screw_head_radius(t);
function screw_head_h(t) = screw_head_height(t);
function washer_h(t) = washer_thickness(t);
function washer_od(t) = washer_diameter(t);
function ball_bearing_h(t) = bb_width(t);
function ball_bearing_od(t) = bb_diameter(t);
function ball_bearing_id(t) = bb_bore(t);
function carriage_total_h(t) = carriage_height(t);
function carriage_l(t) = carriage_length(t);
function carriage_w(t) = carriage_width(t);
function pulley_od(t) = 12.22; // TOFIX
function pulley_length(t) = 16.2; // TOFIX
function pulley_belt_center(t) = 11.5;
function nut_h(t) = nut_thickness(t);
function nut_flats_d(t) = 2 * nut_flat_radius(t);
function screw_tap_d(t) = 2 * screw_pilot_hole(t);
function carriage_screw_gap_l(t) = carriage_pitch_x(t);
function carriage_screw_gap_w(t) = carriage_pitch_y(t);

M3_tnut = 0;
M4_tnut = 1;
M5_tnut = 2;
module tnut(t) {
  rz(90) ry(180) {
    sliding_t_nut(t == M3_tnut ? M3_sliding_t_nut :
                  t == M4_tnut ? M4_sliding_t_nut :
                  M5_sliding_t_nut);
  }
}
function screw_for(l) = (l <= 8 ? 8 :
                         (l <= 10 ? 10:
                          (l <= 12 ? 12 :
                           (l <= 14 ? 14 :
                            (l <= 16 ? 16 :
                             ceil(l / 5) * 5)))));

module screw_washer(t, l) {
  screw_and_washer(t, screw_for(l+washer_h(screw_washer(t))));
}

module screw_washer_nut(t, l) {
  n = screw_nut(t);
  w = screw_washer(t);
  tl = l + washer_h(w) + nut_h(n);
  sl = screw_for(tl);
  screw_and_washer(t, sl);
  explode([0, 0, -10]) tz(-l-nut_h(n)) nut(n);
}

module screw_washer_nut_up(t, l) {
  mirror([0, 0, 1]) {
    screw_washer_nut(t, l);
  }
}

module screw_washer_washer_nut(t, l) {
  n = screw_nut(t);
  w = screw_washer(t);
  tl = l + washer_h(w) * 2 + nut_h(n);
  sl = screw_for(tl);
  screw_and_washer(t, sl);
  tz(-l) nut_washer_up(n);
}

module screw_washer_washer_nut_up(t, l) {
  mirror([0, 0, 1]) {
    screw_washer_washer_nut(t, l);
  }
}

module screw_up(t, l) ry(180) screw(t, screw_for(l));
module screw_washer_up(t, l) ry(180) screw_washer(t, l);

module nut_washer_up(t) {
  mirror([0, 0, 1]) {
    nut_washer(t);
  }
}

module nut_washer(t) {
  tz(exploded() ? -4 : 0) {
    nut_and_washer(t);
  }
}

module NEMA_hole_positions(t, n) NEMA_screw_positions(t, n) children();

module inside_hidden_corner_bracket() {
  extrusion_inner_corner_bracket(E20_inner_corner_bracket);
}

print_color = [0.7, 0.2, 0.7];
alt_print_color = [0.7, 0.4, 0.7];
flex_print_color = [0.7, 0.2, 0.2];
aluminium_color = grey(50);
screw_color = grey(80);
black_aluminium_color = [0.2, 0.2, 0.2];
bottom_belt_color = [0.6,0.6,0.2];
top_belt_color = [0.7,0.2,0.2];

M12_toothed_washer =
  ["M12 Toothed Washer", 12, undef, 1, false, 21.5, undef, undef, undef];
M12_probe_nut_depth = 4;
M12_probe_nut = ["M12 Probe nut", 12, 17, 4, undef, M12_toothed_washer,
  M12_probe_nut_depth, 0];
probe_offset = [25, 0, 3]; // Z is position not sensing offset obviously
front_idler_screw = M3_grub_screw;
idler_screw = M3_cap_screw;
motor_screw = M3_cap_screw;
pcb_mount_screw = M3_cap_screw;
ex_screw = M4_cap_screw;
ex_screw_l = 10;
nema_plate_screw = M5_low_profile_screw;
ex_print_screw = M4_flanged_screw;
tensioning_screw = M4_flanged_screw;
tensioning_nut = screw_nut(tensioning_screw);
ex_tap_screw = M5_flanged_screw;
alt_ex_tap_screw = M5_low_profile_screw;
bed_level_screw = M5_cap_screw;
microswitch_screw = M3_cap_screw; // Tap the microswitch
foot_screw = ex_tap_screw;
opulley = GT2x20ob_pulley; // TOFIX: GT2x20_ooznest_pulley;

y_car = MGN15H_carriage;
y_rail = carriage_rail(y_car);
y_car_l = carriage_l(y_car);
y_car_w = carriage_w(y_car);
y_car_h = carriage_total_h(y_car);
x_car = MGN12H_carriage;
x_rail = carriage_rail(x_car);
x_car_l = carriage_l(x_car);
x_car_h = carriage_total_h(x_car);
pulley_d = pulley_od(opulley);
belt_width = 1.38;
belt_h = 6;
cl = 0.2;
idler_h = ball_bearing_h(BBF623)*2+washer_h(M3_washer)*3;
double_idler_h = ball_bearing_h(BBF623)*4+washer_h(M3_washer)*5;
acme_nut_w = 12;
x_carriage_w = carriage_width(x_car)+2+th;

fw = pw+212;
fd = pd+154;

//pos = [cos(360*$t)*pw/2, sin(360*$t)*pd/2];
//pos = [pw/4, pd/2];
pos = [0,0];
y_rail_l = 300;

x_bar_l = fw-ew*2-22;
x_rail_l = x_bar_l - 50;
y_bar_w = fw/2;

x_carriage_insert_hole_width = 60-9;
x_carriage_insert_hole_gap = 24;
x_rail_h = 30;

motor_offset = sqrt(2*NEMA_width(NEMA17_47)*NEMA_width(NEMA17_47)) / 2;
motor_hole_offset = sqrt(2*NEMA_hole_pitch(NEMA17_47)*NEMA_hole_pitch(NEMA17_47)) / 2;

bbr = (ball_bearing_od(BBF623)+belt_width)/2;
pbr = (pulley_od(opulley)+belt_width)/2;
idler_offset = motor_hole_offset-pbr+bbr;
belt_th = belt_thickness(GT2x6);
top_belt_h = x_rail_h+ew/2+belt_width(GT2x6)/2+1.5;
bottom_belt_h = x_rail_h+ew/2-belt_width(GT2x6)/2-1.5;
car_y = -(ew/2+x_car_h+belt_th/2);
front_y = -fd/2+ew*2;
back_y = fd/2-ew-3;
outside_x = fw/2-ew/2-carriage_width(y_car)/2-1.75;
//outside_x = fw/2-ew*2+bbr*2;
inside_x = outside_x-bbr*2;
motor_x = outside_x-bbr-NEMA_hole_pitch(NEMA17_47)/2;
motor_y = back_y-NEMA_width(NEMA17_47)/2;
motor_z = x_rail_h+ew/2+15;
motor_x_offset = fw/2-motor_x;
motor_y_offset = fd/2-motor_y;
motor_z_offset = motor_z-2*(motor_z-top_belt_h-idler_h/2)-double_idler_h;
motor_mount_w = motor_x_offset+NEMA_width(NEMA17_47)/2+th/2;
//echo(str("mo ", motor_x_offset,
//         ", ", motor_y_offset,
//         ", ", motor_z_offset));
y_car_overhang = 20;
y_rail_offset = th+ew*2+y_car_h-x_rail_h-ew/2;
y_car_ext = [(ew+th*2)/2, x_bar_l/2-(fw/2-ew*.5), th-y_rail_offset];
clamp_r = 3/2+belt_th;
nema_spacing = NEMA_hole_pitch(NEMA17_47);
belt_path = [
  [pos[0]+30, pos[1]+car_y-6, 0],
  [pos[0]+30-8+clamp_r, pos[1]+car_y-clamp_r, clamp_r],
  [+inside_x-bbr, pos[1]+car_y-bbr, bbr],
  [+outside_x-bbr, front_y-bbr, -bbr],
  [+outside_x-bbr, back_y-bbr, -bbr],
  [+inside_x-3-pbr, back_y-nema_spacing/2-pbr, pbr],
  [+inside_x-nema_spacing+bbr, back_y-bbr, -bbr],
  [-outside_x+bbr, back_y-bbr, -bbr],
  [-outside_x+bbr, pos[1]+car_y+bbr, -bbr],
  [pos[0]-30+8-clamp_r, pos[1]+car_y-clamp_r, clamp_r],
  [pos[0]-30, pos[1]+car_y-6, 0],
];

y_car_idlers = [
  [ fw/2-ew*.5-belt_path[2][0],
    pos[1]-15-belt_path[2][1],
    ew*2+y_car_h-top_belt_h,
  ],
  [ fw/2-ew*.5+belt_path[8][0],
    pos[1]-15-belt_path[8][1],
    ew*2+y_car_h-bottom_belt_h,
  ],
];
y_car_idler_h = [
  y_car_idlers[0][2]+th-idler_h/2,
  y_car_idlers[1][2]+th-idler_h/2,
];
