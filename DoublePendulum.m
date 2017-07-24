function dydt = DoublePendulum(t,y,l1,l2,m1,m2,k21,b1,b2)
    dydt = zeros(7,1);
    g = 9.81;
    % y(1) - p17 theta direction
    % y(2) - p14 - r direction
    % y(3) - p37 - theata direction
    % y(4) - p34 - r direction
    % y(5) - x21
    % y(6) - theta1
    % y(7) - theta2
    
    dydt(1) = -dydt(6)*y(2)-sin(y(6))*m1*g-k21*y(5)-(b1/m1)*y(1);
    dydt(2) = dydt(6)*y(1)+cos(y(6))*m1*g;
    dydt(3) = -dydt(7)*y(4)-sin(y(7))*m1*g+k21*y(5)-(b2/m2)*y(3);
    dydt(4) = dydt(7)*y(3)+cos(y(7))*m1*g;
    dydt(5) = y(1)/m1 - y(3)/m2;
    dydt(6) = y(1)/(m1*l1); %w1
    dydt(7) = y(3)/(m2*l2); %w2
    
end