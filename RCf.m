function result = RCf(f,alpha,T)

W0 = 1 / (2*T);
W = (1+alpha) * W0;

cond1 = abs(f) < 2*W0-W;
cond2 = abs(f) < W & abs(f) >= 2*W0-W;
cond3 = not(cond1 | cond2);

result(cond1) = 1;
result(cond2) = (cos((pi./4) .* (abs(f(cond2))+W-2.*W0) ./ (W-W0))).^2;
result(cond3) = 0;