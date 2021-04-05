function SingleLens_GUI
% Single Lens
% Copyright Araz Yacoubian 2013, 2014

clear

close('all')

fh = figure('Visible','off');
set(fh,'Units','Normalized','Position',[0.05 0.43 0.44 0.42]);

set(fh,'Color',[0.925 0.914 0.847]);
set(fh,'Visible','on','Name','Single Lens','NumberTitle','off');

fwndw_H=565;
fwndw_V=420;

xpos2_n=60/fwndw_H;
ypos2_n=120/fwndw_V;
pltx_wd2_n=450/fwndw_H;
plty_wd2_n=250/fwndw_V;


a_ax1 = axes('Units','Normalized','Position',...
    [xpos2_n,ypos2_n,pltx_wd2_n,plty_wd2_n],'XTickLabel','','YTickLabel','');
set(a_ax1,'Parent',fh);
%%%%%%%%%%%%%%%%


%%%%%%%%%%% Input: %%%%%%%%%
s1 = 50;   % mm
f_mm = 25;
ha=1;
%%%%%%%%%%% Input: %%%%%%%%%

slider_value_s1=s1;   % mm

s1_string=num2str(s1,'%2.1f');

         
 text_s1 = uicontrol('Style','edit',...
             'String',s1_string,'Units','Normalized',...
             'Position',[160/fwndw_H,40/fwndw_V,45/fwndw_H,25/fwndw_V],...
             'BackgroundColor',[1 1 1]);

         
text_s1_mark = uicontrol('Style','text',...
             'String','Object Distance','Units','Normalized',...
             'Position',[110/fwndw_H,30/fwndw_V,45/fwndw_H,35/fwndw_V],...
             'BackgroundColor',[0.925 0.914 0.847]);
            
sh_s1 = uicontrol(fh,'Style','slider',...
                'Max',100,'Min',0.01,'Value',slider_value_s1,...
                'SliderStep',[0.05 0.10],...
                'Units','Normalized',...
                'Position',[100/fwndw_H 70/fwndw_V 250/fwndw_H 20/fwndw_V],...
                'Callback',{@slider_s1_Callback});
            
function slider_s1_Callback(source,eventdata)
    slider_value_s1=get(source, 'Value');
    slider_value_s1_dsp=num2str(slider_value_s1,'%2.1f'); 
    set(textinputSliderValue2s1, 'String', slider_value_s1_dsp);
    s1=slider_value_s1;
    Lns_calc
end

s1_input_string=num2str(s1,'%2.1f');
textinputSliderValue2s1 = uicontrol('Style','edit',...
             'Value',s1,...
             'Units','Normalized',...
             'Position',[160/fwndw_H,40/fwndw_V,45/fwndw_H,25/fwndw_V],...
             'BackgroundColor',[1 1 1],...
             'String',s1_input_string,...
             'Callback',{@s1_Callback});
         
         
function s1_Callback(source,eventdata)
    s1 = str2double(get(source, 'String'));

    slider_value_s1=s1;

            
            Lns_calc
 end
%%%%%%%%%%%%%%

%%%%%%%%%%%%%%

slider_value_f_mm=f_mm;  

f_mm_string=num2str(f_mm,'%2.1f');
text_f_mm = uicontrol('Style','edit',...
             'String',f_mm_string,...
             'Units','Normalized',...
             'Position',[340/fwndw_H,10/fwndw_V,45/fwndw_H,25/fwndw_V],...
             'BackgroundColor',[1 1 1]);

sh_f_mm = uicontrol(fh,'Style','slider',...
                'Max',100,'Min',-100,'Value',slider_value_f_mm,...
                'SliderStep',[0.0500 0.20],...
                'Units','Normalized',...
                'Position',[240/fwndw_H 40/fwndw_V 250/fwndw_H 20/fwndw_V],...
                'Callback',{@slider_f_mm_Callback});
            
function slider_f_mm_Callback(source,eventdata)
    slider_value_f_mm=get(source, 'Value');
    slider_value_f_mm_dsp=num2str(slider_value_f_mm,'%2.1f'); %Rev 18B
    set(textinputSliderValue2f_mm, 'String', slider_value_f_mm_dsp);
    f_mm=slider_value_f_mm;
    Lns_calc
    
end

text_f_mm_mark = uicontrol('Style','text',...
             'String','Focal Length',...
             'Units','Normalized',...
             'Position',[380/fwndw_H,5/fwndw_V,90/fwndw_H,25/fwndw_V],...
             'BackgroundColor',[0.925 0.914 0.847]);

f_mm_input_string=num2str(f_mm,'%2.1f');
textinputSliderValue2f_mm = uicontrol('Style','edit',...
             'Value',f_mm,...
             'Units','Normalized',...
             'Position',[340/fwndw_H,10/fwndw_V,45/fwndw_H,25/fwndw_V],...
             'BackgroundColor',[1 1 1],...
             'String',f_mm_input_string,...
             'Callback',{@f_mm_Callback});
               
function f_mm_Callback(source,eventdata)
    f_mm = str2double(get(source, 'String'));


    
    slider_value_f_mm=f_mm;

           
            Lns_calc
 end
%%%%%%%%%%%%%% 

    %%%%%%%%%% Beg. Lns_calc %%%%%%%%
    
    %%%%%%%%%%%%%%%%%
Lns_calc


function Lns_calc
% 
% 
s2=1/((1/(f_mm))-(1/(s1)));
Mt=s2/s1;  %  Magnification
hb=-Mt*ha;

sys_tp=0;

if s1 <= 0;
    tmpdispwrn='Keep s1 pos (>0)';
    disp(tmpdispwrn)
return
end

if f_mm > 0;
    if s2 > 0;
        sys_tp=1;
    end
    if s2 < 0;
        sys_tp=2;
    end
    if s2 > (10^10)*s1;
        sys_tp=3;
        tmpdispwrn=' Nearly Collimated.  Change object distance or focal length';
        disp(tmpdispwrn)
        return
    end
    if s1 == f_mm;
        sys_tp=3;
        tmpdispwrn=' Nearly Collimated.  Change object distance or focal length';
        disp(tmpdispwrn)
        return
    end
end

if f_mm < 0;
    sys_tp=4;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if sys_tp == 1;
    
    plot_ha_x=[-s1 -s1];
    plot_ha_y=[0 ha];
    plot_hb_x=[s2 s2];
    plot_hb_y=[0 hb];
    
    plot_ry1_x=[-s1 -f_mm 0 f_mm s2];
    plot_ry1_y=[ha ha ha 0 hb];
    
    plot_ry2_x=[-s1 0 s2];
    plot_ry2_y=[ha 0 hb];
    
    %%%%% Ln  %%%%
    plot_Ln_x=[0 0];
    h_Ln=1.1*max(abs(ha),abs(hb));
    plot_Ln_y_p=[0 h_Ln];
    plot_Ln_y_n=[0 -h_Ln];
    Lns_arw_top='^';
    Lns_arw_btm='v';
    Linetype_img='b-';
    Mrkrtype_img='bo';
    y_min=-1.1*h_Ln;
    y_max=1.1*h_Ln;
    %%%%% Ln  %%%%
    ImageType='Real';
    
end


if sys_tp == 2;  
    
    plot_ha_x=[-s1 -s1];
    plot_ha_y=[0 ha];
    plot_hb_x=[s2 s2];
    plot_hb_y=[0 hb];

    plot_ry2_x=[-s1 0 s2];
    plot_ry2_y=[ha 0 hb];
    
    plot_ry1_x=[-s1 0 f_mm s2];
    plot_ry1_y=[ha ha 0 hb];
    
    %%%%%%%%%
    plot_Ln_x=[0 0];
    h_Ln=1.1*max(abs(ha),abs(hb));
    plot_Ln_y_p=[0 h_Ln];
    plot_Ln_y_n=[0 -h_Ln];
    Lns_arw_top='^';
    Lns_arw_btm='v';
    Linetype_img='r:';
    Mrkrtype_img='ro';
    y_min=-1.1*h_Ln;
    y_max=1.1*h_Ln;
    %%%%%%%%%
    ImageType='Virtual';
    
end

if sys_tp == 4;   
    
    plot_ha_x=[-s1 -s1];
    plot_ha_y=[0 ha];
    plot_hb_x=[s2 s2];
    plot_hb_y=[0 hb];
    
    plot_ry1_x=[-s1 0 -abs(f_mm) s2 abs(f_mm)];
    plot_ry1_y=[ha ha 0 hb 2*ha];

    plot_ry2_x=[-s1 0  abs(f_mm)];
    plot_ry2_y=[ha 0 f_mm*(ha/(abs(s1)))];

    %%%%%%%%%
    plot_Ln_x=[0 0];
    h_Ln=1.1*max(abs(ha),abs(hb));
    plot_Ln_y_p=[0 h_Ln];
    plot_Ln_y_n=[0 -h_Ln];
    Lns_arw_top='v';
    Lns_arw_btm='^';
    Linetype_img='r:';%'--';
    Mrkrtype_img='ro';
    y_min=min([-1.1*h_Ln -2*ha]);
    y_max=max([1.1*h_Ln 2*ha]);
    %%%%%%%%%
    ImageType='Virtual';

end

    plot_function_1


function plot_function_1
plot(plot_ha_x,plot_ha_y,'-',...
    'LineWidth',4)
hold on
plot(-s1,ha,'o','LineWidth',3)
plot(plot_hb_x,plot_hb_y,Linetype_img,'LineWidth',4)
plot(s2,hb,Mrkrtype_img,'LineWidth',4)
plot(plot_ry1_x,plot_ry1_y,'--','LineWidth',1)
plot(plot_ry2_x,plot_ry2_y,'--','LineWidth',1)
plot(-f_mm,0,'o','MarkerEdgeColor','k',...
    'MarkerFaceColor','k','MarkerSize',5)
plot(f_mm,0,'o','MarkerEdgeColor','k',...
    'MarkerFaceColor','k','MarkerSize',5)
%%%% Ln %%%
plot(plot_Ln_x,plot_Ln_y_p,'k-','LineWidth',3)
plot(0,h_Ln,Lns_arw_top,'MarkerEdgeColor','k',...
    'MarkerFaceColor','k','MarkerSize',10)
plot(plot_Ln_x,plot_Ln_y_n,'k-','LineWidth',3)
plot(0,-h_Ln,Lns_arw_btm,'MarkerEdgeColor','k',...
    'MarkerFaceColor','k','MarkerSize',10)
    %%%%%%%%%%
    x_min_a=-1.1*s1;
    x_min_b=1.1*s2;
    x_min=min([x_min_a x_min_b 1.5.*f_mm -1.5.*f_mm]);
    x_max=max([x_min_a x_min_b 1.5.*f_mm -1.5.*f_mm]);
    %%%%%%%%%%
plot([x_min x_max],[0 0],'k-')
%%%%%%%
hold off
%%%%%%%%%% 



    axis([x_min x_max y_min y_max]);
    grid
    tmptitle=['f = ' num2str(f_mm) '.  s1 = ' num2str(s1) '.  s2 = ' num2str(s2) '.  M = ' num2str(-Mt) '.  Image Type: ' ImageType];
    title(tmptitle)
    %%%%%% %%% %
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end
%%%%%%%%%% End. Lns_calc %%%%%%%%
end

