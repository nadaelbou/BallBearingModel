# Lumped-Parameter Ball Bearing Model 

In this repository, a 1D bearing model is provided, inspired by the article [IEEE 10271443](https://ieeexplore.ieee.org/document/10271443). The model has been carefully studied for a specific setup, and its hyperparameters can be adjusted to fit the geometry of any bearing. Some hyperparameters have been modified for privacy reasons.

This model is free to use, modify, and improve for any application. It represents a humble attempt at a lumped-parameter model of ball bearings, and I welcome feedback, suggestions, and improvements. If you build upon this work, a reference to the cited article would be greatly appreciated.


## Given files

This repository contains three files: 

- parameter.m: this file contains all the geometry and electrical parameters related to the chosen ball bearing and rotor dynamic necessary to the system dynamic. 
- BBModel_Run.slx: this file contains the bearing dynamic equations
- BB_Model.m (main file): this files initiates the simulation loads the parameters and runs the Simulink file BBModel_Run.slx.  


In order to run the model, simply clone the repository and run BB_Model.m.

## Requirements 

The model has been developped using MATLAB_R2022b. Therefore, a version of MATLAB compatible with this, i.e., at least from 2022, is expected to run properly the model. Simulink extension is also required. 

## Idea behind the Model

A radial lumped-parameter model is developed on MATLAB/Simulink for a single ball in contact with the bearing races under a load distribution as a function of its angular position on the races. This simplified radial model identifies fault signatures in frequency domain for inner and outer ring defects. 

As given, the model is discretized from the rotor to the shaft and owns 4 degrees of freedom. You can study the vibrations-displacement of the rotor/inner race system, the ball or the outer race. The function inside the Simulink file models the dynamic behavior of a rolling element bearing system. It calculates the second derivative of displacement (u) for a multi-degree-of-freedom system, considering:

- Bearing stiffness and damping: Modeled using matrices  and , where stiffness depends on Hertzian contact theory.
- Ball position and rotation: The function tracks the angular position of a rolling element based on shaft speed and ball count.
- Nonlinear contact forces: Hertzian contact forces between the rolling elements and races are included.
- External forces: Includes gravitational effects and an applied external force .








