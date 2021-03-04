
# Octave

## Using the prompt

Elementary math & logical operations:

```octave
> 1+2
3

> 2^3
8

> 1 == 2
ans = 0

> 1 && 2
ans = 0

> xor(1,0)
```

Change the prompt:

```octave
PS1('>> ')
```

Variables:

```octave
> a = 3
> a
3

> b = 'hi'
> b
'hi'

> a = pi
> a
3.1416

> disp(sprintf('6 decimals: %0.6f', pi))
6 decimals: 3.141593

% get list of variables defined
> whos

% remove a variable
> clear a

% remove all variables
> clear
```

Vectors and matrices:

```octave
% 3x3 matrix
> A = [1 2; 3 4; 5 6]
> size(A)
ans =

   3   3

% Vector
> v = [1; 2; 3]
> length(v)
ans = 3

% 1x3 random matrix
> w = rand(1,3)
> w
ans =

   0.152253   0.329972   0.921088
   0.062060   0.911577   0.560723
   0.756555   0.743394   0.426702
```

Indexing operations:

```octave
> A = [1 2; 3 4; 5 6]
A =
   1  2
   3  4
   5  6

> A(2,:)
ans =
    3   4

> A(:,2)
ans =
    2
    4
    6

> A([1 3], :)
ans =
  1   2
  5   6

% replace the second column
> A(:,2) = [10; 11; 12]
A =
    1   10
    3   11
    5   12

% Add a new vector to the matrix
> A = [A, [100; 101; 102]]

% put all elements of A into single vector
> A(:)

% concat two matrices
> B = [11 12; 13 14; 15 16]
> C = [A B]

% Or put them on top of eachother
> C = [A; B]
```

Histogram:

```octave
> hist(w)
```

Identity matrices:

```octave
> eye(3)
ans =

Diagonal Matrix

   1   0   0
   0   1   0
   0   0   1
```

## Moving Data Around

Navigating in the filesystem:

```octave
> pwd
/home/azer

> ls
machine-learning dotfiles .config

> cd machine-learning
> load('features.dat')
```

Saving changes:

```octave
> save('hello.mat')

% save in human readable format;
> save('hello.txt') -ascii
```

## Computing on data

```octave
> A = [ 1 2; 3 4; 5 6; ]
> A'
ans =

   1   3   5
   2   4   6
> B = [11 12; 13 14; 15 16]
> C = [1 1; 2 2]
> A*C
ans =

    5    5
   11   11
   17   17

> v = [1; 2; 3]
> 1 ./ v
ans =

   1.00000
   0.50000
   0.33333

% increment every element of v by 1
> v + ones(length(v), 1)
% or, simply
> v + 1
```

## Plotting Data

```octave
> t = [0:0.01:0.98]
> y1 = sin(2*pi*4*t)
> y2 = cos(2*pi*4*t)
> plot(t,y2)

% update the plot while it's open
> hold on;
> plot(t, y1, 'b')
> plot(t, y2, 'r')
> xlabel('time')
> ylabel('value')
> legend('sin', 'cos')

% Save it as PNG
> print -dpng 'myplot.png'
```

Multiple plots;

```octave
> subplot(1,2,1)
> plot(t,y1, 'b')
> subplot(1,2,2)
> plot(t,y1, 'r')
```

Color map;

```octave
> A = magic(5)
> imagesc(A)

> imagesc(A), colorbar, colormap gray
```

## Control Statements

For loops:

```octave
> v=zeros(10,1)
> for i=1:10,
    v(i) = 2^i;
  end;
> v
v =

      2
      4
      8
     16
     32
     64
    128
    256
    512
   1024
```

While loops:

```octave
> i = 1
> while i <= 5;
    v(i) = 100;
    i = i+1
  end
```

If statements:

```octave
> v(1) = 2
> if v(1)==1,
    disp('the value is one')
  elseif v(1) == 2,
    disp('the value is two')
  else
    disp('the value is not one or two')
  end
```

## Functions

Create a file for the function defined;

```octave
% /home/azer/squareThisNumber.m

function y = squareThisNumber(x)

y = x^2;
```

```octave
> cd '/home/azer'
> squareThisNumber(5)
25
```

### Example Cost Function

Definition:

```octave
function J = costFunction(X, y, theta)

  m = size(X, 1);
  predictions = X*theta
  sqrErrors = (predictions-y).^2;

  J = 1/(2*m) * sum(sqrErrors)
```

Usage:

```octave
> X = [1 1; 1 2; 1 3]
> y = [1;2;3]
> theta = [0;1]
> costFunction(X,y,theta)
predictions =

   1
   2
   3

J = 0
```
