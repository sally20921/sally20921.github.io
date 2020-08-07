---
layout: post
title: Pure Python Optimization
categories: Python  
tags: [Advanced Python Programming]
excerpt: Advanced Python Programming
---

* As mentioned in the last chapter,  one of the  most effective  ways  of improving the performance of applications is through the use of better algorithms and data structures. The Python standard library provides a large variety  of ready-to-use algorithms and data structures that can be directly incorporated in your applications. 

* Even though many algorithms have  been around for quite  a while, they are  especially relevant in  today's world as we continuously produce,  consume, and analyze ever  increasing amount  of data. 

* More advanced use cases will also be covered by taking advantage  of third-party  libraries. 

# Lists and deques 
- Python lists are ordered collections of elements and in Python, are implemented as resizable arrays. An array is a basic data  structure that  consists of a  series of contiguous  memory locations,  and each location contains a reference  to a Python object.  
- List shine  in accessing, modifying, and appending elements. Accessing or modifying  an element involves fetching  the object reference  from the  appropriate  position of the underlying array and has complexity O(1). 

* In some cases, it is necessary  to efficiently perform insertion or removal of elements both at the  beginning and at the end of the collection. Python provides a data structure  with those properties in the collections.deque class. The  word **deque** stands for double-ended queue  because this data structure is designed to efficiently put and remove elements at the beginning  and at  the end of  the collection, as it is in the case  of queues. In Python, deques are implemented as doubly-linked lists. 

# Dictionaries  
- Dictionaries are extremely versatile and extensively used in the Python language. Dictionaries are implemented as hash maps and are  very good at element insertion, deletion, and access. All these operations have an average O(1) time complexity.

- In Python versions up to 3.5, dictionaries are unordered collections. Since Python 3.6, dictionaries are capable of maintaining their elements by order of insertion.

- A hash map is a data structure that associates a set of key-value pairs. The principle behind hash maps is to assign 
