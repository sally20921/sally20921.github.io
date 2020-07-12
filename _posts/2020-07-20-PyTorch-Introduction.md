---
layout: post
title: PyTorch Introduction
categories: PyTorch
tags: [PyTorch, Deep Learning]
excerpt: PyTorch Deep Learning Hands-On
---

# What is PyTorch?
 
 Pytorch is a tensor computation library that can be powered by GPUs. In PyTorch, you can inherit PyTorch classes and customize as you desire. The tape-based autograd system enables PyTorch to have dynamic graph capability. Dynamic graphs and a  Python-first approach allow easy debugging, where you can use the usual Python debuggers like Pdb or editor-based debuggers. 
 
 # Using Computational Graphs 
  
  A graph is made by a group of nodes and edges connecting them. In computational graphs, nodes represent the tensors and edges represent the relationship between them. Computational graphs help with doing backpropagation as easily as moving from child node to  previous nodes, and carrying  the gradients along while traversing back. Specifically, reverse-mode automatic differentiation is the core idea used behind computational graphs for doing backpropagation. 
  
# Learning the Basic Operations 

`python
import torch 
`

 Concatenation is an important operation that you need in your toolbox. The `stack` operation looks very similar to concatenation but it is an entirely different operation. If you want to add a new dimension to your tensor, `stack` is the way to go. Similar to cat, you can pass the  axis where  you want to add the new dimension. 
 
 
