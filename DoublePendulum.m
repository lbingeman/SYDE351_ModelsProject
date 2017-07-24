function dydt = DoublePendulum(t,y,l1,l2,m1,m2,k21,b1,b2)
    dydt = zeros(5,1);
    g = 9.81;
    % y(1) - p17 theta direction
    % y(2) - p37 - theata direction
    % y(3) - x21
    % y(4) - theta1
    % y(5) - theta2
    
    dydt(1) = -sin(y(4))*m1*g-k21*y(3)-(b1/m1)*y(1);
    dydt(2) = -sin(y(5))*m2*g+k21*y(3)-(b2/m2)*y(2);
    dydt(3) = y(1)/m1 - y(2)/m2;
    dydt(4) = y(1)/(m1*l1); %w1
    dydt(5) = y(2)/(m2*l2); %w2
    
end