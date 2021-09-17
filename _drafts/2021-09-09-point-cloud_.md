---
layout: post
title: 'Dense 3D Point Cloud Representation of a Scene Using Uncalibrated Monocular Vision'
author: seri
categories:
    - 'computer vision'
image: assets/images/cnn.png
tags: featured
---  
  
  
<h2> Introduction </h2>
In this blog post, we describe the challenges and existing solutions within the research community regarding reconstructing of a scene using a single camera. Imagery is affected by a variety of components. From the electro-optic sensors to the image resolution, contrast, exposure and blurriness variables, all add to the complexity of analyzing a scene and processing the imagery. 
  
<h2> Monocular Vision </h2>
Traditional stereoscopy systems, such as human visual system, utilize multiple viewing angles of the same object in order to do triangulation and get a depth perception. Monocular vision, better described as vision through a single camera source, presents new challenges when compared to stereo vision or a multi-camera system. In a stereo system, similar to human vision, distances between the cameras (the baseline) and their orientation is known and in most circumstances remains constant. In order to generate various viewing angles with a monocular system, the camera must continuously be moving. With a moving camera, the system obtains two different viewing angles form two points in time. The challenge becomes to accurately compute the distance the camera has traveled or the exact location of the camera at each frame of video. In addition, the orientation of the camera at each point in time must be computed from the scene. 
  
<h2> Visual Structure from Motion </h2>
In his work, Wu et al. describes the methodology of Visual Structure from Motion as following. Using a set of image feature locations and correspondences, the goal of bundle adjustment is to find 3D point positions and camera parameters that minimize the re-projection error. This optimization problem is constructed as a non-linear least squares problem, where the error is the squared <img src="https://latex.codecogs.com/gif.latex?L_2"/> norm of the difference between the observed feature location and the projection of the corresponding 3D point on the image plane of the camera.
  
Wu explains by letting <img src="https://latex.codecogs.com/gif.latex?x"/> be a vector of parameters and <img src="https://latex.codecogs.com/gif.latex?f(x)%20=%20[f_1(x),%20&#x5C;dots,%20f_k(x)]"/> be the vector of residual errors for 3D reconstruction. Then the optimization problem he wishes to solve is the non-linear least squares problem shown in the below equation.
<p align="center"><img src="https://latex.codecogs.com/gif.latex?x*%20=%20&#x5C;argmin_{x}%20&#x5C;sum_{i=1}^{k}%20&#x5C;lVert%20f_i(x)%20&#x5C;rVert^2"/></p>  
  
  
The Levenberg-Marquardt (LM) algorithm is an extremely popular algorithm for solving non-linear least squares problems and is the algorithm choice for bundle adjustment. LM operates by computing a series of regularized linear approximations to the original nonlinear problem. Let <img src="https://latex.codecogs.com/gif.latex?J(x)"/> be the Jacobian of <img src="https://latex.codecogs.com/gif.latex?f(x)"/>, then in each iteration LM solves a linear least squares problem of the form
<p align="center"><img src="https://latex.codecogs.com/gif.latex?&#x5C;delta*%20=%20&#x5C;argmin_{&#x5C;delta}%20&#x5C;lVert%20J(x)&#x5C;delta%20+%20f(x)%20&#x5C;rVert^2%20+%20&#x5C;lambda%20&#x5C;lVert%20D(x)%20&#x5C;delta%20&#x5C;rVert^2"/></p>  
  
and updates <img src="https://latex.codecogs.com/gif.latex?x%20&#x5C;leftarrow%20x%20+%20&#x5C;delta*"/> if <img src="https://latex.codecogs.com/gif.latex?&#x5C;lVert%20f(x+&#x5C;delta*)&#x5C;rVert%20&lt;%20&#x5C;lVert%20f(x)%20&#x5C;rVert"/>. Here <img src="https://latex.codecogs.com/gif.latex?D(x)"/> is a non-negative diagonal matrix, typically the square root of the diagonal of the matrix <img src="https://latex.codecogs.com/gif.latex?J(x)^TJ(x)"/> and <img src="https://latex.codecogs.com/gif.latex?&#x5C;lambda"/> is a nonnegative parameter that controls the strength of regularization. Wu explains that the regularization is needed to ensure a convergent algorithm. LM updates the value of <img src="https://latex.codecogs.com/gif.latex?&#x5C;lambda"/> at each step based on how well the Jacobian <img src="https://latex.codecogs.com/gif.latex?J(x)"/> approximates <img src="https://latex.codecogs.com/gif.latex?f(x)"/>.
  
<h2> SIFT Features </h2>
  
The SIFT algorithm can be broken down into four main stages: 
1. scale-space peak selection
2. point localization
3. orientation assignment
4. point descriptor
The first stage is to search for interest points over location and scale. The image is constructed in a Gaussian Pyramid, where the image is downsampled and blurred at each level. These blurred images at each level are used to compute the Difference of Gaussians (DoG), which locate edges and corners within an image. Interesting points are then extracted in stage 2 by locating the maxima/minimal pixels within different scales of DoG at sub-pixel accuracy. Once interest points have been located, an orientation is assigned based on the gradient orientation of the pixels around the interest point. 
  
Once orientation and scale have been addressed, the final stage is the generation of point descriptors. 
  
d
  