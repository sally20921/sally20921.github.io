---
layout: post
title: Computer Vision
categories: Python  
tags: [Advanced Deep Learning with Python]
excerpt: Advanced Deep Learning with Python
---
# Understanding Convolutional Networks 
## Understanding CNNs 
- Depending on the  number of input dimensions, we have  1D, 2D or 3D convolutions.
- In CNNs, the function *f* is the input  of the convolution operation (also referred to as the
convolutional layer) A time series input is a 1D vector, an image input is a 2D matrix, and a 3D point cloud 
is a 3D tensor. The function *g*, on the other hand, is called a kernel (or filter). It has the same
number of dimensions as the  input  data and it is defined by a set of learnable weights. For example,
a filter of size  *n* for a 2D convolution is an *nxn* matrix. The convolution works as follows:
1. We slide the filter along all of the dimensions of the input tensor.
2. At every input position, we multiply each filter weight by its corresponding input tensor cell
at the given location. The input cells, which contribute to a single output cell, are called
**receptive fields**. We sum all ofthese values to produce the value of a single output cell.
- Unlike fully-connected layers, where each output units gathers information from all of the inputs, 
the activation of a convolution output cell is determined by the inputs in its receptive field.
This principle works best for hierarchically structured data such as images. For example, neighboring
pixels form meaningful shapes and objects, but a pixel at one end of the image is unlikely
to have a relationship with a pixel at another end. 
- The  filter  highlights some particular features in the receptive field. The output of the operation
is a tensor  (known as a feature map), which marks the locations where the feature is detected.
Since we apply the  same filter throughout the input tensor, the convolution is translation invariant.
That is, it can detect the same features, regardless of their location on the image. However, the convolution
is neither rotation invariant  (it is not  guaranteed to detect a feature if it's rotated), nor scale
invariant (it is not guaranteed to detect the same artifact in different scales). 

- The CNN convolution can have multiple filters, highlighting different features, which results
in multiple output feature maps (one for each  filter). It can also gather  input from multiple feature
maps, for example, the output of a previous convolution. The combination of feature maps (input or  output)
is called  a volume. In  this context, we can also refer to the feature maps as slices. 
Although the two terms refer to  the same thing, we  can think of the  slice  as part  of the volume,
where the  feature  map highlights its role as, well, a feature  map.
- As we mentioned earlier,  each volume (as well as the  filter) is represented by a tensor. For example, 
a red, green, and blue (RGB) image  is represented by a 3D tensor  of three 2D slices (one slice 
per  color channel). But in the context of CNNs, we add one more dimension for the  sample index
in the mini-batch. Here, a 1D  convolution would have 3D input and output tensors. Their axes 
can be  either NCW or  NWC order, where N is the index of the sample in the  mini-batch,
C is the  index of the depth slice  in the volume, and W is the vector size of each sample. 
- In the  same way, a 2D convolution will be represented by NCHW or NHWC tensors, where H and W  are  
the  height and width of the slices. 

## Introducing transfer learning 
- Let's say that  we want to train a model on a task that doesn't have readily available labeled training data
like ImageNet does. Labeling  training samples could be expensive, time-consuming, and error-prone.
-TL is the process of applying an existing trained ML model to a  new, but related problem. 
For  example, we can take a  network trained on ImageNet and repurpose it to classify grocery store items.
Alternatively, we could use a driving  simulator ame to  train a neural network to drive a 
simulated  car and then use the network  to drive a real car. TL is a  general ML concept  that's applicable
to all ML algorithms, but in this context, we'll talk about CNNs. Here's how it works.
- We start with  an existing pretrained network. The most common scenario is to take a pretrained network from ImageNet, 
but it could be any dataset.  TensorFlow and PyTorch both have popular ImageNet pretrained neural architectures 
that we can use. Alternatively, we can train our own network with a dataset of our choice.
- The  fully-connected layers at the end of  a CNN act  as translators between the  network's language  (the abstract
feature representations learned during training) and our language, which is the class of each sample.
You can think of TL as a translation into another language. We start  with the network's features, which
is the  output of the  last convolutional or pooling layer. Then we translate them into a different
set of classes of the  new task. We  can do this by removing the last fully-connected layer of an existing 
pretrained network and replacing it with another layer, which represents  the classes of the new problem. 
- However, we cannot do this mechanically and expect the  new network to work because  we still have  to 
train the  new layer with data  related to the  new task. Here, we have  two options:
- Use the original part of the network  as a feature extractor and only train the new layers:
In this scenario, we  feed the network a training  batch  of the  new data and propagate it 
forward to see the network's output. But in the backward pass, we lock the weights of the original network
and only update the weights of the new layers. This is recommended way to do things when we have
limited training  data  for the  new problem. By locking most of the  network weights, we  prevent 
overfitting on the  new data.
- Fine-tune the whole network: In this scenario, we'll train the whole network adn not just the newly
added layers at the end. IT is possible to update all of the network weights, but we can also
lock some of the  weights in the first layers. The idea here is taht the  initial layers detect
general features-not related to a specific task- and it  makes sense to reuse them. On the other hand,
the deeper  layers may detect task-specific features and it would be better to update them.
We can use this method when we have more training data  and don't need to worry about overfitting. 

###  Implementing transfer learning with PyTorch
```python
import torch
import torch.nn as nn
import torch.optim as optim
import torchvision
from torchvision import models, transforms

batch_size = 50
```
- The CIFAR-10 images are 32x32, while the ImageNet network expects 224x224  input.
Since we are  using an ImageNet-based network, we'll upsample the 32x32 CIFAR images to 224x224.
-Standardize the CIFAR-10 dat using the ImageNet mean and standard deviation since this is what the network expects.
- We'll also add some data augmentation in the form of random horizontal or vertical flips.

```python
#training data
train_data_transform = transforms.Compose([
  transforms.Resize(224),
  transforms.RandomHorizontalFlip(),
  transforms.RandomVerticalFlip(),
  transforms.ToTensor(),
  transforms.Normalize((0.4914, 0.4821,0.4465), (0.2470, 0.2435, 0.2616))
  ])
train_set = torchvision.datasets.CIFAR10(root='./data', train=True, download=True,
  transform = train_data_transform)
train_loader = torch.utils.data.DataLoader(train_set, batch_size=batch_size, shuffle=True,
  num_workers=2)
device = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")

def train_model(model, loss_function, optimizer, data_loader):
  #set model to training mode
  model.train()
  current_loss = 0.0
  curren_acc = 0
  #iterate over the training  data 
  for i, (inputs, labels) in enumerate(data_loader):
  #send the input/labels to  the GPU
    inputs = inputs.to(device)
    labels = labels.to(device)
    # zero the parameter gradients 
    optimizer.zero_grad()
    with torch.set_grad_enabled(True):
      #forward
      outputs = model(inputs)
      _, predictions  = torch.max(outputs, 1)
      loss = loss_function(outputs, labels)
      #backward
      loss.backward()
      optimizer.step()
      #statistics 
      current_loss += loss.item() * inputs.size(0)
      current_acc += torch.sum(predictions == labels.data)
      total_loss = current_loss / len(data_loader.dataset)
      total_acc = current_acc.double() / len(data_loader.dataset)
      print('Train Loss: {:4f}; Accuracy:{:.4f}'.format(total_loss, total_acc))
```
- define the testing/validation of  the  model.
- define the  first TL  scenario, where  we use the pretrained network as a feature extractor:
we'll use a  popular network known as  ResNet-18. Replace the  last network layer  with  a new layer with 10  outpus (one  for each CIFAR-10 class). Exclude the  existing network layers from the backward pass and only pass the  newly added fully-connected layer to the Adam optimizer.
Run the training for epochs and evaluate the network  accuarcy after each epoch.
- plot the test accuracy  with the help of the plot_accuracy function. 

```python
def tl_feature_extractor(epochs=5):
  # load the pretrained model 
  model = torchvision.models.resnet18(pretrained=True)
  #exclude existing paramters from backward pass
  for param in model.parameters():
    param.requires_grad = False
    
  #newly constructed  layers have  requires_grad=True by default
  num_features = model.fc.in_features
  model.fc  = nn.Linear(num_features, 10)
  
  #transfer to GPU 
  model = model.to(device)
  loss_function = nn.CrossEntropyLoss()
  
  #only  parameters of the final layer are being  optimized
  optimizer = optim.Adam(model.fc.parameters())
  
  #train 
  test_acc = list() #collect accuracy for plotting
  for epoch in range(epochs):
    print('Epoch {}/{}'.format(epoch+1, epochs))
    train_model(model, loss_function, optimizer, train_loader)
    _, acc = test_model(model, loss_function, val_order)
    test_acc.append(acc)
    
  plot_accuracy(test_acc)
```

- implement  the  fine-tuning approach. This function is similar  to  tl_feature_extractor,
but here,  we're training the whole network:
```python
def tl_fine_tuning(epochs=5):
   #load the pretrained model
   model = models.resnet18(pretrained=True)
   #replace the  last  layer 
   num_features = model.fc.in_features
   model.fc  =  nn.Linear(num_features, 10)
   
   #transfer the  model to  GPU 
   model = model.to(device)
   
   #loss function
   loss_function = nn.CrossEntropyLoss()
   
   #We'll optimize  all parameters
   optimizer = optim.Adam(model.parameters())
   
   #train 
   test_acc =  list() #collect accuracy for plotting
   for epoch in range(epochs):
    print('Epoch {}/{}'.format(epoch+1, epochs))
    train_model(model, loss_function, optimizer, train_loader)
    _, acc = test_model(model, loss_function, val_order)
    test_acc.append(acc)
    
   plot_accuracy(test_acc)
```

## Advanced Convolutional Networks
- We'll go a step further there and talk about some of the  most  popular CNN architectures.
These networks usually combine multiple primitive convolution and/or  pooling operations in a novel building block that  serves  as  a base for a complex  architecture. This allows us to build  very deep  (and sometimes wide) networks with high  representational power  that perform well on complex tasks such as  ImageNet classification, image  segmentation,  speech recognition, and so on. 

### Introducing AlexNet
- The model has five cross-correlated convolutional layers, three  overlapping max pooling layers, three fully connected layers, and ReLU activations. The output is a  1000-way softmax (one for each ImageNet  class). The first  and second convolutional layers  use local respnse normalization - a  type of normalization, somewhat similar  to batch normalization. The fully connected layers have a  dropout rate of 0.5. To prevent overfitting, the network  was trained 
using 227x227 crops of the 256x256 input images. 

### An introduction to Visual Geometry Group 
- The  VGG family of networks remains popular tody and is often used  as a benchmark  against newer architectures. The authors of the  paper  observed that a convolutional layer  with a  large  filter size can be replaced with a  stack  of two or more  convolutional layers with smaller filters (factorized convolution). This structure has several advantages as follows:
- The number of weights and operations of stacked layers is smaller. 
- Stacking  multiple layers makes the decision function more discriminative.
- The VGG networks consists  of multiple blocks of two, three, or four stacked convolutional layers combined with  a  max pooling layer. 
- As the  depth of the  VGG network increases, so does the width (the number of filters) in the convolutional layers. 

###  Understanding residual networks 
- This is also the first network architecture that has successfully trained  a network with a depth of more than 100 layers. Thanks to better weight initializations, new activation functions,  as well as normalization layers, it's now  possible to train deep networks. 
In theory, we can take a shallow network and stack identity layers on top of it to produce a deeper  network that  behaves in exactly the same  way as the shallow one. Yet, their  experiments have been  unable  to match the performance  of the shallow network. 
- To solve this problem, they  proposed  a network  constructed of residual blocks. A residual block consists of two or three sequential convolutional layers and a separate  parallel identity shortcut connection,  which  connects the input of the  first layer  and the output of the last one.  
- The two  paths are merged via an element-wise sum. The  output is a single tensor  with the  same shape  as the input. In effect, we  propagate forward the features learned by the block, but also the original unmodified signal. In this way, we can get closer  to the original scenario, as described by the  authors. Thanks to this, we can stack  any number  of blocks for  a  network  with an  arbitrary depth. 

### The limitations of convolutional networks

> The pooling operation used in convolutional neural networks is a big mistake and the fact that it works so well is a disaster.

+ CNNs are  translation invariant. Translation invariance means taht a  CNN is very good at telling us taht  the picture contains a face,  but it cannot  tell us whether the face  is in the  left or right part of the image. The main culprit for this behaviro is  the pooling  layers. Every pooling  alyer introduces a little translation invariance. For example, the max pooling  routes forward the activation of only one of  the input neurons, but the  subsequent  layers don't have  any knowledge of which neuron is routed.

+ By stacking  multiple pooling layers, we gradually increase the receptive  field size. But, the detected object could be  anywhere in thew new  receptive field, because none of the pooling layers relay such information. Therefore, we also increase teh translation invariance. At first,  this might seem to be  a  good thing, because the final labels have to be translation-invariant.  But,  it poses a problem, as CNNs cannot identify the  postition of one  object relative  to another. 

+ A CNN would identify both of the  following images as a face, because they  both contain the  components  of a face (a nose, mouth, and eyes) regardless of their relative  positions to one  another. 
 + This is also known as the **Picasso problem**. 
 
+ A CNN would be confused even if the face had a different orientation, for example, if it was turned upsdie down. One way to overcome this is with data augmentation (rotation) during training. But, this  only shows the limitations  of the network. We  have to explicitly show the object in different orientations and tell the CNN that this  is, in fact, the  same object. 
 +  In computer vision, the combination of translation and orientation is known as the  **pose**. The  pose is enough to  uniquely identify the object's properties in the coordinate system. 
  + If we can somehow train a network  to understand these properties, we won't have to feed it with multiple augmented versions of the  same object. A CNN cannot do  that,  because its internal data representation doesn't contain information about  the object's pose (only about  its type). In contrast, capsule networks preverve information for both the type and the pose of an object. 
  
## Object detection and Image Segmentation
  - We can  say that  these tasks are more complex compared to classification, because the model
  has to obtain a more comprehensive  understanding  of the image. It has  to be able  to detect different objects as well as their positions on the  image. At  the same time, the task complexity allows for more creative  solutions. 
  
### Approaches to object detection
+ **Classic sliding window**: here, we'll use a regular classification network (classifier). This approach can work with any type of classification algorithm, but it's relatively slow and error-prone.
1. Build an image pyramid: This is combination of different  scales of the same image. 
2.  Slide the classifier  across the  whole image: We'll use each location of the image  as an input to  the classifier, and the result will determine the type of object that  is in the location. The bounding box of the location is just the image  region that we used as input.
3. We'll have  multiple overlapping bounding boxes for each object: We'll use some heuristics to combine them in a single prediction. 

+ **Two-stage detection methods**: These methods are very accurate, but relatively slow.
1. A special type of CNN, called Region Proposal Network (RPN), scans the image and proposes a number of possible bounding boxes, or regions of interest (RoI), where objects might be  located. However,  this network doesn't detect the type of the object,  but only whether an object is present in the region.
2. The regions of interest  are  sent to the second stage  for object classification, which determines the actual object in  each bounding box.

+ **One-stage (or one-shot) detection methods**: Here, a single CNN produces both the object type and the bounding box. These approaches are usually faster, but less accurate compared to the two-stage methods. 

### Object detection with YOLOv3
- The  algorithm starts with the  so-called backbone network called Darknet-53 (after the  number of convolutional layers). It  is trained to  classify the ImageNet dataset. It is fully convolutional and uses  residual connections. 
- Once the network is trained, it  will serve as a base for the following object detection training phase. This is a case of feature extraction transfer  learning. The fully connected layers of the backbone  are  replaced with new randomly initialized convolutional and fully connected layers. THe new fully connected layers  will output the  bounding boexes, object classes, and confidence scores of all detected objects in just a single pass. 

1. Split the image into a grid of SxS cells 
* The  network  treats the  center  of each grid cell as the center of the region, where an object might be located.
* An object might  lie entirely within a cell. Thenm its bounding box will be  samller than the cell. Alternatively, it can span over multiple cells and the bounding box will be larger. YOLO covers both cases.
* The algorithm can detect multiple objects in a grid cell with the help of anchor boxes, but  an object is associated with one cell only. That is, if the  bounding box of the object covers multiple cells, we'll associate the object with the cell, where the center of the  bounding box lies. 
* Some of the  cells may  contain an object and others might not. We are  only interested in the  ones that do.

2. The network  will output multiple possible detected objects for each grid cell. 
* *c1, c2, ..., cn* is a one-hot encoding of the  object class. 
3. If we have  multiple  objects in the  same cell, we'll associate each object with one of the anchor boxes. 

3.  The  output of the  network  might be  noisy - that is, the  output includes all possible anchor boxes for each cell, regardless of whether an object is present in them. Many of the boxes will overlap and actually predict the same object. We'll get  rid of the noise using **non-maximum suppression**.
* Discard all bounding boxes with  a confidence score of less than or equal to 0.6.
* From the remaining bounding boxes, pick the one with the  highest possible confidence score.
* Discard  any box whose IoU >= 0.5 with the  box we selected in the previous step.

- need  opencv-python 

```python
import os.path
import cv2 #opencv import
import numpy as np
import requests 

# Download YOLO net  config file
yolo_config = 'yolov3.cfg'
if not os.path.isfile(yolo_config):
  url = 'https://raw.githubusercontent.com/pjreddie/darnet/master/cfg/yolov3.cfg'
  r  = request.get(url)
  with open(yolo_config, 'wb') as f:
    f.write(r.content)
    
# Download YOLO net weights
yolo_weights = 'yolov3.weights'
if not os.path.isfile(yolo_weights):
  url = 'https://pjreaddie.com/media/files/yolov3.weights'
  r =  request.get(url)
  with open(yolo_weights, 'wb')  as f:
    f.write(r.content)
    
# load the network
net = cv2.dnn.readNet(yolo_weights, yolo_config)

# Download class names file
classes_file = 'coco.names'
if not os.path.isfile(classes_file):
  url = 'https://raw.githubusercontent.com/pjreddie/darknet/master/data/coco.names'
  r = request.get(url)
  with  open(classes_file, 'wb') as f:
    f.write(r.content)
    
# load class names
with open(classes_file, 'r') as f:
  classes = [line.strip() for line in f.readlines()]
  
# Download object detection image
image_file = 'source_1.png'
if not os.path.isfile(image_file):
  url = "https://github.com/ivan-vasilev/advanced-deep-learning-with-python/blob/master/chapter04-detection-segmentation/source_1.png"
  r = request.get(url)
  with open(image_file, 'wb') as f:
    f.write(r.content)
    
# read and normalize image
image = cv2.imread(image_file)
blob = cv2.dnn.blobFromImage(image, 1/255, (416,416), (0,0,0), True, crop=False)

# set as input to the net 
net.setInput(blob)

# get network  output layers
layer_names = net.getLayerNames()
output_layers = [layer_names[i[0]-1] for i in net.getUnconnectedOutLayers()]

# inference 
outs =  net.forward(outpu_layers)

# extract bounding boxes
class_ids = list()
confidences = list()
boxes = list()

# iterate over all classes 
for out in outs:
  for detection in out:
    # bounding  box
    center_x = int(detection[0]*image.shape[1])
    center_y = int(detection[1]*image.shape[0])
    w, h = int(detection[2]*image.shape[1]), int(detection[3]*image.shape[0])
    x, y = center_x - w // 2, center_y - h // 2
    boxes.append([x,y,w,h])
    
    # confidence
    confidences.append(float(detection[4]))
    
    # class
    class_ids.append(np.argmax(detection[5:]))
    
    # non-max suppression
    ids = cv2.dnn.NMSBoxes(boxes, confidences, score_threshold=0.75,  nms=threshold=0.5)
    
    # draw the bounding boxes and their captions on the image
    for i in ids:
      i = i[0]
      x, y, w, h = boxes[i]
      class_id = class_ids[i]
    color = colors[class_id]
    cv2.rectangle(img=image, pt1=(round(x),round(y)), pt2=(round(x+w), round(y+h)), color=color, thickness=3)
    cv2.putText(img=image, text= f"{classes[class_id]}:{confidences[i]:.2f}", org=(x-10, y=10), fontFace = cv2.FONT_HERSHEY_SIMPLEX, fontScale=0.8, color=color, thickness=2)
    
    # detect image
    cv2.imshow("Object detection", image)
    cv2.waitKey()
```






















