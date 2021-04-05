function Resolution_GUI
% Resolution 1D
% Copyright Araz Yacoubian 2013, 2014

clear


%%%%%%%%%%%%%%%%

close('all')

fh = figure('Visible','off');
set(fh,'Units','Normalized','Position',[0.05 0.43 0.44 0.42]);

set(fh,'Color',[0.925 0.914 0.847]);
% set(fh,'Visible','on');
set(fh,'Visible','on','Name','Resolution','NumberTitle','off');

fwndw_H=565;
fwndw_V=420;

xpos1_n=60/fwndw_H;
ypos1_n=350/fwndw_V;
pltx_wd1_n=450/fwndw_H;
plty_wd1_n=40/fwndw_V;

xpos2_n=60/fwndw_H;
ypos2_n=290/fwndw_V;
pltx_wd2_n=450/fwndw_H;
plty_wd2_n=40/fwndw_V;

xpos3_n=60/fwndw_H;
ypos3_n=100/fwndw_V;
pltx_wd3_n=450/fwndw_H;
plty_wd3_n=150/fwndw_V;


a_ax1 = axes('Units','Normalized','Position',...
    [xpos1_n,ypos1_n,pltx_wd1_n,plty_wd1_n],'XTickLabel','','YTickLabel','');
set(a_ax1,'Parent',fh);

a_ax2 = axes('Units','Normalized','Position',...
    [xpos2_n,ypos2_n,pltx_wd2_n,plty_wd2_n],'XTickLabel','','YTickLabel','');
set(a_ax2,'Parent',fh);

a_ax3 = axes('Units','Normalized','Position',...
    [xpos3_n,ypos3_n,pltx_wd3_n,plty_wd3_n],'XTickLabel','','YTickLabel','');
set(a_ax3,'Parent',fh);
%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w_lpmm=5;
slider_value_w_lpmm=w_lpmm;    

w_lpmm_string=num2str(w_lpmm,'%2.1f');
text_w_lpmm = uicontrol('Style','edit',...
             'String',w_lpmm_string,'Units','Normalized',...
             'Position',[260/fwndw_H,20/fwndw_V,45/fwndw_H,25/fwndw_V],...
             'BackgroundColor',[1 1 1]);
  
text_w_lpmm_mark = uicontrol('Style','text',...
             'String','w (Lines Per mm) ','Units','Normalized',...
             'Position',[310/fwndw_H,15/fwndw_V,90/fwndw_H,25/fwndw_V],...
             'BackgroundColor',[0.925 0.914 0.847]);
         
text_w_xmm_mark = uicontrol('Style','text',...
             'String','x (mm)','Units','Normalized',...
             'Position',[380/fwndw_H,50/fwndw_V,200/fwndw_H,25/fwndw_V],...
             'BackgroundColor',[0.925 0.914 0.847]);
         
text_I_mark = uicontrol('Style','text',...
             'String','Input','Units','Normalized',...
             'Position',[10/fwndw_H,350/fwndw_V,40/fwndw_H,25/fwndw_V],...
             'BackgroundColor',[0.925 0.914 0.847]);
         
text_Iflt_mark = uicontrol('Style','text',...
             'String','Filtered','Units','Normalized',...
             'Position',[10/fwndw_H,290/fwndw_V,40/fwndw_H,25/fwndw_V],...
             'BackgroundColor',[0.925 0.914 0.847]);
         
sh_w_lpmm = uicontrol(fh,'Style','slider',...
                'Max',20,'Min',2,'Value',slider_value_w_lpmm,...
                'SliderStep',[0.10 0.10],...
                'Units','Normalized',...
                'Position',[160/fwndw_H 50/fwndw_V 250/fwndw_H 20/fwndw_V],...
                'Callback',{@slider_w_lpmm_Callback});
            
function slider_w_lpmm_Callback(source,eventdata)
    slider_value_w_lpmm=get(source, 'Value');
    slider_value_w_lpmm_dsp=num2str(slider_value_w_lpmm,'%2.1f'); %Rev 18B
    set(textinputSliderValue2w_lpmm, 'String', slider_value_w_lpmm_dsp);
    w_lpmm=slider_value_w_lpmm;
    Res_Calc
end

w_lpmm_input_string=num2str(w_lpmm,'%2.1f');
textinputSliderValue2w_lpmm = uicontrol('Style','edit',...
             'Value',w_lpmm,...
             'Units','Normalized',...
             'Position',[260/fwndw_H,20/fwndw_V,45/fwndw_H,25/fwndw_V],...
             'BackgroundColor',[1 1 1],...
             'String',w_lpmm_input_string,...
             'Callback',{@w_lpmm_Callback});
         
         
function w_lpmm_Callback(source,eventdata)
    w_lpmm = str2double(get(source, 'String'));

    slider_value_w_lpmm=w_lpmm;
            

            if w_lpmm <= 20;    % To avoid slider out of range error
                if w_lpmm >=2;  % To avoid slider out of range error
            sh_w_lpmm = uicontrol(fh,'Style','slider',...
                'Max',20,'Min',2,'Value',slider_value_w_lpmm,...
                'SliderStep',[0.10 0.10],...
                'Units','Normalized',...
                'Position',[160/fwndw_H 50/fwndw_V 250/fwndw_H 20/fwndw_V],...
                'Callback',{@slider_w_lpmm_Callback});
                end
            end

            Res_Calc
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Res_Calc

    function Res_Calc

a_resp_LPM=w_lpmm;

%%%%

x_mm_stp=1/1000;   
x_rng_mm_hlf=5;  
x_mm=-x_rng_mm_hlf:x_mm_stp:x_rng_mm_hlf;   
xfmult_mm=(1/x_mm_stp)/(2*x_rng_mm_hlf);  
xf_mm=xfmult_mm.*x_mm;          

[tmp,N_xmm]=size(x_mm);
fstrt_LPM=0.7;
fend_LPM=0.08;
tmp_T=abs((2/N_xmm).*((1:N_xmm)-(N_xmm/2)));
x_T_mm=((fend_LPM-fstrt_LPM)).*tmp_T+fstrt_LPM;

y_mm=cos((2*pi).*x_mm./x_T_mm)+1;    

yf_mm=fft(y_mm);                                   
yf_shft_mm=fftshift(yf_mm);                   

tmp_h=ones(1,10);
y_mm_I=(tmp_h')*y_mm;

%%%%%%%%%%%%%
[tmp,szxfmm]=size(xf_mm);  

y_flt_sq=0.*xf_mm;
tmpsq=xf_mm-a_resp_LPM;
[tmp,sqindex]=min(abs(tmpsq));
N_cntr=(round(N_xmm/2));
sqindex_n=N_cntr-(sqindex-round(N_xmm/2));
y_flt_sq(sqindex_n:sqindex)=1;

y_flt_sq_gsedge=y_flt_sq; 
wgs_N=round(0.3*(sqindex-sqindex_n)/2);  
sqindex_n02=sqindex_n+wgs_N;   
sqindex_02=sqindex-wgs_N;   

xtmp2=sqindex_02:szxfmm;  
ytmp2=exp(-(((xtmp2-sqindex_02)./wgs_N).^2));  
xtmp2n=1:sqindex_n02;  
ytmp2n=exp(-(((xtmp2n-sqindex_n02)./wgs_N).^2));  
y_flt_sq_gsedge(1:sqindex_n02)=ytmp2n; 
y_flt_sq_gsedge(sqindex_02:szxfmm)=ytmp2;  

yf_sq_mm=yf_shft_mm.*y_flt_sq_gsedge; 
y_sq_mm=ifft(yf_sq_mm);                   

y_sq_mm_I=(tmp_h')*y_sq_mm;
%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%
axes(a_ax1)
image(x_mm(5000:9500),tmp_h,35.*abs(y_mm_I(1:10,5000:9500)))
set(a_ax1,'XTickLabel','')
set(a_ax1,'YTickLabel','')
axes(a_ax2)
image(x_mm(5000:9500),tmp_h,35.*abs(y_sq_mm_I(1:10,5000:9500)))
set(a_ax2,'XTickLabel','')
set(a_ax2,'YTickLabel','')
colormap(gray)
axes(a_ax3)
plot(x_mm(5000:9500),abs(y_mm(5000:9500)),'b-',...
    x_mm(5000:9500),abs(y_sq_mm(5000:9500)),'rx')
axis([0 4.5 -0.3 2.3]);
%%%%%%%%%%%%%%%%%
    end
end