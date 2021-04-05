% Blackbody_radiation (Normalized blackbody radiation emission)
% Copyright Araz Yacoubian 2013, 2014


clear

close('all')

T = input('Input temperature in deg. Kelvin:  '); % temperature in degree Kelvin

h = 6.62606885E-34; % Plank's Constant (J.s)
c = 3.00E+08;       % Speed of light (m/s)
k = 1.38E-23;       % Boltzman constant (J/K)

lambda_set1 = 100:10:2000;
lambda_set2 = 2100:100:1000000;
lambda_nm = [lambda_set1 lambda_set2]; %Wavelength (nm)
lambda_m = lambda_nm*(1e-9);           % Wavelength (meter)
lambda_um = lambda_nm*(1e-3);          % Wavelength (micrometer)

Param1_m = ((2*h*(c^2))./(lambda_m.^5));
Param2_m = 1./((exp((h*c/(k*T))./lambda_m))-1);
I = Param1_m.*Param2_m;
I_relative = I./(max(I));

[tmp,size_lambda] = size(lambda_nm);
[Y,lamda_max_index] = max(I_relative);

for m = lamda_max_index:size_lambda;
    if I_relative(m) < 0.05;
        max_index = m;
        break
    end
end

figure('Name','Blackbody Radiation','NumberTitle','off')
clf
axes('Fontsize',14)
plot(lambda_um,I_relative,'k-','LineWidth',2)
ylabel('Normalized Exitance','Fontsize',16)
xlabel('Wavelength (microns)','Fontsize',16)
axis([0 lambda_um(max_index) 0 1.1]);
axis([0 lambda_um(max_index) 0 1.1]);
grid
