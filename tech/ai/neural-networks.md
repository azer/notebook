# Neural Networks

## What is a neural network?

Notes from a [3Blue1Brown video on Youtube](https://www.wetube.com/watch?v=aircAruvnKk).

* Think of each neuron as a function. It takes the outputs of all the neurons in the previous layer, and spits out a number between 0 and 1.
* The entire network is also just a function. It takes in N (e.g 784) numbers as an input and spits out 10 numbers.
* Imagine a 28x28 pixels picture of a handwritten digit.
* The network starts with 28x28=784 neurons. Each one of these takes a number that represents the grayscale value of the corresponding pixel, ranging from 0 for black pixels, up to 1 for white pixels. This number is called activation.
* The last year has 10 neurons; each representing one of the digits. The activation in these neurons -some number between 0 and 1- represents how much the system thinks that the given image corresponds with a given image.

![](./images/neural-network-01.png)

* Activations on one layer, determines the activations on the next layer. If we feed an image lighting up all 784 neurons of the input layer according to the brightness of the each pixel; that pattern of the activations causes some very specific pattern in the next layer, which causes some pattern in the one after it, which finally gives some pattern in the output layer; the brightest neuron in the output layer is the choice of the network.
* How exactly activations in one layer might determine the activations in the next? The goal is to have some mechanism that can conceiveably combine pixels into edges, or edges into patterns, or patterns into digits.
* Let's say the hope is one particular neuron in the second layer to pick up on whether or not the image has an edge in a region of the image.
* What parameters should exist to capture a pattern ? We'll assign a weight to each connection between our neuron and the neurons from the first layer;

![](./images/neural-network-02.png)

* Next; take all the activations from the first layers and compute their weighted sum.
* If we made all of the weights associated with almost all of the pixels zero, except for some positive weights in this region we care about, then taking the weighted sum of all the pixel values amounts to adding up to the values of the pixels in the region we care about.
* If we wanted  to pick up on whether there is an edge here, have some negative weights associated with the surrounding pixels, then the some is largest when those middle pixels are bright, but the surrounding pixels are darker.

![](./images/neural-network-03.png)

* We want activations to be a number between 0 and 1; a common thing to do is pump this weighted sum into sigmoid function that squashes the real number into a range between 0 and 1. Very negative inputs will be close to zero, very high numbers will be close to 1.

![](./images/neural-network-04.png)

* We need neurons to light up only when they have a meaningfully high number, not just when they're higher than zero. We'll add bias -another number e.g (-10)- to set how high the weighted sum needs to be, before the neuron starts getting meaningfully active, before passing the sum to sigmoid function.

![](./images/neural-network-05.png)

* The connection between other layers will also have weights and biases. The example network will have 784x16+16x16+16x10 weights and 16+16+10 biases in total.
* The actual function can be organized in a more notationally compact way; organize all activations from one layer into a column as a vector, then organize all weights as a matrix, and each row of this matrix corresponds to the connections between one layer and particular neuron in the next layer.
* Instead of adding bias to each value independently, we represent it by organizing all those biases into a vector, and adding the entire vector to previous matrix vector product.
* As a final step, we'll wrap a sigmoid around the outside here. That represents applying sigmoid function to each specific component of the resulting vector inside.

![](./images/neural-network-06.png)

* Once we write down the weight matrix (W) and these vectors as their own symbols, we can communicate the full transition of layers from one layer to the next in an extremely tight & neat little expression;

  ```
  a⁽¹⁾ = σ(Wa⁽⁰⁾+b)
  ```

## Gradient Descent: How Neural Networks Learn?

Notes from a [3Blue1Brown video on Youtube](https://www.wetube.com/watch?v=IHZwWFHWa-w).

* To start, we'll take the example network in previous chapther, initialize all weights and biases randomly and the output layer will look like a mess.
* Now, we define a cost function to tell computer "that output should have activations zero for these neurons, but one for this neuron".

![](./images/neural-network-07.png)

* To express this mathematically, we add up the squares of the differences between each of those wrong output activations and the value we want them to have. This is what we call "cost of a single training example".

* This sum is small when network confidently classifies an image correctly, but it's high, when the network doesn't know what it's doing.

![](./images/neural-network-08.png)

* Then what we do is to consider the average cost over all of the thousands of training examples. This average cost is our measure for how lousy our network is.
* To tell the network what a lousy job its doing isn't helpful, we want to tell it how to change its weights and biases, so it gets better.
* Just imagine a simple function that has one number as an input, one number as an output; how do we find an input that minimizes the value of this function?
* A flexible tactic is to start at any old input and figure out which direction we should step to make that output lower. Specificly, if we can figure out the slope of the function where we are, shift to the left if that slope is positive, shift to the right if the slope is negative. If we do this repeatedly at each point checking the new slope and taking the appropriate step, we'll approach some local minimum of the function.

  ![](./images/neural-network-09.png)

* There is no guarantee that the local minimum we land in is gonna be the smallest possible value of the cost function. That will carry over to our neural network case as well.
* Notice that how we make our step sizes proportional to the slope, then when the slope is flattening out towards the minimum, our steps get smaller and smaller, and that helps us from over shooting.
* Now imagine a function with two inputs and one output. Think of the input space as X, Y plane, and the cost function as being graphed as a surface above it.
* Instead of asking about the slope of the function, we have to ask which direction should we step in this input space, so as to decrase the output of the function most quickly. In other words, what's the downhill direction?
* The gradient of a function, gives us the direction of steepest ascent.
* Taking the negative of that gradient gives us the direction to step that decreases the function most quickly.

![](./images/neural-network-10.gif)
