---
layout: post
title:  "Batch Normalization and Group Normalization"
author: seri
categories: [ deep learning ]
image: assets/images/bn.png
tags: featured 
excerpt: "Batch normalization is used in most state-of-the-art computer vision techniques to stabilize training, but it also suffers from drawbacks. Group normalization can be an awesome alternative when the batch size is too small."
---

<!--more-->

<h2> Batch Normalization: the Principles </h2>

<picture><img src="{{site.baseurl}}/assets/images/bn2.png"></picture> 

Batch Normalization is an algorithmic method which makes the training of Deep Neural Networks <span class="blue"> faster and more stable </span>. Batch normalization is computed differently during the training and the testing phase. 

At <span class="circle-sketch-highlight"> training </span>, the BN layer determines the mean and standard deviation of the activation values across the batch. It then <span class="underline"> normalizes the activation vector </span> with $\mu$ and $\sigma$. That way, each neuron's output follows a standard <span class="blue"> normal distribution </span> across the <span class="blue"> batch </span>.

It finally applies a <span class="blue"> linear transformation </span> with $\gamma$ and $\beta$ which are the two `trainable parameters`. Such step allows the model to choose the optimum distribution for each hidden layer. $\gamma$ allows to adjust the standard deviation while $\beta$ allows to adjust the bias, shifting the curve on the right or on the left side.

At each iteration, the network computes the mean $\mu$ and the standard deviation $\sigma$ corresponding to the current batch. Then it trains $\gamma$ and $\beta$ through <mark> gradient descent </mark> using an <mark> Exponential Moving Average (EMA) </mark> to give more importance to the latest iterations. 

<div class="sidenote"> We mostly use <mark> Exponential Moving Average algorithm </mark> to reduce the noise or to smooth the data. The weight of each element decreases progressively over time, meaning <span class="underline"> the EMA gives greater weight to recent data points </span>. EMA reacts faster to changes compared to Simple Moving Average. </div>

At the <span class="rainbow"> evaluation phase </span>, we may not have a full batch to feed into the model. To tackle this issue, <span class="underline"> we compute $\mu_{pop}$ and $\sigma_{pop}$ as the estimated mean and standard deviation of the studied population </span>. Those values are computed using all the $\mu_{batch}$ and $\sigma_{batch}$ during training, and directly fed during the evaluation phase. 

<h2> Why Normalization? </h2>

<picture><img src="{{site.baseurl}}/assets/images/bn4.png"></picture>

What we can conclude from the original Batch Normalization paper is that:
1. Adding BN layers leads to <b> better convergence and higher accuracy </b>
2. Adding BN layers allows us to <b> use higher learning rate </b> without compromising convergence.

To quote Ian Goodfellow about the use of batch normalization:
<blockquote> Before BN, we thought it was almost <span class="underline"> impossible to efficiently train deep models using sigmoid </span> in the hidden layers. Batch Normalization makes those unstable networks trainable. </blockquote>

In practice, it is widely admitted that: 
<ul><li> For <span class="highlight-green"> CNNs, Batch Normalization is better </span> </li><li> <span class="highlight-yellow"> For Recurrent Networks, Layer Normalization is better </span> </li></ul>

While BN uses the current batch to normalize every single value, LN uses all the current layer to do so. <span class="underline"> The normalization is performed using other features from a single example </span> instead of using the same feature across all current batch examples.

The best way to understand why BN works is to understand <span class="highlight-sketch"> the optimization landscape smoothness </span>. BN <u> reparameterizes the underlying optimization problem </u>, making the training faster and easier. In additional recent studies, researchers observed that this effect is not unique to BN, but applies to other normalization methods (i.e. L1 normalization or L2 normalization). 

<h2> The Drawbacks of BN </h2>

For BN to work, the <span class="rainbow"> batch size is required to be sufficiently large </span>, usually at least <span class="circle-sketch-highlight"> 32 </span>. However, there are situations when we have to settle for a small batch size. For example, when each <span class="underline"> data sample is highly memory consuming </span> or when we train a <span class="underline"> very large neural network </span> which leaves little GPU memory for processing data. For computer vision applications other than image classification, the restriction on batch sizes are more demanding and it is difficult to have higher batch sizes. 

<h2> Comparisions of Normalization Methods </h2>

<picture><img src="{{site.baseurl}}/assets/images/bn3.png"></picture>

Group Normalization is one of the latest normalization methods that <u> avoids exploiting the batch dimension</u>, thus is <u>independent of batch size</u>. But there are other normalization methods as well. 

<h3> Layer Normalization </h3>

Layer Normalization computes $\mu_i$ and $\sigma_i$ along the `(C,H,W)` axes. The computation for an input feature is entirely independent of other input features in a batch. 

<h3> Instance Normalization </h3>

Instance Normalization computes $\mu_i$ and $\sigma_i$ along the `(H,W)` axes. Since the computation of IN is the same as that of BN with `batch_size=1`, IN actually makes the situation worse in most cases. However, for <span class="highlight-pink"> style transfer tasks </span>, IN is better at discarding contrast information of an image, thus having superior performance than BN.

<h3> Group Normalization </h3>

Also notice that IN can be viewed as applying Layer Normalization to each channel individually as if the `num_channels = 1`. Group Normalization is the middle ground between IN and LN. It <span class="gif"> organizes the channels into different groups </span> and <span class="highlight-yellow"> computes $\mu_i$ and $\sigma_i$ along the `(H,W)` axes and along a group of channels. 


First, the batch with dimension `(N,C,H,W)` is reshaped to `(N,G,C//G,H,W)`. The number of group <span class="underline"> $G$ is a pre-defined hyperparameter </span>. Then we normalize along the `(C//G,H,W)` dimension and return the result after reshaping the batch back to `(N,C,H,w)`.

Group Normalization is better than Layer Normalization as GN allows different distribution to be learned for each group of channels. GN is also thought to be better than IN because GN can exploit the dependence across channels. If <mark>`C = G`</mark>, that is, if the number of groups are set to be equal to the number of channels, <mark> GN becomes IN </mark> . Likewise, if <mark>`G = 1`</mark> <mark> GN becomes LN </mark>. 

<h2> References </h2>
<ul> 
<li><a href="https://amaarora.github.io/2020/08/09/groupnorm.html"> blog post </a></li>
<li><a href="https://towardsdatascience.com/what-is-group-normalization-45fe27307be7"> medium article </a></li>
<li><a href="https://towardsdatascience.com/batch-normalization-in-3-levels-of-understanding-14c2da90a338"> medium article2 </a></li>
</ul>


