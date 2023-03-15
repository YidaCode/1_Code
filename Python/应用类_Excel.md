# Python Excel学习笔记
## 主要以代码为主
```python
#导入库
import openpyxl
#创建实例 选择具体页
xlsx_instance   = openpyxl.load_workbook("temp.xlsx")
sheet           = xlsx_instance.worksheets[0]
#提取数值
value           = sheet['A' + str(i)].value
#修改数值
sheet['A'+str(i)].value = i
#在9行前面插一行
sheet.insert_rows(9)
#保存文件
xlsx_instance.save(path)
```