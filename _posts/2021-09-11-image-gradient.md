---
layout: post
title:  "Understanding and Implementing Image Gradients"
author: seri
categories: [ computer vision ]
image: assets/images/camera/camera.jpeg
tags: featured 
---
<h2> Introduction </h2>
Image gradients are a fundamental building block of many computer vision and image processing routines. We use gradients for:
<ul><li> detecting edges in images, which allows us to find contours and outlines of objects in images </li>
<li> inputs for quantifying images through feature extraction-in fact, image descriptors like HOG (Histogram of Oriented Gradients) or SIFT are bult upon image gradient representations.</li>
<li> constructing saliency map, which highlight the subject of an image. 

In mathematics, the term gradient of a function means how a function is changing with respect to its arguments or independent variables. The gradient term is more frequently used for multi-variable functions. For a single variable function, we refer to this as the slope. 

The gradient of an $N$-variable function at each point is an $N$-D vector with the components given by the derivatives in the $N$-direction. 

For example, for a 3-variable function $f(x,y,z)$ the gradient (if it exists) is given by

$$
\nabla f = \frac{\partialf}{\partialx}i + \frac{\partialf}{\partialy} j + \frac{\partialf}{\partialz}k 
$$

Thus, the gradient provides two pieces of information-magnitude and direction. The direction of the gradient tells us the direction of greatest increase while the magnitude represents the rate of increase in that direction. 

Because gradients are defined only for continuous functions and image is a 2-D discrete function $F(x,y)$. Thus we need to approximate the gradients using Finite Difference Approximation. Instead of $h$ approaching $0$ (i.e. $f'(x) = \lim_{h \rightarrow 0} \frac{f(x+h) - f(x)}{h}$ we assume $h$ to be a fixed (non-zero) value (i.e. $f'(x) \approx \frac{f(x+h)-f(x)}{h}$. Three forms of finite differences are commonly used: forward, backward and central. Forward being the equation above, and backward being 
$$
f'(x) \approx \frac{f(x) - f(x-h)}{h}
$$ 
and central being
$$
f'(x) \approx \frac{f(x+0.5h)-f(x-0.5h)}{h}
$$

For calculating image gradients, we use the central difference to approximate gradients in $x$ and $y$ directions.
In

<h2> What are Image Gradients? </h2>
Conventionally, two Python scripts are built, 1) to compute the gradient magnitude and 2) to compute gradient orientation. Together these computations power traditional computer vision techniques such as SIFT or HOG. 

The main application of image gradients lies within edge detection. Edge detection is the process of finding edges in an image, which reveals structural information regarding the objects in an image. Edges correspond to either boundaries of an object or boundaries of shadowing or light conditions or boundaries of "parts" within an ojbect. 

With an image with detected edges-commonly called edge map, we could then apply contours to extract the actual objects from the region or quantify the shapes so that we can identify them later. Just as image gradients are building blocks for methods like edge detection, edge detection is also a building block for developing a complete computer vision application. 

At each image point, the gradient vector points in the direction of largest possible intensity increase, nad the magnitude corresponds to the rate of change in that direction. Thus, for an image $f(x,y)$, the gradient direction and magnitude is given by:

$$
\lVert \nabla f \rVert = \sqrt{\frac{\partial f}{partial x}+\frac{\partial f}{\partial y}}
$$
$$
\theta = \tan^{-1}(\frac{\partial f}{\partial y}/\frac{\partial f}{\partial x})
$$

Since edges are an abrupt change in the intensity values thus the largest gradient values will occur across an edge (neglecting noise) in an image. The $x$-gradient will find the vertical edges while $y$-gradient will highlight the horizontal edges. Thus, we may conclude that edges are perpendicular to the largest gradient direction.

<h2> Sobel and Scharr Kernels </h2>
Just like we used kernels to smooth and blur an image, we can also use kernels to compute our gradients. The Sobel method actually uses two kernels: one for detecting horizontal changes in direction and the other for detecting vertical changes in direction. We could also use the Scharr kernel instead of the Sobel kernel which may give us better approximations to the gradient.

Overall, gradient magnitude and orientation make for excellent features and image descriptors when quantifying and abstractly representing an image. But for edge detection, the gradient representation is extremely sensitive to local noise. We'll need to add in a few more steps to create an actual robust edge detector.

<h2> References </h2>
<ul> 
<li><a href="https://www.pyimagesearch.com/2021/05/12/image-gradients-with-opencv-sobel-and-scharr/"> pyimagesearch </a></li>
<li><a href="https://theailearner.com/2019/05/11/understanding-image-gradients/"> TheAILearner </a></li>
</ul>


