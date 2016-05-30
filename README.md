# Math 451 Final Proj
Final Project for Numerical Analysis class

The project does a reparameterization of a curve so the new curve has a constant arclength with respect to time.
ie. when moving a dot along a curve the dot will always go the same speed.

First, the program finds values of t that produce equidistant points along the curve. 
It does this by finding a zero of the function f(t) = s*arcLen - arcLen{from 0 to t} where s is the step size as a fraction of the total arclength. Multiples of s are used to find the complete list of t values.

The program then runs an animation where two dots are moved along the curve. One has steps that are contant in time (the original parameterization) and one has steps that are constant in distance (the new parameterization using the equidistant point found).

Notes on methods use:
Numerical integration (for finding arclength) is done via adaptive quadrature.
Finding zeros of f is done using Newton's Method.
  There is also an implementation of bisection to find zeros but Newton's Method is the default as it is much faster.
