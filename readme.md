<a name="TOP"></a>
# M-draw-scad
Drawing bot with MGN rails

![Main Assembly](assemblies/main_assembled.png)

<span></span>

---
## Table of Contents
1. [Parts list](#Parts_list)
1. [Idler Assembly](#idler_assembly)
1. [Right Inner Idler Assembly](#right_inner_idler_assembly)
1. [Right Idler Assembly](#right_idler_assembly)
1. [Double Idler Assembly](#double_idler_assembly)
1. [Right Motor Assembly](#right_motor_assembly)
1. [Left Motor Assembly](#left_motor_assembly)
1. [X Carriage Insert Assembly](#x_carriage_insert_assembly)
1. [X Carriage Assembly](#x_carriage_assembly)
1. [X Rail Assembly](#x_rail_assembly)
1. [Back Frame Assembly](#back_frame_assembly)
1. [Front Frame Assembly](#front_frame_assembly)
1. [Right Y Carriage Assembly](#right_y_carriage_assembly)
1. [Y Rail Assembly](#y_rail_assembly)
1. [Right Y Rail Assembly](#right_y_rail_assembly)
1. [Left Y Carriage Assembly](#left_y_carriage_assembly)
1. [Left Y Rail Assembly](#left_y_rail_assembly)
1. [Main Assembly](#main_assembly)

<span></span>
[Top](#TOP)

---
<a name="Parts_list"></a>
## Parts list
| <span style="writing-mode: vertical-rl; text-orientation: mixed;">7 x Idler</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">Right&nbsp;Inner&nbsp;Idler</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">Right&nbsp;Idler</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">2 x Double&nbsp;Idler</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">Right&nbsp;Motor</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">Left&nbsp;Motor</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">X&nbsp;Carriage&nbsp;Insert</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">X&nbsp;Carriage</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">X&nbsp;Rail</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">Back&nbsp;Frame</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">Front&nbsp;Frame</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">Right&nbsp;Y&nbsp;Carriage</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">2 x Y&nbsp;Rail</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">Right&nbsp;Y&nbsp;Rail</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">Left&nbsp;Y&nbsp;Carriage</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">Left&nbsp;Y&nbsp;Rail</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">Main</span> | <span style="writing-mode: vertical-rl; text-orientation: mixed;">TOTALS</span> |  |
|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|:---|
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | | **Vitamins** |
| &nbsp;&nbsp;14&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;8&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;22&nbsp; | &nbsp;&nbsp; Ball bearing F623-2RS 3mm x 10mm x 4mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Belt GT2 x 6mm x 1522mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Belt GT2 x 6mm x 1522mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Extrusion E2020 x 450mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Extrusion E2040 x 354mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Extrusion E2040 x 472mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp; Heatfit insert M3 x 4mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Linear rail MGN12 x 400mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Linear rail MGN15 x 300mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Linear rail carriage MGN12H |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Linear rail carriage MGN15H |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Nut M4 x 3.2mm  |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp; Nut M4 x 3.2mm  |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Pulley GT2OB 20 teeth |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;12&nbsp; | &nbsp;&nbsp; Screw M3 cap x 10mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp; Screw M3 cap x 16mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;8&nbsp; | &nbsp;&nbsp; Screw M3 cap x 35mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp; Screw M3 cap x 45mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;5&nbsp; | &nbsp;&nbsp;5&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;15&nbsp; | &nbsp;&nbsp; Screw M4 flanged x 10mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Screw M4 flanged x 16mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Screw M4 flanged x 45mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp; Stepper motor NEMA17 x 47mm (5x24 shaft) |
| &nbsp;&nbsp;21&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;14&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;55&nbsp; | &nbsp;&nbsp; Washer  M3 x 7mm x 0.5mm |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;5&nbsp; | &nbsp;&nbsp;5&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;17&nbsp; | &nbsp;&nbsp; Washer  M4 x 9mm x 0.8mm |
| &nbsp;&nbsp;35&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;8&nbsp; | &nbsp;&nbsp;22&nbsp; | &nbsp;&nbsp;20&nbsp; | &nbsp;&nbsp;20&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;4&nbsp; | &nbsp;&nbsp;3&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;10&nbsp; | &nbsp;&nbsp;6&nbsp; | &nbsp;&nbsp;8&nbsp; | &nbsp;&nbsp;10&nbsp; | &nbsp;&nbsp;8&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;165&nbsp; | &nbsp;&nbsp;Total vitamins count |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | | **3D printed parts** |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;front_idler.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;left_lower_motor_mount.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;left_lower_y_carriage.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;left_motor_mount.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;left_y_carriage.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;right_idler_mount.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;right_lower_motor_mount.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;right_lower_y_carriage.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;right_motor_mount.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;right_y_carriage.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;x_belt_clamp.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; |  &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;x_carriage.stl |
| &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;1&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;2&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;.&nbsp; | &nbsp;&nbsp;13&nbsp; | &nbsp;&nbsp;Total 3D printed parts count |

<span></span>
[Top](#TOP)

---
<a name="idler_assembly"></a>
## 7 x Idler Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|14| Ball bearing F623-2RS 3mm x 10mm x 4mm|
|21| Washer  M3 x 7mm x 0.5mm|


### Assembly instructions
![idler_assembly](assemblies/idler_assembly_tn.png)

![idler_assembled](assemblies/idler_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="right_inner_idler_assembly"></a>
## Right Inner Idler Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|1| Screw M3 cap x 16mm|
|2| Screw M4 flanged x 45mm|


### 3D Printed parts

| 1 x [front_idler.stl](stls/front_idler.stl) |
|---|
| ![front_idler.stl](stls/front_idler.png) 



### Sub-assemblies

| 1 x idler_assembly |
|---|
| ![idler_assembled](assemblies/idler_assembled_tn.png) 



### Assembly instructions
![right_inner_idler_assembly](assemblies/right_inner_idler_assembly_tn.png)

![right_inner_idler_assembled](assemblies/right_inner_idler_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="right_idler_assembly"></a>
## Right Idler Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|2| Nut M4 x 3.2mm |
|3| Screw M4 flanged x 10mm|
|3| Washer  M4 x 9mm x 0.8mm|


### 3D Printed parts

| 1 x [right_idler_mount.stl](stls/right_idler_mount.stl) |
|---|
| ![right_idler_mount.stl](stls/right_idler_mount.png) 



### Sub-assemblies

| 1 x right_inner_idler_assembly |
|---|
| ![right_inner_idler_assembled](assemblies/right_inner_idler_assembled_tn.png) 



### Assembly instructions
![right_idler_assembly](assemblies/right_idler_assembly_tn.png)

![right_idler_assembled](assemblies/right_idler_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="double_idler_assembly"></a>
## 2 x Double Idler Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|8| Ball bearing F623-2RS 3mm x 10mm x 4mm|
|14| Washer  M3 x 7mm x 0.5mm|


### Assembly instructions
![double_idler_assembly](assemblies/double_idler_assembly_tn.png)

![double_idler_assembled](assemblies/double_idler_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="right_motor_assembly"></a>
## Right Motor Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|1| Pulley GT2OB 20 teeth|
|4| Screw M3 cap x 35mm|
|5| Screw M4 flanged x 10mm|
|1| Stepper motor NEMA17 x 47mm (5x24 shaft)|
|4| Washer  M3 x 7mm x 0.5mm|
|5| Washer  M4 x 9mm x 0.8mm|


### 3D Printed parts

| 1 x [right_lower_motor_mount.stl](stls/right_lower_motor_mount.stl) | 1 x [right_motor_mount.stl](stls/right_motor_mount.stl) |
|---|---|
| ![right_lower_motor_mount.stl](stls/right_lower_motor_mount.png) | ![right_motor_mount.stl](stls/right_motor_mount.png) 



### Sub-assemblies

| 1 x double_idler_assembly | 1 x idler_assembly |
|---|---|
| ![double_idler_assembled](assemblies/double_idler_assembled_tn.png) | ![idler_assembled](assemblies/idler_assembled_tn.png) 



### Assembly instructions
![right_motor_assembly](assemblies/right_motor_assembly_tn.png)

![right_motor_assembled](assemblies/right_motor_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="left_motor_assembly"></a>
## Left Motor Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|1| Pulley GT2OB 20 teeth|
|4| Screw M3 cap x 35mm|
|5| Screw M4 flanged x 10mm|
|1| Stepper motor NEMA17 x 47mm (5x24 shaft)|
|4| Washer  M3 x 7mm x 0.5mm|
|5| Washer  M4 x 9mm x 0.8mm|


### 3D Printed parts

| 1 x [left_lower_motor_mount.stl](stls/left_lower_motor_mount.stl) | 1 x [left_motor_mount.stl](stls/left_motor_mount.stl) |
|---|---|
| ![left_lower_motor_mount.stl](stls/left_lower_motor_mount.png) | ![left_motor_mount.stl](stls/left_motor_mount.png) 



### Sub-assemblies

| 1 x double_idler_assembly | 1 x idler_assembly |
|---|---|
| ![double_idler_assembled](assemblies/double_idler_assembled_tn.png) | ![idler_assembled](assemblies/idler_assembled_tn.png) 



### Assembly instructions
![left_motor_assembly](assemblies/left_motor_assembly_tn.png)

![left_motor_assembled](assemblies/left_motor_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="x_carriage_insert_assembly"></a>
## X Carriage Insert Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|4| Heatfit insert M3 x 4mm|


### 3D Printed parts

| 1 x [x_carriage.stl](stls/x_carriage.stl) |
|---|
| ![x_carriage.stl](stls/x_carriage.png) 



### Assembly instructions
![x_carriage_insert_assembly](assemblies/x_carriage_insert_assembly_tn.png)

![x_carriage_insert_assembled](assemblies/x_carriage_insert_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="x_carriage_assembly"></a>
## X Carriage Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|4| Screw M3 cap x 10mm|


### 3D Printed parts

| 2 x [x_belt_clamp.stl](stls/x_belt_clamp.stl) |
|---|
| ![x_belt_clamp.stl](stls/x_belt_clamp.png) 



### Sub-assemblies

| 1 x x_carriage_insert_assembly |
|---|
| ![x_carriage_insert_assembled](assemblies/x_carriage_insert_assembled_tn.png) 



### Assembly instructions
![x_carriage_assembly](assemblies/x_carriage_assembly_tn.png)

![x_carriage_assembled](assemblies/x_carriage_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="x_rail_assembly"></a>
## X Rail Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|1| Extrusion E2020 x 450mm|
|1| Linear rail MGN12 x 400mm|
|1| Linear rail carriage MGN12H|


### Sub-assemblies

| 1 x x_carriage_assembly |
|---|
| ![x_carriage_assembled](assemblies/x_carriage_assembled_tn.png) 



### Assembly instructions
![x_rail_assembly](assemblies/x_rail_assembly_tn.png)

![x_rail_assembled](assemblies/x_rail_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="back_frame_assembly"></a>
## Back Frame Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|1| Extrusion E2040 x 472mm|


### Assembly instructions
![back_frame_assembly](assemblies/back_frame_assembly_tn.png)

![back_frame_assembled](assemblies/back_frame_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="front_frame_assembly"></a>
## Front Frame Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|1| Extrusion E2040 x 472mm|


### Assembly instructions
![front_frame_assembly](assemblies/front_frame_assembly_tn.png)

![front_frame_assembled](assemblies/front_frame_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="right_y_carriage_assembly"></a>
## Right Y Carriage Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|2| Nut M4 x 3.2mm |
|2| Screw M3 cap x 45mm|
|1| Screw M4 flanged x 10mm|
|1| Screw M4 flanged x 16mm|
|2| Washer  M3 x 7mm x 0.5mm|
|2| Washer  M4 x 9mm x 0.8mm|


### 3D Printed parts

| 1 x [right_lower_y_carriage.stl](stls/right_lower_y_carriage.stl) | 1 x [right_y_carriage.stl](stls/right_y_carriage.stl) |
|---|---|
| ![right_lower_y_carriage.stl](stls/right_lower_y_carriage.png) | ![right_y_carriage.stl](stls/right_y_carriage.png) 



### Sub-assemblies

| 2 x idler_assembly |
|---|
| ![idler_assembled](assemblies/idler_assembled_tn.png) 



### Assembly instructions
![right_y_carriage_assembly](assemblies/right_y_carriage_assembly_tn.png)

![right_y_carriage_assembled](assemblies/right_y_carriage_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="y_rail_assembly"></a>
## 2 x Y Rail Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|2| Extrusion E2040 x 354mm|
|2| Linear rail MGN15 x 300mm|
|2| Linear rail carriage MGN15H|


### Assembly instructions
![y_rail_assembly](assemblies/y_rail_assembly_tn.png)

![y_rail_assembled](assemblies/y_rail_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="right_y_rail_assembly"></a>
## Right Y Rail Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|4| Screw M3 cap x 10mm|
|4| Washer  M3 x 7mm x 0.5mm|


### Sub-assemblies

| 1 x right_y_carriage_assembly | 1 x y_rail_assembly |
|---|---|
| ![right_y_carriage_assembled](assemblies/right_y_carriage_assembled_tn.png) | ![y_rail_assembled](assemblies/y_rail_assembled_tn.png) 



### Assembly instructions
![right_y_rail_assembly](assemblies/right_y_rail_assembly_tn.png)

![right_y_rail_assembled](assemblies/right_y_rail_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="left_y_carriage_assembly"></a>
## Left Y Carriage Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|2| Nut M4 x 3.2mm |
|2| Screw M3 cap x 45mm|
|1| Screw M4 flanged x 10mm|
|1| Screw M4 flanged x 16mm|
|2| Washer  M3 x 7mm x 0.5mm|
|2| Washer  M4 x 9mm x 0.8mm|


### 3D Printed parts

| 1 x [left_lower_y_carriage.stl](stls/left_lower_y_carriage.stl) | 1 x [left_y_carriage.stl](stls/left_y_carriage.stl) |
|---|---|
| ![left_lower_y_carriage.stl](stls/left_lower_y_carriage.png) | ![left_y_carriage.stl](stls/left_y_carriage.png) 



### Sub-assemblies

| 2 x idler_assembly |
|---|
| ![idler_assembled](assemblies/idler_assembled_tn.png) 



### Assembly instructions
![left_y_carriage_assembly](assemblies/left_y_carriage_assembly_tn.png)

![left_y_carriage_assembled](assemblies/left_y_carriage_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="left_y_rail_assembly"></a>
## Left Y Rail Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|4| Screw M3 cap x 10mm|
|4| Washer  M3 x 7mm x 0.5mm|


### Sub-assemblies

| 1 x left_y_carriage_assembly | 1 x y_rail_assembly |
|---|---|
| ![left_y_carriage_assembled](assemblies/left_y_carriage_assembled_tn.png) | ![y_rail_assembled](assemblies/y_rail_assembled_tn.png) 



### Assembly instructions
![left_y_rail_assembly](assemblies/left_y_rail_assembly_tn.png)

![left_y_rail_assembled](assemblies/left_y_rail_assembled_tn.png)

<span></span>
[Top](#TOP)

---
<a name="main_assembly"></a>
## Main Assembly
### Vitamins
|Qty|Description|
|---:|:----------|
|1| Belt GT2 x 6mm x 1522mm|
|1| Belt GT2 x 6mm x 1522mm|


### Sub-assemblies

| 1 x back_frame_assembly | 1 x front_frame_assembly | 1 x left_motor_assembly |
|---|---|---|
| ![back_frame_assembled](assemblies/back_frame_assembled_tn.png) | ![front_frame_assembled](assemblies/front_frame_assembled_tn.png) | ![left_motor_assembled](assemblies/left_motor_assembled_tn.png) 


| 1 x left_y_rail_assembly | 1 x right_idler_assembly | 1 x right_motor_assembly |
|---|---|---|
| ![left_y_rail_assembled](assemblies/left_y_rail_assembled_tn.png) | ![right_idler_assembled](assemblies/right_idler_assembled_tn.png) | ![right_motor_assembled](assemblies/right_motor_assembled_tn.png) 


| 1 x right_y_rail_assembly | 1 x x_rail_assembly |
|---|---|
| ![right_y_rail_assembled](assemblies/right_y_rail_assembled_tn.png) | ![x_rail_assembled](assemblies/x_rail_assembled_tn.png) 



### Assembly instructions
![main_assembly](assemblies/main_assembly_tn.png)

Insert PSU

![main_assembled](assemblies/main_assembled_tn.png)

<span></span>
[Top](#TOP)
