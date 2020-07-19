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
