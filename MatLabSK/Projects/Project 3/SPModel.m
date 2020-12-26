function [do, time] = SPModel(dt,tf,KD,KR,KA,cs,c0,L)
% Return DO profile data based on the expanded Streeter-Phelps model.
% do: vector of DO concentration during simulation period
% time: vector of time corresponding to do vector
% dt: simulation time step FOR AEROBIC CONDITION, in days
% tf: duration of simulation, in days
% KD: decay rate, /day
% KR: removal rate, /day
% KA: reaeration rate, /day
% cs: saturation DO, mg/L
% c0: initial DO (at time of pollution event), mg/L
% L : pollutant load