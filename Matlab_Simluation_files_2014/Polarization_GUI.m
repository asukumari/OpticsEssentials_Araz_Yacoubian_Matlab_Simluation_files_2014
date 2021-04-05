function Polarization_GUI
% Polarization
% Copyright Araz Yacoubian 2013, 2014

clear
close('all')

%%%% 
option_wv_pol=21; % In, qrtwv

%%%%

x=-125:125;


q1=30;45;

q2=135;

r1=50;
r2=55;

sgm=pi/2;
sgm=pi/1;
rho=50;


%%%%%%%%%%%%%
fh303 = figure('Visible','off');
set(fh303,'Units','Normalized','Position',[0.2 0.45 0.6 0.45]);

set(fh303,'Color',[0.925 0.914 0.847]);
set(fh303,'Visible','on','Name','Polarization','NumberTitle','off');

%%%%%%%%%%%%%


%%%%%%%%%%%%%% 
slider_value_q1=q1;  

q1_string=num2str(q1,'%2.1f');
text_q1 = uicontrol('Style','edit',...
             'String',q1_string,...
             'Units','Normalized',...
             'Position',[0.09,0.25,0.05,0.05],...
             'BackgroundColor',[1 1 1]);

sh_q1 = uicontrol(fh303,'Style','slider',...
                'Max',360,'Min',0,'Value',slider_value_q1,...
                'SliderStep',[0.0500 0.20],...
                'Units','Normalized',...
                'Position',[0.17,0.25,0.3,0.04],...
                'Callback',{@slider_q1_Callback});
            
function slider_q1_Callback(source,eventdata)
    slider_value_q1=get(source, 'Value');
    slider_value_q1_dsp=num2str(slider_value_q1,'%2.1f'); 
    set(textinputSliderValue2q1, 'String', slider_value_q1_dsp);
    q1=slider_value_q1;
    pol_calc
    
end

text_q1_mark = uicontrol('Style','text',...
             'String','P1 Angle',...
             'Units','Normalized',...
             'Position',[0.005,0.25,0.06,0.04],...
             'BackgroundColor',[0.925 0.914 0.847]);

q1_input_string=num2str(q1,'%2.1f');
textinputSliderValue2q1 = uicontrol('Style','edit',...
             'Value',q1,...
             'Units','Normalized',...
             'Position',[0.09,0.25,0.05,0.05],...
             'BackgroundColor',[1 1 1],...
             'String',q1_input_string,...
             'Callback',{@q1_Callback});
               
function q1_Callback(source,eventdata)
    q1 = str2double(get(source, 'String'));

    slider_value_q1=q1;
        
            pol_calc
 end
%%%%%%%%%%%%%% 

%%%%%%%%%%%%%% 

slider_value_rho=rho;  

rho_string=num2str(rho,'%2.1f');
text_rho = uicontrol('Style','edit',...
             'String',rho_string,...
             'Units','Normalized',...
             'Position',[0.09,0.25-0.10,0.05,0.05],...
             'BackgroundColor',[1 1 1]);

sh_rho = uicontrol(fh303,'Style','slider',...
                'Max',360,'Min',0,'Value',slider_value_rho,...
                'SliderStep',[0.0500 0.20],...
                'Units','Normalized',...
                'Position',[0.17,0.25-0.10,0.3,0.04],...
                'Callback',{@slider_rho_Callback});
            
function slider_rho_Callback(source,eventdata)
    slider_value_rho=get(source, 'Value');
    slider_value_rho_dsp=num2str(slider_value_rho,'%2.1f'); 
    set(textinputSliderValue2rho, 'String', slider_value_rho_dsp);
    rho=slider_value_rho;
    pol_calc
    
end

text_rho_mark = uicontrol('Style','text',...
             'String','Wave Angle ',...
             'Units','Normalized',...
             'Position',[0.005,0.25-0.10,0.09,0.04],...
             'BackgroundColor',[0.925 0.914 0.847]);
%                       'Position',[0.005,0.25-0.10*2,0.06,0.04],...

rho_input_string=num2str(rho,'%2.1f');
textinputSliderValue2rho = uicontrol('Style','edit',...
             'Value',rho,...
             'Units','Normalized',...
             'Position',[0.09,0.25-0.10,0.05,0.05],...
             'BackgroundColor',[1 1 1],...
             'String',rho_input_string,...
             'Callback',{@rho_Callback});
               
function rho_Callback(source,eventdata)
    rho = str2double(get(source, 'String'));


    
    slider_value_rho=rho;

           
            pol_calc
 end
%%%%%%%%%%%%%%


%%%%%%%%%%%%%%

slider_value_q2=q2;  

q2_string=num2str(q2,'%2.1f');
text_q2 = uicontrol('Style','edit',...
             'String',q2_string,...
             'Units','Normalized',...
             'Position',[0.09,0.25-0.10*2,0.05,0.05],...
             'BackgroundColor',[1 1 1]);

sh_q2 = uicontrol(fh303,'Style','slider',...
                'Max',360,'Min',0,'Value',slider_value_q2,...
                'SliderStep',[0.0500 0.20],...
                'Units','Normalized',...
                'Position',[0.17,0.25-0.10*2,0.3,0.04],...
                'Callback',{@slider_q2_Callback});
            
function slider_q2_Callback(source,eventdata)
    slider_value_q2=get(source, 'Value');
    slider_value_q2_dsp=num2str(slider_value_q2,'%2.1f'); 
    set(textinputSliderValue2q2, 'String', slider_value_q2_dsp);
    q2=slider_value_q2;
    pol_calc
    
end

text_q2_mark = uicontrol('Style','text',...
             'String','P2 Angle',...
             'Units','Normalized',...
             'Position',[0.005,0.25-0.10*2,0.06,0.04],...
             'BackgroundColor',[0.925 0.914 0.847]);
         

q2_input_string=num2str(q2,'%2.1f');
textinputSliderValue2q2 = uicontrol('Style','edit',...
             'Value',q2,...
             'Units','Normalized',...
             'Position',[0.09,0.25-0.10*2,0.05,0.05],...
             'BackgroundColor',[1 1 1],...
             'String',q2_input_string,...
             'Callback',{@q2_Callback});
               
function q2_Callback(source,eventdata)
    q2 = str2double(get(source, 'String'));


    
    slider_value_q2=q2;

           
            pol_calc
 end
%%%%%%%%%%%%%%



    pol_calc

% %%%%%%%%%%%%%%
%%%%%%%%%%%%
    function pol_calc
yc1_p=real(sqrt(r1^2-x.^2));
yc1_n=-real(sqrt(r1^2-x.^2));

yc1_p_imag=imag(sqrt(r1^2-x.^2));
yc1_p_tmp=yc1_p;
yc1_p_tmp(find(yc1_p_imag>0))=nan;
yc1_p=yc1_p_tmp;
yc1_n_tmp=yc1_n;
yc1_n_tmp(find(yc1_p_imag>0))=nan;
yc1_n=yc1_n_tmp;

x1=r1.*cos(q1*pi/180);
y1=r1.*sin(q1*pi/180);
plot_x1=[-x1 x1];
plot_y1=[-y1 y1];
% %%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%
sftx_2=0;
sfty_2=0;

yc2_p=real(sqrt(r2^2-(x-sftx_2).^2))+sfty_2;
yc2_n=-real(sqrt(r2^2-(x-sftx_2).^2))+sfty_2;

yc2_p_imag=imag(sqrt(r2^2-(x-sftx_2).^2))+sfty_2;
yc2_p_tmp=yc2_p;
yc2_p_tmp(find(yc2_p_imag>sfty_2))=nan;
yc2_p=yc2_p_tmp;
yc2_n_tmp=yc2_n;
yc2_n_tmp(find(yc2_p_imag>sfty_2))=nan;
yc2_n=yc2_n_tmp;

x2=r2.*cos(q2*pi/180);
y2=r2.*sin(q2*pi/180);
plot_x2=[-x2+sftx_2 x2+sftx_2];
plot_y2=[-y2+sfty_2 y2+sfty_2];
%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%
x_sq=60;
y_sq=35; 
rho_rad_disp=-rho*pi/180;
A_rt=[cos(rho_rad_disp) sin(rho_rad_disp);...
    -sin(rho_rad_disp) cos(rho_rad_disp)];

V1=[x_sq;y_sq];
Vout1=A_rt*V1;

V2=[-x_sq;y_sq];
Vout2=A_rt*V2;

V3=[-x_sq;-y_sq];
Vout3=A_rt*V3;

V4=[x_sq;-y_sq];
Vout4=A_rt*V4;

Voutsq_x=[Vout1(1) Vout2(1) Vout3(1) Vout4(1) Vout1(1)];
Voutsq_y=[Vout1(2) Vout2(2) Vout3(2) Vout4(2) Vout1(2)];

r_rho=x_sq;
xW=r_rho.*cos(rho*pi/180);
yW=r_rho.*sin(rho*pi/180);
plot_xW=[-xW xW];
plot_yW=[-yW yW];
%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%
Hoz_Ln_x=x;
Hoz_Ln_y=0.*x;
Hoz_Ln_y(66:186)=NaN;

Ver_Ln_y=x;
Ver_Ln_x=0.*x;
Ver_Ln_x(66:186)=NaN;


%%%%%%%%% %%%%%%%%%%%%%
q1_rad=(pi/180)*q1;
E_in=[cos(q1_rad);sin(q1_rad)]; 

q2_rad=q2*(pi/180);
A_pol2=[(cos(q2_rad))^2 sin(q2_rad)*cos(q2_rad);...
    sin(q2_rad)*cos(q2_rad) (sin(q2_rad))^2];

rho_rad=rho*pi/180;
A_rtrd=[(exp(i*sgm/2))*((cos(rho_rad))^2) + (exp(-i*sgm/2))*((sin(rho_rad))^2)...
    2*i*(sin(rho_rad))*(cos(rho_rad))*sin(sgm/2);...
    2*i*(sin(rho_rad))*(cos(rho_rad))*sin(sgm/2)...
    (exp(-i*sgm/2))*((cos(rho_rad))^2) + (exp(i*sgm/2))*((sin(rho_rad))^2)];
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tplot=-2*pi:(pi/50):2*pi;
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%
bgh_WP = uibuttongroup('Parent',fh303,'Title','Component Selection',...
    'Units','Normalized',...
    'Position',[.5 .03 .3 0.22]);

rbh_P2 = uicontrol(bgh_WP,'Style','radiobutton','String','P2  ',...
                'Units','normalized',...
                'Value',68,...
                'Position',[.7 .5 .3 .5]);
   
rbh_Wq = uicontrol(bgh_WP,'Style','radiobutton','String','l/4 ',...
                'FontName','Symbol',...
                'Units','normalized',...
                'Value',1,...
                'Position',[.4 .5 .3 .5]);
rbh_Wh = uicontrol(bgh_WP,'Style','radiobutton','String','l/2 ',...
                'FontName','Symbol',...
                'Units','normalized',...
                'Value',2,...
                'Position',[.1 .5 .3 .5]);
            
rbh_Wq_P2 = uicontrol(bgh_WP,'Style','radiobutton','String','l/4,',...
                'FontName','Symbol',...
                'Units','normalized',...
                'Value',3,...
                'Position',[.5 .03 .2 .5]);
            
text_Wq_P2_b = uicontrol(bgh_WP,'Style','text',...
             'String','P2','Units','Normalized',...
             'Position',[.7 .05 .1 .3]);     
                         
rbh_Wh_P2 = uicontrol(bgh_WP,'Style','radiobutton','String','l/2,',...
                'FontName','Symbol',...
                'Units','normalized',...
                'Position',[.1 .03 .2 .5]);
            
text_Wh_P2_b = uicontrol(bgh_WP,'Style','text',...
             'String','P2','Units','Normalized',...
             'Position',[.3 .05 .1 .3]);
         


set(bgh_WP,'SelectionChangeFcn',@radiobutton_W_P_Callback);
set(bgh_WP,'Visible','on');

 
if option_wv_pol == 1;  % In, pol
    Slctn_deflt = [rbh_P2];
end
if option_wv_pol == 21; % In, qrtwv
        Slctn_deflt = [rbh_Wq];
end
if option_wv_pol == 22; % In, hlfwv
        Slctn_deflt = [rbh_Wh];
end
if option_wv_pol == 31; % In, qrtwv, pol
        Slctn_deflt = [rbh_Wq_P2];
end
if option_wv_pol == 32; % In, hlfwv, pol
        Slctn_deflt = [rbh_Wh_P2];
end


set(bgh_WP,'SelectedObject',Slctn_deflt); 
%%%%%%% 





function radiobutton_W_P_Callback(source,eventdata)
    
btn_slctd=get(get(source,'SelectedObject'),'String');

if btn_slctd == 'l/2 ';
    disp(['This is l/2'])
    option_wv_pol=22;
end

if btn_slctd == 'l/4 ';
    disp(['This is l/4'])
    option_wv_pol=21;
end

if btn_slctd == 'P2  ';
    disp(['This P2'])
    option_wv_pol=1;
    
end

if btn_slctd == 'l/2,';
    disp(['This is l/2, P2'])
    option_wv_pol=32;
end

if btn_slctd == 'l/4,';
    disp(['This is l/4, P2'])
    option_wv_pol=31;
end

option_wv_pol
pol_calc

end




%%%%%%%%%
function A_rtrd_fnctn
A_rtrd=[(exp(i*sgm/2))*((cos(rho_rad))^2) + (exp(-i*sgm/2))*((sin(rho_rad))^2)...
    2*i*(sin(rho_rad))*(cos(rho_rad))*sin(sgm/2);...
    2*i*(sin(rho_rad))*(cos(rho_rad))*sin(sgm/2)...
    (exp(-i*sgm/2))*((cos(rho_rad))^2) + (exp(i*sgm/2))*((sin(rho_rad))^2)];
end
if option_wv_pol == 1;
    E_out_tot=A_pol2*E_in;
end

if option_wv_pol == 21;
    sgm=pi/2; % Qrt_W=pi/2
    A_rtrd_fnctn;
    E_out_tot=A_rtrd*E_in;
end

if option_wv_pol == 22;
    sgm=pi; % Hlf_W=pi
    A_rtrd_fnctn;
    E_out_tot=A_rtrd*E_in;
end

if option_wv_pol == 31;
    sgm=pi/2; % Qrt_W=pi/2
    A_rtrd_fnctn;
    E_out_tot=A_pol2*A_rtrd*E_in;
end

if option_wv_pol == 32;
    sgm=pi; % Hlf_W=pi
    A_rtrd_fnctn;
    E_out_tot=A_pol2*A_rtrd*E_in;
end

%%%%%%%%%% V6


E_out_tot_x=E_out_tot(1);
E_out_tot_y=E_out_tot(2);

E_out_tot_x_abs=abs(E_out_tot_x);
E_out_tot_y_abs=abs(E_out_tot_y);

E_out_tot_x_angl=angle(E_out_tot_x);
E_out_tot_y_angl=angle(E_out_tot_y);

Vx_plot_out_tot=E_out_tot_x_abs*cos(tplot-E_out_tot_x_angl);
Vy_plot_out_tot=E_out_tot_y_abs*cos(tplot-E_out_tot_y_angl);

tmpIout=(abs(E_out_tot(1)))^2+(abs(E_out_tot(2)))^2;

%%%%%%
scrn_size = get (0,'screensize');
scrn_size_x = scrn_size(3);
scrn_size_y = scrn_size(4);

%%%%%% %%%%%%


%%%%%%

if option_wv_pol == 1;
W_P2_plot_option = 1; % Pol only
end

if option_wv_pol == 21;
W_P2_plot_option = 2; % Wv only
end;
if option_wv_pol == 22;
W_P2_plot_option = 2; % Wv only
end;

if option_wv_pol == 31;
W_P2_plot_option = 3; % Wv only
end;
if option_wv_pol == 32;
W_P2_plot_option = 3; % Wv only
end;

%%%%%%

a_ax303a = axes('Units','Normalized','Position',[0.15,0.38,0.27,0.54],...% [0.1,0.35,.3,.6],...
    'XTickLabel','','YTickLabel','');
set(a_ax303a,'Parent',fh303);

if W_P2_plot_option == 1;
plot(plot_x1,plot_y1,'bv-',...
    plot_x2,plot_y2,'rs-',...
    x1,y1,'bv',x,yc1_p,'b--',x,yc1_n,'b--',...
    x,yc2_p,'r-',x,yc2_n,'r-',...
    Hoz_Ln_x,Hoz_Ln_y,'k:',Ver_Ln_x,Ver_Ln_y,'k:')
legend('P1','P2')
end

if W_P2_plot_option == 2;
plot(plot_x1,plot_y1,'bv-',Voutsq_x,Voutsq_y,'ko-',...
    plot_xW,plot_yW,'ko-',...
    x1,y1,'bv',x,yc1_p,'b--',x,yc1_n,'b--',...
    Hoz_Ln_x,Hoz_Ln_y,'k:',Ver_Ln_x,Ver_Ln_y,'k:')
legend('P1','W')
end

if W_P2_plot_option == 3;
plot(plot_x1,plot_y1,'bv-',Voutsq_x,Voutsq_y,'ko-',...
    plot_x2,plot_y2,'rs-',...
    plot_xW,plot_yW,'ko-',...
    x1,y1,'bv',x,yc1_p,'b--',x,yc1_n,'b--',...
    x,yc2_p,'r-',x,yc2_n,'r-',...
    Hoz_Ln_x,Hoz_Ln_y,'k:',Ver_Ln_x,Ver_Ln_y,'k:')
legend('P1','W','P2')
end
axis([-100 100 -100 100]);
axis('square')
title('Components')

a_ax303b = axes('Units','Normalized','Position',[0.5,0.32,.3,.6],...%[0.5,0.35,.3,.6],...
    'XTickLabel','','YTickLabel','');

compass(E_in(1),E_in(2),'b--')
hold on
compass(-E_in(1),-E_in(2),'b--')
plot(Vx_plot_out_tot,Vy_plot_out_tot,'rx-','LineWidth',2)
hold off
title('Polarization State')

text_compass_mark_a = uicontrol('Style','text',...
             'String','- - -',...
             'Units','Normalized',...
             'ForegroundColor','b',...
             'Position',[0.51,0.27,0.06,0.04],...
             'BackgroundColor',[0.925 0.914 0.847]);
         
text_compass_mark_b = uicontrol('Style','text',...
             'String','After P1',...
             'Units','Normalized',...
             'Position',[0.56,0.27,0.06,0.04],...
             'BackgroundColor',[0.925 0.914 0.847]);
         
text_compass_mark_c = uicontrol('Style','text',...
             'String','* * *',...
             'Units','Normalized',...
             'ForegroundColor','r',...
             'Position',[0.65,0.27,0.06,0.04],...
             'BackgroundColor',[0.925 0.914 0.847]);
         
text_compass_mark_d = uicontrol('Style','text',...
             'String','Out',...
             'Units','Normalized',...
             'Position',[0.70,0.27,0.06,0.04],...
             'BackgroundColor',[0.925 0.914 0.847]);


a_ax303c = axes('Units','Normalized','Position',[0.9,0.3,.03,.6],...
    'XTickLabel','','YTickLabel','');
set(a_ax303c,'Parent',fh303);
bar(0,tmpIout)
axis([-0.1 0.1 0 1.1])
title('I_R_e_l');
%%%%%% %%%%%%

clear

    end
end


