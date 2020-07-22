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
- The idea is that  the embedding functino learns semantic information about the  words. It associates each words in the  vocabulary with a continuous-valued vector representation, that is, the  word embedding. Each word corresponds to a point in this embedding space,  and different dimensions correspond to the grammatical  or semantic properties of these words. 
-  The  goal is to ensure that the words close to  each other in the embedding space have similar meanings. In this  way, the  information that some words are semantically similar can be  exploited by the language  model. 
- Words embeddings are  one of the central  paradigms when solving  NLP tasks.

## Nueral Probabilistic Language Model  
- It is possible to learn the language model and,  implicitly, the embedding function via feedforward fully connected network. Given  a sequence of *n-1* words, it tries to output  the  probability distribution of the next  word. The network layers play different roles, such as the  following:
1) The  embedding layer takes the one-hot representation of the word w_i and transforms it into the word's embedding vecgor by multiplying it with  the embedding matrix, **C**. This computation can  be  efficiently implemented with table  lookup. The  embedding  matrix, **C**, is shared between the words, so all words use the same embedding  function. **C** is a *VxD* matrix, where  *V* is the size of the vocabulary and *D* is the size of the embedding. In other words, the matrix, **C** represents the network weights of the hidden *tanh* layer.
2) The resulting embeddings are concatenated and serve  as an input to the hidden layer, which uses *tanh* activation. 
3)  Finally, we  have the  output layer  with weights, *U*, bias, *b*, and softmax activation,  which map the hidden layer to the word space probability distribution.

- This model simultaneously learns an embedding  of all the words in the vocabulary (embedding  layer) and a model of the probability  function for sequences of words (network output). It is  able to  generalize  this probability function to sequences of words that were  not  seen during training. 
- Since  we can construct the  training  data and labels based on the positions  of the  words (which already exist  in the text), training  this model is an unsupervised learning task. 

## Word2Vec
- word2vec creates embeddingvectors based on the context (surrounding words) of the word in focus. 

### CBOW
- CBOW predicts the most likely word given its context (surrounding words). 
1) The network  has input, hidden, and output layers.
2) THe input  is the  one-hot encoded word representations.The one-hot encoded vector size of each  word is equal to the size of the  vocabulary, *V*.
3)  The  embedding vectors are represented  by  the  input-to-hidden weights, W_(VxD), of the  network. They are  VxD-shaped matrix, where *D* is the length of the embedding vector (which is the  same as the  number of units in the hidden layer). We can  think of the weights as  a  lookup table, where each  row represents one word embedding  vector. 
3) The  embedding vectors of all context words are  averaged  to produce the output of the  hidden network layer.
4) THe hidden activations serve  as input  to  the  output softmax layer  of size  *V*, which predicts the most likely owrd to be found in the context of the input words. 

-We'll train the network with  gradient descent and backpropagation.  The training set consists of one-hot  encoded  pairs of words, appearing  in  close proximity to  each other in the text. 

# Sequence-to-Sequence Models and Attention 
- In this section, we'll introduce  the attention mechanism - a new type of algorithm for seq2seq tasks. It allows direct access  to any element of the input  sequence. 

##  Introducing seq2seq models
-Seq2seq, or encoder-decoder  models use RNNs in a way  that's especially suited for  solving tasks with indirect many-to-many relationships between  the  input and the  output. The model consists  of  two  parts: an encoder and a decoder. Here's how the inference part works:
1) The encoder  is an  RNN. THe  original paper uses LSTM, but GRU  or other types would also work. Taken by itself, the  encoder works in the usual way - it reads the input  sequence, one step  at a time, and updates its internal state after each step. The  encoder  output is discarded and has no role in the  seq2seq model, as we're only interested in the hidden encoder state.
2) Once the encoder is finished, we'll signal the decoder so that it can start generating the  output sequence.  The decoder is also an RNN (LSTM or GRU). The linke between the  encoder and the decoder is the most recent encoder internal state vector h_t (also known as the  thought vector), which is fed as the  recurrence relation  at the  first decoder step.  

- The  training  of the model is supervised,  and  the  model needs to know both the  input sequence and its corresponding target output sequence. We  feed the  input sequence  to the decoder, generate  the  thought vector h_t,  and use it to initiate the output sequence generation from the decoder. 

## Seq2seq  with  attention
- The decoder has to generate the entire output sequence  based solely on the  thought vector. For  this to  work,  the  thought vector has to encode all of the information  of the input sequence;  however,  the encoder is an RNN, and we can expect that its  hidden state wil lcarry more inforamtion about the  latest sequence elements than the  earliest. Using  LSTM  cells and reversing the input helps, but cannot prevent it entirely. Because of this, the thought vector becomes something of a bottleneck. As a  result, the  seq2seq model works well for short sentences, but the performance deteriorates for longer ones. 

###  Bahdanau attention
- We can solve  this problem with  the help of the **attention mechanism**, an extension of the seq2seq model, that provides  a way for the decoder to work with all encoder hidden  states, not just the last one.  
- Besides solving the  bottleneck problem, the attention mechanism has some other advantages. For one, the immediate  access to all previous states helps to prevent  the vanishing gradient problem. It also allows for some interpretability of the  results because we can see what parts of  the  input the  decoder  was focusing on. 
- The attention mechanism works by plugging an  additional context  vector  c_t between the encoder and the decoder. The hidden decoder state s_t at the time t  is  now  a function not only of hidden state  and decoder  output  and step  t-1, but  also of the context vector c_t. 
- Each  decoder step has a unique context vector, and the context vector for  one  decoder step is just a weighted sum of all encoder hidden states. In this way, the encoder has access to  all input sequence states  at each output step *t*, which removes the  necessity  to  encode  all  information  of the source  sequence  into a fixed-length vector

### General attention
- Let's assume that we are working with hard attention. We can think of vector s_(t-1) as a query executed against  a  data-base of key-value pairs, where  the keys are vectors and the hidden states are the values. These are often abbreviated as Q, K, and V, and you can think of them as matrices of vectors. 

### Understanding transformers
- But  we still use attention in the context of RNN - in that sense, it works as an addition on top of the core  recurrent nature of these models. Since  attention is so good, is there  a  way  to use it on its own without  the RNN part? It turns out that there is. The  paper  *Attention is all you need* introduces a new architecture called **transformers** with encoder and  decoder that relies solely on the attention mechanism. 

### The transformer  attention 
- The transformer  uses dot product  attention, which follows the general attention procedure. In practice, we'll compute the attention  function over a  set  of  queries simultaneously, packed into  matrix **Q**. In this scenario, the keys **K**, the values **V**, and the result are also matrices. 
1) Match the query **Q** and the database (keys **K**) with matrix multiplication to produce the alignment  scores. In other words, we can match  multiple queries against multiple database keys in a single matrix-matrix multiplication. In the context of NMT, we can compute  the alignment  scores of all words of the  target sentence over all words of the  source sentence in the  same way. 
2) Scale  the alignment scores, where d_k is the vector size of the key vectors in the matrix **K**, which is also equal to the size of the query vectors in **Q**. 
3) Compute  the attention scores with  the softmax operation along the rows of the matrix. 
4) Compute the  final attention vector by multiplying the attention scores with the  values **V**.

- The authors also proposes multihead attention. Instead of a single attention function with  d_model-dimensional keys, we  linearly project the keys, queries, and values *h* times to produce  *h* different d_k, d_k, and d_v-dimensional projections of these values. Then we apply separate parallel  attention  functinos over the newly  created vectors, which yield a single d_v-dimensinal output  for each head. Finaly, we concatenate the  head outputs  to produce the  final attention result.  Multihead attention allows each head to  attend to  different elements of the sequence.  Let's look at this in more detail, starting with the heads:

