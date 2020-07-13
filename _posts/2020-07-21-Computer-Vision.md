# Introduction to CNNs
- A CNN is a network architecture that  fundamentally consists of small networks,
almost like the simple feedforward network. CNN consists of neurons that have
non-linearity, weight parameters, biases, and spit out one loss value based on which
the whole  network is rearranged using backpropagation.
- Simple fully connected layers have more weights  because they store the information
to  process everything in weights. And they cannot take spatial information 
into account,  since it removes  the order/arrangement structure of the 
pixel values while processing. 
- CNNs consist of several three-dimensional kernels moving through the input tensor
like a sliding window until they cover the whole tensor. 
A kernel is a three-dimensional tnesor where its depth and the depth of the input
tensor is the same. The sliding window movement creates an output feature map
(essentially a tensor). Each feature map is capable of holding one particular type of 
information. 
- A CNN essentially downgrades the dimensionality of the image in the 
x and y axes (height and width) and increases the depth (z axis). 
Each slice in the z axis is one feature map as described previously, 
created by each of those multidimensional kernels. 
