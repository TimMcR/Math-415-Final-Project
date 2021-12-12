clear all
%This solves the string displacement equation using finite differences

h = 0.1; %step size in x diretion
k = 0.1; %time step
L = 6; %length of string
tend = 13; %stopping time value
c = 1; %constant
lamda = c^2 * k^2 / h^2;
t = 0:k:tend;
x = 0:h:L;
m = length(x);
n = length(t);
%initial value. initializes solution u
u = zeros(m, n);
syms xx;
f(xx) = piecewise(1 < xx < 3, 2 - 2 * abs(xx - 2), 0);
u(:, 1) = double(f(x));

%iterate to solve for u when j=1
for i = 2:m-1
   u(i,2) = (1/2) * ( u(i,1)*(2-2*lamda) + lamda*(u(i+1,1) + u(i-1,1)) );
end

%iterate to solve for u when j>1
for j = 2:n-1
   for i = 2:m-1
       u(i,j+1) = u(i,j)*(2-2*lamda) + lamda*(u(i+1,j) + u(i-1,j)) - u(i,j-1);
   end
end

%plot at tend (t=13)
plot(x, u(:, end), 'linewidth', 2);
ylim([-2 2])
xlabel('x')
ylabel('u')
title('Solution when t = 13')
grid on

%generate a 3d plot
figure

mesh(x, t, u')
xlabel('x')
ylabel('t')
ylim([0 tend])
zlabel('u')
zlim([-2 2])
title('Solution')
set(gca, 'fontsize', 12)

%create animation
figure

v = VideoWriter('Solution.avi')
v.FrameRate = 10;
open(v)
for i = 1:n
   plot(x, u(:, i), 'linewidth', 2) 
   grid on
   ylim([-2 2])
   xlabel('x')
   ylabel('u')
   title('Solution')
   FFF(i) = getframe(gcf)
   writeVideo(v, FFF(i));
end
close(v);
