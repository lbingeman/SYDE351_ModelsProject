% Project Simulation
% y(1) - p17
% y(2) - p14
% y(3) - p37
% y(4) - p34
% y(5) - x21
% y(6) - theta1
% y(7) - theta2

% Parameters
l1 = 0.172; %[m]
l2 = 0.150; %[m]

m1 = .1228; %[kg]
m2 = .13523; %[kg]

b1 = 0.01455; % [N/(m/s)]
b2 = 0.01455; % [N/(m/s)]

k21 = 16.536; %[N/m]- spring constant

x0 = 0.041; %[m] - initial unstretched spring length

% Initial condition
t_start = 0; %[s]
t_stop = 20; %[s]
x_inital = 0.12;
p17_initial = 0;
p14_initial = 0;
p37_initial = 0;
p34_initial = 0;
theta_1_initial = pi/12;
theata_2_initial = -pi/12;

tspan = [t_start t_stop];
y0 = [p17_initial p14_initial p37_initial p34_initial (x_inital-x0) theta_1_initial theata_2_initial];

options=odeset('RelTol',1e-4,'AbsTol',1e-8);
[t,y]=ode45(@DoublePendulum,tspan,y0,options,l1,l2,m1,m2,k21,b1,b2);

v17 = (1/m1)*y(:,1);
v37 = (1/m2)*y(:,3);

figure;

subplot(3,2,1);
plot(t,v17,'r');
title("Velocity in radial direction direction vs time");
xlabel("Time (s)");
ylabel("Velocity (m/s)");
legend('Mass 1')

subplot(3,2,2);
plot(t,v17,'g');
title("Velocity in radial direction direction vs time");
xlabel("Time (s)");
ylabel("Velocity (m/s)");
legend('Mass 2')

pks = findpeaks(y(:,7));

subplot(3,2,3);
plot(t,y(:,6),'r');
title("Angle of Mass vs time");
xlabel("Time (s)");
ylabel("Angle (degrees)");
legend('Mass 1');

subplot(3,2,4);
plot(t,y(:,7),'g');
title("Angle of Mass vs time");
xlabel("Time (s)");
ylabel("Angle (degrees)");
legend('Mass 2');

subplot(3,2,[5 6]);
plot(t,l1*sin(y(:,6)),'r',t,l2*sin(y(:,7))-0.07,'g');%,l1*cos(y(:,6)) ,l2*cos(y(:,7))
title("Position vs time");
xlabel("Time (s)");
ylabel("X-Position (m)");
zlabel("Y-Position (m)");
legend('Mass 1','Mass 2')
