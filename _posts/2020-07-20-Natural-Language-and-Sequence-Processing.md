---
layout: post
title: Natural Language and Sequence Processing
categories: PyTorch
tags: [PyTorch]
excerpt: Advanced Deep Learning with Python
---

# Language Modeling 
- In order to solve **Natural Language  Processing (NLP)** problems, we have to represent the  natural  language  
in  a way that  the  computer can understand, and this is not  a trivial task. 
- Let's focus on text data. Unlike an image, we have 1D (as opposed to 2D) data - a single  long sequence 
of words. All the pixels of the image  relate  to one digit; however, we don't  know  whether all the  words
relate to the  same subject. 
- To help us  with this, we'll use a  special type of vector word representation (language model).
The language  models we'll discuss use the context  of a word (its surrounding words) to create a
unique embedding  vector associated with that word. These vectors carry more information about the  
word, compared to, say, one-hot encoding. They  serve as a base for various NLP tasks.

##  Understanding n-grams
- A word-based  language model defines a probability  distribution over sequence of words.
Given a sequence of words of length *m*, (for example, a sentence), it assigns a probability
*P(w_1, ..., w_m)* to the full sequence of words. We can use these probabilities as follows:
1) to  estimate  the  likelihood of different phrases in NLP applications.
2) As a generative model to create new text. A word-based language model can compute the likelihood of a
given word following a sequence of words. 
- We can calculate  the  joint probability with the  chain rule of joint probability.
The  probability  of the  later words given the  earlier words would be especially difficult to estimate
from the data. That's why  this joint probability is typically approximated by an independence assumption that 
the i-th words is only dependent on the  *n-1* previous words. We'll only model the joint probabilities
of combinations of *n* sequential words, called *n-grams*. 
- The inference of the joint  distribution is approximated with the help of *n-gram* models that  split the  
joint distribution into multiple independent parts. 

## Introducing Neural Language Models
- One way to overcome the curse of dimensionality is by learning a lower-dimensional, distributed
representation of the words. This distributed representation is created by learning an embedding function
that transforms the space of words into a lower-dimensional space of word embeddings as follows:
- Words from the vocabulary with  size *V* are transformed into one-hot vectors of size *V* (each
words is encoded uniquely). Then the embedding function transforms this *V*-dimensional space into a  
distributed representation of size *D*. 
- The idea is that  the 
