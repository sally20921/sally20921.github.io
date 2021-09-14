---
layout: post
title:  "Dissecting the Camera Matrix (Part 2)"
author: seri
categories: [ computer vision ]
image: assets/images/extrinsic.png
tags: featured 
excerpt: "This is the second part of our journey to master the camera matrix. In this blog post, we will study the extrinsic camera parameters. Extrinsic matrix describes the camera's location in the world."
---
 
<!--more-->

<picture><img src="{{site.baseurl}}/assets/images/cali.png"></picture>
<div class="caption"> Overview of the Camera Calibration Parameters </div>

<h2> The Extrinsic Camera Matrix </h2>

The extrinsic matrix takes the form of a rigid transformation matrix: a $3 \times 3$ rotation matrix in the left-block, and $3 \times 1$ translation column-vector in the right.

$$

\begin{bmatrix}
\begin{array}{ccc|c}
  r_{11} & r_{12} & r_{13} & t_1 \\
  r_{21} & r_{22} & r_{23} & t_2 \\
  r_{31} & r_{32} & r_{33} & t_3
\end{array}
\end{bmatrix}

$$

It is common to see a version of this matrix with extra row of $(0,0,0,1)$ added to the bottom. This makes the matrix square, which allows us to further decompose this matrix into a rotation followed by translation:

$$

\begin{bmatrix}
\begin{array}{ccc|c}
1 & 0 & 0 & t_1 \\
0 & 1 & 0 & t_2 \\
0 & 0 & 0 & t_3 \\
\hline
0 & 0 & 0 & 1
\end{array}
\end{bmatrix}

\times

\begin{bmatrix}
\begin{array}{ccc|c}
r_{11} & r_{12} & r_{13} & 0 \\
r_{21} & r_{22} & r_{23} & 0 \\
r_{31} & r_{32} & r_{33} & 0 \\
\hline
0 & 0 & 0 & 1
\end{array}
\end{bmatrix}

$$

The matrix describes how to transform points in world coordinates to camera coordinates. The important thing to remember about the extrinsic matrix is that it describes how the <span class="blue"> world </span> is transformed <span class="blue"> relative to the camera </span>. This if often counter-intuitive, because we usually want to specify how the <span class="red"> camera </span> is transformed <span class="red"> relative to the world </span>.

<h2> Building the Extrinsic Matrix from Camera Pose </h2>

Like I said before, it is often more natural to <span class="highlight-yellow"> specify the camera's pose directly </span> rather than specifying <span class="highlight-pink"> how world points should transform to camera coordinates </span>. 

Luckily, building an extrinsic camera matrix this way is easy: just <span class="highlight-green"> build a rigid transformation matrix that describes the camera's pose </span> and then <span class="rainbow"> take its inverse </span>.

$$

\begin{bmatrix}
\begin{array}{c|c}
R & t \\
0 & 1 
\end{array}
\end{bmatrix}

= 

\begin{bmatrix}
\begin{array}{c|c}
R_c & C \\
0 & 1 
\end{array}
\end{bmatrix}^{-1}

$$

Let $C$ be a column vector describing the location of the camera-center in world coordinates, and let $R_c$ be the rotation matrix describing the camera's orientation with respect to the world coordinate axes. Then extrinsic matrix is obtained by inverting the camera's pose matrix.

<blockquote> Algebraically a rotation matrix in $n$-dimensions is a $n \times n$ special orthogonal matrix, i.e. an orthogonal matrix whose determinant is 1. </blockquote>

<div class="sidenote"> We can define matrix $R$ that rotates in the $xy$-Cartesian plane counterclock-wise through an angle $\theta$ about the origin of the Cartesian system as follows:

$$
R = \begin{bmatrix}
\cos\theta & -\sin\theta \\
\sin\theta & \cos\theta
\end{bmatrix}
$$

</div>

<div class="sidenote"> The set of all rotation matrices form a group, known as the special orthogonal group. The inverse of a rotation matrix is its transpose, which is also a rotation matrix. 

$$
\displaylines{
R^T = R^{-1} \\
det(R) = 1
}
$$
</div>

<picture><img src="{{site.baseurl}}/assets/images/rotation.png"></picture>
<div class="caption"> the extrinsic matrix is obtained by inverting the camera's pose matrix </div>

We here use the fact that the inverse of a rotation matrix is its transpose, and inverting a translation matrix simply negates the translation vector. Relationship between the extrinsic matrix parameters and the camera's pose is straightforward:

$$
\displaylines{
R = R^T_c \\
t = -RC
}
$$

<h2> References </h2>
<ul> 
<li><a href="https://ksimek.github.io/2012/08/14/decompose/"> ksimek blog </a></li>
<li><a href="https://prateekvjoshi.com/2014/05/31/understanding-camera-calibration/"> prateekvjoshi blog </a></li>
</ul>


