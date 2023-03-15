function pic_psd(X1, Y1)
%CREATEFIGURE(X1, Y1)
%  X1:  x 数据的向量
%  Y1:  y 数据的向量

%  由 MATLAB 于 20-Jan-2022 20:28:19 自动生成

% 创建 figure
figure1 = figure('WindowState','maximized');
% 创建 axes
axes1 = axes('Parent',figure1);

hold(axes1,'on');

% 创建 plot
plot1 = plot(X1,Y1,'LineWidth',5);
plot1.Color(4)=1;

%plot2 = plot(X1,Y2,'LineWidth',5,'Color',[0 0 1]);
%plot2.Color(4)=0.1
% 创建 ylabel
%ylim(axes1,[-0.8 1.2]); %ECG信号专用幅值范围
ylabel({'PSD[dB/Hz]'},'FontWeight','bold','FontName','Arial');

% 创建 xlabel 英文
xlabel({'Frequency[Hz]'},'FontWeight','bold','FontName','Arial');
xlim(axes1,[-5 100]);
%xlabel({'Fre[Hz]'},'FontWeight','bold','FontName','Arial');
box(axes1,'on');
hold(axes1,'off');
% 设置其余坐标区属性
set(axes1,'FontName','Arial','FontSize',50,'FontWeight','bold','LineWidth',...
    5,'XColor',[0.149019607843137 0.149019607843137 0.149019607843137],'XGrid',...
    'on','YGrid','on');