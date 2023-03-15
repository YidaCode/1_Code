# Vispy 学习笔记
## 主要以代码为主
### 参考资料：VisPy.org
```python
#采用scene方法描绘动态图
#简单的直线画图
import numpy as np
from vispy import scene,app

#添加一个画布 设置一些属性
canvas  = scene.SceneCanvas( keys ='interactive',
                            size = (600,600),
                            # position = (0,0),
                            # title = 'canvas',
                            show = True,
                            # fullscreen = False,
                            # dpi = 600,
                            # always_on_top = False,
                            bgcolor = 'white')
#设置网格布局（类似于subplot） 
'''
canvas.central_widget returns the default widget 
that occupies the entire area of the canvas.
'''
grid    = canvas.central_widget.add_grid(margin=10)
#设置两个网格（subplot）之间的间距
grid.spacing        = 10
#设置标题
title   = scene.Label("Plot Title", color='black')
title.height_max    = 40
grid.add_widget(title, row=0, col=0, col_span=2)
#设置坐标轴
yaxis = scene.AxisWidget(orientation='left',#方向
                         axis_label='Y Axis',#坐标轴
                         axis_font_size=12,
                         axis_label_margin=50,
                         tick_label_margin=5)
yaxis.width_max     = 80
grid.add_widget(yaxis, row=1, col=0)
xaxis = scene.AxisWidget(orientation='bottom',
                         axis_label='X Axis',
                         axis_font_size=12,
                         axis_label_margin=50,
                         tick_label_margin=5)

xaxis.height_max = 80
grid.add_widget(xaxis, row=2, col=1)
right_padding = grid.add_widget(row=1, col=2, row_span=1)
right_padding.width_max = 50
view = grid.add_view(row=1, col=1, border_color='black')
if __name__ == '__main__':
    app.run()
```