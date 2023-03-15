function pic_signal_multifigure(X, YMatrix)

% 创建 Figure
figure1 = figure('WindowState','maximized');

% 创建 Subplot1
subplot1 = subplot(2,1,1,'Parent',figure1);
hold(subplot1,'on');
% 使用 plot 的矩阵输入创建多行
plot1 = plot(X,YMatrix);
[length_row,length_col] = size(YMatrix);
length = min(length_row,length_col);
for i = 1:length
    signal_name = strcat('Signal',num2str(i));
    set(plot1(i),'DisplayName',signal_name,'LineWidth',5);
end
% 创建 x/y label 及属性
% ylim(axes1,[4.1 4.3]);
ylabel({'Amplitude'},'FontWeight','bold','FontName','Arial');
xlabel({'Time[s]'},'FontWeight','bold','FontName','Arial');
box(subplot1,'on');
hold(subplot1,'off');
% 创建 legend
legend1 = legend(subplot1,'show');
set(legend1,'Location','best');
% 设置其余坐标区属性
set(subplot1,'FontName','Arial','FontSize',50,'FontWeight','bold',...
    'LineWidth',5,'XColor',...
    [0.149019607843137 0.149019607843137 0.149019607843137],'XGrid','on',...
    'YGrid','on');

% 创建 Subplot2
subplot2 = subplot(2,1,2,'Parent',figure1);
hold(subplot2,'on');
% 使用 plot 的矩阵输入创建多行
plot1 = plot(X,YMatrix);
[length_row,length_col] = size(YMatrix);
length = min(length_row,length_col);
for i = 1:length
    signal_name = strcat('Signal',num2str(i));
    set(plot1(i),'DisplayName',signal_name,'LineWidth',5);
end
% 创建 x/y label 及属性
% ylim(axes1,[4.1 4.3]);
ylabel({'Amplitude'},'FontWeight','bold','FontName','Arial');
xlabel({'Time[s]'},'FontWeight','bold','FontName','Arial');
box(subplot2,'on');
hold(subplot2,'off');
% 创建 legend
legend1 = legend(subplot2,'show');
set(legend1,'Location','best');
% 设置其余坐标区属性
set(subplot2,'FontName','Arial','FontSize',50,'FontWeight','bold',...
    'LineWidth',5,'XColor',...
    [0.149019607843137 0.149019607843137 0.149019607843137],'XGrid','on',...
    'YGrid','on');
end
