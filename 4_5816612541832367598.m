clear;
clc;
%% INVERSE KINEMATICS THETA1 - THETA3
xc=0.8;
yc=0.8;
zc=1;
d=0.27;
a2=0.67;
a3=0.7;
phi=atan2(xc,yc);
alpha2=atan2(sqrt(xc^2+yc^2-d^2),d);
theta1=phi-alpha2
d1=0.24+0.26;
D=(xc^2+yc^2-d^2+(zc-d1)^2-a2^2-a3^2)/(2*a2*a3);
theta3=atan2(D,sqrt(1-D^2))
theta2=atan2(sqrt(xc^2+yc^2-d^2),zc-d1)-atan2(a2+a3*cos(theta3),a3*sin(theta3))

%% D-h parameter 
syms theta4 theta5 theta6
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
% theta1=0;
% theta2=0;
% theta3=0;
% theta4=p/3;
% theta5=p/6;
% theta6=0;

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

%% Inverse Kinematics Theta4- Theta6
T_EE_4=T4*T5*T6;
T_3_0=T1*T2*T3;
R_3_0=T_3_0(1:3,1:3);
R_EE_4=T_EE_4(1:3,1:3);
R_EE_0=Ttotal(1:3,1:3);
R=R_EE_0;
R_EE_4_2=transpose(R_3_0)*R_EE_0;
simplify(R_EE_4_2)

%% With Euler Angles

syms alpha beta gamma

beta= atan2(sqrt(R(3,1)^2+R(3,2)^2),R(3,3));
alpha= atan2(R(2,3)/sin(beta),R(1,3)/sin(beta));
gamma= atan2(R(3,2)/sin(beta),-R(3,1)/sin(beta));

RZYZ= [cos(alpha)*cos(beta)*cos(gamma)-sin(alpha)*sin(gamma), -cos(alpha)*cos(beta)*sin(gamma)-sin(alpha)*cos(gamma), cos(alpha)*sin(beta);
       sin(alpha)*cos(beta)*cos(gamma)+cos(alpha)*sin(gamma), -sin(alpha)*cos(beta)*sin(gamma)+cos(alpha)*cos(gamma), sin(alpha)*sin(beta);
       -sin(beta)*cos(gamma), sin(beta)*sin(gamma),cos(beta)]

        