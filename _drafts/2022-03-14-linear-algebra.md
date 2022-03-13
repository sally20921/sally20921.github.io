---
layout: post
title:  ""
author: seri
categories: [ computer vision ]
image: assets/images/depth/1.jpg
tags: featured
---

<!--more-->

<h2> Introduction </h2>

Machine learning builds mathematical models from data containing multiple attributes (i.e., variables) in order to predict some variables from others. For example, in a cancer prediction problem, each data point might contain the variables obtained from running clinical test, whereas the predicted variable might be a binary diagnosis of cancer. Such models are sometimes expressed as linear and nonlinear relationships between variables. These relationships are discovered in a data-driven manner by optimizing (maximizing) the "agreement" between the models and the observed data. This is an optimization problem. 

Linear algebra is the study of linear operations in vector spaces. An example of a vector space is the infinite set of all possible Cartesian coordinates in two dimensions in relation to a fixed point referred to as the origin, and each vector (i.e., a 2-dimensional coordinate) can be viewed as a member of this set. This abstraction fits in nicely with the way data is represented in machine learning as points with multiple dimensions, albeit with dimensionalityu that is usually greater than 2. These dimensions are also referred to as attributes in machine learning parlance. For example, each patient in a medical application might be represented by a vector containing many attributes, such as age, blood sugar level, inflammatory markers, and so on. It is common to apply linear functions to these high-dimensional vectors in many applciation domains in order to extract their analytical properties. The study of such linear transformations lies at the heart of linear algebra.

While it is easy to visualize the spatial geometry of points/operations in 2 or 3 dimensions, it becomes harder to do so in higher dimensions. For example, it is simple to visualize a 2-dimensional rotation of an object, but it is hard to visualize a 20-dimensional object and its corresponding rotation. This is one of the primary challenges associated with linear algebra. However, with some practice, one can transfer spatial intuitions to higher dimensions. Linear algebra can be viewed as a generalized form of the geometry of Cartesian coordinates in $d$ dimensions. Just as one can use analytical geometry in two dimensions in order to find the intersection of two lines in the plane, one can generalize this concept to any number of dimensions. 

The resulting method is referred to as Gaussian elimination for solving systems of equations, and it is one of the fundamental cornerstones of linear algebra. Indeed, the problem of linear regression, which is fundamental to linear algebra, optimization, and machine learning is closely related to solving systems of equations. This book will introduce linear algebra and optimization with a specific focus on machine learning applications. 

This chapter is organized as follows. The next section introduces the definitions of vectors and matrices and important operations. Section 1.3 closely examines the nature of matrix multiplication with vectors and its interpretation as the composition of simpler transformations on vectors. In Section 1.4, we will introduce the basic problems in machine learning that are used as application examples throughout this booThe resulting method is referred to as Gaussian elimination for solving systems of equations, and it is one of the fundamental cornerstones of linear algebra. Indeed, the problem of linear regression, which is fundamental to linear algebra, optimization, and machine learning is closely related to solving systems of equations. This book will introduce linear algebra and optimization with a specific focus on machine learning applications. 

This chapter is organized as follows. The next section introduces the definitions of vectors and matrices and important operations. Section 1.3 closely examines the nature of matrix multiplication with vectors and its interpretation as the composition of simpler transformations on vectors. In Section 1.4, we will introduce the basic problems in machine learning that are used as application examples throughout this book. Section 1.5 will introduce the basics of optimization, and its relationship with the differnet types of machine learning problems. A summary is given in Section 1.6. 

<h3> Scalars, Vectors, and Matrices </h3>

We start by introducing the notions of scalars, vectors, and matrices, which are the fundamental structures associated with linear algebra. 

<ul><li> Scalars: Scalars are individual numerical values that are typically drawn from teh real domain in most machine learning appllications. For example, the value of an attribute such as Age in machine learning application is a scalar. </li>
<li> Vectors: Vectors are arrays of numerical values (i.e., arrays of scalars). Each such numerical value is also referred to as a coordinate. The individual numerical values of the arrays are referred to as entries, components, or dimensions of the vector, and the number of components is referred to as the vector dimensionality. 

In machine learning, a vector might contain components (associated with a data point) corresponding to numerical values like Age, Salary, and so on. A 3-dimensional vector representation of a 25-year-old person making 30 dollars an hour, and having 5 years of experience might be written as teh array of numbers $[25,30,5]$. </li>

<li> Matrices: Matrices can be viewed as rectangular arrays of numerical values containing both rows and columns. In order to access an element in the matrix, one must specify its row index and its column index. For example, consider a data set in machine learning applciation containing $d$ properties of $n$ individuals. Each individual is allocated a row, and each property is allocated in column. In such a case, we can define a data matrix, in which each row is a $d$-dimensional vector containing the properties of one of the $n$ individuals. The size of such matrix is denoted by the notation $n \times d$. An element of the matrix is accessed with the pair of indices $(i,j)$, where the first element $i$ is the row index, and the second element $j$ is the column index. The row index increases from top to bottom, whereas teh column index increases from left to right. The value of the $(i,j)$ entry of the matrix is therefore equal to the $j$th property of the $i$th individual. When we define a matrix $A = [a_{ij}]$, it refers to the fact that the $(i,j)$th element of $A$ is denoted byu $a_{ij}$. Furthermore, defining $A=[a_{ij}]_{n \times d}$ refers to the fact that the size of $A$ si $n \times d$. When a matrix has the same number of rows as columns, it is referred to as a square matrix. Otherwise, it is referred to as a rectangular matrix. A rectangular matrix with mroe rows than columns is referred to as tall, whereas a matrix with more columns than rows is referred to as wide or fat. </li></ul>

It is possible for scalars, vectors, and matrices to contain complex numbers. This book will occasionally discuss complex-valued vectors when they are relevant to machine learning.

Vectors are special cases of matrices, and scalars are special cases of both vectors and matrices. For example, a scalar is sometimes viewed as a $1 \times 1$ matrix. Similarly, a $d$-dimensional vector can be viewed as a $1 \times d$ matrix when it is treated as a row vector. It can also be treated as a $d \times 1$ matrix when it is a column vector. The addition of the word "row" or "column" to the vector definition is indicative of whether that vector is naturally a row of a large matrix or whether it is a column of a larger matrix. 

By default, vectors are assumed to be column vectors in linear algebra, unless otherwise specified. We always use an overbar on a variable to indicate that it is a vector, although we do nto do so for matrices and scalars. For example, the row vector $[y_1, \dots, y_d]$ of the $d$ values can be denoted by $\bar{y}$ or $\bar{Y}$. In this book, scalars are always represented by lower-case variables like $a$ or $\delta$, whereas matrices are always represented by upper-case variables like $A$ or $\Delta$. 

In the sciences, a vector is often geometrically visualized as a quantity, such as velocity, that has a magnitude as well as a direction. Such vectors are referred to as geometric vectors. For example, imagine a situation where the positive direction of the $X$-axis corresponds to the eastern direction, and the positive direction of the $Y$-axis corresponds to the northern direction. This is also the length of the vector. The vector of the velocity of this person can be written as a directed line from the origin to $[4,3]$. This vector is shown in Figure 1.1(a). In this case, the tail of the vector is at the origin, and the head of the vector is at $[4,3]$. Geometric vectors in the sciences are allowed to have arbitrary tails. For example, we have shown another example of the same vector $[4,3]$ in Figure 1.1(a) in which the tail is placed at $[1,4]$ and the head is placed at $[5,7]$. In contrast to geometric vectors, only vectors that have tails at the origin are considered in linear algebra (although mathematical results, principles, and intuition remain the same). This does not lead to any loss of expressivity. All vectors, operations, and spaces in linear algebra use the origin as an important reference point. 


<h3> Basic Operations with Scalars and Vectors </h3>

Vectors of the same dimensionality can be added or subtracted. For example, consider two $d$-dimensional vectors $\bar{x} = [x_1, \dots, x_d]$ and $\bar{y} = [y_1, \dots, y_d]$ in a retail application, where the $\Lambda$ component is $x_i + y_i$. 

$$
\bar{x} + \bar{y} = =[x_1, \dots, x_d] + [y_1, \dots, y_d] = [x_1+y_1, \dots, x_d + y_d]
$$

Note that vector addition and subtraction follow the same rules in linear algebra as for geometric vectors, except that the tails of the vectors are always origin rooted. Nevertheless, the diagonal abstraction still help in the computation of $(\bar{A} - \bar{B})$. One wayu of visualizing vector addition (in terms of teh velocity abstraction) is that if a platform moves on the ground with velocity $[1,4]$, and if the person walks on the platform (relative to it) with velocity $[4,3]$, then the overall velocity of the person relative to the ground is $[5,7]$.

It is possible to multiply a vector with a scalar by multiplying each component of the vector with the scalar. Consider a vector $\bar{x} = [x_1, \dots, x_d]$, which is scaled by a factor of $\alpha$:

$$
\bar{x}' = \alpha \bar{x} = [a x_1, \dots, a x_d]
$$

For example, if the vector $\bar{x}$ contains the number of units sold of each product, then one can use $ \alpha = 10^{-6}$ to convert units sold into number of millions of units sold. The scalar multiplication operation simply scales the length of teh vector, but does not change its direction (i.e., relative values of different components). The notion of "length" is defined more formally in terms of the norm of the vector, which is discussed below.

Vectors can be multiplied with the notion of the dot product. The dot product between two vectors, $\bar{x} = [x_1, \dots, x_d]$ and $\bar{y} = [y_i, \dots, y_d]$ is the sum of the element-wise multiplication of their individual components. The dot product of $\bar{x}$ and $\bar{y}$ is denoted by $\bar{x} \cdot \bar{y}$ (with a dot in the middle) and is formally defined as follows:

$$
\bar{x} \cdot \bar{y} = \sum_{i=1}^d x_i y_i
$$

Consider a case where we have $\bar{x} = [1,2,3]$ and $\bar{y} = [6,5,4]$. In such as case, the dot product of these two vectors can be computed as follows:

$$
\bar{x} \cdot \bar{y} = (1)(6) + (2)(5) + (3)(4) = 28
$$

The dot product is a special case of a more general operation, referred to as the inner product, and it preserves many fundamental rules of Euclidean geometry. The space of vectors that includes a dot product operation is referred to as a Euclidean space. The dot product is a commutative operation:

$$
\bar{x} \cdot \bar{y} = \sum_{i=1}^{d} x_i y_i = \sum_{i=1}^d y_i x_i = \bar{y} \bar{x}
$$

The dot product also inherits the distributive property of scalar multiplication:

$$
\bar{x} \cdot (\bar{y} + \bar{z}) = \bar{x} \cdot \bar{y} + \bar{x} \cdot \bar{z}
$$

The dot product of a vector, $\bar{x} = [x_1, \dots, x_d]$ with itself is referred to as its squared norm or Euclidean norm. The norm defines the vector length and is denoted by $\lVert \cdot \rVert$:

$$
\lVert \bar{x}^2 \rVert = \sum_{i=1}^d x_i^2
$$

The norm of the vector is the Euclidean distance of its coordinates from the origin. In the case of Figure 1.1.(a), the norm of the vector $[4,3]$ is $\sqrt{4^2+3^2} = 5$. Often, vectors are normalized to unit length by dividing them with their norm:

$$
\bar{x}' = \frac{\bar{x}}{\lVert \bar{x}' \rVert}
$$

Scaling a vector by its norm does not change the relative values of its components, which define the direction of the vector. For example, the Euclidean distance of $[4,3]$ from the origin is $5$. Dividing each component of the vector $5$ results in the vector $[4/5, 3/5]$ which changes the length of the vector to 1, but not its direction. This shortened vector is shown in Figure 1.1(c), and it overlaps with the vector $[4,3]$. The resulting vector is referred to as a unit vector. 

Dot products satisfy the Cauchy-Schwarz inequality, according to which the dot product between a pair of vectors is bounded above by the product of their lengths:

$$
\lVert \bar{x} \bar{y} \leq \lVert \bar{x} \rVert \lVert \bar{y} \rVert
$$

The Cauchy-Schwarz inequality can be proven by first showing that $\lVert \bar{x} \bar{y} \rVert \leq 1$ when $\bar{x}$ and $\bar{y}$ are unit vectors (i.e., the result hold s when the arguments are unit vectors). This is because both $\lVert \bar{x} - \bar{y} \rVert^2 = 2 - 2 \bar{x} \bar{y}$ and $\lVert \bar{x} + \bar{y} \rVert^2 = 2 + 2 \bar{x} \bar{y}$ are nonnegative. This is possible only when $\lvert \bar{x} \cdot \bar{y} \rvert \leq 1$. One can then generalize this result to arbitrary length vectors by observing that the dot product scales up linearly with the norms of hte underlying arguments. Therefore, one can scale up both sides of the inequality with the norms of the vectors.


<span class="theorem"> <span class="highlight"> Triangle Inequality </span> Consider the triangle formed by the origin, $\bar{x}$, and $\bar{y}$. Use the Cauchy-Schwarz inequality to show that the side length $\lVert \bar{x} - \bar{y}$ \rVert$ is not greater than the sum $\lVert \bar{x} \rVert + \lVert \bar{y} \rVert$ of the other two sides. </span>

A hint for solving the above problem is that both sides of the triangle inequality are nonnegative. Therefore, the inequality is true if and only if it holds after squaring both sides. 

The Cauchy-Schwarz inequality shows that the dot product between a pair of vectors is no greater than the product of vector lengths. In fact, the ratio between these two quantities is the cosine of the angle between the two vectors (which is always less than 1). For example, one often represents the coordinates of a $2$-dimensional vector in polar form as $[a, \theta]$, where $a$ is the length of the vector, and $\theta$ is the counter-clockwise angle the vector makes with the $X$-axis. The Cartesian coordinates are $[a\cos{\theta}, a \sin{\theta}]$, and the dot product of this Cartesian coordinate vector with $[1,0]$ (the $X$-axis) is $a \cos{\theta}$. As another example, consider two vectors with length 2 and 1, respectively, which make (counter-clockwise) angles of $60^\circ$ and $-15^\circ$ with respect  to the $X$-axis in a 2-dimensional setting. These vectors are shown in Figure 1.2. The coordinates of these vectors are $[2\cos{60}, 2\sin{60}]$ and $[\cos{-15}, \sin{-15}]$. 


The cosine function between two vectors $\bar{x} = [x_1, \dots, x_d]$ and $\bar{y} = [y_i, \dots, y_d]$ is algebraically defined by the dot product between two vectors after scaling them to unit norm. 



<picture><img src="{{site.baseurl}}/assets/images/disparity.png"></picture>

<h2> References </h2>
<ul><li><a=href=""> TheAILearner </a></li>
</ul>

