%% Bearing Simulation
clc; clear; close all;

% Imports variables

run('parameter.m');  

% Run Simulation

out = sim('BBModel_Run.slx', Tend);

