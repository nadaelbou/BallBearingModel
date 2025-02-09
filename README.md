# Lumped-Parameter Ball Bearing Model 

In this repository, a 1D bearing model is provided, inspired by the article ['Radial Lumped-parameter Model of a Ball Bearing for Simulated Fault Signatures'](https://ieeexplore.ieee.org/document/10271443), except that it is given with 4 degrees of freedom instead of 5 in the article. The model has been carefully studied for a specific setup, and its hyperparameters can be adjusted to fit the geometry of any bearing. Some hyperparameters have been modified for privacy reasons.

This model is free to use, modify, and improve for any application. It represents a humble attempt at a lumped-parameter model of ball bearings, and I welcome feedback, suggestions, and improvements. If you build upon this work, a reference to the cited article would be greatly appreciated.


## Given files

This repository contains three files: 

- parameter.m: this file contains all the geometry and electrical parameters related to the chosen ball bearing and rotor dynamic necessary to the system dynamic. 
- BBModel_Run.slx: this file solves on Simulink the gouverning equations of the bearing-rotor system dynamic. 
- BB_Model.m (main file): this files initiates the simulation loads the parameters and runs the Simulink file BBModel_Run.slx.  

In order to run the model, simply clone the repository and run BB_Model.m.

## Requirements 

The model has been developped using MATLAB_R2022b. Therefore, a version of MATLAB compatible with this, i.e., at least from 2022, is expected to run properly the model. Simulink extension is also required. 

## Idea behind the Model

A radial lumped-parameter model is developed on MATLAB/Simulink for a single ball in contact with the bearing races under a load distribution as a function of its angular position on the races. This simplified radial model identifies fault signatures in frequency domain for inner and outer ring defects. 

As given, the model is discretized from the rotor to the shaft and owns 4 degrees of freedom. The vibration motion for multiple mass points u$_i$ is described by the second law of Newton as:

M ⋅ d²u/dt² + C ⋅ du/dt + K ⋅ u = ∑F_ext

 where C is the damping matrix, K is the stiffness matrix and m the mass matrix. F_ext includes all forces applied on the bearing, i.e., the weight of the different mass points, the weight of the rotor in the load zone of the bearing and the radial electromagnetic forces applied by the rotor.

You can study the vibrations-displacement of the rotor/inner race system, the ball or the outer race. The function inside the Simulink file models the dynamic behavior of a rolling element bearing system. It calculates the second derivative of displacement (u) for a multi-degree-of-freedom system, considering:

- Bearing stiffness and damping: Modeled using matrices  and , where stiffness depends on Hertzian contact theory.
- Ball position and rotation: The function tracks the angular position of a rolling element based on shaft speed and ball count.
- Nonlinear contact forces: Hertzian contact forces between the rolling elements and races are included.
- External forces: Includes gravitational effects and an applied external electromagnetic force.

## Bearing Health State Model

In this model, you can simulate inner and outer race faults. To do so, go to: 

1. Parameter.m
2. Modify the lines Cdin or Cdout respectively if you want to model an inner ring fault or an outer ring one.

Keep the system's physics in mind. If you use extreme geometries, the model may fail to converge at certain time steps due to the solver's precision limitations (a fourth-order Runge-Kutta numerical method). 

## Citation 
```
N. E. Bouharrouti, F. Martin and A. Belahcen, "Radial Lumped-parameter Model of a Ball Bearing for Simulated Fault Signatures," 2023 IEEE 14th International Symposium on Diagnostics for Electrical Machines, Power Electronics and Drives (SDEMPED), Chania, Greece, 2023, pp. 403-409, doi: 10.1109/SDEMPED54949.2023.10271443.
```








