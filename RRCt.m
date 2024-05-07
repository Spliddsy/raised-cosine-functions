function result = RRCt(t,alpha,T)

R = 1/T;

result = (sqrt(2.*R) ./ (1 - 64.*alpha.^2.*R.^2.*t.^2)) .* (sin(2.*pi.*R.*(1-alpha).*t)./(2.*pi.*R.*t) + 4.*alpha./pi .* cos(2.*pi.*R.*(1+alpha).*t));
