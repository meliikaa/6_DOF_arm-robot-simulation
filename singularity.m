
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

%% origin
o1_0 = T1(1:3,4);
o1_0 = simplify(expand(o1_0));
z1   = T1(1:3,3);

x2   = T1*T2;
o2_0 = x2(1:3,4);
o2_0 = simplify(expand(o2_0));
z2   = x2(1:3,3);

x3   = T1*T2*T3;
o3_0 = x3(1:3,4);
o3_0 = simplify(expand(o3_0));
z3   = x3(1:3,3);

x4   = T1*T2*T3*T4;
o4_0 = x4(1:3,4);
o4_0 = simplify(expand(o4_0));
z4   = x4(1:3,3);

x5   = T1*T2*T3*T4*T5;
o5_0 = x5(1:3,4);
o5_0 = simplify(expand(o5_0));
z5   = x5(1:3,3);

x6   = T1*T2*T3*T4*T5*T6;
o6_0 = x6(1:3,4);
o6_0 = simplify(expand(o6_0));
z6   = x6(1:3,3);
%%jacobian
jv1 = cross(z1,o6_0-o1_0);
 j1 = [jv1;z1];
  O = o6_0-o2_0;
 jv2= cross(z2,O);
 j2 =[jv2;z2];
 Op = o6_0-o3_0;
 jv3 = cross(z3,Op);
 j3 = [jv3;z3];
 Op1 = o6_0-o4_0;
 jv4 = cross(z4,Op1);
 j4 = [jv4;z4];
 Op2 = o6_0-o5_0;
 jv5 = cross(z5,Op2);
 j5 = [jv5;z5];
 Op3 = o6_0-o6_0;
 jv6 = cross(z5,Op3);
 j6 = [jv6;z6];
 
 
J = [j1,j2,j3,j4,j5,j6];
J=simplify(J);
JV_6 = J(1:3,1:6);
JW_6 = J(4:6,1:6);
%% 
JJ=det(J);
simplify(JJ)
% temp= (1407*sin(theta3))/50000 - (3283*cos(theta2))/20000 - (31423*sin(theta2)*sin(theta3))/200000 + (3283*cos(theta2)*cos(theta3)^2)/20000 - (3283*cos(theta3)*sin(theta2)*sin(theta3))/20000 ==0;
% solve(temp,X)
dasti=70*cos(theta2) - 12*sin(theta3) + 67*sin(theta2)*sin(theta3) - 70*cos(theta2)*cos(theta3)^2 + 70*cos(theta3)*sin(theta2)*sin(theta3)==0;
dasti_solve=solve(dasti);
simplify(dasti_solve)

