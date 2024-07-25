function result = RRCt(t,alpha,Ts)
% Generates a VERSION OF the RRC pulse (there are other definitions but
% this is valid)

tol = 0.0001 * Ts;

result = 0 * t;
R = 0.5/Ts;

cond1 = abs(t) < tol;
cond2 = abs(abs(t) - (64 * alpha^2 * R^2)^(-1/2)) < tol;
cond3 = not(cond1 | cond2);

result(cond1) = sqrt(2.*R) .* (1 - alpha + 4.*alpha./pi); % check this is correct
result(cond2) = (sqrt(2.*R) ./ (2.*pi.*R.*(1 - 192.*(alpha.^2).*(R.^2).*(t(cond2).^2)))).*(2.*pi.*R.*(1-alpha).*cos(2.*pi.*R.*(1-alpha).*t(cond2)) + 8.*R.*alpha.*(cos(2.*pi.*R.*(1+alpha).*t(cond2)) - 2.*pi.*R.*(1+alpha).*t(cond2).*sin(2.*pi.*R.*(1+alpha).*t(cond2))));
result(cond3) = (sqrt(2.*R) ./ (1 - 64.*alpha.^2.*R.^2.*t(cond3).^2)) .* (sin(2.*pi.*R.*(1-alpha).*t(cond3))./(2.*pi.*R.*t(cond3)) + 4.*alpha./pi .* cos(2.*pi.*R.*(1+alpha).*t(cond3)));
