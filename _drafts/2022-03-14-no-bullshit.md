---
layout: post
title:  ""
author: seri
categories: [ computer vision ]
image: assets/images/depth/1.jpg
tags: featured
---

<!--more-->

<h2> Vectors </h2>

<span class="definition"> The two dimensional vector $\rightarrow{v} \in \rightarrow{R}^2$ is squivalent to a pair of numbers $\rightarrow{v} \equiv (v_x, v_y)$. We call $v_x$ the $x$-component of $\rightarrow{v}$ and $v_y$ is the $y$-component of $\rightarrow{v}$. </span>

<h3> Vector Representations </h3>

We'll use three equivalent ways to denote vectors:

<ul><li> $\rightarrow{v} = (v_x, v_y)$: component notation, where the vector is represented as a pair of coordinates with respect to the $x$-axis and the $y$-axis. </li>
<li> $\rightarrow{v} = v_x \hat{i} + v_y \hat{j}$: unit vector notation, wher the vector is expressed in terms of the unit vectors $\hat{i} = (1,0)$ and $\hat{j}=(0,1)$. </li>
<li> \rightarrow{v} = $\lVert \rightarrow{v} \rVert \angle \theta$: length-and-direction notation, where the vector is expressed in terms of its length $\lVert \rightarrow{v} \rVert$ and the angle $\theta$ that the vector makes with the $x$-axis. </li></ul>

These three notations describe different aspects of vectors, and we will use them throughout the rest of the book. We'll learn how to convert between them-both algebraically (with pen, paper and calculator) and intuitively (by drawing arrows).

<h3> Vector Operations </h3>

Consider two vectors $\rightarrow{u} = {u_x, u_y}$ and $\rightarrow{v} = (v_x, v_y)$ and assume that $\alpha \in \mathbb{R}$ is an arbitrary constant. The following operations are defined for these vectors:

$$
\begin{aligned}
\rightarrow{u}+\rightarrow{v} = (u_x+v_x,u_y+v_y) \\
\rightarrow{u}-\rightarrow{v} = (u_x - v_x, u_y - v_y) \\
\alpha \rightarrow{u} = (\alpha u_x, \alpha u_y) \\
\rightarrow{u} \cdot \rightarrow{v} = u_x v_x + u_y v_y \\
\lVert \rightarrow{u} \rVert = \sqrt{\rightarrow{u} \cdot \rightarrow{u}} = \sqrt{u_x^2 + u_y^2}
\end{aligned}
S
We will also sometimes simply use the letter $u$ to denote the length of $\rightarrow{u}$. 

$$
\rightarrow{u} \times \rightarrow{v} = (u_y v_z - u_z v_y, u_z v_x - u_x v_z, u_x v_y - u_y v_x)
$$

The cross product is only defined for three-dimensional vectors like $\rightarrow{u} = (u_x, u_y, u_z)$ and $\rightarrow{v} = (v_x, v_y, v_z)$ 

Pay careful attention to the dot product and the cross product. Although they're called products, these operations behave much differently than taking the product of two numbers. Also note, there is no notion of vector division. 

<h3> Vector Algebra </h3>

<h4> Addition and Subtraction </h4>

Just like numbers, you can add vectors and subtract them. 

$$
\begin{aligned}
\rightarrow{v}+\rightarrow{w} = (v_x, v_y) + (w_x, w_y) = (v_x+w_x, v_y+w_y) \\
\rightarrow{v} - \rightarrow{w} = (v_x, v_y) - (w_x, w_y) = (v_x-w_x, v_y-w_y)
\end{aligned}
$$

and solve all kinds of equations where the unknown variable is a vector. This is not a formidably complicted new development in mathematics. Performing arithmetic calculations on vectors simply requires carrying out arithmetic operations on their components. Given two vectors, $\rightarrow{v}=(4,2)$ and $\rightarrow{w}=(3,7)$, their difference is computed as $\rightarrow{v} - \rightarrow{w} = (4,2) - (3,7) = (1, -5)$ 

<h4> Scaling </h4>

We can also scale a vector by any number $\alpha \in \mathbb{R}$:

$$
\alpha \rightarrow{v} = (\alpha v_x, \alpha v_y)
$$

where each component is multiplied by the scaling factor $\alpha$. Scaling changes the length of a vector. If $\alpha > 1$ the vector will get longer, and $0 \leq \alpha 1$ then the vector will bSecome shorter. If $\alpha$ is a negative number, the scaled vector will point in the opposite direction. 

<h4> Length </h4>

A vector's length is obtained from Pythagoras' theorem. Imagine a right-angle triangle with one side of length $v_x$ and the other side of length $v_y$; the length of the vector is equal to the length of the triangle's hypotenuse: 

$$
\lVert \rightarrow{v} \rVert = \sqrt{v_x^2 + v_y^2}
$$

A common technique is to scale a vector $\rightarrow{v}$ by one over its length to obtain a unit-length vector that points in the same direction as $\rightarrow{v}:

$$
\hat{v}
$$

Unit vectors (denoted with a hat instead of an arrow) are useful when you want to describe only a direction in space without any specific length in mind. Verify that $\lVert \hat{v} \rVert = 1$. 

<h3> Vectors as Arrows </h3>

So far we described how to perform algebraic operations oin vectors in terms of their components. Vector operations can also be interpreted geometrically, as operations on two-dimensional arrows in the Cartesian plane. 

<h4> Vector Addition </h4>

The sum of two vectors corresponds to the combined displacement of the two vectors. The diagram on the right illustrates teh addition of two vectors, $\rightarrow{v_1} = (3,0)$ and $\rightarrow{v_2} = (2,2)$. The sum of the two vectors is the vector $\rightarrow{v_1}+\rightarrow{v_2} = (3,0)+(2,2)=(5,2)$. 

<h4> Vector Subtraction </h4>

Before we describe vector subtraction, note that multiplying a vector by a scaling factor $\alpha = -1$ gives a vector of the same length as the original, but pointing in the opposite direction. This fact is useful if you want to subtract two vectors using the graphical approach. Subtracting a vector is teh same as adding the negative of the vector. 

$$
\rightarrow{w} - \rightarrow{v_1} = \rightarrow{w} + (- \rightarrow{v_1}) = \rightarrow{v_2}
$$

The diagram on the right illustrates the graphical procedure for subtracting the vector $\rightarrow{v_1} = (3,0)$ from the vector $\rightarrow{w} = (5,2)$. Subtraction of $\rightarrow{v_1} = (3,0)$ is the same as addition of $-\rightarrow{v_1} = (-3,0)$.

<h4> Scaling </h4>

The Scaling operation acts to change the length of a vector. Suppose we want to obtain a vector in the same direction as the vector $\rightarrow{v} = (3,2)$, but half as long. "Half as long" corresponds to a scaling factor of $\alpha = 0.5$. The scaled-down vector is $\rightarrow{w} = 0.5 \rightarrow{v} = (1.5, 1)$ 

<h4> Length-and-direction representation </h4>

So far we've seen how to represent a vector in terms of its components. There is also another way of representing vectors: we can specify a vector in terms of its length $\lVert \rightarrow{v} \rVert$ and its direction-the angle it makes with the $x$-axis. For example, the vector $(1,1)$ can also be written as $\sqrt{2} \angle 45^\circ$. This magnitude-and-direction notation is useful because it makes it easy to see the size of vectors. On the other hand, vector arithmetic operations are much easier to carry out in the component notation. We will use the following formulas for converting between the two notations. 

To convert the length-and-direction vector $\lVert \rightarrow{r} \rVert \angle \theta$ into an $x$-component and a $y$-component $(r_x, r_y)$, use the formulas 

$$
\begin{aligned}
r_x = \lVert \rightarrow{r} \rVert \cos \theta \\
r_y = \lVert \rightarrow{r} \rVert \sin \theta
\end{aligned}
$$

To convert from component notation $(r_x, r_y)$ to length-and-direction $\lVert \rightarrow{r} \rVert \angle \theta$, use 

$$
\begin{aligned}
r = \lVert \rightarrow{r} \rVert = \sqrt{r_x^2 + r_y^2} \\
\theta = \tan^{-1} (\frac{r_y}{r_x})
\end{aligned}
$$

Note that the second part of the equation involves the inverse tangent function. By convention, the function $\tan^{-1}$ returns values between $\pi/2$ and $-\pi/2$. You must be careful when finding the $\theta$ of vectors with an angle outside of this range. Specifically, for vectors with $v_x < 0$, you must add $\pi$ to $\tan^{-1})(r_y/r_x)$ to obtain the correct $\theta$. 

<h3> Determinants </h3>

A parallelpiped is a box whose opposite faces are parallel but whose sides are slanted. How do we compute the volume of a parallelpiped? The determinant tool is the perfect tool for this purpose. 

$$
\operatorname{det}: \mathbb{R}^{n \times n} \rightarrow \mathbb{R} 
$$

The determinant of a matrix, denoted $\operatorname{det}(A)$ or $|A|$, is a particular way to multiply the entries of the matrix to produce a single number. We use determinants for all kinds of tasks: to compute areas and volumes, to solve systems of equations, to check whether a matrix is invertible or not. 

We can interpret the determinant of a matrix intuitively as a geometrical calculation. The determinant is the "volume" of the geometric shape whose edges are the rows of the matrix. For $2 \times 2$ matrices, the determinant corresponds to the area of parallelogram. For $3 \times 3$ matrices, the determinant corresponds to the volume of a parallelpiped. For dimensions $d>3$, we say the determinant measures a $d$-dimensional hyper-volume. 

Consider the linear transformation $T: \mathbb{R}^2 \rightarrow \mathbb{R}^2$ defined through the matrix-vector product with a matrix $A_T: T(\vec{x}) \equiv A_T(\vec{x})$. The determinant of the matrix $A_T$ is the scale factor associated with the linear transformation $T$. The scale factor of the linear transformation $T$ describes how the area of a unit square in the input space (a square with dimension $1\times1$) is tranformed by $T$. After passing through $T$, the unit square is transformed to a parallelogram with area $\operatorname{det}(A_T)$. 

Linear transformations that shrink area have $\operatorname{det}(A_T)<1$, while linear transformations that enlarge areas have $\operatorname{det}(A_T)>1$. A linear transformation that is area preserving has $\operatorname{det}(A_T)=1$. 

The determinant is also used to check linear independence for a given set of vectors. We construct a matrix using the vectors as the matrix rows, and compute its determinant. If the determinant is nonzero, the vectors are linearly independent. 

The determinant of a matrix tells us whether or not that matrix is invertible. If $\operatorname{det}(A) \neq 0$, then $A$ is invertible; if $\operatorname{det}(A) = 0$, $A$ is not invertible. The determinant shares a connection with the vector cross product, and is also used in the definition of the eigenvalue equation. 


<h4> Formulas </h4>




<picture><img src="{{site.baseurl}}/assets/images/disparity.png"></picture>

<h2> References </h2>
<ul><li><a=href=""> TheAILearner </a></li>
</ul>

