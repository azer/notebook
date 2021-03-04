
# Machine Learning Recipes

## Finding Patterns in Data

Define features of apples and oranges:

```python
# [weight, bumpy texture?]
features = [[140, 1], [130, 1], [150, 0], [170, 0]]
```

And define their labels.

```python
# Is orange?
labels = [0, 0, 1, 1]
```

Now predict given features:

```python
from sklearn import tree

features = [[140, 1], [130, 1], [150, 0], [170, 0]]
labels = [0, 0, 1, 1]

clf = tree.DecisionTreeClassifier()
clf = clf.fit(features, labels)

print(clf.predict([[125, 1]]))
```
