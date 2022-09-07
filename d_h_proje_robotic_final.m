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
rank(J)
J_again=det(J);
simplify(J_again)
dd=70*cos(theta2) - 12*sin(theta3) + 67*sin(theta2)*sin(theta3) - 70*cos(theta2)*cos(theta3)^2 + 70*cos(theta3)*sin(theta2)*sin(theta3)==0;
ddd=solve(dd);
pretty(ddd)
%% j3_0
jv1 = cross(z1,o3_0-o1_0);
 j1 = [jv1;z1];
 O  = o3_0-o2_0;
 jv2= cross(z2,O);
 j2 =[jv2;z2];
 Op = o3_0-o3_0;
 jv3 = cross(z3,Op);
 j3 = [jv3;z3];
 z4 = [0;0;0];
 z5 = [0;0;0];
 z6 = [0;0;0];
 jv4 = [0;0;0];
 jv5 = [0;0;0];
 jv6 = [0;0;0];
%  jacobian from frame 3 to frame 1
 JV_3 = [jv1,jv2,jv3,jv4,jv5,jv6];
 JW_3 = [z1,z2,z3,z4,z5,z6];
%  J = [j1,j2,j3,j4,j5,j6]
%% j2_0
jv1 = cross(z1,o2_0-o1_0);
 j1 = [jv1;z1];
 O  = o2_0-o2_0;
 jv2= cross(z2,O);
 j2 =[jv2;z2];
 
 jv3 = [0;0;0];
 jv4 = [0;0;0];
 jv5 = [0;0;0];
 jv6 = [0;0;0];
 JV_2 = [jv1,jv2,jv3,jv4,jv5,jv6];
 z3 = [0;0;0];
JW_2 = [z1,z2,z3,z4,z5,z6];
%% dynamic
m6 = 12.33;
m3 = 13.91;
m2 = 56.73;
% inertia matrix taken at the output coordinate system
I6 = [20.75,0.02,-1.54;0.02,20.87,-0.21;-1.54,-0.21,0.19];
I3 = [6.9,-0.17,-0.99;-0.17,6.89,1.08;-0.99,1.08,0.39];
I2 = [34.39,-0.17,-3;-0.17,34.58,1.03;-3,1.03,1.14];
link6 = m6*(transpose(JV_6))*JV_6+(transpose(JW_6))*I6*JW_6;
link3 = m3*(transpose(JV_3))*JV_3+(transpose(JW_3))*I3*JW_3;
link2 = m2*(transpose(JV_2))*JV_2+(transpose(JW_2))*I2*JW_2;
M = link6+link3+link2;


%% matrix G
syms teta2 teta3
%x is the angular from solid
x=61.64*(p/180);
teta2 = theta2 + p/2;
teta3 = theta3 + p/2;
p1 = m2 * 9.8 * 0.46;
p2 = m3 * 9.8 * (0.67*sin(teta2+x)+0.46); %%%%x
p3 = m6 * 9.8 * (0.7*sin(teta2+teta3+x)+0.67*sin(teta2+x)+0.46);
P = p1 + p2 + p3;
phi1 = 0;
phi2 = (m3+m6)*9.8*0.67*cos(teta2+x);
phi3 = m6*9.8*0.7*cos(teta2+teta3+x);
G = [phi1;phi2;phi3]
%% matrix c
syms theta1(t) theta2(t) theta3(t) theta4(t) theta5(t) theta6(t)
THETA = [theta1 theta2 theta3 theta4 theta5 theta6];  %% watch out teta2 and teta3
C = sym(zeros(6,6));
c = sym(zeros(6,6,6));
for k = 1:6
        for j = 1:6
            for i = 1:6
                F1 = M(k,j);
                F2 = M(k,i);
                F3 = -M(i,j);
                c(i,j,k) = 0.5*(diff(F1,THETA(i)) + diff(F2,THETA(j)) + diff(F3,THETA(k)));
            end
        end
end
%% C
for k=  1:6
for i = 1:6
for j = 1:6
    C(i,k) = C(i,k)+c(i,j,k);
end
end
end

%% Sehat Jv
syms theta1(t) theta2(t) theta3(t) theta4(t) theta5(t) theta6(t)
THETA = [theta1 theta2 theta3 theta4 theta5 theta6];  %% watch out teta2 and teta3

J_vprim = sym(zeros(3,3));
X= sym(zeros(1,3));
%F4 is the same as p3_0 because we assum that theta4 and theta5 theta6 hav
%zero effect on jv
F4=[
(67*cos(theta1)*cos(theta2 - pi/2))/100 - (3*cos(theta1))/25 - (7*cos(theta1)*cos(theta2 - pi/2)*sin(theta3 - pi/2))/10 - (7*cos(theta1)*cos(theta3 - pi/2)*sin(theta2 - pi/2))/10;
(67*cos(theta2 - pi/2)*sin(theta1))/100 - (3*sin(theta1))/25 - (7*cos(theta2 - pi/2)*sin(theta1)*sin(theta3 - pi/2))/10 - (7*cos(theta3 - pi/2)*sin(theta1)*sin(theta2 - pi/2))/10;
                                                 (7*sin(theta2 - pi/2)*sin(theta3 - pi/2))/10 - (7*cos(theta2 - pi/2)*cos(theta3 - pi/2))/10 - (67*sin(theta2 - pi/2))/100 + 23/50];
X1=diff(F4,theta1(t));
X2=diff(F4,theta2(t)); 
X3=diff(F4,theta3(t));
X4=diff(F4,theta4(t));
X5=diff(F4,theta5(t));
X6=diff(F4,theta6(t));
X1=simplify(X1)
X2=simplify(X2)
X3=simplify(X3)
X4 = [0;0;0]
X5 = [0;0;0]
X6 = [0;0;0]
JV_dervivative = [X1,X2,X3,X4,X5,X6]
JV_derivative = simplify(JV_dervivative)
%% SEHAT Jw
% syms q1 q2 q3 q4 q5 q6
% q_dot=[q1;q2;q3;q4;q5;q6];
% R=Ttotal(1:3,1:3);
% R_dot=diff(R);
% S_w=(R_dot)*(transpose(R));
% S_w2=simplify(S_w); %skew-symmetric
% w=[0;0;1];
% w_z=S_w(2,1);
% w_y=S_w(1,3);
% w_x=S_w(3,2);
% W=[w_x;w_y;w_z];
% y=J(4:6,1:6);
% answer=y*(q_dot);
%% 
% syms theta1(t) theta2(t) theta3(t) theta4(t) theta5(t) theta6(t)
syms q1 q2 q3 q4 q5 q6
Q = [q1,q2,q3,q4,q5,q6];
W_S= sym(zeros(3,6));
tt=T1*T2*T3*T4*T5*T6;
w0=[0;0;0];
z1=[0;0;1];
z2=[0;1;0];
z3=[0;1;0];
z4=[0;0;1];
z5=[0;1;0];
z6=[0;0;1];
Z_S=[z1,z2,z3,z4,z5,z6];
R0_1=transpose(T1(1:3,1:3));
R1_2=transpose(T2(1:3,1:3));
R2_3=transpose(T3(1:3,1:3));
R3_4=transpose(T4(1:3,1:3));
R4_5=transpose(T5(1:3,1:3));
R5_6=transpose(T6(1:3,1:3));
R_S=[R0_1,R1_2,R2_3,R3_4,R4_5,R5_6];
% new jw 
w1_1 = R0_1*w0  +q1*z1;
w2_2 = R1_2*w1_1+q2*z2;
w3_3 = R2_3*w2_2+q3*z3;
w4_4 = R3_4*w3_3+q4*z4;
w5_5 = R4_5*w4_4+q5*z5;
w6_6 = R5_6*w5_5+q6*z6;
% for i=1:3
%     for j=1:6
%         temp(i,j)=collect(w6_6(i),Q(j)); 
%         jW6_6(i,j)=diff(temp(i,j));
%     end
%     
% end
ans1_1 = collect(w6_6(1),q1);
ans1_1 = diff(ans1_1,q1);

ans2_1 = collect(w6_6(1),q2);
ans2_1 = diff(ans2_1,q2);

ans3_1 = collect(w6_6(1),q3);
ans3_1 = diff(ans3_1,q3);

ans4_1 = collect(w6_6(1),q4);
ans4_1 = diff(ans4_1,q4);

ans5_1 = collect(w6_6(1),q5);
ans5_1 = diff(ans5_1,q5);

ans6_1 = collect(w6_6(1),q6);
ans6_1 = diff(ans6_1,q6);
%w6_6(2)
ans1_2 = collect(w6_6(2),q1);
ans1_2 = diff(ans1_2,q1);

ans2_2 = collect(w6_6(2),q2);
ans2_2 = diff(ans2_2,q2);

ans3_2 = collect(w6_6(2),q3);
ans3_2 = diff(ans3_2,q3);

ans4_2 = collect(w6_6(2),q4);
ans4_2 = diff(ans4_2,q4);

ans5_2 = collect(w6_6(2),q5);
ans5_2 = diff(ans5_2,q5);

ans6_2 = collect(w6_6(2),q6);
ans6_2 = diff(ans6_2,q6);
%w3
ans1_3 = collect(w6_6(3),q1);
ans1_3 = diff(ans1_3,q1);

ans2_3 = collect(w6_6(3),q2);
ans2_3 = diff(ans2_3,q2);

ans3_3 = collect(w6_6(3),q3);
ans3_3 = diff(ans3_3,q3);

ans4_3 = collect(w6_6(3),q4);
ans4_3 = diff(ans4_3,q4);

ans5_3 = collect(w6_6(3),q5);
ans5_3 = diff(ans5_3,q5);

ans6_3 = collect(w6_6(3),q6);
ans6_3 = diff(ans6_3,q6);

Jw_6_6 = [ans1_1,ans2_1,ans3_1,ans4_1,ans5_1,ans6_1;
          ans1_2,ans2_2,ans3_2,ans4_2,ans5_2,ans6_2;
          ans1_3,ans2_3,ans3_3,ans4_3,ans5_3,ans6_3];
Jw_propagation = tt(1:3,1:3)*Jw_6_6;
simplify(Jw_propagation)

J_w_j=J(4:6,1:6);
simplify(J_w_j)


% 
% 
% Y1=diff(w6_6,q1);
% Y2=diff(w6_6,q2); 
% Y3=diff(w6_6,q3);
% Y4=diff(w6_6,q4);
% Y5=diff(w6_6,q5);
% Y6=diff(w6_6,q6);
% 
% Y1=simplify(Y1);
% Y2=simplify(Y2);
% Y3=simplify(Y3);
% Y4=simplify(Y4);
% Y5=simplify(Y5);
% Y6=simplify(Y6);
% 
% Jw_propagation2 = [Y1,Y2,Y3,Y4,Y5,Y6];
% j=2;
% W_S(:,1)=q1*z1;
%  for i=1:5
%     W_S(:,i+1)=R_S(:,j:j+2)*W_S(:,i)+Q(i+1)*Z_S(:,i+1);
%     j=i+3;
%  end
% simplify(W_S(:,6))
% y=Ttotal(1:3,1:3)*J(4:6,1:6);
% answer=y*(transpose(Q));
% simplify(answer)