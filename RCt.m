function result = RCt(t,alpha,T)

W0 = 1 / (2*T);
W = (1+alpha) * W0;

result = 2.*W0.*sinc(2.*W0.*t).*cos(2.*pi.*(W-W0).*t)./(1-(4.*(W-W0).*t).^2);