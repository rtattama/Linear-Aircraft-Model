clear all;
close all;
clc;
t = 0:0.1:10;
A = load('HW4_Amatrix.dat');
B = load('HW4_Bmatrix.dat');
C = load('HW4_Cmatrix.dat');
D = load('HW4_Dmatrix.dat');
Q = zeros(9,9);
Q(1,1) = 1;
Q(7,7) = 1;
Q(8,8) = 1;
R = eye(3);
x0=[0 0 0 0 0 0 0 0 0]';
k = lqr(A,B,Q,R);
Q1 = eye(9);
R1 = eye(9);
L = lqr(A',C',Q1,R1);
[tout,yout] = sim('observer1');
figure(1),plot(tout,yout(:,1)*(180/pi));grid on
figure(2),plot(tout,yout(:,7));grid on
figure(3),plot(tout,yout(:,8));grid on
figure(4),plot(yout),legend('phi','theta','p','q','r','u','v','w','h');grid on