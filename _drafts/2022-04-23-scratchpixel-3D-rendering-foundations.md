---
layout: post
title:  "3D Rendering Foundations"
author: seri
categories: [ Python ]
image: assets/images/depth/1.jpg
tags: featured
---

<!--more-->

<h2> Introduction to Ray Tracing: A Simple Method for Creating 3D Images </h2>

To begin, I will explain how a three-dimensional scene is made into a viewable two-dimensional image. Once we understand that process and what it involves, we will be able to utilize a computer to simulate an artificial image by similar methods. This section can be thought of as the theory that more advanced computer graphics is built upon. 

Ray-tracing is the most straightforward way of simulating the physical phenomena that cause objects to be visible. For that reason, we believe ray-tracing is the best choice, among other techniques, when writing a program that creates simple images. 

<h3> How Does an Image Get Created? </h3>

Although it seems unusual to start with the following statement, the first we need to produce an image, is a two-dimensional surface (this surface needs to be of some area and cannot be a point). With this in mind, we can visualize a picture as a cut made through a pyramid whose apex is located at the center of our eye and whose height is parallel to our line of sight (remember, in order to see something, we must view along a line that connects to that object). 

We will call this cut, or slice, mentioned before, the image plane (you can see this image plane as canvas used by painters). 


<picture><img src="{{site.baseurl}}/assets/images/disparity.png"></picture>

<h2> References </h2>
<ul><li><a=href=""> TheAILearner </a></li>
</ul>

