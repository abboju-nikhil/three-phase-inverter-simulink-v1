# Three-Phase PWM Inverter Simulation

MATLAB/Simulink project containing a three-phase inverter model and MATLAB post-processing script.

## Files

- `Model/three_phase_inverter_v1.slx` — Simulink model
- `Model/three_phase_inverter_code.m` — analysis script for PWM signals, switch voltages, phase voltages, and phase currents
- `Model/1.png` through `Model/7.png` — existing project figures
- `Document/code for inverter.doc` — project notes

## Analysis workflow

The MATLAB script expects a simulation output object named `out` with the logged PWM, MOSFET, voltage, and current signals used by the script. Confirm the model's signal logging and the MATLAB/Simulink setup before relying on the plots.

## Status

The repository contains the model, script, and figures. The simulation workflow was not verified during this repository review. No license file is included.

**Author:** Abboju Nikhil
