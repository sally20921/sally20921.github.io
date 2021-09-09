---
layout: post
title:  "Depth Estimation - An Introduction"
author: seri
categories: [ computer vision ]
image: assets/images/camera/camera.jpeg
tags: featured 
---

<h3> Paradigms for 3D Images Representation over a Plane </h3>
As we saw in the previous section, the projection onto a plane forces the loss of the depth dimension of the scene. However, the depth information should be able to be represented in a plane, for printing purposes, for example.

There are three widely used modes for depth representation:
<ul><li> Gray scale 2.5D representation. This paradigm uses the gray scale intensity to represent the depth of each pixel in the image. Thus, the color, texture and luminosity of the original image are lost in this representation. The name "2.5D" refers to the fact that this kind of images has the depth information directly in each pixel, while it is represented over a 2D space. In this paradigm, the gray level represents the inverse of the distance. Thus, more a pixel is bright, closer is the point represented. Vice versa, the darker is a pixel, further is the represented point. This is most commonly used way for depth representation. </li>
<li> Color 2.5D representation. This representation is similar to the previous one. The difference is the use of colors to represent depth. In the following image, red-black colors represent closer points, and blue-dark colors the further points. However, other color representations are available in the literature. </li>
<li> Pseudo-3D representation. This representation provides different points of view of the reconstructed space. </li>

The main advantage of the first two methods is the possibility of implementing objective comparison among algorithms, as it is done in the Middlebury database and test system. 

<h3> Important terms and issues in depth estimation </h3>
The depth estimation world is quite complex research field, where many techniques and setups have been proposed. The set of algorithms which solve the depth map estimation problem deals with many different mathematical concepts which should be briefly explained for a minimum overall comprehension of the matter. In this section, we will review some important points about image processing applied to depth estimation.

<h4> Standard Test Beds </h4>
The availability of common tests and comparable results is a mandatory constraint in active and widely explored fields. Likewise, the possibility of objective comparisons make easier to classify different proposals.

In depth estimation, and more specifically in stereo vision, one of the most important test bed is the Middlebury database and test bed. The test beds provides both eyes images of a 3D scene, as well as the ground truth map. The same test allow, as said, algorithms classification.

<h4> Color or Grayscale Images? </h4>
The first point when we want to process an image, whichever is the goal, is to decide what to process. In this case, color or grayscale images. As it can be seen in the following figure, color images have much more information than gray scale images. Color images should, hence, be more appropriate for data extraction, among them, depth information. 

However, the color images have an important disadvantage: for a 256 level definition, they are represented by 3 bytes (24-bit representation), while grayscale images with the same level only require one single byte. The consequence is obvious: color image processing requires much more time and operations.

<h4> The Epipolar Geometry </h4>
When dealing with stereo vision setups, we have to face the epipolar geometry problem. Let $C_l$ and $C_r$ be the focal centers of the left and right sensors (or eyes), and $L$ and $R$ the left and right image planes. Finally, $P$ will be a physical point of the scene and $p_l$ and $p_r$ the projections of $P$ over $L$ and $R$, respectively. 

<picture>
<img src="{{base.url}}/assets/images/epipolar.png">
</picture>

In this figure, we can also see both "epipoles", i.e., the points where the line connecting both focal centers intersect the image planes. They are noted as $e_l$ and $e_r$.

The geometrical properties of this setup force that every point of the line $Pp_l$ lies on the line $p_re_r$ which is called "epipole line". The correspondence ofa poitn seen in one image must be searched in the corresponding epipolar line in the other one. A simplified version of the geometry arise when the image planes are parallel. This is the base of the so-called fronto-parallel hypothesis.

<h4> The Fronto-Parallel Hypothesis </h4>
The epipolar geometry of two sensors can be simplified, as said, positioning both planes parallel, arriving to the following setup:

<picture>
<img src="{{base.url}}/assets/images/fronto.png">
</picture>

The epipoles are placed in the infinite, and the epipolar (and search) lines become horizontal. The point (except the occluded ones) are only decaled horizontally. 

This geometrical setup can be implemented by properly orienting the sensors, or by means of mathematical transformation fo the original images. If the last option is the case, the result is called "rectified image". 

The most important consequences of this geometry, regarding the Cartesian plane can be written as follows:
<ul><li> $y_l = y_r$. The height of a physical point is the same in both images. </li>
<li> $x_l = x_r + \nabla d$. The abcissa of a physical point is decaled by the so-called <span class="blue"> parallax </span> or <span class="blue"> disparity </span>, which is inversely related to the depth. </li>
<li> A point in the infinite has identical abscissa coordinates in both image planes. </li></ul>

<h4> Matching </h4>
When different viewpoints from the same scene are compared, a further problem arises that is associated with the mutual identification of images. The solution to this problem is commonly referrred to as matching. The matching process consists of identifying each physical points within different images. However, matching techniques are not only used in stereo or multivision procedures but also widely used for image retrieval or fingerprint identification where it is important to allow rotational and scalar distortions.

There are also various constraints that are generally satisfied by true matches thus simplifying the depth estimation algorithm, such as similarity, smoothness, ordering and uniqueness. 

As we will see, the matching process is a conceptual approach to identify similar characteristics in different images. It is, then, subjected to errors. The matching is, hence, implemented by means of comparators allowing different identification strategies such as minimum square errors (MSE), sum of absolute differences (SAD) or sum of squared differences (SSD). The characteristic compared through the matching process can be anything quantifiable. Thus, we will see algorithms matching points, edges, regions or other image cues. 








<h2> References </h2>
<ul> 
<li><a href="https://ksimek.github.io/2012/08/14/decompose/"> ksimek blog </a></li>
<li><a href="https://prateekvjoshi.com/2014/05/31/understanding-camera-calibration/"> prateekvjoshi blog </a></li>
</ul>


