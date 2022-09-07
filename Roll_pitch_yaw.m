clear;
clc;
%% D-h parameter 
syms theta1 theta2 theta3 theta4 theta5 theta6
p=sym(pi);
%a
a1=0;
a2=-0.12;
a3=0.67;
a4=0;
a5=0;
a6=0;
%alpha
alphab1=  0;
alphab2= -p/2;
alphab3=  0;
alphab4= -p/2;
alphab5=  p/2;
alphab6= -p/2;
% d
d1 = 0.46;
d2 = 0;
d3 = 0;
d4 = 0.7;
d5 = 0;
d6 = 0;
%theta
theta1=0;
theta2=0;
theta3=0;
theta4=p/3;
theta5=p/6;
theta6=0;

theta2 = -p/2 + theta2;
theta3 = -p/2 + theta3;

T1=[cos(theta1) -sin(theta1) 0 a1;
   sin(theta1)*cos(alphab1) cos(theta1)*cos(alphab1) -sin(alphab1) -sin(alphab1)*d1;
   sin(theta1)*sin(alphab1) cos(theta1)*sin(alphab1) cos(alphab1) cos(alphab1)*d1;
   0 0 0 1];
T2=[cos(theta2) -sin(theta2) 0 a2;
   sin(theta2)*cos(alphab2) cos(theta2)*cos(alphab2) -sin(alphab2) -sin(alphab2)*d2;
   sin(theta2)*sin(alphab2) cos(theta2)*sin(alphab2) cos(alphab2) cos(alphab2)*d2;
   0 0 0 1];
T3=[cos(theta3) -sin(theta3) 0 a3;
   sin(theta3)*cos(alphab3) cos(theta3)*cos(alphab3) -sin(alphab3) -sin(alphab3)*d3;
   sin(theta3)*sin(alphab3) cos(theta3)*sin(alphab3) cos(alphab3) cos(alphab3)*d3;
   0 0 0 1];
T4=[cos(theta4) -sin(theta4) 0 a4;
   sin(theta4)*cos(alphab4) cos(theta4)*cos(alphab4) -sin(alphab4) -sin(alphab4)*d4;
   sin(theta4)*sin(alphab4) cos(theta4)*sin(alphab4) cos(alphab4) cos(alphab4)*d4;
   0 0 0 1];
T5=[cos(theta5) -sin(theta5) 0 a5;
   sin(theta5)*cos(alphab5) cos(theta5)*cos(alphab5) -sin(alphab5) -sin(alphab5)*d5;
   sin(theta5)*sin(alphab5) cos(theta5)*sin(alphab5) cos(alphab5) cos(alphab5)*d5;
   0 0 0 1];
T6=[cos(theta6) -sin(theta6) 0 a6;
   sin(theta6)*cos(alphab6) cos(theta6)*cos(alphab6) -sin(alphab6) -sin(alphab6)*d6;
   sin(theta6)*sin(alphab6) cos(theta6)*sin(alphab6) cos(alphab6) cos(alphab6)*d6;
   0 0 0 1];
Ttotal = T1*T2*T3*T4*T5*T6;
%% Roll-Pitch-Yaw
% T_prime= T6*T5*T4*T3*T2*T1;
% R=T_prime(1:3,1:3);
% syms alpha beta gamma
% 
% beta =atan2(-R(1,3),sqrt(R(1,1)^2+R(2,1)^2))
% alpha=atan2(R(2,1)/cos(beta),R(1,1)/cos(beta))
% gamma=atan2(R(3,2)/cos(beta),R(3,3)/cos(beta))
% 
% RXYZ=[cos(alpha)*cos(beta),cos(alpha)*sin(beta)*sin(gamma)-sin(alpha)*cos(gamma),cos(alpha)*sin(beta)*cos(gamma)+sin(alpha)*sin(gamma);
%       sin(alpha)*cos(beta),sin(alpha)*sin(beta)*sin(gamma)+cos(alpha)*cos(gamma),sin(alpha)*sin(beta)*cos(gamma)-cos(alpha)*sin(gamma);
%      -sin(beta),cos(beta)*sin(gamma),cos(beta)*cos(gamma)]
% isequal(R,RXYZ)
%% II
R=Ttotal(1:3,1:3);
syms phi sy teta

phi= atan2(R(3,2),R(3,3))
teta=atan2(-R(3,1),sqrt(R(3,2)^2+R(3,3)^2))
sy= atan2(R(2,1),R(1,1))

R_roll=[cos(sy)*cos(teta),cos(sy)*cos(teta)*sin(phi)-sin(sy)*cos(phi),cos(sy)*sin(teta)*cos(phi)+sin(sy)*sin(phi);
        sin(sy)*cos(teta),sin(sy)*sin(teta)*sin(phi)+cos(sy)*cos(phi),sin(sy)*sin(teta)*cos(phi)-cos(sy)*sin(phi);
        -sin(teta),cos(teta)*sin(phi),cos(teta)*cos(phi)]

isequal(R,R_roll)
