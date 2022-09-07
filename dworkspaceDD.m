clc;
clear;
close all;
% D-H Parameters
a1 = -0.12; d1 = 0.46; alpha1 = -pi/2  ; theta1 = 0;
a2 = 0.67 ; d2 = 0   ; alpha2 = 0      ; theta2 = -pi/4;
a3 = 0    ; d3 = 0   ; alpha3 = -pi/2  ; theta3 = 3*pi/4;
a4 = 0    ; d4 = 0.7 ; alpha4 = pi/2   ; theta4 = 0;
a5 = 0    ; d5 = 0   ; alpha5 = -pi/2  ; theta5 = pi/2;
a6 = 0    ; d6 = 0   ; alpha6 = 0      ; theta6 = 0;

% Axis Properties
%points
X=[0 0 0.22 0.22 0.22];
Z=[0 0.22 0.22+0.24 0.22+0.24+0.67 0.22+0.24+0.67+0.70];

% Iteration of th2,th3 within maximum and minimum limits
% for theta1_0=  -180:50:180
for theta2_0 = -105:10:145
for theta3_0 = -163:10:150
% theta1=theta1_0*pi/180;
theta2=theta2_0*pi/180;
theta3=theta3_0*pi/180;
A01 = [cos(theta1), -cos(alpha1)*sin(theta1), sin(alpha1)*sin(theta1),a1*cos(theta1);
       sin(theta1), cos(alpha1)*cos(theta1), -sin(alpha1)*cos(theta1),a1*sin(theta1);
       0, sin(alpha1), cos(alpha1),d1;
       0, 0, 0, 1 ];
A12 = [cos(theta2), -cos(alpha2)*sin(theta2), sin(alpha2)*sin(theta2),a2*cos(theta2);
       sin(theta2), cos(alpha2)*cos(theta2), -sin(alpha2)*cos(theta2), a2*sin(theta2);
       0, sin(alpha2), cos(alpha2),d2;
       0, 0, 0, 1 ];
A23 = [cos(theta3), -cos(alpha3)*sin(theta3), sin(alpha3)*sin(theta3),a3*cos(theta3);
       sin(theta3), cos(alpha3)*cos(theta3), -sin(alpha3)*cos(theta3),a3*sin(theta3);
       0, sin(alpha3), cos(alpha3),d3;
       0, 0, 0, 1 ];
A34 = [cos(theta4), -cos(alpha4)*sin(theta4), sin(alpha4)*sin(theta4),a4*cos(theta4);
       sin(theta4), cos(alpha4)*cos(theta4), -sin(alpha4)*cos(theta4), a4*sin(theta4);
       0, sin(alpha4), cos(alpha4),d4;
       0, 0, 0, 1 ];
A45 = [cos(theta5), -cos(alpha5)*sin(theta5), sin(alpha5)*sin(alpha5),a5*cos(alpha5);
       sin(theta5), cos(alpha5)*cos(theta5), -sin(alpha5)*cos(theta5),a5*sin(theta5);
       0, sin(alpha5), cos(alpha5),d5;
       0, 0, 0, 1 ];
A56 = [cos(theta6), -cos(alpha6)*sin(theta6), sin(alpha6)*sin(theta6),a6*cos(theta6);
       sin(theta6), cos(alpha6)*cos(theta6), -sin(alpha6)*cos(theta6),a6*sin(theta6);
       0, sin(alpha6), cos(alpha6),d6;
       0, 0, 0, 1 ];
A06 = A01*A12*A23*A34*A45*A56;
Envelope_1 = plot(A06(1,4), A06(3,4),'r.')
hold 'all'
% drawnow
% pause(.1)
% else
% fail = 1;
% end
end
end