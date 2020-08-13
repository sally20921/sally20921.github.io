---
layout: post
title: File Input/Output
categories: Python  
tags: [Advanced Guide to  Python 3 Programming]
excerpt: Advanced Guided to Python 3  Programming
---

# Introduction to Files, Paths, and IO
* A common format used in Unix/Linux and Windows systems is the ASCII text format. The ASCII format is a set  of codes that represent various characters that is widely used by  operating  systems. 
* ASCII is a very  useful format to use for text files as they can be  read by  a wide  range of  editors and browsers. However, programming languages such as  Python often  use a different set of character encodings such  as a  Unicode character encodeing (such as  UTF-8). Unicode is another standard representing  characters using various codes. 
* It can be necessary to translate ASCII into Unicode (e.g. UTF-8) and vice versa when reading and writing ASCII files in Python. 
# Reading and Writing  Files 
* Reading from, and writing to text files in Python is relatively straightforward.  The built in *open()* function creates a file object for  you that you can use to read and/or write data  from and/or to a  file. The function requires as a minimum the names of the file you want to work with. 
*  Optionally you can specify  the  access mode  (e.g. read, write, append, etc). If you do not specify  a mode then the file is open in read-only mode. 
```python
file_object  = open(file_name, access_mode, buffering)
```
* You can also specify whether  you want the interactions with the file to be buffered which can improve performance  by grouping data reads together. If the buffering value is set to 0, no buffering takes place. If the buffering value is 1, line buffering is performed while accessing a file. 
* *file.closed* returns *True* if the file has been  closed ( can no longer be accessed because  the  *close()* method has been called on it.)
* *file.mode* returns the  access mode with  which the file was opened. 
* *file.name* the name of the file. 
* *file.close()* method is used to close the file once you have finished with it.  This will flush any unwritten information to the file (this may occur  because of buffering) and will close the  reference from the file object to  the actual underlying operating system file. 
```python
file = open('myfile.txt', 'r+')
print('file.name: ', file.name)
print('file.closed: ', file.closed)
print('file.mode: ', file.mode)
file.close()
```

* Reading data from a text file is by the *read(), readline(), readlines()* method.
 * The *read()* method will return the  entire contents of the file as a single string
 * The *readline()* method  reads the next line of text from a file. It returns all the text on one line up to  and including the newline character. It can be used to read a file a line at a time.  
 *  The *readlines()* method  returns a list of all  the lines in a file, where each item  of the list represents a single line. 
 * Note that once you have  read some text from a  file  using one of the aboe operations then taht line is not read again. Thus using *readlines()*  would result in a  further *readlines()* returning an empty list whatever the  contents of the file.  
 
 ```python
 file = open('myfile.txt', 'r')
 lines = file.readlines()
 for line in lines:
  print(line, end='')
 file.close()
 ```
 * Notice that within the *for* loop we have indicated to the  *print* function that we want the end character to be '' rather  than a newline. This is because the line  string  already possesses the newline character read from the file.
 
##  File Contents  Iteration
* Python makes this extremely easy by making the file object support iteration. File iteration acceesses each line in the file and makes the line available to the *for* loop:
```python
file = open('myfile.txt', 'r')
for line in file:
  print(line, end='')
file.close()
```
*  It is also possible to use the *list comprehension* to provide a very concise way to load and process lines in a file into a list. 
```python
file = open('myfile.txt', 'r')
lines = [line.upper() for line in file]
file.close()
print(lines)
```
## Writing Data to Files
* Note that the write  method *does* not add a newlien character to the end of the  string - you must do this manually. 
```python
print('Writing file')
f = open('my-new-file.txt', 'w')
f.write('Hello from Python!\n')
f.write('Working with files is easy ... \n')
f.write('It is cool ...\n')
f.close()
```

###  Using Files and with Statements
* The file object class implements the *Context Manager Protocol* and thus can be used with the  *with* statement. Thus it ensures that the file will be closed when the block of code is finished.

```python
with open('my-new-file.txt','r') as f:
  lines  = file.readlines()
  for line in lines:
    print(line, end='')
 ```
 
## The Fileinput Module
* In some situations, you may need to read the input from several files in one go. You could do this by opening each file independently and then reading the contents and appending  that contents  to a list. However,  this is  a common enough requirement that the *fileinput*  module provides a function *fileinput.input()*  that can take  a list of files and treat  all  the  files as  a single input.
```python
with fileinput.input(files=('spam.txt', 'eggs.txt')) as f:
 for line in f:
  process(line)
 ```
 * Features provided by the *fileinput* module include  
  * Return the name of the file currently being  read 
  * return the  integer "file descriptor" for the current file
  * return the  cumulative  line  number  of the  line  that has just been read
  * return the line number  in the  current file. Beforet he  first line has been  read  this returns 0.
  * A boolean  function  that indicates if the current line  just read is the  first line of its file. 
  
  ```python
with fileinput.input(files=('spam.txt', 'eggs.txt')) as f:
 line  = f.readline()
 f.filename()
 f.isfirstline()
 f.lineno()
 f.filelineno()
 for line in f:
  print(line, end='')
 ```
 
 ##  Renaming Files 
 * A file can be renamed using the *os.rename()* function. This function takes two arguments, the current filename and the new filename. It  is part of the  Python *os*  module which provides methods that can be  used to perfrom a  range of file-processing operations (such as renaming  a file). 
 
 ##  Random Access Files
 * It is also possible to use a random-access approach to the contents within a file. 
 * The random-access aspect of a file is provided by the seek method of the file object:
 * *file.seek(offset, whence)* : this method determines where the next  read or write  operation takes place. 
  * The optional whence  parameter  indicates where the  offset is relative to. 
 
# Stream IO
#  Working with  CSV Files
* The  CSV (Comma Separated Values) format is the  most common import and export format  for spreadsheets  and databases. 
* The Python *csv* module implements classes to read and write tabular data in CSV format. 
* This allows programmers to  iterate  over lines in the given csvfile. An optional dialect parameter  can be  given. 
```python
csv.writer(csvfile, dialect='excel', **fmtparams)
 ```
 * Returns a writer object responsible for converting  the user's data into delimited strings on the given csvfile. 
 ```python
csv.list_dialects()
 ```
 * Returns the names of all registered dialects. 
 
## The CSV Writer  Class
* A CSV Writer is obtained from the *csv.writer()* function. 
# Introduction to Logging
* Logging is typically a key aspect of any production application; this is because it is important  to provide appropriate information to allow future investigation following some events or issue in such applications. 

## Why Not Just Use Print?
* There  might be  no terminal/console window to send the data to; instead the data is just lost. 
# Logging in  Python
## The Logging  Module 
* Python  has included a built-in logging module since Python 2.3. This  module, the *logging*  module, defines functions  and classes which implement  a flexible  logging  framework that can be  used in any Python application/script or in Python libraries/modules. 
* **Configuration Information** The logger can be configured either  programmatically in Python or through configuration files. These configuration files can be written using key-value pairs or in a YAML file (which is a simple mark up language). YAML stands for Yet Another Markup Language!

### The  Logger  
* The Logger provides the programmers interface to the logging pipeline. 
* A Logger object is obtained from the *getLogger()* function defined in the *logging* module.
```python
import logging 
logger  = logging.getLogger()
 ```
### Controlling the  Amount of Information Logged 
* Log messages are actually associated with a  log level. There are six different log levels associated  with  the Python logging framework.
 * **NOTESET**
 * **DEBUG** : when a developer is diagnosing a bug 
 * **INFO**
 * **WARNING**
 * **ERROR**
 * **CRITICAL**
 ```python
import logging 
logging.basicConfig(level=logging.DEBUG)
logger  = logging.getLogger()
 ```
 
 ###  Logger Methods
 ```python
import logging 

logger = logging.getLogger()

try:
 print('starting')
except:
 logger.exception('an exception message')
print('Done')
 ```

### Default Logger
* A default (or root) logger is always available from the logging framework. 

### Module Level Loggers
* Most modules will not use the root logger to log information, instead they will use a *named* or *module level* logger. Such a logger can be configured independently of the  root logger. This allows developers to turn on logging just for a module rather than for a whole application. 
* It is possible to create a named logger. This is a separate logger object that has its own name and can potentially have  its own log level, handlers, and formatters etc. 
 ```python
logger1 = logging.getLogger('my logger')
 ```
 * multiple calls to *getLogger()* with the same name will always return a reference to the same Logger object. 
 * It is common practice to use the name of the module as the name of the logger; 
 
### Logger  Hierarchy
 *  There  is in fact a hierarchy of loggers with the root logger at the top of this hierarchy. All *named* loggers are below the  root logger. 
 
### Formatters
#### Formatting Log Messages 
 ```python
logger.warning('%s is set to %d', 'count', 42)
 ```
#### Foramtting Log  Output
* To globally set the output format for log messages use the *logging.basicConfig()* function using  the named parameter  *format*. 

 ```python
import logging 
logging.basicConfig(format='%(asctime)s %(messages)s', level=logging.DEBUG)
logger = logging.getLogger(__name__)
 ```
# Advanced Logging 
* In this chapter we go  further into the configuration and modification of the Python logging module. In particular  we will look at  Handlers (used to determine the destination for log messages) and logger configuration files. We conclude the chapter by considering performance issues associated with logging. 

## Handlers
* Within the logging pipeline, it is handlers that send log messages to their final destination. By default the handler is set up to direct output to the console/terminal associated with  the running program. However, this can be changed to send the log messages to a file, to an email service, to a web server etc. 

### Setting the Root Output Handler
 ```python
import logging 

logging = basicConfig(filename='example.log', level=logging.DEBUG)

logger = logging.getLogger(__name__)
 ```
 
 ###  Logger Configuration
 * For most production systems a better solution is to use an external configuration file which is loaded when the  application is run and is used to dynamically configure  the  logging framework. 
* This allows system administrators and others to change the log level, the log  destination, the log format etc. without needing to change the code. 
* The logging configuration  file can be  written using several  standard formats from JSON to YAML format, or as a set of key-value pairs in a .conf file. 
* The YAML code is stored in a file called *logging.conf.yaml*
* The YAML file always starts with a version number. This file can be loaded into a Python application using the *PyYAML* module. This  provides a YAML parser that can  load a YAML file as a dictionary structure that can be  passed to the *logging.config.dictConfig()* function. 
* As this is a file it must be opened and closed to ensure  that the resource  is handled appropriately. It is therefore best managed using the *with-as* statement as shown below:
 ```python
with open('logging.config.yaml', 'r') as f:
 config = yaml.safe_load(f.read())
 logging.config.dictConfig(config)
 ```
 * This will open the YAML file in a read-only mode and close it  when the two statements have been executed. 
 
  ```python
import logging
import logging.config
import yaml

with  open('logging.config.yaml','r') as f:
 config = yaml.safe_load(f.read())
 logging.config.dictConfig(config)
 
logger = logging.getLogger('myLogger')

# 'application' code
def do_something():
 
logger.info('Starting')
do_something()
logger.info('Done')
 ```
