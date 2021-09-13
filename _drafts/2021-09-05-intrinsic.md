---
layout: post
title:  "Dissecting the Camera Matrix (Part 2)"
author: seri
categories: [ computer vision ]
image: assets/images/intrinsic.png
tags: featured 
excerpt: "This is the second part of our journey to master the camera matrix. In this blog post, we will study the intrinsic camera parameters. Intrinsic camera matrix can be examined with two equivalent interpretations: the virtual camera geometry and simple 2D transformations."
---

 
  <!--more-->

<h2> The Intrinsic Matrix </h2>

The intrinsic matrix is paramterized as 
$$
K = \begin{bmatrix} f_x & s& x_o \\ 0 & f_y & y_o \\ 0 & 0 & 1 \end{bmatrix}
$$

Each intrinsic parameter describes a geometric property of the camera. Let's examine each of these properties in defail.

<h3> Focal Length </h3>

<picture><img src="{{site.baseurl}}/assets/images/focal.png"></picture>

The focal length is the distance between the pinhole and the film (a.k.a the image plane). For reasons that we will discuss later, the focal length is measured in pixels. In a true pinhole camera, both $f_x$ and $f_y$ have the same value, which is illustrated as $f$ in the above figure.  

In practice, $f_x$ and $f_y$ can differ for a number of reasons:
<ul><li> the camera's lens introduces unintentional distortion </li>
<li> the camera uses an anamorphic format, where the lens compresses a widescreen scene into a standard-sized sensor. </li>
<li> flaws in the digital camera sensor. </li></ul>

In all of these cases, the resulting image has non-square pixels. Having two different focal lengths sadly isn't intuitive, so some texts use a single focal length and an <span class="underline"> aspect ratio </span> that describes the amount of deviation from a perfectly squared pixel. Such a parameterization nicely separates the camera geometry (i.e. focal length) from distortion (aspect ratio). 
<h3> Principal Point Offset a.k.a $x_0$ and $y_0$ </h3> 

<picture>
<img src="{{site.baseurl}}/assets/images/principal.png">
<img src="{{site.baseurl}}/assets/images/origin.png">
</picture>

The camera's <span class="highlight-yellow"> principal axis </span> is the <span class="underline"> line perpendicular to the image plane that passes through the pinhole <span>. Its intersection with the image plane is referred to as the <span class="highlight-pink"> principal point </span>.

The <span class="glow"> principal point offset </span> is <span class="underline"> the location of the principal point relative to film's origin </span>. The exact definition dependson which convention is used for the location of the origin; the illustration above assumes it's at the bottom-left off the film. Notice that the box surrounding the camera is irrelevant, only the pinholes position relative to the film matters. 

<h3> Axis Skew $s$ and Other Geometric Properties  </h3>
Axis skew causes shear distortion in the projected image. Apparently some digitalization processees can cause nonzero skew. 

The focal length and principal point offset amount to simple translation of the film relative to the pinhole. What about rotating or scaling the film?

Rotating the film around the pinhole is equivalent to rotating the camera itself, which is handled by the extrinsic matrix. Rotating the film around any other fixed point $x$ is equivalent to rotating around the pinhole $P$, then translating by $(x-P)$.

What about scaling? It should be obvious that doubling all camera dimensions (film size and focal length) has no effect on the captured scene. If, instead, you double the film size and not the focal length, it is equivalent to doubling both and then halving the focal length. Thus, representing the film's scale explicitly would be redundant. It is captured by focal length. 

<h2> The Camera Frustom </h2> 
<h3> Focal Length: From Pixels to World Units </h3>

The above discussion of camera-scaling shows that there are infinite number of pinhole cameras that produce the same image. The intrinsic matrix is only concerened with <span class="highlight-pink"> the relationship between camera coordinates and image coordinates </span>, so the absolute camera dimensions are irrelevant. <span class="underline"> Using pixel units for focal length and principal point allows us to represent the relative dimensions fo the camera, namely, <span class="highlight-yellow"> the film's position relative to its size in pixels </span>. 


Another way to say this is that <span class="green"> the intrinsic camera transformation is invariant to uniform scaling of the camera geometry </span>. By representing dimensions in pixel units, we naturally capture this invariance. 

You can use similar triangles to convert pixel units to world units if you know at least one camera dimension in world units. For example, if you know the camera's film (or digital sensor) has a width of $W$ in millimiters, the image width in pixels $w$, you can convert the focal length $f_x$ to world units using 

$$
F_x:f_x = W: w   F_x = f_x \frac{W}{w}
$$

Other parameters $f_y$, $x_0$ and $y_0$ can be converted to their world-unit counterpart using similar equations:


$$
F_y = f_y \frac{H}{h} X_O = x_0 \frac{W}{w} Y_0 = y_0 \frac{H}{h}
$$

<h3> The Camera Frustum: A Pinhole Camera Made Simple </h3>

As we discussed earlier, only the arrangement of the pinhole and the film matter, so the physical box surrounding the camera is irrelevant. For this reason, many discussions of camera geometry use a simpler visual representation: the camera frustum.

<h3> Intrinsic Parameters as 2D Transformations </h3>

It also emphasizes that the <span class="highlight-green"> intrinsic camera transformation occurs <b> post-projection </b></span>.


<h2> References </h2>
<ul> 
<li><a href="https://ksimek.github.io/2012/08/14/decompose/"> ksimek blog </a></li>
<li><a href="https://prateekvjoshi.com/2014/05/31/understanding-camera-calibration/"> prateekvjoshi blog </a></li>
</ul>


