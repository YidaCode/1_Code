# Python Decorator学习笔记
先来看一个简单例子：
```python
def foo():
    print('i am foo')
```
现在有一个新的需求，希望可以记录下函数的执行日志，于是在代码中添加日志代码：
```python
def foo():
    print('i am foo')
    logging.info("foo is running")
```
bar()、bar2()也有类似的需求，怎么做？
```python
def use_logging(func):
    logging.warn("%s is running" % func.__name__)
    func()

def bar():
    print('i am bar')

use_logging(bar)
```
简单装饰器
```python
def use_logging(func):

    def wrapper(*args, **kwargs):
        logging.warn("%s is running" % func.__name__)
        return func(*args, **kwargs)
    return wrapper

def bar():
    print('i am bar')

bar = use_logging(bar)
bar()
```
函数use_logging就是装饰器，它把执行真正业务方法的func包裹在函数里面，看起来像bar被use_logging装饰了。<br>
在这个例子中，函数进入和退出时 ，被称为一个横切面(Aspect)，这种编程方式被称为面向切面的编程(Aspect-Oriented Programming)。<br>
@符号是装饰器的语法糖，在定义函数的时候使用，避免再一次赋值操作。
```python
def use_logging(func):

    def wrapper(*args, **kwargs):
        logging.warn("%s is running" % func.__name__)
        return func(*args)
    return wrapper

@use_logging
def foo():
    print("i am foo")

@use_logging
def bar():
    print("i am bar")

bar()
```
带参数的装饰器
```python
def use_logging(level):
    def decorator(func):
        def wrapper(*args, **kwargs):
            if level == "warn":
                logging.warn("%s is running" % func.__name__)
            return func(*args)
        return wrapper

    return decorator

@use_logging(level="warn")
def foo(name='foo'):
    print("i am %s" % name)

foo()
```
类装饰器
```python
class Foo(object):
    def __init__(self, func):
        self._func = func

    def __call__(self):
        print ('class decorator runing')
        self._func()
        print ('class decorator ending')
@Foo
def bar():
    print ('bar')

bar()
```
