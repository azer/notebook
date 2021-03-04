# Tensors

The special data type that undergirds all of the mathematical transformations you perform is called a Tensor.

## A Tensor has Data

A Tensor is a repository for some set of data, usually numeric. In this way, it's similar to the flat or multidimensional arrays.

```js
> tf.tensor([1, 2, 3, 4]).print();
Tensor
    [1, 2, 3, 4]
```

## A Tensor has a Dimension

The array from the previous example was a flat sequence of numbers. Another way of thinking about that array is that it has a dimension of 1.

Something more complex, like an Excel spreadsheet which contains rows and columns, would have a dimension of 2.

Tensors define an easy way to encode dimensionality into the data structure. (Dimensionality is commonly referred to as "Rank", as in "this tensor has a Rank of 2".)

Let's see an example of a 2-dimensional Tensor:

```js
> tf.tensor([[1, 2], [3, 4]]).print();
Tensor
    [[1, 2],
     [3, 4]]
```

Higher rank tensors are used for a wide variety of machine learning problems, as [Daniel Jeffries lists](https://hackernoon.com/learning-ai-if-you-suck-at-math-p4-tensors-illustrated-with-cats-27f0002c9b32) in his tutorial:

3D = Time series
4D = Images
5D = Videos

## A Tensor has a Shape

Closely correlated with the Tensor's Dimension (or Rank) is Shape.

A Tensor's shape describes the underlying length of the Tensor's dimensions. Here's an example:

```js
> tf.tensor([[1, 2, 3], [3, 4, 5]]).shape
(2) [2, 3]
```

## A Tensor has a Type

be floating point numbers (decimals), integers, or booleans.

We can set the data type upon creation of the Tensor:

```js
> tf.tensor1d([1, 2], null, 'float32').dtype
"float32"
```

## A Tensor Describes Valid Transformations

A Tensor encodes some knowledge of what are valid mathematical operations in relation to other Tensors. For this reason, it can be useful to think of Tensors not as data structures but as objects or classes. This is exactly how Tensorflow.js represents a Tensor.

```js
> tf.tensor1d([1, 2]).dot(tf.tensor2d([[1,2], [2, 3]])).print()
Tensor
    [5, 8]
```

However, if we try and perform an invalid calculation:

```js
> tf.tensor2d([[1, 2, 3], [4, 5, 6]]).dot(tf.tensor2d([[1,2], [2, 3]])).print()
Uncaught Error: Error in dot: inner dimensions of inputs must match, but got 3 and 2.
```
