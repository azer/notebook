# ELM

* I actually wrote a guide for Elm. Check that out: [The Hitchhiker's Guide to Elm
](https://kodfabrik.com/journal/elm/)

## Function Composition

```elm
addOne : Int -> Int
addOne number =
    number + 1

multiplyByThree : Int -> Int
multiplyByThree number =
    number * 3

firstAddThenMultiply : Int -> Int
firstAddThenMultiply number =
    (addOne >> multiplyByThree) number

firstMultiplyThenAdd : Int -> Int
firstMultiplyThenAdd number =
    (addOne << multiplyByThree) number

firstAddThenMultiply 5 --> (5 + 1) * 3
firstMultiplyThenAdd 5 --> (5 * 3) + 1
```

The arrows show the direction (what goes after what).
Note that you could say

```elm
firstAddThenMultiply : Int -> Int
firstAddThenMultiply =
    addOne >> multiplyByThree
```
but in Elm we generally [try not to be too clever](http://martin.janiczek.cz/clanek/being-clever-antipattern-in-elm/)
and we prefer pipelines :

```elm
firstAddThenMultiply : Int -> Int
firstAddThenMultiply number =
    number
        |> addOne
        |> multiplyByThree
```

## Emacs Shortcuts

| Binding | Command |
| --- | --- |
| C-c C-f | elm-mode-format-buffer |
| C-c M-t | elm-mode-generate-tags |
| M-. | elm-mode-goto-tag-at-point |
| M-, | pop-tag-mark |
| C-c C-l | elm-repl-load |
| C-c C-p | elm-repl-push |
| C-c C-e | elm-repl-push-decl |
| C-c C-z | run-elm-interactive |
| C-c C-a | elm-compile-add-annotations |
| C-c C-r | elm-compile-clean-imports |
| C-c C-c | elm-compile-buffer |
| C-c M-c | elm-compile-main |
| C-c M-k | elm-package-catalog |
| C-c C-n | elm-preview-buffer |
| C-c C-m | elm-preview-main |
| C-c C-d | elm-documentation-lookup |
| C-c C-i | elm-import |
| C-c C-s | elm-sort-imports |
| C-c C-t | elm-oracle-type-at-point |
| C-c M-d | elm-oracle-doc-at-point |
| C-c C-v | elm-test-project |
