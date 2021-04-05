function Refraction_GUI
% Refraction GUI
% Copyright Araz Yacoubian 2013, 2014
clear
close('all')

fh = figure('Visible','off'); 
set(fh,'Color',[0.925 0.914 0.847]);


set(fh,'Visible','on','Name','Refraction','NumberTitle','off');

%%%%%%%%%%%%%%
slider_value=20;
angle_input=slider_value;
n1=1;
n2=1.5;
%%%%%%%%%%%%%%

CalcPlot1


angle_input_string=num2str(angle_input,'%2.1f');
text_angle_input = uicontrol('Style','edit',...
             'String',angle_input_string,'Position',[60,210,35,25],...
             'BackgroundColor',[1 1 1]);%,...

%%%%%%%%%%%%%%%%%%%%%%%%%
sh = uicontrol(fh,'Style','slider',...
                'Max',90,'Min',-90,'Value',slider_value,...
                'SliderStep',[0.05 0.2],...
                'Position',[30 100 20 250],...
                'Callback',{@slider1_Callback});
               
function slider1_Callback(source,eventdata)
    slider_value=get(source, 'Value');
    slider_value_dsp=num2str(slider_value,'%2.1f');
    set(textinputSliderValue, 'String', slider_value_dsp);
   
    
    CalcPlot1
end

angle_input_string=num2str(angle_input,'%2.1f');
textinputSliderValue = uicontrol('Style','edit',...
             'Value',angle_input,'Position',[60,210,35,25],...%[140,round(5.7*btn_pd_y),100,25],...
             'BackgroundColor',[1 1 1],...
             'String',angle_input_string,...
             'Callback',{@anglein_Callback});

function anglein_Callback(source,eventdata)
    angle_input = str2double(get(source, 'String'));


    angle_input
    slider_value=angle_input;
    
    sh = uicontrol(fh,'Style','slider',...
                'Max',90,'Min',-90,'Value',slider_value,...
                'SliderStep',[0.05 0.2],...
                'Position',[30 100 20 250],...
                'Callback',{@slider1_Callback});
            
            CalcPlot1
 end
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
text_n1_mark = uicontrol('Style','text',...
             'String','n1 = ','Position',[180,20,85,25],...
             'BackgroundColor',[0.925 0.914 0.847]);

function textin_n1(source,eventdata)
    n1 = str2double(get(source, 'String'));
    CalcPlot1
end
n1_string=num2str(n1,'%2.1f');
text_n1 = uicontrol('Style','edit',...
             'String',n1_string,'Position',[240,25,25,25],...%[160,25,25,25],...
             'BackgroundColor',[1 1 1],...
             'Value',n1,'Callback',{@textin_n1});
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
text_n2_mark = uicontrol('Style','text',...
             'String','n2 = ','Position',[330,20,85,25],...
             'BackgroundColor',[0.925 0.914 0.847]);

function textin_n2(source,eventdata)
    n2 = str2double(get(source, 'String'));
    CalcPlot1
end
n2_string=num2str(n2,'%2.1f');
text_n2 = uicontrol('Style','edit',...
             'String',n2_string,'Position',[390,25,25,25],...%[360,25,25,25],...
             'BackgroundColor',[1 1 1],...
             'Value',n2,'Callback',{@textin_n2});
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%
text_angle_mark = uicontrol('Style','text',...
             'String','q1',...
             'FontName','Symbol','FontSize',11,...
             'Position',[65,235,25,25],...
             'BackgroundColor',[0.925 0.914 0.847]);
%%%%%%%%%%%

%%%%%%%%%%%%%%%
function CalcPlot1
q1_d=slider_value;
q1_r=(pi/180)*q1_d;
q2_r_out=asin((n1/n2)*sin(q1_r));

if abs(imag(q2_r_out)) > 0;
    q2_r=-q1_r;
    x2=-10;
else
    q2_r=q2_r_out;
    x2=10;
end
    
    
q2_d=(180/pi)*q2_r;

disp(['Input angle = ' num2str(q1_d) ' (deg.)']);
disp(['Output angle = ' num2str(q2_d) ' (deg.)']);
disp(' ');
%%%%
x05=-5;
x1=-10;
y05=-x05*tan(q1_r);
y1=-x1*tan(q1_r);

x0=0;
y0=0;
y2=-x2*tan(q2_r);
x_lft=[x1 x05];
y_lft=[y1 y05];
x=[x1 x0 x2];
y=[y1 y0 y2];

xin=[x1 x0];
yin=[y1 y0];
xout=[x0 x2];
yout=[y0 y2];

xpos=120;
ypos=90;
pltx_wd=390;
plty_wd=300;

a_ax = axes('Units','pixels','Position',[xpos,ypos,pltx_wd,plty_wd],'XTickLabel','','YTickLabel','');

plot(xin,yin,xout,yout,'--')
axis('equal')
line([0,0],[-10 10],'Color',[0 0 0])
line([-10 10],[0,0],'LineStyle',':','Color',[0 0 0])
axis([-10 10 -10 10])
xlabel('x (mm)')
ylabel('y (mm)')

text(-6,-8,['n1=' num2str(n1)],'BackgroundColor',[1 1 1],'fontsize',12)
text(6,-8,['n2=' num2str(n2)],'BackgroundColor',[1 1 1],'fontsize',12)

end



end
