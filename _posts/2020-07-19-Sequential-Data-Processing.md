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
- We  initialize the model class, we define the  loss function, and then we define the  optimizer.  - But in a simple RNN, since we  are doing transfer learning  from the learned embeddings from the  GloVe vectors, we have to  transfer those learned weights  to  
