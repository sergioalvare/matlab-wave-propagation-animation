close all
clear all
clc

p_o_i=1;%1Pa

f=500;%Hz
vp=343;%[m/s]
landa=vp/f;
k=2*pi/landa;
x_i=[0];
z_i=[0];
num_elem=99;

max_x=0.5;
min_x=-0.5;
pasox=(max_x-min_x)/num_elem;

max_z=2;
min_z=0.5;
pasoz=(max_z-min_z)/num_elem;

x=min_x:pasox:max_x;

z=min_z:pasoz:max_z;


d=0;
for m=1:num_elem+1;
    for n=1:num_elem+1;
        d(m,n)=sqrt((x(m)-x_i).^2+(z(n)-z_i).^2);
    end
end


p_i=p_o_i*(exp(-i*k*d)./d);
% suma=sum(p_i);
% surface(z,x,abs(p_i))

w=2*pi*f;
t=0:0.1e-3:4e-3;
%p_x_z_t=real(p_i*exp(i*w*t))


for m=1:length(t)
    pt(:,:,m)=real(p_i*exp(i*w*t(m)))
end
pt_normalizado=pt/max(max(max(pt)));

for m=1:length(t)
    clf;
    surface(z,x,abs(pt_normalizado(:,:,m)));
    shading flat
    v=[0 1];
    caxis(v);
    pause(0.2);
end


