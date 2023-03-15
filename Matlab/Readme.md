# MATLAB学习笔记
## 矩阵
### 取值
- 取第一行的值          : ans(1,:)
- 取第一二行的值        ：ans(1:2,:)
- 取第一列的值          : ans(:,1)

## 信号
### 产生信号
- 产生时间              : t = (0:0.001:1) #生成0到1 0.001为间隔的数据
### 定义和导出滤波器(filterDesigner)
- 设计滤波器            : filterDesigner;
- 定义滤波器            : 在GUI界面进行选择;
- 导出滤波器            : 选项卡-文件-导出(可以使用对象/系数)
### 使用滤波器(filter)(默认滤波)
- 使用滤波器(对象)      : signal_filt   = filter(FilterObj,signal);
- 使用滤波器(系数 FIR)  : signal_filt   = filter(coefficient,1,signal);
- 使用滤波器(系数 IIR)  : signal_filt   = filter(numerator,denominator,1,signal);
  - IIR导出的系数是SOS和G, 需要通过[numerator,denominator] = sos2tf(SOS,G)进行转换;
### 使用滤波器(filtfilt)(零相位滤波)
- 使用滤波器(系数 FIR)  : signal_filt   = filtfilt(coefficient,1,signal);
- 使用滤波器(系数 IIR)  : signal_filt   = filtfilt(SOS,G,signal);

## 脚本
### 计算
- cal_fft_analyse      : fft计算
- cal_fft_analyse      : fft计算(psd形式)
### 画图
- pic_1_signal_1figure : 1个信号 1张图
- pic_2_signal_1figure : 2个信号 1张图
- pic_2_signal_2figure : 2个信号 2张图

## 杂
- 删除某个变量          : clear var_name
- 只保留某个变量        : clearvars -except var_name
- 归一化数据            : mapminmax(signal) #列向量归一化
