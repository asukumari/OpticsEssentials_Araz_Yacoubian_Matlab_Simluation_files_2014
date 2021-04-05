function Diffraction_GUI_Rev2
% Diffraction
% Copyright Araz Yacoubian 2013, 2014


clear

close('all')


fh = figure('Visible','off');
set(fh,'Units','Normalized','Position',[0.05 0.43 0.44 0.42]);


set(fh,'Color',[0.925 0.914 0.847]);

set(fh,'Visible','on','Name','Diffraction','NumberTitle','off');

fwndw_H=565;
fwndw_V=420;

xpos2_n=120/fwndw_H;
ypos2_n=270/fwndw_V;
pltx_wd2_n=390/fwndw_H;
plty_wd2_n=120/fwndw_V;



a_ax1 = axes('Units','Normalized','Position',...
    [xpos2_n,ypos2_n,pltx_wd2_n,plty_wd2_n],'XTickLabel','','YTickLabel','');
set(a_ax1,'Parent',fh);
%%%%%%%%%%%%%%%%

xpos2B=120;
ypos2B=270-150;
pltx_wd2B=390;
plty_wd2B=120;

xpos2B_n=xpos2B/fwndw_H;
ypos2B_n=ypos2B/fwndw_V;
pltx_wd2B_n=pltx_wd2B/fwndw_H;
plty_wd2B_n=plty_wd2B/fwndw_V;


a_ax2B = axes('Units','Normalized','Position',...
    [xpos2B_n,ypos2B_n,pltx_wd2B_n,plty_wd2B_n],'XTickLabel','','YTickLabel','');
set(a_ax2B,'Parent',fh);


%%%%%%%%%%%%%%  
slider_valueDist=1000; 
slider_valueDiste=log(slider_valueDist);
z_mm=slider_valueDist;


z_mm_string=num2str(z_mm,'%2.1f');
text_z_mm = uicontrol(fh,'Style','edit',...
             'String',z_mm_string,'Units','Normalized',...
             'Position',[20/fwndw_H,360/fwndw_V,45/fwndw_H,25/fwndw_V],...
             'BackgroundColor',[1 1 1]);
%%%%%%%%%%%%%%


%%%%%%%%%%%%%% 
wh=0.2;  
slider_value_wh=wh; 

wh_string=num2str(wh,'%2.1f');
text_wh = uicontrol(fh,'Style','edit',...
             'String',wh_string,'Units','Normalized',...
             'Position',[160/fwndw_H,40/fwndw_V,45/fwndw_H,25/fwndw_V],... 
             'BackgroundColor',[1 1 1]);

text_wh_mark = uicontrol(fh,'Style','text',...
             'String','Slit Half Width (mm)','Units','Normalized',...
             'Position',[110/fwndw_H,30/fwndw_V,45/fwndw_H,35/fwndw_V],... 
             'BackgroundColor',[0.925 0.914 0.847]);
         
         
sh_wh = uicontrol(fh,'Style','slider',...
                'Max',5,'Min',0.1,'Value',slider_value_wh,...
                'SliderStep',[0.1 0.2],...
                'Units','Normalized',...
                'Position',[100/fwndw_H 70/fwndw_V 250/fwndw_H 20/fwndw_V],...  
                'Callback',{@slider_wh_Callback});
            
function slider_wh_Callback(source,eventdata)
    slider_value_wh=get(source, 'Value');
    slider_value_wh_dsp=num2str(slider_value_wh,'%2.1f');
    set(textinputSliderValue2wh, 'String', slider_value_wh_dsp);
    wh=slider_value_wh;
    Ufrl_calc
end

wh_input_string=num2str(wh,'%2.1f');
textinputSliderValue2wh = uicontrol(fh,'Style','edit',...
             'Value',wh,...
             'Units','Normalized',...
             'Position',[160/fwndw_H,40/fwndw_V,45/fwndw_H,25/fwndw_V],...  
             'BackgroundColor',[1 1 1],...
             'String',wh_input_string,...
             'Callback',{@wh_Callback});
         
         
function wh_Callback(source,eventdata)
    wh = str2double(get(source, 'String'));

    slider_value_wh=wh;
            
sh_wh = uicontrol(fh,'Style','slider',...
                'Max',5,'Min',0.1,'Value',slider_value_wh,...
                'SliderStep',[0.1 0.2],...
                'Units','Normalized',...
                'Position',[100/fwndw_H 70/fwndw_V 250/fwndw_H 20/fwndw_V],... 
                'Callback',{@slider_wh_Callback});
            
            Ufrl_calc
 end
%%%%%%%%%%%%%% 


%%%%%%%%%%%%%% 
L = 1;
slider_value_L=L;  

L_string=num2str(L,'%2.1f');
text_L = uicontrol(fh,'Style','edit',...
             'String',L_string,...
             'Units','Normalized',...
             'Position',[340/fwndw_H,10/fwndw_V,45/fwndw_H,25/fwndw_V],... 
             'BackgroundColor',[1 1 1]);%,...
         
         
sh_L = uicontrol(fh,'Style','slider',...
                'Max',5,'Min',0.5,'Value',slider_value_L,...
                'SliderStep',[0.1 0.2],...
                'Units','Normalized',...
                'Position',[240/fwndw_H 40/fwndw_V 250/fwndw_H 20/fwndw_V],...  
                'Callback',{@slider_L_Callback});
            
function slider_L_Callback(source,eventdata)
    slider_value_L=get(source, 'Value');
    slider_value_L_dsp=num2str(slider_value_L,'%2.1f'); 
    set(textinputSliderValue2L, 'String', slider_value_L_dsp);
    L=slider_value_L;
    Ufrl_calc
    
end

text_L_mark = uicontrol(fh,'Style','text',...
             'String','Slit Separation (Center-Center, mm) ',...
             'Units','Normalized',...
             'Position',[380/fwndw_H,5/fwndw_V,180/fwndw_H,25/fwndw_V],... 
             'BackgroundColor',[0.925 0.914 0.847]);
         
text_L2_mark = uicontrol(fh,'Style','text',...
             'String','x (mm)',...
             'Units','Normalized',...
             'Position',[380/fwndw_H,70/fwndw_V,200/fwndw_H,25/fwndw_V],... 
             'BackgroundColor',[0.925 0.914 0.847]);


L_input_string=num2str(L,'%2.1f');
textinputSliderValue2L = uicontrol(fh,'Style','edit',...
             'Value',L,...
             'Units','Normalized',...
             'Position',[340/fwndw_H,10/fwndw_V,45/fwndw_H,25/fwndw_V],...  
             'BackgroundColor',[1 1 1],...
             'String',L_input_string,...
             'Callback',{@L_Callback});
         
         
function L_Callback(source,eventdata)
    L = str2double(get(source, 'String'));


    
    slider_value_L=L;
            

sh_L = uicontrol(fh,'Style','slider',...  
                'Max',5,'Min',0.1,'Value',slider_value_L,...
                'SliderStep',[0.1 0.2],...
                'Units','Normalized',...
                'Position',[240/fwndw_H 40/fwndw_V 250/fwndw_H 20/fwndw_V],... 
                'Callback',{@slider_L_Callback});
           
            Ufrl_calc
 end
%%%%%%%%%%%%%% 


lambda_micron=0.633;          % Wavelength (microns)      
lambda=lambda_micron*10^(-3); % Wavelength (mm)  

xmax=50;
xstp=0.001;


x=-xmax:xstp:xmax-xstp;
[tmp,szx]=size(x);

xf=(1/(1*xstp)*(1/szx)).*((-szx/2):(szx/2)-1);

x2=(lambda*z_mm).*xf;

midx=round(szx/2);

xh=round(wh/xstp);

xL=round(L/xstp);

k_1d=2*pi/lambda;




%%%%%%%%%%%%%%%%%%%%%%%%%%%            

            
 sh = uicontrol(fh,'Style','slider',...
                'Max',13.5,'Min',1.15,'Value',slider_valueDiste,...
                'SliderStep',[0.05 0.2],...
                'Units','Normalized',...
                'Position',[30/fwndw_H 100/fwndw_V 20/fwndw_H 250/fwndw_V],...
                'Callback',{@slider1_Callback});
            
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

         
text_lambda_mark = uicontrol(fh,'Style','text',...
             'String','Wavelength',...
             'Units','Normalized',...
             'Position',[7/fwndw_H,50/fwndw_V,90/fwndw_H,25/fwndw_V],...
             'BackgroundColor',[0.925 0.914 0.847]);

         
text_lambda_mark = uicontrol(fh,'Style','text',...
             'String','(microns) ',...
             'Units','Normalized',...
             'Position',[8/fwndw_H,35/fwndw_V,90/fwndw_H,25/fwndw_V],...
             'BackgroundColor',[0.925 0.914 0.847]);
         
function textin_lambda(source,eventdata)
    
    lambda_micron = str2double(get(source, 'String'));
    lambda=lambda_micron*10^(-3); % Wavelength (mm)
    Ufrl_calc
end

lambda_micron_string=num2str(lambda_micron,'%2.3f');


text_lambda = uicontrol(fh,'Style','edit',...
             'String',lambda_micron_string,...
             'Units','Normalized',...
             'Position',[20/fwndw_H,15/fwndw_V,55/fwndw_H,25/fwndw_V],...
             'BackgroundColor',[1 1 1],...
             'Value',lambda_micron,'Callback',{@textin_lambda});
             lambda=lambda_micron*10^(-3); % Wavelength (mm) 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
           
            
function slider1_Callback(source,eventdata)
    slider_valueDiste=get(source, 'Value');
    slider_valueDist=exp(slider_valueDiste);
    slider_value_dsp1=num2str(slider_valueDist,'%2.1f'); 
    set(textinputSlidervalueDist, 'String', slider_value_dsp1);
    Ufrl_calc
    slider_valueDist=exp(slider_valueDiste);
end

z_mm_input_string=num2str(z_mm,'%2.1f');
textinputSlidervalueDist = uicontrol(fh,'Style','edit',...
             'Value',z_mm,...
             'Units','Normalized',...
             'Position',[20/fwndw_H,360/fwndw_V,45/fwndw_H,25/fwndw_V],...
             'BackgroundColor',[1 1 1],...
             'String',z_mm_input_string,...
             'Callback',{@z_mm_Callback});
         
 text_z_mm_mark = uicontrol(fh,'Style','text',...
             'String','Distance (mm) ',...
             'Units','Normalized',...
             'Position',[10/fwndw_H,385/fwndw_V,80/fwndw_H,25/fwndw_V],...
             'BackgroundColor',[0.925 0.914 0.847]);
         
         
         

function z_mm_Callback(source,eventdata)
    z_mm = str2double(get(source, 'String'));

    slider_valueDist=z_mm;
         
    sh = uicontrol(fh,'Style','slider',...
                'Max',13.5,'Min',1.15,'Value',slider_valueDiste,...
                'SliderStep',[0.05 0.2],...
                'Units','Normalized',...
                'Position',[30/fwndw_H 100/fwndw_V 20/fwndw_H 250/fwndw_V],...
                'Callback',{@slider1_Callback});
            z_mm=exp(slider_valueDiste);  
            
            Ufrl_calc
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%


  
  zne = 0;
  
  rng_val_Fra = (2*z_mm)/(k_1d*(wh^2));

  tmpwmax=[L+2*wh wh];                          
  wMax=max(tmpwmax);                            
  rng_val_Frl = (4*lambda*(z_mm^3))/((wMax)^4);  
  
  if rng_val_Frl > 35;
      zne = 1;  % Fresnel
  end
  
  if rng_val_Fra > 30;
      zne = 2;  % Fraunhofer 
  end


  
      if zne < 1
          disp('Not in Fresnel or Fraunhofer Zone')
          disp('Try larger z')
          disp(' ')
      return
      end
  
  %%% End.  Zone Calc %%%


Uo=0.*x;
Uo(midx - round(xL/2) - xh : midx - round(xL/2) + xh ) = 1;
Uo(midx + round(xL/2) - xh : midx + round(xL/2) + xh ) = 1;
% end


%%%%%%%%%%% Fresnel 
    %%%%%%%%%% Beg. Ufrl_calc %%%%%%%%
    
    %%%%%%%%%%%%%%%%%
Ufrl_calc


function Ufrl_calc

    
z_mm=slider_valueDist;
k_1d=2*pi/lambda;


xh=round(wh/xstp);  
xL=round(L/xstp);

  %%%%% Zone Calc %%%
  
  zne = 0;
  
  rng_val_Fra = (2*z_mm)/(k_1d*(wh^2));

  rng_val_Frl = (4*lambda*(z_mm^3))/((wh)^4);
  
  if rng_val_Frl > 35;
      zne = 1;  % Fresnel
  end
  
  if rng_val_Fra > 30;
      zne = 2;  % Fraunhofer
  end

disp(' ')
  
  
      if zne < 1
          disp('Not in Fresnel or Fraunhofer Zone')
          disp('Try larger z')
          disp(' ')
      return
      end
      
    
  %%% End.  Zone Calc %%%


Uo=0.*x;
Uo(midx - round(xL/2) - xh : midx - round(xL/2) + xh ) = 1;
Uo(midx + round(xL/2) - xh : midx + round(xL/2) + xh ) = 1;

U_preFFT=Uo.*exp((i*k_1d/(2*z_mm)).*(x.^2));

Ufrl=fft(U_preFFT); 
Ufrl=fftshift(Ufrl);


Ufrl_max=max(abs(Ufrl));
Ufrlmx1=(1/Ufrl_max).*Ufrl;

x2=(lambda*z_mm).*xf;

x2limit=1000*(lambda*(sqrt(z_mm)))+0.8;  

 I_diff=(abs(Ufrl)).^2;  
 I_diff_max=max(I_diff); 
 I_diff_norm=(1/I_diff_max).*I_diff; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

axes(a_ax1)
plot(x2,abs(Ufrl))
axis([-x2limit x2limit -0.1*max(abs(Ufrl)) 1.1*max(abs(Ufrl))]);
plot(x2,I_diff_norm) 
axis([-x2limit x2limit -0.1 1.1]); 
ylabel('Intensity')


%%%%%%%%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
%%%%%%%%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

axes(a_ax2B);
plot(x,Uo)  
axis([-1.5*(2*wh+L) 1.5*(2*wh+L) -0.1 1.1]);

%%%%%%%%%%%%%%%% %%%%%%%%%% %%%%%%%%%%



end


end
