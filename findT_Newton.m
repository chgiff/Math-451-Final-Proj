%finds the T s.t. arc length from 0 to t equals input s
function t = findT_Newton(s)

%initial guess
curT = .5;
%tolerance
tol = 10.^-6;

% do newtons method to find zero of s*arcLen - arcLen{from 0 to t}
while abs(arcLen(curT) - s*arcLen(1)) > tol
    curT = curT - (arcLen(curT) - s*arcLen(1))/(arcelement1(curT));
end
t = curT;

% returns the arc length from 0 to t of the function we are working with
% (arcelement1)
function a = arcLen(t)
    tol = 10.^-6;
    a = adapquad(@arcelement1, 0, t, tol);