function [m,b,dm,db,s]=pente(x,y,sig)
n=nargin;
N=max(size(x));
if n<3
	sig=ones(size(x));
end
if max(size(sig))==1
	sig=ones(size(x))*sig;
end
sig=sig.*sig;
A=[sum(1./sig) sum(x./sig); sum(x./sig) sum(x.*x./sig)];
DA=det(A);
m=det([sum(1./sig) sum(y./sig); sum(x./sig) sum(x.*y./sig)])/DA;
b=det([sum(y./sig) sum(x./sig); sum(x.*y./sig) sum(x.*x./sig)])/DA;
s2=sum((y-b-m*x).^2/sig)/(N-2);
s=sqrt(s2);
if n<3
	dm=sqrt(N*s2/DA);
	db=sqrt(sum(x.*x)*s2/DA);
else
	dm=sqrt(sum(1./sig)/DA);
	db=sqrt(sum(x.*x./sig)/DA);
end