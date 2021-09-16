---
layout: post
title:  "Sparse Convolutional Networks"
author: seri
categories: [ computer vision ]
image: assets/images/depth/1.jpg
tags: featured
---

<!--more-->

<h2> Introduction </h2>
Convolutional Neural Network (CNN) has been proved very effective for 2D image signal processing. However, for 3D point cloud signals, the extra dimension $Z$ increases the calculation significantly. On the other hand, unlike regular images, most of the voxels of the 3D point cloud are empty, which makes point cloud data in the 3D voxels often a sparse signals. The question is whether we can only calculate the convolution with the sparse data efficiently instead of scanning all the image pixels or spatial voxels.

One intuitive thinking is, regular image signals are stored as matrix or tensor. The corresponding convolution is calculated as a dense matrix multiplication. The sparse signals are normally represented as data lists and index lists. We could develop a sparse convolution schema that uses the advantage of sparse signal representation. 

<h2> Sparse Convolution Model </h2>
In a short


<h2> References </h2>
<ul><li><a=href="https://towardsdatascience.com/how-does-sparse-convolution-work-3257a0a8fd1"> medium article </a></li>
</ul>

