---
layout: post
title: Supercharge Your Classes With Python super()
categories: Python 
tags: [Real Python]
excerpt: https://realpython.com/python-super/
---
# An Overview of Python's *super()* Function
- At a high level, *super()* gives you access to methods in a superclass from the subclass that inherits from  it.
- *super()* alone returns a temporary object that then allows you to call that superclass's method. 
- Why would you want to  do any of this? A common use case is building classes that extend teh functionality of previously built classes. 
- calling the previously built methods with *super()* saves you from needing to rewrite those methods in your subclass, and allows you  to  swap  out superclasses with  minimal code changes. 

# What can *super()* do for you?
- Before heading into multiple inheritance,  let's take a quick  detour into the mechanics of *super()*.
- While  the examples above (and below) call *super()* without any parameters, *super()*  can also take two parameters: the first is the subclass, and the second parameter is an object that is an instance of that subclass. 

```python
class Rectangle:
  def __init__(self, length,  width):
    self.length = length
    self.width - width
    
  def area(self):
    return self.length * self.width
    
    
```
