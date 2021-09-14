---
layout: post
title:  "Towards Hierarchical Self-Supervised Monocular Absolute Depth  Estimation for Autonomous Driving Application"
author: seri
categories: [ paper ]
image: assets/images/depth/1.jpg
tags: featured
excerpt: "This paper addresses two problem for monocular depth estimation: 1) imrecise object-level depth inference and 2) uncertain scale factor. A dense geometrical constrains (DGC) and dense connected prediction (DCP) layer is proposed. Still the camera height has to be given."
---

<!--more-->

<h2> Introduction </h2>
Despite its potential to reach satisfying performances, current methods have shortcomings: they are only able to estimate <mark> relative depth rather than the absolute one </mark> . For evaluation,<mark> scale factor is calculated by ratio between the medians of ground-truth (given by LiDAR) </mark>. 

Based on relative depth estimation, DGC module can <mark> finish per-pixel ground segmentation and estimate a camera height from every ground point </mark>.

Scale factor can be determined through comparison between the given and estimated camera height. 

<div class="sidenote"> <span style="color:red"> Monocular Scale Recovery </span> Monocular visual SLAM integrate object detection algorithms into monocular visual SLAM system and take advantage of object size prior to recover scale.

<span class="rainbow"> Handling the geometric relationship between camera and ground </span> is also an effective approach to tackle this problem. The main task of these methods is <span class="highlight-yellow"> estimate a relative camera height using camera-ground geometrical constrains </span> <mark> thus infer scale with absolute camera height prior </mark></div>

<h3> Method </h3>

A novel pipeline called DNet is divided into two parts: relative depth estimation and scale recovery based on dense geometric constraint.

<h4> Relative Depth Estimation </h4>

The authors introduce DCP layer to replace full resolution module used in Monodepth2. 

<h4> Scale Recovery </h4> 

<blockquote> Scale recovery module utilizes geometrical relationship between the ground and the camera. It ues extracted ground points to densely calculate camera height point by point </blockquote>

Dense geometrical constraint (DGC) works under the assumption that there are enough ground poitns in the monocular image, which is usually the case for autonomous driving. 

1. Surface Normal Calculation

Determine the surface normal for eaach pixel in the input image. All the pixel points need to be projected to 3D space. 

For each pixel point, 8-neighbor convention is used to determine several planes around it.

2. Ground point detection

Ground point refers to the points that has a normal close to ideal ground normal, i.e., $\tilde{n} = (0,1,0)^T$. 

3. Camera Height Estimation

The geometrical relationship between points and camera itself is exploited. Median of all estimated camera heights $h_M = Median(H)$ is selected as the final camera height.

4. Scale Factor Calculation

In order to calculate the scale factor, all that is needed is the real height of the camera $h_R$. The scale factor for the current relative depth estimation is simply determined as follows:

$$
f_t = \frac{h_R}{h_M}
$$

5. Absolute Depth Estimation 

The absolute depth can thus be calculated pixel-wise from the relative depth map.

$$
D^{abs}_{t} = f_t D^{rel}_t
$$

<h2> References </h2>
<ul><li><a=href="http://ras.papercept.net/images/temp/IROS/files/0898.pdf"> original paper </a></li>
</ul>

