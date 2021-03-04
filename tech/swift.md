# Swift 

## Shorthand for `if ... != nil`

Long version:

```swift
if let chosenEmoji = emojis[card.identifier] != nil {
  return emojis[card.identifier]!
} else {
  return "?"
}
```

Short equivalent:

```swift
emojis[card.identifier] ?? "?"
```

## Optionals

```swift
var indexOfOpenCard: Int?
```

Terminate the execution if the optional is empty using `!`:

```swift
print(indexOfOpenCard) // It'll never terminate
print(indexOfOpenCard!) // It might terminate
```
