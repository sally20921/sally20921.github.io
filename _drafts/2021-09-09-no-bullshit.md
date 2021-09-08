---
layout: post
title:  "Guide to Linear Algebra"
author: seri
categories: [ linear algebra ]
image: assets/images/linear.png
tags: featured 
---

<h2> Computational Linear Algebra </h2>
This chapter covers the computational aspects of performing matrix calculations. Understanding matrix computations is important because all later chapters depend on them. Suppose we're given a huge matrix $A \in R^{n \times n}$ with $n=1000$. Hidden behind the innocent-looking mathematical notation of the matrix inverse $A^{-1}$, the matrix product $AA$, and the matrix determinant $|A|$, lie monster coputations involving all the $1000 \times 1000 = 1$ million entries of the matrix $A$. Millions of arithmetic operations must be performed, so I hope you have at least a thousand pencil ready!

Okay, calm down. I won't actually make you calculate millions of arithmetic operations. In fact, to learn linear algebra, it is sufficient to know how to carry out calculations with $3 \times 3$ and $4 \times 4$ matrices. Even for such moderately sized matrices, computing products, inverses, and determinants by hand are serious computational tasks. If you're ever required to take a linear algebra final exam, you need to make sure you can do these calculations quickly. Even if no exam looms in your imminent future, it's important to practice matrix operations by hand to get a feel for them. 

This chapter will introduce you to the following computational tasks involving matrices:
<ul><li><span class="blue">Gauss-Jordan elimination </span> Suppose we're trying to solve two equations in two unknowns $x$ and $y$:

$$ 
ax+by = c
dx+ ey= f
$$

If we add $\alpha$\times the first equation to the second equation, we obtain an equivalent system of equations:

$$
ax + by = c
(d + \alpha a)x + (e + \alpha b)y = f + \alpha c
$$

This is called a <span class="highlight-sketch"> row operation </span>: we added $\alpha$-times the first row to the second row. Row operations change the coefficient of the system of equations, but leave the solution unchanged. Gauss-Jordan elimination is a systematic procedure for solving systems of linear equations using row operations. </li>
<li> <span class="blue"> Matrix product </span> The product $AB$ between matrices $A \in \mathbb{R}^{m \times l}$ and $B \in \mathbb{R}^{l \times n}$ is the matrix $C \in \mathbb{R}^{m \times n}$ whose coefficients $c_{ij}$ are defined by the formula $c_{ij} = \sum_{k=1}^{l}a_{ik}b_{kj}$ for all $i \in \[1, \dots, m \]$ and $j \in \[ 1, \dots, n \]$. We'll soon unpack this formula and learn about its intuitive interpretation: that computing $C = AB$ is computing all the dot products between the rows of $A$ and the columns of $B$. </li>
<li><span="blue"> Determinant </span> The determinant of a matrix $A$, denoted $|A|$ is an operation that gives us useful information about the linear independence of the rows of the matrix. The determinant is connected to many notions of linear algebra: linear independence, geometry of vectors, solving systems of equations, and matrix invertibility. We'll soon discuss these aspects. </li>
<li><span class="blue"> Matrix inverse </span> We'll build upon our knowledge of Gauss-Jordan elimination, matrix products, and determinants to derive three different procedures for computing the matrix inverse $A^{-1}$.</li></ul>

<h3> Reduced Row Echelon Form </h3>
In this section, we'll learn to solve systems of linear equations using the Gauss-Jordan elimination procedure. A system of equations can be represented as a matrix of coefficients. The Gauss-Jordan elimination procedure converts any matrix into its <span class="highlight-sketch"> reduced row echelon form (RREF) </span>. We can easily find the solution (or solutions of the system of equations from the RREF.

Listen up: the material covered in this section requires your full on, caffeinated attention, as the procedures you'll learn are somewhat tedious. Gauss-Jordan elimination involves many repetitive mathematical manipulations of arrays of numbers. It's important you hang in there and follow through the step-by-step manipulations, as well as verify each step I present on your own with pen and paper. 

<h4> Solving Equations </h4>
Suppose you're asked to solve the following system of equations:
$$
1x_1 + 2x_2  = 5
3x_1 + 9x_2 = 21
$$
The standard approach is to use one of the equation-solving tricks we learned to combine the equations and find the values of the two unknowns $x_1$ and $x_2$.

Observe that the names of the two unknowns are irrelevant to the solution of the system of equations. Indeed, the solution $(x_1, x_2)$ to the above system of equations is the same as the solution $(s,t)$ to the system of equations 
$$
1s+ 2t = 5
3s+ 9t = 21
$$

The important parts of a system of linear equations are the <span class="highlight-yellow"> coefficients </span> in front of the variables and the constants on the right-hand side of each equation. 

<h4> Augmented Matrix </h4>
The system of linear equations can be written as an <span class="highlight-green"> augmented matrix </span>:
$$
\begin{pmatrix} 1 & 2 &\bigm | & 5 \\
                3 & 9 &\bigm | & 21
\end{pmatrix}
$$

The first column corresponds to the coefficients of the first variable, the second column is for the second variable, and the last column corresponds to the constants of the right-hand side. It is customary to draw a vertical line where the equal signs in the equations would normally appear. This line helps distinguish the coefficients of the equations from the column of constants on the right-hand side.

Once we have the augmented matrix, we can simplify it by using <span class="highlight-yellow"> row operations </span> (which we'll discuss shortly) on its entries. After simplification by row operations, the augmented matrix will be transformed to 

$$
\begin{pmatrix}
1 & 0 &\bigm | & 5 \\
0 & 1 &\bigm | & 2
\end{pmatrix}
$$
which corresponds to the system of equations 
$$
x_1 = 1
x_2 = 2
$$
This is a <span class="monospace"> trivial </span> system of equations; there is nothing left to solve and we can see that the solutions are $x_1 = 1$ and $x_2 = 2$. This example illustrates the general idea of the Gauss-Jordan elimination procedure for solving the system of equations by manipulating an augmented matrix.

<h4> Row Operations </h4>
We can manipulate the rows of an augmented matrix without changing its solutions. We're allowed to perform the following three types of row operations:

<ul><li> Add a multiple of one row to another row </li>
<li> Swap the position of the two rows </li>
<li> Multiply a row by a constant </li></ul>

Let's trace the sequence of row operations needed to solve the system of equations 
$$
1x_1 + 2x_2 = 5
3x_1 + 9x_2 = 21
$$
starting from its augmented matrix:
$$
\begin{pmatrix}
1 & 2 &\bigm | & 5 \\
3 & 2 &\bigm | & 21
\end{pmatrix}
$$

1. As a first step, we eliminate the first variable in the second row by subtracting three times the first row from the second row.

$$ 
\begin{pmatrix}
1 & 2 &\bigm | & 5 \\
0 & 3* &\bigm | & 6
\end{pmatrix}
$$
We denote this row operation as $R_2 \leftarrow R_2 - 3R_1$.

2. To simplify the second row, we divide it by 3 to obtain 
$$ 
\begin{pmatrix}
1 & 2 &\bigm | & 5 \\
0 & 1 &\bigm | & 2 
\end{pmatrix}
$$
This row operation is denoted $R_2 \leftarrow \frac{1}{3}R_2$. 

3. The final step is to eliminate the second variable from the first row. We do this by subtracting two times the second row from the first row $R_1 \leftarrow R_1 - 2 R_2$:
$$
\begin{pmatrix}
1 & 0 &\bigm | & 1 \\
0 &  1 &\bigm | & 2
\end{pmatrix}
$$

We can now read off the solution: $x_1 =1$ and $x_2 = 2$. 

Note how we simplified the augmented matrix through a specific procedure: we followed the <span class="rainbow"> Gauss-Jordan elimination algorithm </span> to bring the matrix into its reduced row echelon form.

The reduced row echelon form (RREF) is the simplest form for an augmented matrix. Each row contains a <span class="circle-sketch-highlight"> leading one </span> (a numeral 1) also known as a <span class="circle-sketch-highlight"> pivot </span>. Each column's pivot is used to eliminate the numbers that lie below and above it in the same column. The end result of this procedure is the reduced row echelon form:
$$
\begin{pmatrix}
1 & 0 & * & 0 &\bigm | * \\
0 & 1 & * & 0 &\bigm | * \\
0 & 0 & 0 & 1 &\bigm | *
\end{pmatrix}
$$
Note the matrix contains only zero entries below and above the pivots. The asterisks $*****$ denote arbitrary numbers that could not be eliminated because no leading one is present in these columns.


