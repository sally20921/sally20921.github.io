---
layout: post
title:  "Guide to Linear Algebra (Part 1)"
author: seri
categories: [ linear algebra ]
image: assets/images/linear.png
tags: featured 
excerpt: "This article goes through the fundamentals of linear algebra. Linear algebra is the branch of mathematics concerning linear equations and their representations in vector spaces. This ultimate guide will prove very useful or understanding deep learning techniques."
---

<!--more-->

<h2> Computational Linear Algebra </h2>

This chapter covers the computational aspects of performing matrix calculations. Understanding matrix computations is important because all later chapters depend on them. Suppose we're given a huge matrix $ A \in R^{n \times n} $ with $ n=1000 $. Hidden behind the innocent-looking mathematical notation of the matrix inverse $A^{-1}$, the matrix product $AA$, and the matrix determinant $ \| A \|$, lie monster coputations involving all the $1000 \times 1000 = 1$ million entries of the matrix $A$. Millions of arithmetic operations must be performed, so I hope you have at least a thousand pencil ready!

Okay, calm down. I won't actually make you calculate millions of arithmetic operations. In fact, to learn linear algebra, it is sufficient to know how to carry out calculations with $3 \times 3$ and $4 \times 4$ matrices. Even for such moderately sized matrices, computing products, inverses, and determinants by hand are serious computational tasks. If you're ever required to take a linear algebra final exam, you need to make sure you can do these calculations quickly. Even if no exam looms in your imminent future, it's important to practice matrix operations by hand to get a feel for them. 

This chapter will introduce you to the following computational tasks involving matrices:
<ul><li><span class="blue">Gauss-Jordan elimination </span> Suppose we're trying to solve two equations in two unknowns $x$ and $y$:

$$ 
\displaylines{
ax+by = c \\\
dx+ ey= f
}
$$

If we add $\alpha$\times the first equation to the second equation, we obtain an equivalent system of equations:

$$
\displaylines{
ax + by = c \\\
(d + \alpha a)x + (e + \alpha b)y = f + \alpha c
}
$$

This is called a <span class="highlight-sketch"> row operation </span>: we added $\alpha$-times the first row to the second row. Row operations change the coefficient of the system of equations, but leave the solution unchanged. Gauss-Jordan elimination is a systematic procedure for solving systems of linear equations using row operations. </li>
<li> <span class="blue"> Matrix product </span> The product $AB$ between matrices $A \in \mathbb{R}^{m \times l}$ and $B \in \mathbb{R}^{l \times n}$ is the matrix $C \in \mathbb{R}^{m \times n}$ whose coefficients $c_{ij}$ are defined by the formula $c_{ij} = \sum_{k=1}^{l}a_{ik}b_{kj}$ for all $i \in \lbrack 1, \dots, m \rbrack $ and $j \in \lbrack 1, \dots, n \rbrack $. We'll soon unpack this formula and learn about its intuitive interpretation: that computing $C = AB$ is computing all the dot products between the rows of $A$ and the columns of $B$. </li>
<li><span class="blue"> Determinant </span> The determinant of a matrix $A$, denoted $|A|$ is an operation that gives us useful information about the linear independence of the rows of the matrix. The determinant is connected to many notions of linear algebra: linear independence, geometry of vectors, solving systems of equations, and matrix invertibility. We'll soon discuss these aspects. </li>
<li><span class="blue"> Matrix inverse </span> We'll build upon our knowledge of Gauss-Jordan elimination, matrix products, and determinants to derive three different procedures for computing the matrix inverse $A^{-1}$.</li></ul>

<h3> Reduced Row Echelon Form </h3>
In this section, we'll learn to solve systems of linear equations using the Gauss-Jordan elimination procedure. A system of equations can be represented as a matrix of coefficients. The Gauss-Jordan elimination procedure converts any matrix into its <span class="highlight-sketch"> <b> reduced row echelon form (RREF) </b></span>. We can easily find the solution (or solutions of the system of equations from the RREF.

Listen up: the material covered in this section requires your full on, caffeinated attention, as the procedures you'll learn are somewhat tedious. Gauss-Jordan elimination involves many repetitive mathematical manipulations of arrays of numbers. It's important you hang in there and follow through the step-by-step manipulations, as well as verify each step I present on your own with pen and paper. 

<h4> Solving Equations </h4>
Suppose you're asked to solve the following system of equations:

$$
\displaylines{
1x_1 + 2x_2  = 5 \\\
3x_1 + 9x_2 = 21}
$$

The standard approach is to use one of the equation-solving tricks we learned to combine the equations and find the values of the two unknowns $x_1$ and $x_2$.

Observe that the names of the two unknowns are irrelevant to the solution of the system of equations. Indeed, the solution $(x_1, x_2)$ to the above system of equations is the same as the solution $(s,t)$ to the system of equations 

$$
\displaylines{
1s+ 2t = 5 \\\
3s+ 9t = 21}
$$

The important parts of a system of linear equations are the <span class="highlight-yellow"> coefficients </span> in front of the variables and the constants on the right-hand side of each equation. 

<h4> Augmented Matrix </h4>
The system of linear equations can be written as an <span class="highlight-green"> augmented matrix </span>:

$$
\begin{pmatrix} 1 & 2 &\bigm | & 5 \\\
                3 & 9 &\bigm | & 21
\end{pmatrix}
$$

The first column corresponds to the coefficients of the first variable, the second column is for the second variable, and the last column corresponds to the constants of the right-hand side. It is customary to draw a vertical line where the equal signs in the equations would normally appear. This line helps distinguish the coefficients of the equations from the column of constants on the right-hand side.

Once we have the augmented matrix, we can simplify it by using <span class="highlight-yellow"> row operations </span> (which we'll discuss shortly) on its entries. After simplification by row operations, the augmented matrix will be transformed to 

$$
\begin{pmatrix}
1 & 0 &\bigm | & 5 \\\
0 & 1 &\bigm | & 2
\end{pmatrix}

$$

which corresponds to the system of equations

$$
\displaylines{
x_1 = 1 \\\
x_2 = 2}
$$

This is a <span class="monospace"> trivial </span> system of equations; there is nothing left to solve and we can see that the solutions are $x_1 = 1$ and $x_2 = 2$. This example illustrates the general idea of the Gauss-Jordan elimination procedure for solving the system of equations by manipulating an augmented matrix.

<h4> Row Operations </h4>
We can manipulate the rows of an augmented matrix without changing its solutions. We're allowed to perform the following three types of row operations:

<ul><li> Add a multiple of one row to another row </li>
<li> Swap the position of the two rows </li>
<li> Multiply a row by a constant </li></ul>

Let's trace the sequence of row operations needed to solve the system of equations 

$$
\displaylines{x_1 + 2x_2 = 5 \\\
3x_1 + 9x_2 = 21}
$$

starting from its augmented matrix:

$$
\begin{pmatrix}
1 & 2 &\bigm | & 5 \\\
3 & 2 &\bigm | & 21
\end{pmatrix}
$$

1. As a first step, we eliminate the first variable in the second row by subtracting three times the first row from the second row.

$$ 
\begin{pmatrix}
1 & 2 &\bigm | & 5 \\\
0 & 3 &\bigm | & 6
\end{pmatrix}
$$

We denote this row operation as $R_2 \leftarrow R_2 - 3R_1$.

2. To simplify the second row, we divide it by 3 to obtain 

$$ 
\begin{pmatrix}
1 & 2 &\bigm | & 5 \\\
0 & 1 &\bigm | & 2 
\end{pmatrix}
$$

This row operation is denoted $R_2 \leftarrow \frac{1}{3}R_2$. 

3. The final step is to eliminate the second variable from the first row. We do this by subtracting two times the second row from the first row $R_1 \leftarrow R_1 - 2 R_2$:

$$
\begin{pmatrix}
1 & 0 &\bigm | & 1 \\\
0 &  1 &\bigm | & 2
\end{pmatrix}
$$

We can now read off the solution: $x_1 =1$ and $x_2 = 2$. 

Note how we simplified the augmented matrix through a specific procedure: we followed the <span class="rainbow"> Gauss-Jordan elimination algorithm </span> to bring the matrix into its reduced row echelon form.

The reduced row echelon form (RREF) is the simplest form for an augmented matrix. Each row contains a <span class="circle-sketch-highlight"><b> leading one </b></span> (a numeral 1) also known as a <span class="circle-sketch-highlight"> <b>pivot </b></span>. Each column's pivot is used to eliminate the numbers that lie below and above it in the same column. The end result of this procedure is the reduced row echelon form:

$$
\begin{pmatrix}
1 & 0 & \ast & 0 &\bigm | \ast \\\
0 & 1 & \ast & 0 &\bigm | \ast \\\
0 & 0 & 0 & 1 &\bigm | \ast
\end{pmatrix}
$$

Note the matrix contains only zero entries below and above the pivots. The asterisks $\ast$ denote arbitrary numbers that could not be eliminated because no leading one is present in these columns.

<div class="definition">The solution to a system of linear equations in the variables $x_1, x_2, \dots, x_n$ is the set of values $\{(x_1, x_2, \dots, x_n)\}$ that satisfy all the equations.</div>

<div class="definition"> Gaussian elimination is the process of bringing a matrix into row echelon form. </div>
<div class="definition"> A matrix is said to be in row echelon form (REF) if all entries below the leading ones are zero. This form can be obtained by adding or subtracting the row with the leading one from the rows below it. </div>
<div class="definition"> Gaussian-Jordan elimination is the process of bringing a matrix into reduced row echelon form. </div>
<div class="definition"> A matrix is said to be in reduced row echelon form (RREF) if all the entries below and above the pivots are zero. Starting from the REF, we obtain the RREF by subtracting the row containing the pivots from the rows above them.</div>
<div class="definition"> the rank of the matrix $A$ is the number of pivots in the RREF of $A$. </div>

<h3> Number of Solutions </h3>

A system of linear equations in three variables could have:
<ul><li><span class="rainbow"> one solution </span> If the RREF of a matrix has a pivot in each row, we can read off the values of the solution by inspection. 

$$

\begin{bmatrix}
1 & 0 & 0 & c_1 \\\
0 & 1 & 0 & c_2 \\\
0 & 0 & 1 & c_3
\end{bmatrix}

$$

The unique solution is $x_1 = c_1$, $x_2 = c_2$, and $x_3 = c_3$. </li>
<li><span class="rainbow"> Infinitely many solutions 1 </span> If one of the equations is redundant, a row of zeros will appear when the matrix is brought to the RREF. This happens when one of the original equations is a linear combination of the other two. In such cases, we're really solving two equations  in three variables, so can't pin down one of the unknown variables. We say the solution contains <span class="underline"> a free variable </span>. For example, consider the following RREF:

$$
\begin{bmatrix} 
1 & 0 & a_1 & c_1 \\\
0 & 1 & a_2 & c_2 
\end{bmatrix}
$$

The column that doesn't contain a leading one corresponds to the free variable. To indicate that $x_3$ is a free variable, we give it a special label $x_3 \equiv t$. The variable $t$ could be any number $t \in \mathbb{R}$. In other words, when we say $t$ is free, it means $t$ can take on any value from $-\infty$ to $+\infty$. The information in the augmented matrix can now be used to express $x_1$ and $x_2$ in terms of the right-hand constants and the free variable $t$:

$$
\begin{Bmatrix} x_1 = c_1 - a_1 t \\ x_2 = c_2 - a_2 t \\ x_3 = t, \forall t \in \mathbb{R} \end{Bmatrix} = \begin{Bmatrix} \begin{bmatrix} c_1 \\ c_2 \\ 0 \end{bmatrix} + t \begin{bmatrix} -a_1 \\ -a_2 \\ 1 \end{bmatrix}, \forall t \in \mathbb{R}\end{Bmatrix}
$$.

The solution corresponds to the equation of a line passing through the point $(c_1, c_2, 0)$ with direction vector $(-a_1, -a_2, 1)$. We'll discuss the geometry of lines in the next section. For now, it's important that you understand that a system of equations can have more than one solution; any point on the line $l \equiv \{(c_1, c_2, 0) + t(-a_1, -a_2, 1), \forall t \in \mathbb{R}\}$ is a solution to the above system of equations. </li>
<li><span class="rainbow"> Infinitely many solutions 2 </span> It's also possible to obtain a two-dimensional solution space. This happens when two of the three equations are redundant. In this case, there will be a single leading one, and thus two free variables. For example, in the RREF

$$
\begin{bmatrix} 
0 & 1 & a_1 & c_1 \\\ 
0 & 0 & 0 & 0 \\\ 
0 & 0 & 0 & 0 
\end{bmatrix}
$$

the variables $x_1$ and $x_3$ are free. As in the previous infinitely-many-solutions case, we define new labels for the free variables $x_1 \equiv s$ and $x_3 \equiv t$, where $ s \in \mathbb{R}$ and $t \in \mathbb{R}$ are two arbitrary numbers. The solution to this system of equations is 

$$ 
\begin{Bmatrix} 
x_1 = s \\ x_2 = c_2 - a_2 t \\ x_3 = t , \\ \forall s,t \in \mathbb{R} \end{Bmatrix} = \begin{Bmatrix} \begin{bmatrix} 0 \\ c_2 \\ 0 \end{bmatrix} + s \begin{bmatrix} 1 \\ 0 \\ 0 \end{bmatrix} + t \begin{bmatrix} 0 \\ -a_2 \\ 1 \end{bmatrix}, \forall s,t \in \mathbb{R} 
\end{Bmatrix} 
$$

This solution set corresponds to the parametric equation of a plane that contains the point $(0,c_2, 0)$ and the vectors $(1,0,0)$ and $(0, -a_2, 1)$. 

The general equation for the solution plane is $0x+1y+a_2z = c_2$, as can be observed from the first row of the augmented matrix. In the next section, we'll learn more about the geometry of planes and how to convert between their general and parametric forms. </li>
<li><span class="rainbow"> no solutions </span> If there are no numbers $(x_1, x_2, x_3)$ that simultaneously satisfy all three equations, the system of equations has no solution. An example of a system of equations with no solution is the pair $ s+t = 4$ and $s+t = 44$. There are no numbers $(s,t)$ that satisfy both these equations. 

A system of equations has no solution if its reduced row echelon form contains a row of zero coefficients with a nonzero constant in the right-hand side:

$$
\begin{Bmatrix}
\begin{array}{ccc|c}
1 & 0 & 0 & c_1 \\\ 
0 & 1 & 0 & c_2 \\\ 
0 & 0 & 0 & c_3 
\end{array}
\end{Bmatrix}
$$

If $c_3 \neq 0$ this system of equations is impossible to satisfy. There is no solution because there are no numbers $(x_1, x_2, x_3)$ such that $0x_1 + 0x_2 + 0x_3 = c_3$. 

Dear reader, we've reached the first moment in this book where you'll need to update your math vocabulary. The solution to an individual equation is a finite set of points. The solution to a system of equations can be an entire space containing infinitely many points, such as a line or a plane. 

The solution set of a system of three linear equations in three unknowns could be either the empty set $\{0\}$ (no solution), a set with one element $\{(x_1, x_2, x_3)\}$, or a set with infinitely many elements like a line $\{p_o + t \overrightarrow{v}, t \in \mathbb{R}\}$ or a plane $\{p_o + s \overrightarrow{v} + t \overrightarrow{w}, s,t \in \mathbb{R}\}$. Another possible solution set is all of $\mathbb{R}^3$; every vector $ \overrightarrow{x} \in \mathbb{R}^3 $ is a solution to the equation 

$$
\begin{bmatrix} 0 & 0 & 0 \\ 0 & 0 & 0 \\ 0 & 0 & 0 \end{bmatrix} \begin{bmatrix} x_1 \\ x_2 \\ x_3 \end{bmatrix} = \begin{bmatrix} 0 \\ 0 \\ 0 \end{bmatrix}
$$

Note the distinction between the three types of infinite solution sets. A line is one-dimensional, a plane is two-dimensional, and $\mathbb{R}^3$ is three-dimensional. Describing all points on a line requires one parameter, describing all points on a plane takes two parameters, and-of course-describing a point in $\mathbb{R}^3$ takes three parameters. 

<h3> Geometric Interpretation </h3>
We can gain some intuition about solution sets by studying the geometry of the intersections of lines in $\mathbb{R}^2$ and planes in $\mathbb{R}^3$. 

<h4> Lines in two dimensions </h4>
Equations of the form $ax+by = c$ corresponds to lines in $\mathbb{R}^2$. Solving systems of linear equations of the form

$$
\displaylines{
a_1 x + b_1 y = c_1 \\\
a_2 x + b_2 y = c_2
}
$$

requires finding the point $(x,y) \in \mathbb{R}^2$ where these lines intersect. There are three possibilities for the solution set:
- <span class="highlight-sketch"> one solution </span> if the two lines intersect at a point. 
- <span class="highlight-sketch"> infinitely many solutions </span> if the lines are superimposed.
- <span class="highlight-sketch"> no solution </span> if the two lines are parallel and never intersect.

<h4> Planes in three dimensions </h4>
Equations of the form $ax+by+cz = d$ correspond to planes in $\mathbb{R}^3$. When solving three such equations, 

$$ 
\displaylines{
a_1 x + b_1 y + c_1 z = d_1 \\\
a_2 x + b_2 y + c_2 z = d_2 \\\
a_3 x + b_3 y + c_3 z = d_3
}
$$

we want to find a set of points $(x,y,z)$ that satisfy all three equations simultaneously. There are four possibilities for the solution set:

1. <span class="highlight-green"> one solution </span> three non-parallel planes intersect at a point. 
2. <span class="highlight-yellow"> infinitely many solutions 1 </span> if only one of the plane equations is redundant, the solution corresponds to the intersection of two planes which is a line.
3. <span class="highlight-green"> infinitely many solutions 2 </span> if two of the equations are redundant, then the solution space is a two-dimensional space. 
4. <span class="highlight-yellow"> if two (or more) of the planes are parallel, they will never intersect. </span>

<h3> Determinants </h3>
<h4> Overview </h4> 
What is the volume of a rectangular box of length $1m$, width $2$ and height $3m$? It's easy to compute the volume of this box because its shape is right rectangular prism. The volume of this prism is $V = l \times w \times h = 6m^3$. What if the shape of the box was a parallelpiped instead? A parallelpiped is a box whose opposite faces are parallel but whose sides are slanted. How do we compute the volume of a parallelpiped? The determinant operation, specifically the $3 \times 3$ determinant, is the perfect tool for this purpose. 

The determinant of a matrix, denoted $det(A)$ or $|A|$, is a particular way to multiply the entries of the matrix to produce a single number. We use determinants for all kinds of tasks: to compute areas and volumes, to solve systems of linear equations, to check whether a matrix is invertible or not, etc.

We can interpret the determinant of a matrix intuitively as a geometrical calculation. The <span class="blue"> determinant </span> is the <span class="blue"> volume </span> of the geometric shape whose edges are the rows of the matrix. For $2 \times 2$ matrices, the determinant corresponds to the area of a parallelogram. For $3 \times 3$ matices, the determinant corresponds to the volume of a parallelpiped. For dimensions $d > 3$, we say the determinant measures a <span class="blue"> $d$-dimensional hyper-volume </span>.

Consider the linear transformation $T: \mathbb{R}^2 \rightarrow \mathbb{R}^2$ defined through the matrix-vector product with a matrix $A_T: T(\overrightarrow{x}) \equiv A_T \overrightarrow{x}$. The determinant of the matrix $A_T$ is the <span class="blue"> scale factor </span> associated with the linear transformation $T$. The scale factor of the linear transformation $T$ describes <mark> how the area of a unit square in the input space (a square with dimensions $1 \times 1$) is transformed by $T$ </mark>. After passing through $T$, the unit square is transformed to a parallelogram with with area $det(A_T)$. Linear transformations that shrink areas have $det(A_T) < 1$, while linear transformations that enlarge areas have $det(A_T) > 1$. A linear transformation that is area preserving has $det(A+T) = 1$. 

The determinant is also used to check <span class="blue"> linear independence </span> for a given set of vectors. We <span class="underline"> construct a matrix using the vectors as the matrix rows </span>, and compute its determinant. 

The determinant of a matrix tells us whether or not that matrix is <span class="blue"> invertible </span>. If $det(A) \neq 0$, then $A$ is invertible; if $det(A) = 0$, $A$ is not invertible. 

The determinant shares a connection with the <span class="blue"> vector cross product </span>, and is used in the definition of the <span class="blue"> eigenvalue equation </span>.

<h4> Formulas </h4>
The determinant of a $2 \times 2$ matrix is 

$$
det(\begin{bmatrix} a_{11} & a_{12} \\ a_{21} & a_{22} \end{bmatrix}) = \begin{vmatrix} a_{11} & a_{12} \\ a_{21} & a_{22} \end{vmatrix} = a_{11}a_{22} - a_{12}a{21}
$$

The formulas for the determinants of larger matrices are defined recursively. For example, the determinant of $3 \times 3$ matirx is defined in terms of $2 \times 2$ determinants:

$$ 
\begin{vmatrix} a_{11} & a_{12} & a_{13} \\ a_{21} & a_{22} & a_{23} \\ a_{31} & a_{32} & a_{33} \end{vmatrix} = a_{11} 

= a_{11} \begin{vmatrix}a_{22} & a_{23} \\ a_{32} & a_{33} \end{vmatrix} -a_{12} \begin{vmatrix} a_{21} & a_{23} \\ a_{31} & a_{33} \end{vmatrix}+ a_{13} \begin{vmatrix} a_{21} & a_{22} \\ a_{31} & a_{32} \end{vmatrix}
$$ 

There's a neat computational trick for computing $3 \times 3$ determinants by hand. The trick consists of extending the matrix $A$ into a $3 \times 5$ array that contains copies the columns of $A$: the $1^{st}$ column of $A$ is copied to the $4^{th}$ column of the extended array, and the $2^{nd}$ column of $A$ is copied to the $5^{th}$ column. The determinant is then computed by summing the products of the entries on the three positive diagonals and subtracting the products of the entries on the three negative diagonals. 

<picture><img src="{{site.baseurl}}/assets/images/3x3.png"></picture>

The general formula for the determinant of an $n \times n$ matrix is

$$
det(A)  = \sum_{j=1}^{n} (-1)^{1+j} a_{1j} M_{1j}
$$

where $M_{ij}$ is called the <mark> minor </mark> associated with the entry $a_{ij}$. The minor $M_{ij}$ is the determinant of the submatrix obtained by removing the $i^{th}$ row and the $j^{th}$ column of the matrix $A$. Note the alternating factor $(-1)^{i+j}$ that changes value between $+1$ and $-1$ for different terms in the formula.

The determinant of a $4 \times 4$ matrix $B$ is 

$$ 
det(B) = b_{11}M_{11} - b_{12}M_{12} + b_{13}M_{13} - b_{14}M_{14}
$$

The general formula for determinants $det(A) = \sum_{j=1}^{n} (-1)^{1+j} a_{1j} M_{1j}$ assumes we're expanding the determinant along the first row of the matrix. In fact, a determinant formula can be obtained by expanding the determinant along anyrow or column of the matrix.

The expand-along-any-row-or-column nature of determinants can be very handy: if you need to calculate the determinant of a matrix with one row (or column) containing many zero entries, it makes sense to expand along that row since many of the terms in the formula will be zero. If a matrix contains a row (or column) consisting entirely of zeros, we can immediately tell its determinant is zero. 

<h4> Geometric interpretation </h4>
<h5> Area of a parallelogram </h5>
Suppose we're given vectors $overrightarrow{v} = (v_1, v_2)$ and $\overrightarrow{w} = (w_1, w_2)$ in $\mathbb{R}^2$ and we construct a parallelogram with corner points $(0,0), \overrightarrow{v}, \overrightarrow{w}$ and $\overrightarrow{v} + \overrightarrow{w}$.

The area of this parallelogram is equal to the determinant of the matrix that contains $(v_1, v_2)$ and $(w_1, w_2)$ as rows:

$$
area = \begin{vmatrix} v_1 & v_2 \\ w_1 & w_2 \end{vmatrix} = v_1 w_2 - v_2 w_1 
$$

<h2> Theoretical Linear Algebra </h2>
The things we are going to learn now are less concerned with calculations and more about mind expansion. This section extends what we know about the vector space $\mathbb{R}^n$ to the realm of <span class="blue"> abstract vector spaces </span> of <u>vector-like mathematical objects. </u>

<h3> Eigenvalues and Eigenvectors </h3>
The set of <u> eignevectors </u> of a matrix is a special set of input vectors for which the action of the matrix is described as <u> simple scaling </u>. 

Decomposing a matrix in terms of its eigenvalues and its eigenvectors gives valuable insights into the properties of the matrix. Certain matrix calculations, like <b> computing the power of the matrix</b>, become much easier when use the <u> eigendecomposition of the matrix </u>

For example, suppose we're given a square matrix $A$ and want to compute $A^7$. To make this example more concrete, we'll analyze the matrix 
$$
A = \begin{bmatrix} 9 & -2 \\ -2 & 6 \end{bmatrix}
$$

We want to compute $A^7$. That would be an awful lot of matrix multiplications. Every matrix corresponds to some linear operation. This means it's legit to ask, <u> "what does the matrix A do?" </u> Once we figure out this part, we can compute $A^{77}$ by simply doing what $A$ does $77$ times. 

The best way to see what a matrix does is to look inside it and see what it's made of. To understand the matrix $A$, you must find it its eigenvectors and its eigenvalues. The eigenvectors of a matrix are a <span class="rainbow"> natural basis </span> for describing the action ofthe matrix. The eigendecomposition is a change-of-basis operation that expresses the matrix $A$ with respect to its eigenbasis (own-basis). The eigendecompositions of the matrix $A$ is a product of three matrices:






