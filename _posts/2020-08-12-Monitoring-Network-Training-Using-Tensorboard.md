---
layout: post
title: Monitoring Network Training Using Tensorboard
categories: Deep-Learning  
tags: [Deep Learning Quick Reference]
excerpt: Deep Learning Quick  Reference
---

# A brief overview of Tensorboard
- TensorBoard is a web-based application that can help you visualize the  metrics, parameters, and structure of a deep neural network created in TensorFlow. It  will help you debug and optimize your deep neural networks faster and easier.
- TensorBoard will allow you to monitor the changes in metrics and parameters as your network is trained, which can greatly accelearte troubleshooting.
- TensorBoard is also great for optimization. With TensorBoard, you can visually compare multiple model runs against  each other. This allows you to experiment  with  changing architectures and hyperparameters and then evaluate  those changes relative to the other runs of the network. All this can happen throughout each epoch, so you  can kill model runs that aren't doing well early if you desire, which saves you time and money. 

# Setting up TensorBoard
- TensorBoard is a standalone web application. You'll use it through your web browser. The  setup requires two steps. First, we will set up  TensorBoard  to  visualize  the networks that we build in TensorFlow and Keras,  and then we will set  up Keras to  share information with TensorBoard. 

```python
pip install -U  tensorboard
 ```
 
 # How TensorBoard talks to Keras/TensorFlow
 - TensorBoard  and TensorFlow  use a common log  directory  to share information. As Keras and tensorFlow train, Keras will write metrics and activation histograms to the log directory you specify.  
 
 # Running TensorBoard
 
```python
tensorboard  --logdir ~/ch3_tb_log --port 6006
 ```
 * Port 6006 is the default.  
 * You should  now be able to navigate to the  TensorBoard  URL by pointing  your browser at  http://<ip address>:6006
  * If you're using a  cloud service, you may also need  to  adjust a  firewall or security rule to  allow connects to  your  server on port 6006. 
  
 # Connecting Keras to TensorBoard  
 ## Introducing  Keras callbacks
 * Callbacks in Keras are  functions that can be run during  the training  process. They  can do all kinds of great things, such as saving your model weights after an epoch, logging  things, changing  your hyperparameters, or conveniently writing  TensorBoard log  files. You can even create your  own custom callbacks. 
 * TensorBoard callbacks are objects that  can be configured and instantiated before model training. Once we have created a list of callbacks we want to use with our deep neural network, we can simply pass that list as an argument  to  the model's .fit() method. These callbacks wil l then be used at each epoch, or as appropriate by Keras. 
 
 ## Creating  a TensorBoard callback 
 
```python
from keras.callbacks import TensorBoard

def create_callbacks():
  tensorboard_callback = TensorBoard(log_dir = '~/ch3_tb_log/mlp', histogram_freq=1, batch_size=32,  write_graph=True, write_grads=False)
  return [tensorboard_callback]
 ```
 *  The create_callbacks() function below will  return a list of all the callbacks we will pass to .fit(). In this case, it returns a list with one element. 
 * *histogram_freq*: this specifies how often we will compute histograms for activations and weights in epochs. It defaults to 0, which makes the  log much smaller but doesn't generate histograms. 
 * *batch_size*: This is the batch size used to  calculate histograms. It defaults to  32.
 * *write_graph*: This function is Boolean. This will tell TensorBoard to visualize the  network graph. This can be quite handy, but it can also make the logs quite large.
 * *write_grads*: This function is also Boolean. This will tell TensorBoard to calculate histograms of gradients as well. 
 
 - Now we  just need to  create our list of callbacks and fit our *mlp* with the  callbacks argument. 
 
 # Using TensorBoard 
 ## Visualizing training 
 * We can use TensorBoard to compare the two models graphically. 
 - Open up TensorBoard and head to the SCALARS tab. 
 ## Visualizing network graphs 
 * We can also use it to visualize network structure. Here, I've navigated to  GRAPHS and pulled up the structuer of the deep  neural network. The training node represents the input tensor, and by default, it's this giant octopus that connects to  the rest of the graph in a somewhat unhelpful way. 
