---
layout: post
title:  "Image Processing: the Basics"
author: seri
categories: [ computer vision ]
image: assets/images/depth/1.jpg
tags: featured
---

<!--more-->

<h2> The Basics of Optimization </h2>

An optimization problem has an <span class="blue"> objective function </span> that is defined in terms of a set of variables, referred to as <span class="red"> optimization variables </span>. The goal of the optimization problem is to <span class="underline"> compute the values of the variables at which the objective function is either maximized or minimized </span>. 

It is common to use a <mark class="coral"> minimization form of the objective function </mark> in machine learning, and the corresponding objective function is often referred to as a <span class="three"> loss function </span>. A loss function is always associated with a minimization of objective function, and it is often interpreted as a <mark class="teal"> cost with a nonnegative value </mark>. 

Most objective functions in machine learning are multivariate loss functions over many variables. First, we will consider the simple case of optimizations defined on <span class="highlight"> a single variable </span>. 

<h3> Univariate Optimization </h3>

Consider a single-variable objective function $f(x)$ as follows:

$$ 
f(x) = x^2 - 2x + 3
$$

This objective function is an <span class="circle-sketch-highlight"> upright parabola </span>, which can be expressed in the form $f(x) = (x-1)^2 + 2$. It clearly takes on its minimum value $x=1$, where the nonnegative term $(x-1)^2$ drops to $0$. 

Note that at the <span class="circle-sketch-highlight"> minimum value </span>, the rate of change of $f(x)$ with respect to $x$ is zero, as <mark color="gold"> the tangent to the plot at that point is horizontal </span>. 

One can also find this optimal value by computing the first derivative $f'(x)$ of the function $f(x)$ with respect to $x$ and setting it to $0$:

$$ 
f'(x) = \frac{df(x)}{dx} = 2x - 2 = 0
$$




<picture><img src="{{site.baseurl}}/assets/images/disparity.png"></picture>

<h2> References </h2>
<ul><li><a=href=""> TheAILearner </a></li>
</ul>

