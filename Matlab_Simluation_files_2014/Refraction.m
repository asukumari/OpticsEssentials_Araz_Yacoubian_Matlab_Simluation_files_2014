% Refraction
% Copyright Araz Yacoubian 2013, 2014

clear

close('all')

n1 = input('Enter Refractive index in medium 1 (n1):  ');
n2 = input('Enter Refractive index in medium 2 (n2):  ');
q1_d = input('Input angle (deg.):  ');
q1_r=(pi/180)*q1_d;
q2_r_out=asin((n1/n2)*sin(q1_r));


%%%%
if abs(imag(q2_r_out)) > 0;
    q2_r=-q1_r;
    x2=-10;
else
    q2_r=q2_r_out;
    x2=10;
end
    
  
q2_d=(180/pi)*q2_r;
disp(' ');
disp(['Output angle = ' num2str(q2_d) ' (deg.)']);
%%%%

x1=-10;
y1=-x1*tan(q1_r);

x0=0;
y0=0;

y2=-x2*tan(q2_r);

xin=[x1 x0];
yin=[y1 y0];
xout=[x0 x2];
yout=[y0 y2];

figure('Name','Refraction','NumberTitle','off')
plot(xin,yin,xout,yout,'--')
line([0,0],[-10 10],'Color',[0 0 0])
line([-10 10],[0,0],'LineStyle',':','Color',[0 0 0])
axis([-10 10 -10 10])
xlabel('x (mm)')
ylabel('y (mm)')

text(-6,-8,['n1=' num2str(n1)],'BackgroundColor',[1 1 1],'fontsize',14)
text(6,-8,['n2=' num2str(n2)],'BackgroundColor',[1 1 1],'fontsize',14)




