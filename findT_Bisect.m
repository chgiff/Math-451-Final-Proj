%finds the T s.t. arc length from 0 to t equals input s
function t = findT_Bisect(s)

%start and end points to guess t*(s)
a=-.1; b=1.1;
%tolerance
tol = 10.^-6;

% do bisection to find zero of s*arcLen - arcLen{from 0 to t}
if sign(s*arcLen(1) - arcLen(a))*sign(s*arcLen(1) - arcLen(b)) >= 0
    error('f(a)f(b)<0 not satisfied!') %ceases execution
end
fa=s*arcLen(1) - arcLen(a);
fb=s*arcLen(1) - arcLen(b);
while (b-a)/2>tol
    c=(a+b)/2;
    fc= s*arcLen(1) - arcLen(c);
    if fc == 0              %c is a solution, done
        break
    end
    if sign(fc)*sign(fa)<0  %a and c make the new interval
        b=c;fb=fc;
    else                    %c and b make the new interval
        a=c;fa=fc;
    end
end
t=(a+b)/2;               %new midpoint is best estimate

% returns the arc length from 0 to t of the function we are working with
% (arcelement1)
function a = arcLen(t)
    tol = 10.^-6;
    a = adapquad(@arcelement1, 0, t, tol);