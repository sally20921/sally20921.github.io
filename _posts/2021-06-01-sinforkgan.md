---
layout: post
title: SinForkGAN
categories: Python
tags: []
excerpt:
---

# The shutil Module 
* The *shutil* (or shlell utilities) module has functions to let you copy, move, rename and delete files in your Python programs. To use the *shutil* functions, you will first need to *import shutil*.

# Copying Files and Folders
* The *shutil* module provides functions for copying files, as well as entire folders. 
* Calling *shutil.copy(source, destination)* will copy the file at the path *source* to the folder at the path *destination*. 
* Both *source* and *destination* can be strings or *Path* objects.
* If *destination* is a filename, it will be used as the new name of the copied file. This function returns a string or *Path* object of the copied file. 

```python
import shutil, os
from pathlib import Path
p = Path.home()
shutil.copy(p/'spam.txt', p/'some_folder')
shutil.copy(p/'eggs.txt', p/'some_folder/eggs2.txt')
```
