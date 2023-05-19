clc;
close all;
A1=0:1:30;
N1=5; %%the number of channels
GOS1=erlangb(N1,A1); %%theoretical value
plot(A1,GOS1,'--or');
axis([10,40,0,0.9]);
title('Blocking probability versus offered load')
xlabel('offered load a')
ylabel('blocking probability')
hold on;
GOS2=erlangbSimul(N1,200,A1./200);
plot(A1,GOS2,'--xb');
axis([0,30,0,0.9]);
legend('analysis','simulation')

N2=15; %%the number of channels
GOS3=erlangb(N2,A1); %%theoretical value
plot(A1,GOS3,'--om');
hold on;
GOS4=erlangbSimul(N2,200,A1./200);
plot(A1,GOS4,'--xc');

N3=25; %%the number of channels
GOS5=erlangb(N3,A1); %%theoretical value
plot(A1,GOS5,'--oy');
hold on;
GOS6=erlangbSimul(N3,200,A1./200);
plot(A1,GOS6,'--xk');

legend('analysis S=5','simulation S=5','analysis S=15','simulation S=15', ...
    'analysis S=25','simulation S=25')
