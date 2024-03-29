---
layout: post
title:  "Depth from Disparity"
author: seri
categories: [ computer vision ]
image: assets/images/depth/12.png
tags: featured 
excerpt: "We will be looking at depth estimation as a multi-image problem. Multi-view problems span different problem domains: these include stereo vision, SfM, optical flow, etc."
---

<!--We will be looking at depth estimation as a multi-image problem. Multi-view problems span different problem domains: these include stereo vision, Structure from Motion, optical flow etc. In the first part of the series, we will focus on stereo vision.--> <!--more-->

<div align="center"><h2 class="glow">🌟 3D Reconstruction from 2D Signals </h2></div>

We are going to look at depth estimation as a multi-view problem. Multi-view problems can span into different domains including stereo vision, Structure from Motion and optical flow. Although each carries great importance in the problem of Virtual Reality (VR) and robotics, we will focus on stereo vision in this multi-part series. Specifically, the progress of deep learning in stereo vision technology. 

How can we automatically <span class="highlight-sketch"> compute 3D geometry from images </span>? What cues in the image provide 3D information? Before looking at binocular, let's consider single view characteristics. 

Well, we humans do so naturally. Here are several cues we use to infer depth information:
<ul>
<li> shading </li>
<li> texture </li> 
<li> focus </li>
<li> motion </li> 
<li> perspective </li>
<li> occlusion </li> 
<li> symmetry </li>
</ul>

<picture><img src="{{site.baseurl}}/assets/images/single.png"></picture>

Nonetheless, structure and depth are inherently ambiguous from a single view. As seen from the optical center (i.e., camera location), $P1$ and $P2$ are projected onto the image plane as equivalent. 

<h2> The Stereo Problem </h2>

<picture><img src="{{site.baseurl}}/assets/images/stereo.png"></picture>

Stereo vision systems reference the knowledge of two images captured simultaneously from a pair of cameras (left and right) with camera parameters (extrinsic and intrinsic). Stereo is heavily motivated by biology. Classic stereo problem include disparity, depth, occlusion, Structure from Motion, motion parallax etc. Provided left and right images, the ambiguity problem of the aforementioned is satisfied via triangulation from the two image planes by matching correspondences of a point in the world coordinate to the ones that can be seen in both images. 

The basic principle of triangulation is shown above: the reconstruction via the intersection of two rays. Requirements? Calibration and correspondences. 

<picture><img src="{{site.baseurl}}/assets/images/epipolar.png"></picture> 

Furthermore,  <span class="rainbow"> the Epipolar Constraint </span> reduces the correspondence problem to $1D$ search along <span class="frozen"> conjugate epipolar lines </span> shown in the above figure. 

Thus, <span class="rainbow"> Epipolar Constraint </span> assumes that stereo pairs are rectified images, meaning the same <span class="frozen"> epipolar line </span> aligns across rows such that it is orthogonal to both and aligned with one another. Rectification is achieved by learning a transformation based on intrinsic and extrinsic parameters: a process that dates back several decades.

From the rectified image pair, the depth $Z$ can be determined by its inversely proportionate relationhip with disparity $d$, where the disparity is defined as the pixel difference along the horizontal when comparing correspondences of left and right. This can be written as: 

$$
I(x,y) = D(x+d, y)
$$

This relationship is easiest to grasp visually. Provided a point in the left image plane $P_L(x,y)$ along with the correspondence in the right image plane and the world coordinates $(X,Y,Z)$ projected as a point in a 3D scene, our goal is to reconstruct the missing $Z$ (depth) provided the stereo pair. 

<picture><img src="{{site.baseurl}}/assets/images/disparity.png"></picture>

We set the relative coordinates (red axis) along with having known baseline $b$ between the two camera centers. Then $/frac{x_L}{f}$ can be expressed as $\frac{X+b/2}{Z}$ and $\frac{x_R}{f} = \frac{X-b/2}{Z}$. Therefore, 

$$
\frac{y_L}{f} = \frac{y_R}{f} = \frac{Y}{Z}
$$

and the world coordinate can be expressed as 

$$
X = \frac{b(x_L+x_R)}{2(x_L - x_R)} Y = \frac{b(y_L + y_R}{2(x_L-x_R} Z = \frac{bf}{(x_L - x_R)}
$$

<blockquote class="black"> $d = x_L - x_R$ is the <span class="neon-green">disparity</span> between corresponding left and right image points </blockquote> 

<h2> References </h2>
<ul> 
<li><a href="https://towardsdatascience.com/depth-from-disparity-via-deep-learning-part-0-458827141b23"> article from medium </a></li>
</ul>


