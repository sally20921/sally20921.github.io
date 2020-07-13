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
- Dimensionality downgrading in CNN helps CNN to be positionally invariant. 
Positional invariance helps it to  identify objects in a different part of the image.
CNN achieves poisitonal invariance by two mechanisms: striding and pooling. 
The stride value decides how aggressive the sliding window movement is.
Pooling is an inherent part of CNNs. We have three main type of pooling:
max-pooling, min-pooling, and average-pooling. 
The input and output of the pooling layer and convolutional kernels are essentially 
the same. Both moves as a sliding window over the input tensor and output a single
value. 
- There are  four main types of operations for building  the complete CNN network:
1) Convolutional layer 2) Non-linearity  layer 3) Pooling layer 4) Fully connected layer 

# Computer Vision with PyTorch
- PyTorch provides `Conv1d`, `Conv2d`, `Conv3d` under `torch.nn` package. 
`Conv2d` handles four-dimensional input among which the first dimension would be 
batch size, teh second dimension would be the depth of the image (in RGB channels), 
and the last two dimensions would be height and width of the image. 
- `torchvision` has some handy utility functions for setting up the  network.

## Simple CNN 
- input: CIFAR10 ( 60,000 32x32 color images in 10 classes, with 6000 images per class)

```python
def get_data():
  transform = transforms.Compose(
    [transforms.ToTensor(), 
    transforms.Normalize((0.5,0.5,0.5), (0.5,0.5,0.5))])
  trainset  =  torchvision.datasets.CIFAR10(root='./data',train=True, 
                    download=True, transform=transform)
  trainloader = torch.utils.data.DataLoader(trainset, batch_size=100,
                    shuffle=True, num_workers=2)
  testset  = torchvision.datasets.CIFAR10(root='./data', train=False,
                  download=True, transform=transform)
  testloader= torch.utils.data.DataLoader(testset, batch_size=100, 
                  shuffle=False, num_workers=2)
  return trainloader,  testloader 
```

### Model 
```python
class SimpleCNNModel(nn.Module):
  def __init__(self):
    super().__init__()
    self.conv1 =  Conv(3,6,5)
    self.pool = MaxPool(2)
    self.conv2 = Conv(6,16,5)
    self.fc1 = nn.Linear(16*5*5, 120)
    self.fc2 =  nn.Linear(120, 84)
    self.fc3 = nn.Linear(84, 10)
  def forward(self,x):
    x =  self.pool(F.relu(self.conv1(x)))
    x = self.pool(F.relu(self.conv2(x))))
    x = x.view(-1, 16*5*5)
    x = F.relu(self.fc1(x))
    x = F.relu(self.fc2(x))
    x = self.fc3(x)
    return x 
```

- the model has two convolutional layers separated by a max-pool layer. 
The  second convolutional layer is wired to  three fully connected  layers, one after another, which spit out  the score for 10  classes. 

```python
class Conv(nn.Module):
  def __init__(self, in_channels, out_channels, kernel_size, stride=1, padding=0):
    super().__init__()
    self.kernel_size = kernel_size
    self.stride = stride
    self.padding = padding
    self.weight = Parameter(torch.Tensor(out_channels, in_channels, 
              kernel_size, kernel_size))
    self.bias = Parameter(torch.zeros(out_channels))
```

- For simplicity, let's consider the input iamge is a single channel (grayscale)
image of size 7x7 and assume the  kernel is of size 3x3. We call the middle  value of the  kernel the anchor, since we  keep the  anchor on some values in the  image to do the convolution. 
-  We start the convolution by anchoring the kernel on teh  top-left pixel of the  image. But  we have a problem to  handle. What wil lthe top row and left column of the  kernel be  multiplied to? For this, we introduce padding. 
- We add rows and columns to the outer side of the  input  tensor with the value as zero, so taht  all the values in the kernel have a  corresponding value in teh input image to pair with. 
- Now we  move the  kernle one pixel right and do the operation again, like a  sliding window, and repeat this until we cover the image. Each output we could get 
from each convolution operation together creates a feature map or output of that layer.
- Non-continuous memory block tensors cannot be  changed by using  `view()`, and hence we use the method `contiguous()` to move the tensor to  a continuous block.
Then we multiply this tensor with  the kernel (weight) and add bias to  it.
The result of the convolution operation is then saved to  the *out* tensor, which is initialized with zero as a  placeholder. 
- The *functional* module in PyTorch  has methods for helping us with padding `F.pad` accepts the input tensor and the padding size for each side. 
- The convolutional layer  we have built does not have the capability of doing  striding since  we did downsampling with max-pooling. 
- The preceding example used a single-channel input and created a single-channel output. We an extend this to use *n* number of input channels to  create *n* number  of output channels and that  is the  fundamental building block of convolutional networks. 
- Since the  input image  has more than one channel, the kernel used to multiply with the corresponding elements needs to be  *n* dimensional. If the input channel s are three and the kernel size is five, the  kernel shape should be 5x5x3.
The kernel size is being constructed with the shape `[kernel_size, kernel_size, input_channels]`. 

- The pooling  operation takes a sub-piece of the  tensor and fetches a single value  as output.  Historically, max-pooling  gives better results  than other pooling algorithms, probably because it takes the most prominent feature from the  input and passes it to the  next  level. 
- The *max()* method of PyTorch accepts the dimension as input and returns a tuple with index/indices to the max value and the actual max value. 
- Convolutional layers and the max-pool layer are followed by three linear  layers (fully connected), which reduces dimensionality to 10, which gives the  probability score for each of the classes. 

```python
net  = SimpleCNNModel()
loss_fn = nn.CrossEntropyLoss()
optimizer = optim.SGD(net.parameters(), lr=0.001, momentum=0.9)
trainloader, testloader = get_data()
```

-momentum is a very popular technique used along with  the optimization algorithm nowadays. We add a factor of the current gradient to the current  gradient itself to get a bigger value, which is then subtracted from the weights. Momentum accelerates the  movement of the  loss in the  direction of the minima analogous to  momentum in the  real world. 

```python
inputs, labels = data
optimizer.zero_grad()
outputs = net(inputs)
loss = loss+fn(outputs, labels)
loss.backward()
optimizer.step()
```

##  Semantic Segmentation
- This technique  marks parts of an image with a category. Segmentation by itself means identifying the structure, regions, and so on, from an image. Semantic segmantation is recognizing and understanding what's in the image at pixel level. 
- CamVid is a ground truth  dataset that consists of high-quality videos converted to  frames that  are manually segmented and labeled. Manually labeled output images use color as an indentification for objects. 

### LinkNet
- LinkNet exploits the idea of autoencoders, which used to be a data  compression technique. Autoencoders have two parts in their  architecture: an encoder and a decoder. The encoder encodes the input to  a low-dimensional space and the decoder decodes the input from the low-dimensional space. Autoencoders are widely used to reduce dimensionality in compression and so on. 
- LinkNet consists of an initial block, a final block, and encoder block with  four convolutional modules in it,  and a decoder with four deconvolution modules. 
The initial block downsamples the input image twice by using a strided convolution and a max-pooling layer. Then each convolution module in the encoder block downsamples the input once with strided convolution. The encoded output is then passed to the decoder block, which upsamples the input  with strided deconvolution once in each deconvolution block. The output from the decoder block then passes through  the final block. which upsamples twice. 
- LinkNet is capable of reducing the number of parameters in  the architecture using  the idea of skip connection. 
