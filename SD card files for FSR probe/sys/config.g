M550 PArtemis                              ; Printer name
M552 S0									   ; Turn of WiFi module
G4 P1000								   ; Pause one second
M587 S"seemecnc" P"seeme3dp"			   ; set network ssid and password
M552 S1									   ; Turn on WiFi module
;  Open a web browser and type     http://Artemis.local/   
;  where 'Artemis' is the printer name you can set in the first line

M555 P2                                    ; Gcode Output Type
M575 P1 B57600 S1                          ; PanelDue Comm Setup
G21                                        ; Work in millimetres
G90                                        ; Send absolute coordinates

M569 P0 S0                                 ; Drive 0 goes forwards (X)
M569 P1 S0                                 ; Drive 1 goes forwards (Y)
M569 P2 S0                                 ; Drive 2 goes forwards (Z)
M569 P3 S1                                 ; Drive 3 goes forwards (E0)
M569 P4 S1                                 ; Drive 4 goes forwards (E1)

M574 X2 Y2 Z2 S1                           ; set endstop configuration (all endstops at high end, active high)

M665 R150 L351.155 B145 H530 X0 Y0 Z0      ; delta radius, diagonal rod length, printable radius and homed height
                                           ; Y X Z are tower angle offsets
M666 X0 Y0 Z0                              ; endstop offsets in mm

M350 X16 Y16 Z16 E16:16 I1                 ; Set 16x microstepping w/ Interpolation
M92 X200 Y200 Z200                         ; Set axis steps/mm
M92 E182.0:182.0                           ; Set extruder steps/mm

M906 X1200 Y1200 Z1200 E1200:1200 I50      ; Set motor currents (mA) and idle current %
M201 X4200 Y4200 Z4200 E5000               ; Accelerations (mm/s^2)
M203 X18000 Y18000 Z18000 E18000           ; Maximum speeds (mm/min)
M566 X2000 Y2000 Z2000 E2000               ; Maximum instant speed changes mm/minute

M106 P0 H-1                                ; Part Cooling Fan
M106 P2 T50 S0.5 H1                        ; Heat sink fan

M307 H0 B0                                 ; Heated Bed (H2)
M305 P0 T100000 B4388 R4700 H30 L0         ; Bed thermistor

M305 P1 T100000 B4388 R4700 H30 L0         ; Hot end Thermistor
M563 P0 D0 H1                              ; Hot end (T0), drive (E0), heater (H1)
G10 P0 S0 R0                               ; Hot end operating and standby temperatures

;Dual Extrusion Code
;M563 P1 D1 H1 F1                           ; Hot end (T1), drive (E1), heater (H1)
;G10 P1 S0 R0                               ; Hot end (1) operating and standby temperatures

M558 P5 I1 A2 S0.05 H5 F200                ; FSR Settings
G31 P500 X0 Y0 Z-0.3                       ; Probe trigger value and offsets
M557 R140 S30                              ; defualt bed mapping
M501                                       ; Load saved config values
T0                                         ; Select Tool 0

M375									   ; Load height map

;Note Strain Gage hotend probe is not in this file