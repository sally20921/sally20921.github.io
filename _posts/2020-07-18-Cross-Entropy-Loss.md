# Task
## Multi-Class Classification
- each sample can belong to one of *C* classes. 
- The CNN will have  *C* output neurons that can be gathered in a vector *s* (scores).
- The target (ground truth) vector *t* will be  a one-hot vector with a positive  class and *C-1* negative  classes.

## Multi-Label Classification
- each sample can belong  to more than  one  class.
- The CNN will have *C* output neurons. 
- The target vector *t* can have more  than  a  positive  calss, so it will be  a vector of  0s and 1s with *C* dimensionality.

