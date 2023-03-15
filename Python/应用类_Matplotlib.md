# Matplotlib学习笔记
## 主要以代码为主
### 参考资料：莫凡python
```python
import  numpy                   as      np
import  matplotlib.pyplot       as      plt
from    mpl_toolkits.mplot3d    import  Axes3D

x                       = np.linspace(-10,10,10)#-1到1之间生成50个点
y1                      = 2*x
y2                      = 3*x
t_scatter               = np.arctan2(x,y1)
x_meshgrid,y_meshgrid   = np.meshgrid(x,y1)
x_img_np                = np.arange(1,10,1).reshape(3,3)

#创建一个figure 画很多不同类型的线
plt.figure()
#直线以及双坐标轴
fig1_ax1        = plt.subplot(3,3,1)
fig1_ax1_twin   = fig1_ax1.twinx()
fig1_ax1.plot(x,y1)
fig1_ax1_twin.plot(y1,x,color='r')
#散点图
plt.subplot(3,3,2)
plt.scatter(x,y1,s=20,c=t_scatter,alpha=0.5)
#柱状图
plt.subplot(3,3,3)
plt.bar(x,y1,alpha=0.1,facecolor='#9999ff',edgecolor='black',width=0.1)
for i,j in zip(x,y1):
    plt.text(i,j,'%.2f'%j,ha='center',va='bottom',fontsize=5)#给坐标
#等高线图
plt.subplot(3,3,4)
plt.contourf(x_meshgrid,y_meshgrid,x_meshgrid+y_meshgrid,20,alpha=0.5,cmap=plt.cm.hot)
C = plt.contour(x_meshgrid,y_meshgrid,x_meshgrid+y_meshgrid,20,colors='black')
plt.clabel(C,inline=True,fontsize=10)
#热点图
plt.subplot(3,3,5)
plt.imshow(x_img_np,interpolation='nearest',cmap='bone',origin='upper')
#https://matplotlib.org/stable/gallery/images_contours_and_fields/interpolation_methods.html
plt.colorbar(shrink=1)
#3D图
fig_3d = plt.figure(num=2,figsize=(8,5))
ax = Axes3D(fig_3d)
ax.plot_surface(x_meshgrid,y_meshgrid,np.sin(x_meshgrid),rstride=1,cstride=1,cmap='rainbow')
ax.contourf(x_meshgrid,y_meshgrid,np.sin(x_meshgrid),zdir='z',offset=0,cmap='rainbow')

#创建一个新的figure 展示不同的subplot方式
plt.figure()
ax1 = plt.subplot2grid((3,3),(0,0),colspan=3,rowspan=1)
ax2 = plt.subplot2grid((3,3),(1,0),colspan=1,rowspan=2)
ax3 = plt.subplot2grid((3,3),(1,1),colspan=2,rowspan=2)
ax1.set_title("pic1")#plt的一些属性前面需要加set_
ax2.set_title("pic2")
ax3.set_title("pic3")

#创建一个新的figure 展示图中图
plt.figure()
plt.axes([0.1,0.1,0.8,0.8])
plt.plot(x,y1)
plt.axes([0.2,0.7,0.1,0.1])
plt.plot(y1,x,color='g')

#创建一个新的figure 画两条线 下面的属性只针对新的figures
plt.figure()
plt.xlim((-1,2))
plt.ylim((-5,5))
plt.xlabel('XLABEL',labelpad=35,fontweight='bold',loc='center')
plt.ylabel('YLABEL',labelpad=35,fontweight='bold')
#设置x和y的坐标轴
new_ticks = np.linspace(-1,2,5)
plt.xticks(new_ticks)#为空时就没有轴例了
plt.yticks([-3,0,1,3,5],
            ['bad','not bad','normal','good','good+'],
            fontsize=15)
#设置x和y坐标轴具体内容(高级)
ax = plt.gca()#gca = 'get current axis'
ax.spines['right'].set_color('none')
ax.spines['top'].set_color('none')
ax.xaxis.set_ticks_position('bottom')
ax.yaxis.set_ticks_position('left')
ax.spines['bottom'].set_position(('data',0))
ax.spines['left'].set_position(('data',0))
ax.spines[['right','top']].set_visible(False)
ax.tick_params(labelsize=35,length=7,width=3,zorder=1)
#移动坐标轴
line1, = plt.plot(x,y1,label='y1')
line2, =plt.plot(x,y2,label='y2')
plt.legend(handles=[line1,line2,],labels=['line1','line2',],loc='best')
#图例添加
x_annotate = 1
y_annotate = 2
plt.annotate('test%s'%y_annotate,#注释文字
            xy=(x_annotate,y_annotate),#注释所在位置
            xycoords='data',#基于所给data为基准
            xytext=(+30,-30),#偏移角度
            textcoords='offset points',#文字位置
            fontsize=16,#字体大小
            arrowprops=dict(arrowstyle='->',connectionstyle='arc3,rad=.2')#箭头属性
            )
plt.annotate('', 
             xy=(1.06, 0), xycoords='axes fraction',
             xytext=(0, 0), textcoords='axes fraction',
             arrowprops=dict(facecolor='black', shrink=0.00),
             zorder=3)#用图例画坐标轴箭头
plt.text(1,2,"test_text")#只注释文字
#ticks能见度
for label in ax.get_xticklabels() + ax.get_yticklabels():
    label.set_fontsize(12)
    label.set_bbox(dict(facecolor='black',edgecolor='None',alpha=1))

plt.show()
```

```python
#动态做图的小例子
import  numpy                   as      np
import  matplotlib.pyplot       as      plt 
from    mpl_toolkits.mplot3d    import  Axes3D
import  math
pi      = 3.1415
x       = np.linspace(0,2*pi,100)#-1到1之间生成50个点 
plot_x  = []
plot_y  = []
for i in range(100):
    plt.xlim(0,2*pi)
    plt.ylim(-1.5,+1.5)
    plot_x.append(x[i])
    plot_y.append(math.sin(x[i]))
    plt.plot(plot_x,plot_y)
    plt.pause(0.01)
    plt.cla()
plt.show()
```

```python
#科研作图模板
fig = plt.figure() #创建figure
ax  = plt.gca()    #坐标操作
#坐标轴属性 线宽/颜色
ax.spines['right'].set_visible(False)
ax.spines['top'].set_color('none')
ax.spines['bottom'].set_linewidth(3)
ax.spines['left'].set_linewidth(3)
#箭头
plt.annotate('',
             xy=(1.06, 0), xycoords='axes fraction',
             xytext=(0, 0), textcoords='axes fraction',
             arrowprops=dict(facecolor='black', shrink=0.00),
             zorder=3)
plt.annotate('',
             xy=(0,1.06), xycoords='axes fraction',
             xytext=(0,0), textcoords='axes fraction',
             arrowprops=dict(facecolor='black', shrink=0.00),
             zorder=5)
#坐标轴标注属性设置
ax.tick_params(labelsize=35,length=7,width=5,zorder=1)
ax.ticklabel_format(axis="y", style="sci", scilimits=(0,0))
ax.yaxis.get_offset_text().set_fontsize(25)
ax.yaxis.get_offset_text().set_fontweight('bold')
labels = ax.get_xticklabels() + ax.get_yticklabels()
for label in labels:
    label.set_fontweight('bold')
plt.rcParams['xtick.direction'] = 'in' #坐标轴标签朝内
plt.rcParams['ytick.direction'] = 'in' 
#坐标轴标签设置
font = {
         'family': 'Arial',
         'weight': 'bold',
         'size': 16,
        }
plt.xlabel('Time(s)',loc='center',fontweight='bold',fontdict=font)#fontdict设置字体
plt.ylabel('Current(mA)',fontsize=65,loc='center',labelpad=35,fontweight='bold')
plot_ir,  = plt.plot(x_value,y_value_ir,color='blue',linewidth=2)

#副坐标轴设置
ax_twin     = ax.twinx()
ax_twin.spines['top'].set_color('none')
ax_twin.tick_params(labelsize=35,length=7,width=5,zorder=1)
#坐标轴科学计数法
ax_twin.ticklabel_format(axis="y", style="sci", scilimits=(0,0))
#调节科学计数法的字体大小
ax_twin.yaxis.get_offset_text().set_fontsize(25)
ax_twin.yaxis.get_offset_text().set_fontweight('bold')
labels = ax_twin.get_xticklabels() + ax_twin.get_yticklabels()
for label in labels:
    label.set_fontweight('bold')
plot_red,   = plt.plot(x_value,y_value_red,color='red',linewidth=2,alpha=0.6)

#图例设置
plt.legend(handles=[plot_ir,plot_red],labels=['IR','RED'],loc='best',prop=font_dict)

#自动布局 画图
plt.tight_layout()
plt.show()

```