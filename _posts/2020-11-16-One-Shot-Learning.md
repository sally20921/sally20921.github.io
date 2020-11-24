---
layout: post
title: One-shot Learning
categories: Etc  
tags: [Hands-On One-shot Learning with Python]
excerpt: 
---

# Introduction to One-shot Learning
* The primary motivation behind this book is to train a model with very few examples that is capable of generalizing to unfamiliar categories without extensive retraining.
* One-shot learning is an object categorization problem in computer vision. 
* While most ML-based object categorization algorithms require hundreds or thousands of images and very large datasets to train on, one-shot learning aims to learn information about object categories from one, or only a few, training images.

# One-shot learning - overview
* One-shot learning can be seen as an approach to train machines in a way that is similar to how humans learn.
* One-shot learning is an approach to learn a new task using limited supervised data with the help of strong prior knowledge.

# Prerequisites of one-shot learning 
* If we look into further discussion about how we can learn necessary information from a limited amount of data, we will realize that the human brain already has neurons trained to extract important information.
* For any form of one-shot learning, we can say we need at least one of the following things:
 * Previously trained filters and a pre-determined architecture
 * A correct assumption of data distribution
 * A defined form of taxonomy for information stored or collected

* In certain cases, we observe that we can only have a very low level of feature extraction. 

# kNN - basic one-shot learning 
* In this exercise we will compare kNN to neural networks where we have a small dataset. We will be using the *iris* dataset imported from the *scikit-learn* library.
* To begin, we will first discuss the basics of kNN. 
* The kNN classifier is a nonparametric classifier that simply stores the training data D, and classifies each new instance using a majority vote over its set of k nearest neighbors, computed using any distance function.
* For a kNN, we need to choose the distance function, d, and the number of neighbors, k:
* Follow these steps to compare kNN with a neural network:
```python
import numpy as np
import matplotlib.pyplot as plt
from sklearn import datasets
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import tran_test_split
from sklearn.metrics import confusion_matrix, accuracy_score
from sklearn.model_selection import cross_val_score
from sklearn.neural_network import MLPClassifier

iris = datasets.load_iris()
X = iris.data
y = iris.target

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=0)
classifier = KNeighborsClassifier(n_neighbors=3)

classifier.fit(X_train, y_train)

y_pred = classifier.predict(X_test)
 
cm = confusion_matrix(y_test, y_pred)

accuracy = accuracy_score(y_test, y_pred)*100
print('Accuracy of our model is equal '+str(round(accuracy, 2))+ ' %.')

mlp = MLPClassifier(hidden_layer_sizes=(13,13,13), max_iter=10)
mlp.fit(X_train, y_train)

predictions = mlp.predict(X_test)
accuracy = accuarcy_score(y_test, predictions)*100
print('Accuracy of our model is equal '+ str(round(accuracy, 2))+ ' %/.')
```
* For our current scenario, we can see that the neural network is less accurate than the kNN. This could be due to a lot of reasons, including the randomness of the dataset, the choice of neighbors, and the number of layers.
* But if we run it enough times, we will observe that a kNN is more likely to give a better output as it always stores data points, instead of learning parameters as a neural networks do. 

# Deep Learning Architectures
* One-shot learning has been an active field of research for many scientists who are trying to find a cognitive machine that is as close as possible to humans in terms of learning.
* As there are various theories about how humans do one-shot learning, we have a lot of different deep learning methods that we can use to solve it. This section of the book will focus on metrics-based, model-based, and optimization-based deep learning architectures to tackle one-shot learning problems, along with their implementations.

# Metrics-Based Methods
* Deep learning has successfully achieved state-of-the-art performance in a variety of applications.
* But deep learning architectures often fail when forced to make predictions about data for which there is little supervised information available.

* In this chapter, we will learn about deep learning architectures that can learn proper mathematical representations from smaller datasets.
* Overall, we aim to create an architecture that can generalize unfamiliar categories without extensive data collections or training processes.

# Parametric methods - an overview
* This section will be primarily focused on what the parametric methods of machine learning are, and what they actually learn.

* In simple terms, parametric machine learning algorithms try to elarn the joint probabilistic distribution of data and their labels. 
* The parameters we learn are of the equation given by joint probabilistic distribution;

* Logistic regression is a form of discriminative classifier, and in discriminative classifiers, we make an assumption about the probabilistic distribution of Labels(Y), and try to somehow map our Input(X) to it. 

* Here, P(Y|X) is a categorical distribution, which means that we are trying to learn a distribution over possible categories.

# Neural networks - learning procedure
* As we know, neural networks learn through minimizing the loss function using the stochastic gradient descent optimization method.
* So, loss functions are one of the major factors that determine the objective of neural network architecture. 

* Figuring out a new loss function can be tricky due to two reasons:
 * The objective function has to be convex in nature to meet the requirements of stochastic gradient descent optimization.
 * Often, the minima obtained by different functions is the same numerically. 

# Visualizing parameters
* Nueral networks learn through gradient descent, but what do they learn? The answer is parameters, but we are looking to understand what those parameters mean.
* This is because as we go into deeper layers, more information-rich features are being extracted through various matrix operations.
* This enables high-dimenional information to be compressed into the low-dimensional loss function space and results in a trained model:
* So for exmaple, if we are looking at categories such as flower versus car, the initial layers' features would be sufficient. But if we have categorieees such as types of cars, we need a deeeper model, as we need to extract more complicated features, which require a larger dataset.
* The question is, what decides the kind of features or parameters that a model learns, and is it possible to learn these importatnt parameters at initial layers? 
* Ih the next section, we will explore Siamese networks, a neural network architecture that can learn complex features in the first few layers by changing the loss funciton and its architecture design.

# Understanding Siamese networks
* A Siamese network, as the name suggests, is an architecture with two parallel layers.
* In this architecture, instead of a model learning to classify its inputs using classification loss functions, the model learns to differentiate between two given inputs.
* It compares two inputs based on a similarity metric and checks whether they are the same.
* Similar to any deep learning architecture, a Siamese network also has two phases - a training and a testing phase.
* But, for a one-shot learning approach (as we won't have a lot of data points), we will be training the model architecture on one dataset and testing it on a different dataset.
* To put this in simpler terms, we learn image embeddings using a supervised metric-based approach with Siamese neural networks, and then reuse that network's features for one-shot learning without fine-tuning or retraining.

* Extraction of good features for machine learning algorithms plays a crucial role in determining the efficiency of a model. In various scenarios, it is proven to be either computationally expensive or difficult when we have limited data available.

* As we can see in the following diagram, our objective is to train a network to understand whether two images or sounds are the same.
* The key idea might sound similar to transfer learning, but it is a little different. 
* Siamese networks learn these features using the contrastive loss function. 
* Secondlyy, a Siamese network approach is only valid for similar domains, as it also needs to take card of domain adaption, that is, it needs to try to ensure that our training and testing datasets are close in terms of the domain.

* In the next section, we will look into the architecture of the Siamese network and learn about its optimization.

## Architecture
* A Siamese network consists of two identical neural networks that share similar parameters, each head taking one input data point.
* In the middle layer, we extract similar kinds of features, as weights and biases are the same. 
* The last layers of these networks are fed to a contrastive loss function layer, which calculates the similarity between the two inputs.

* One question you might have is why do Siamese networks' layers share parameters? If we are already putting the effort into changing the loss function, won't it help us to train the layers separately?

* These are two major reasons why we are not training layers separately:
 * For every layer, we have thousands of parameters being added. 
 * Therefore, similar to how we do in a convolutional neural network appraoch where we share parameters, we can optimize the network fastter.
 * Sharing weights guarantees that two similar images won't be mapped to different locations in the feature embeddings space.

* Feature embeddings are the projection of features to some higher dimensional space, also known as the feature embeddings space, depending upon the task we want to achieve.

* The following diagram illustrates a sample Siamese network architecture:
 * The nueral network transforms the input into a properties vector
 * the distance function decides if the output vectors are close enough to be similar


## Preprocessing
* For training a Siamese network, we need to apply a special kind of preprocessing to the dataset. 
* While preprocessing the dataset, we have to carefully create pairs of data points as follows:
 * Pairs of similar images
 * Pairs of dissimilar images

* We also need to create labels accordingly for similar data points and dissimilar data points; then, each pair is fed to the Siamese architecture.
* At the end of the layer, the Siamese network uses a differentiating form of the loss function to learn the differentiating features across layers. 
* Commonly, we use just two types of function for Siamese networks - the contrastive loss function, and the triplet loss function.

## Contrastive loss function
* The whole idea of using Siamese architecture is not to classify between classes but to learn to discriminate between inputs.
* So, it requires a differentiating form of the loss function known as the contrastive loss function.

* By enforcing a margin, we ensure that the Siamese network learns a good decision boundary.

* Though the contrastive loss function is a good method for learning discriminative features, in other modified versions of the Siamese network architecture, the contrastive loss function isn't able to learn decision boundaries very clearly. 
* In this case, we can use a new loss function known as triplet loss, which helps the architecture to get better results.

## Triplet loss function
* The triplet loss function is an  alternative to the contrastive loss function. It has convergence advantages over contrastive loss functions.
* To learn about the triplet loss function, first, we need to define data points in pairs:
 * Anchor: the main data point 
 * Positive: a data point similar to Anchor
 * Negative: a different data point than Anchor

* The triplet loss function converges better than the contrastive loss function because it considers three examples at a time, maintaining the distance between the Positvie and Negative points as shown in the preceding diagram, thereby learning decision boundaries more accurately, whereas the contrastive loss function only considers pairwise examples at a time, so in a sense, it is more greedy, which affects decision boundaries.

## Applications
* In the next section, we will learn about the matching networks architecture, which learns a probability distribution over label s of the training set using an attention mechanism, and different training procedures.

# Understanding matching networks
* Matching networks, in general, propose a framework that learns a network that maps a small training dataset and tests an unlabeled example in the same embeddings space.
* Matching networks aim to learn the proper embeddings representation of a small training dataset and use a differentiable kNN with a cosine similarity measure to check whether a test data point has already been seen.

* Matching networks are designed to be two-fold:
 * Modeling level: At the modeling level, they propose matching networks, which uses advances made in attention and memory that enables fast and efficient learning.
 * Training procedure: At the training level, they have one condition - the distribution fo training and test sets must be the same.

* Matching networks incorporate the best characteristic of both parametric and non-parametric models, also famously known as differntial nearest neighbor.

## Model architecture
* The matching networks architecture is majorly inspired by the attention model and memory-based networks. In all these models, a neural attention mechanism is defined to access a memory matrix, which stores useful information to solve the task at hand. 
* To begin with, first, we need to understand certain terminologies used in matching networks:
 * Label set: This is the sample set of all possible categories.  * Support set: This is the sampled input data points of our label set categories.
 * Batch: similar to the support set, a batch is also a sampled set consisting of input data points of label set categories.
 * N-way k-shot method: Here, N is the size of the support set, or in simpler terms, the number of possible categories in the training set. 
 * For example, in the diagram that follows, we have four different types of dog breeds, and we are planning to use the 5-shot learning method, that is, have at least five examples of each category.
 * This will make our matching networks architecture use 4-way 5-shot learning.

* The key idea of matching networks is to map images to an embedding space, which also encapsulates the label distribution, and then project a test image in the same embedding space using different architecture; then, later, we use cosine similarity to measure the similarity metric.
* Let's look at how matching networks create their embeddings space.

# Training procedure
* When it comes to training architecture, matching networks follow a certain technique: they try to replicate test conditions druing the training phase. 
* In simpler terms, as we have learned in the previous section, matching networks sample label sets from the training data, and later they generate a support set and a batach set from the same label set.
* After data preprocessing, matching netwokrs learn their parameters by training the model to minimize the error by taking support sets as training sets, and batch sets as test sets.
* This training procedure of taking a support set as the training set and a batch set as the test set enables matching networks to replicate the test conditions.
* In the next section, we will go through the architecture and algorithm of matching networks, and learn how ot use the batch set, which is the test set, during the model's training phase.

# Modeling level - the matching networks architecture
* Now the question arises as to how to extract embeddings from both the test and training sets. Any form of neural network will owrk.
* For images, the famous VGG16 or Inception Net will provide proper embeddings for both the test and train images by using transfer learning;
* They are commonly used for initial feature extraction of any image, as this will give our architecture a proer initialization for the training procedure.
* Matching networks pointed out two issues with the preceding simplistic non-parametric approach:
 * Embeddings of the training set images are independent of each other, without considering them to be part of a support set, even though the calssification strategy is conditioned on the support set.
 * Solution: Matching networks use a bi-directional Long Short-Term Memory to enable the encoding of each data oint in the context of the whole support set. 
