function G = Greeks(S0,T,X,r,rol)
d1 = (log(S0/X)+(r+rol^2/2)*T)/(rol*sqrt(T));
d2 = d1-rol*sqrt(T);
delta = NORM(d1);
% delta = normcdf(d1,0,1);
gamma = densityN(d1)/(S0*rol*sqrt(T));
sigma = X*T*exp(-r*T)*NORM(d2);
% sigma = X*T*exp(-r*T)*normcdf(d2,0,1);
theta = -S0*densityN(d1)*rol/(2*sqrt(T))-r*X*exp(-r*T)*NORM(d2);
% theta = -S0*normpdf(d1,0,1)*rol/(2*sqrt(T))-r*X*exp(-r*T)*normcdf(d2,0,1);
vega = S0*densityN(d1)*sqrt(T);
G = [delta,gamma,sigma,theta,vega];
