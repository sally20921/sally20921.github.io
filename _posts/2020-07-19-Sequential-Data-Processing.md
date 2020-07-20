---
layout: post
title: Sequential Data Processing
categories: PyTorch
tags: [PyTorch]
excerpt: PyTorch Deep Learning Hands-On
---

- The major challenges  that neural  networks are trying to  solve  today are  processing, understanding, compressing, and  generating sequential data. Sequential data  can be described vaguely as anything that has a dependency on the  previous data point and the next  data point. 
- Handling different  types of sequential data requires different techniques, although the  basic approach can be generalized. 

# Introduction to recurrent  neural networks  
- Recurrent  neural networks (RNN) are  the  de  facto  implementation for sequential  data processing. As the name indicates, RNNs recur through the  data holding the  information from the previous run and try to find the  meaning  of the sequence,  just like how humans do. 
- Although  the  vanilla RNN, was a revolutionary idea, it failed to  provide production-ready results. When the  length of the  input  sequence  is  increased,  the  network  won't be  able  to  remember  information  from the  initial units when  it reaches the last cells. 
- The state-of-the-art models now use long short-term memory (LSTM) implementations or gated recurrent units  (GRU). Both of these implementations use gates inside the RNN cell for  different purposes, such as  the forget gate, which is responsible for  making the  network forget unnecessary  information. 
- Attention  was the  next big  invention, which helps the  network  to focus on an  important part of  the input instead of searching the  whole input  and  trying to find  the  answer. Most implementations use  LSTM/GRU and attention together. 
- Embedding was another  revolutionary  idea for finding the  conceptual meaning of a  word by comparing the distribution of a  word in a  word  cluster. Embeddings keep the  relation between words and  convert this relation,  which it finds  from the  distribution of words in a word cluster,  to a set of floating point  numbers. Embeddings reduce the input size  drastically and  improve  performance and accuracy a great  deal. We'll use word2vec for our experiments. 
- Data processing is one  of the  main  challenges when it comes to sequence data, especially natural language. PyTorch provides  several utility packages  to  handle that. 

# The Problem
- The  problem  is finding the similarity between  two  English sentences  with  three  different approaches. 

# Approaches  
- the  sentences are converted to embeddings  first and then passed into each  implementation. 

## Simple RNN
- How can we make our neural network process the  English language? The old approach would be to  convert the  input to a one-hot encoded sequence.  Do you see what would be the  problem with one-hot encoding? You would end up having a huge input layer as your  vocabulary size  increases. That is when embedding can help you. 

### Word Embedding 
- Word embedding is a  decades-old idea to  reduce the dimensionality fo the  array or tensors. 
- Word2vec is an unsupervised  learning algorithm where  the  network makes embeddings without being trained to  do so. 
- GloVe  is a count-based model where we make a  huge  table  that shows the  frequencies of each word corresponding to other words. 
- PyTorch has an embeddings layer created  in *torch.nn*, just like other PyTorch layers. It is trainable for our  custom dataset,  although we  could use the pretrained  model. The embedding layer  requires the size of the vocabulary  and  size  of the  embedding dimension we wanted to  keep. 

### RNNCell 
- The way it works is that one  RNN cell is capable  of processing all  the words in the  sentence one by one. 

`
```python
class RNNCell(nn.Module):
 def __init__(self, embed_dim, hidden_size, vocab_dim):
  super().__init__()
  self.hidden_size =  hidden_size
  self.input2hidden = nn.Linear(embed_dim+hidden_size, hidden_size)
  
 def forward(self, inputs, hidden):
  combined  = torch.cat((input, hidden), 1)
  hidden = torch.relu(self.input2hidden(combined))
  output = self.input2output(combined)
  output = self.softmax(output)
  return output, hidden 
  
 def init_hidden(self):
  return torch.zeros(1, self.hidden_size)
```

### Classifier 
- So, we have two sentences in hand that we passed through the encoders and we got the final  hidden state of both sentences. Now it's time to  define the loss  function.
- One approach would  be  to find the distance  between  the  high-dimensional hidden states  from both sentences. THe loss  can be  manipulated  as follows:
1) Maximize the loss to a big positive value if  it's an entailment.
2) Minimize the loss to  a  big negative value  if it's a contradiction. 
3) Keep the  loss around zero if it's neutral 

- Another approach could be  to concatenate  the  hidden states of both sentences and  pass them to another set of layers, and define a final classifier layer that could classify the concatenated value into the three classes we want.

```python
class  RNNClassifier(nn.Module):
 def __init__(self, config):
  super().__init__()
  self.config = config
  self.embed = nn.Embedding(config.vacab_dim, config.embed_dim)
  self.encoder = Encoder(config)
  self.classifier = nn.Sequential(
                      Merger(config.embed_dim, config.dropout),
                      nn.Linear(4*config.embed_dim, config.fc1_dim),
                      nn.ReLU(), 
                      nn.BatchNorm1d(config.fc1_dim), 
                      nn.Dropout(p=config.dropout),
                      nn.Linear(config.fc1_dim, config.fc2_dim)
                    )
```

- The RNNClassifier module has three major layers, which we discussed previously:
1) The embedding layer saved into *self.embed*
2) The encoder layer that uses *RNNCell*
3) An instance of the  *nn.Sequential* layer stored in *self.classifier*

- The final sequential layer starts with the *Merger* node. The merged output  will have the  sequence length dimension augmented by a factor of four because we append both sentences, their difference, and their product to the output of *Merger*.
- This is then passed  through  a fully  connected  layer, which will then be  normalized using  *batchnorm1d* after a *ReLU* non-linearity. 
- The dropout afterward reduces the chance of overfitting, which is then passed to  another  fully connected layer,  which creates scores for our input data.  

###  Training 
- We  initialize the model class, we define the  loss function, and then we define the  optimizer.  - But in a simple RNN, since we  are doing transfer learning  from the learned embeddings from the  GloVe vectors, we have to  transfer those learned weights  to  the weight matrix of our embed layer. 
```python
model = RNNClassifier(config)
model.embed.weight.data = inputs.vocab.vectors
criterion = nn.CrossEntropyLoss()
opt =  optim.Adam(model.parameters(), lr=lr)
```
## Advanced RNNs
- Gates are fundamentally activations, such as sigmoid, to decide the  amount  of data to  flow through. 

### LSTM
- LSTMs are mainly composed of a forget gates, and update  gate,  and a cell state, which makes the LSTMs different  from normal RNN cells. 
- All the  operations will be performed on the  cell state flowing parallelly through the network, which has only a linear interaction with the  information in the  network  and hence allows the  data  to flow  forward and  backward seamlessly.

### GRUs
- GRUs merges the  forget gate  and  update gate  together and only do one-time  updating  on the  cell state. 
- In  fact, GRUs don't have a  separate cell state and hidden state, both of which  are merged together to  create one  state. 
- GRUs are being  widely used nowadays  because of the  performance  gain GRUs have over LSTMs. 

### Architecture
- PyTorch has functional APIs available  for  using an LSTM cell or GRU cell as  the smallest unit of the recurrent  network. 
- The only difference between advanced RNNs and simple RNNs lies in the  encoder network. The *RNNCell* class  has been replaced with *torch.nn.LSTMCell* or  *torch.nn.GRUCell*, and the *Encoder* class uses these prebuilt cells instead of the  custom *RNNCell* we made  last time.

```python
class Encoder(nn.Module):
 def __init__(self, config):
   super(Encoder, self).__init__()
   self.config =  config
   if config.type == 'LSTM':
    self.rnn  = nn.LSTMCell(config.embed_dim, config.hidden_size)
   elif config.type == 'GRU':
    self.rnn = nn.GRUCell(config.embed_dim, config.hidden_size)
 
 def forward(self, inputs):
  ht = self.rnn.init_hidden()
  for word  in inputs.split(1, dim=1):
   ht, ct =  self.rnn(word, (ht, ct))
```
- The forward call  accepts the  mini-batch of  input with the  input size and creates cell  state and hidden state  for  that instance,  which is then passed to the  next execution input. 
- The *torch.nn* module has higher-level APIs for LSTM and GRU nets, which wrap *LSTMCell* and *GRUCell* and implement  the  efficient execution using **cuDNN(CUDA Deep Neural Network)**.
- Theoretically, bidirectional RNNs tend to work better if the  tasks in hand require  past and future information. In our classification task, a bidirectional RNN works better since when the  RNN makes the contextual meaning of the  sequence, it uses the flow of the  sequence  on both sides. PyTorch's LSTM or  GRU accepts a Boolean value  for the  argument *bidirectional*, which decides whether the network should be bidirectional or not. 

### Attention
- Attention is the  process of focusing on  the  important  area along with the  normal neural  network process. Attention acts  as another module that looks at  the  input  always and is passed as an extra  input to  the current network. 
- The idea behind attention is that we focus on the  important part of  the  sentence when we read one.  
- Attaining  attention in PyTorch is straightforward once the concept is clear.  Attention  can effectively be  used in a number of applications, where autoencoders were  the go-to implementation before, and  CNN to  RNN, and others. 
