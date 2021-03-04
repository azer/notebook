# Vectorization

* Vectorization is the art of getting rid of explicit for loops in your code.
* Deep learning algorithms tend to shine in large datasets.
* It's important that our code run quickly, otherwise, we'll have to wait very long time to get results.

## Setup & run Jupyter Notebook

```bash
$ docker pull jupyter/scipy-notebook
$ docker run -d --name notebook -p 0.0.0.0:8888:8888 jupyter/scipy-notebook:latest
```

Get URL & secret token for the notebook:

```bash
$ docker exec 8ac9b7558964 jupyter notebook list
```

## Vectorized vs Nonvectorized

* Define two large arrays with random values:

```py
import numpy as np
import time

a = np.random.rand(1000000)
b = np.random.rand(1000000)
```

And compute the sum without vectorization:

```py
c = 0
tic = time.time()
for i in range(1000000):
    c += a[i]*b[i]
toc = time.time()

print("For loop:", str(1000 * (toc - tic)) + "ms")
```

It'll output a number close to 1 second:

```
For loop: 880.5141448974609ms
```

Now, compute the sum with vectorization:

```py
tic = time.time()
c = np.dot(a,b)
toc = time.time()

print("Vectorized version:", str(1000*(toc - tic)) + "ms")
```

It'll output much smaller number:

```
Vectorized version: 2.811431884765625ms
```

## Vectorizing Logistic Regression
