; bed.g
; called by G32 to perform auto calibration
;
G28                                         ; home
M117 Heating Bed Please Wait                ; display message
M190 S70                                    ; bed preheat temperature
M104 S0                                     ; hotend off
M140 S0                                     ; bed off
M561                                        ; clear any bed transform
; Probe the bed at 3 peripheral and 3 halfway points, and perform 6-factor auto compensation
; Before running this, you should have set up your Z-probe trigger height to suit your build, in the G31 command in config.g.
G30 P0 X0 Y139.9 H0 Z-99999
G30 P1 X121.16 Y-69.95 H0 Z-99999
G30 P2 X-121.16 Y-69.95 H0 Z-99999
G30 P3 X0 Y69.9 H0 Z-99999
G30 P4 X60.54 Y-34.95 H0 Z-99999
G30 P5 X-60.54 Y-34.95 H0 Z-99999
G30 P6 X0 Y0 H0 Z-99999 S6
M500                                        ; save
G28
; Use S-1 for measurements only, without calculations. Use S4 for endstop heights and Z-height only. Use S6 for full 6 factors
; If your Z probe has significantly different trigger heights depending on XY position, adjust the H parameters in the G30 commands accordingly. The value of each H parameter should be (trigger height at that XY position) - (trigger height at centre of bed)
