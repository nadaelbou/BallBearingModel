# Lumped-Parameter Ball Bearing Model 

In this repository, a 1D bearing model is given inspired by the article https://ieeexplore.ieee.org/document/10271443. The model has been carefully studied for a specific set-up and its hyperparameters can be adjusted to the specific geometry of any bearing. Some hyperparameters have been changed for privacy reasons. 

This model is free to be used for any application and improved. It is a humble attempt of a lumped-parameter model of ball bearings and I am open to critics/suggestions/improvements. If you use this as a basis for further work, a reference to the hereabove cited article is highly appreciated. 

## Idea behind the Model

A radial lumped-parameter model is developed on MATLAB/Simulink for a single ball in contact with the bearing races under a load distribution as a function of its angular position on the races. This simplified radial model identifies fault signatures in frequency domain for inner and outer ring defects. 

As given, the model is discretized from the rotor to the shaft and owns 4 degrees of freedom. The 

## Given files

This repository contains one main files: 
- BB_Model.m (main file)
- parameter.m
- BBModel_Run.slx.

In order to run the model, simply clone the repository and run BB_Model.m.
