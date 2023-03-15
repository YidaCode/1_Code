# Python asyncio学习笔记
```python
import asyncio
async def func(id):
    print("print_start_from:",id)
    await asyncio.sleep(2) # 假装的IO操作
    print("print_end_from:",id)

async def main():
    print("main开始")
    # 创建协程，将协程封装到一个Task对象中并立即添加到事件循环的任务列表中，等待事件循环去执行（默认是就绪状态）。
    task1 = asyncio.create_task(func(1))
    # 创建协程，将协程封装到一个Task对象中并立即添加到事件循环的任务列表中，等待事件循环去执行（默认是就绪状态）。
    task2 = asyncio.create_task(func(2))
    print("main结束")
    # 当执行某协程遇到IO操作时，会自动化切换执行其他任务。
    # 此处的await是等待相对应的协程全都执行完毕并获取结果
    await task1
    await task2
asyncio.run(main())
```
