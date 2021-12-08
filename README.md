# Math415_Final_Project
Problem #2 for my final project in Math 415: Mathematical Modeling

This code solves the following problem:

Simulate the motion of a vibrating string with fixed ends.

The displacement u(x, t) of the string is modeled with the one-dimensional wave equation:

∂^2u / ∂t^2 = c^2 ∂^2u / ∂x^2 , 0 < x < L, t > 0.

The boundary conditions are:
u(0, t) = 0 and u(L, t) = 0 for all t > 0.
The initial conditions are:
u(x, 0) = f(x) and ∂u

∂t (x, 0) = g(x) for 0 < x < L.

The ends of a stretched string of length L = 6 are fixed at x = 0 and x = 1. Assume
c = 1. The string is set to vibrate from rest by plucking it from an initial triangular shape
modeled by the function.

f(x) = {  2 − 2|x − 2|, 1 < x < 3
          0           , otherwise
        }

The initial velocity of the string is g(x) = 0. Use finite differences to simulate the motion of
the string with a step size in the x direction of h = 0.1 and a time step of k = 0.1. Create a
movie of your results from t = 0 to t = 13. Plot your solution at t = 13.

How to Run:

Open FinalProjectNo2.m in MatLab and run. The code will generate the following three figures:

1) A movie of the displacement of the string from t=0 to t=13
2) A 3D graph of the displacement of the string over time
3) A graph of the displacement of the string at t=13
