clear all;
close all;
clc;
t = 0:0.1:10;
A = load('HW4_Amatrix.dat');
B = load('HW4_Bmatrix.dat');
C = eye(9);
D = zeros(9,3);
Q = zeros(9,9);
Q(1,1) = 1;
Q(7,7) = 1;
Q(8,8) = 1;
R = eye(3);
x0=[0 0 0 0 0 0 0 0 0]';
k = LQR(A,B,Q,R);
[tout,yout] = sim('observer2');
figure(1),plot(tout,yout(:,1)*(180/pi));grid on
figure(2),plot(tout,yout(:,7));grid on
figure(3),plot(tout,yout(:,8));grid on
figure(4),plot(yout),legend('phi','theta','p','q','r','u','v','w','h');grid on