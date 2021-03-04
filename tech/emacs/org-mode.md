# Org-mode

Useful commands:

* `C-c ?` org table field info
* `C-c *` recalculate the table formula
* `C-c ^` sort rows

## Tables

Start a table by `|` and hitting `tab`:

```
| Expense
```

To add a formula, go to the field and type the formula:

```
:=vsum(@2$2..@8$2)
```

```
| Expense    | Budget |
|------------+--------|
| Bills      |    271 |
| Shopping   |    150 |
| Cash       |    100 |
| Eating out |    150 |
| Grocery    |    100 |
| Books      |     50 |
| Other      |     50 |
|------------+--------|
| Total      |    871 |
#+TBLFM: @9$2=vsum(@2$2..@8$2)
```
