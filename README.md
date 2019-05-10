

# Pattern Recognition with Single Layer Neural Network

## Oriol Domingo Roig, Roger Creus Castanyer

### May 2019 



In this work we aim to classify a set of numbers using a **Data Mining** technique, known as **Neural Network**. We are going to use a Single Layer Neural Network that will be trained on pictures of size $7$x$5$ pixels per image. Thus, Layer will consist of $35$ neurons, each one representing a pixel. Consequently, we will have $35$ weights that link a final node with the previous nodes and assign a probability value. This value represents whether the number is in the target number set or not.



![SLNN](/home/oriol/Downloads/SLNN.png)

​														               Figure 1 : Training Model [1] 



This project is divided into three components which ease the understanding of global workflow. Firstly, we developed some scripts that generate training data and test data. Both data sets play a specific role in the whole project. Then, it was necessary to build some objective functions that represents the work of the Neural Network. These functions were nurtured by training data. Following, we apply some mathematical programming algorithm to find the optimum value of such functions. Finally, our team reported the behavior of each model using some performance metrics respect to training and test data.



**References**

* [1] F.-Javier Heredia.  Unconstrained optimization.  University Lecture, 2019.