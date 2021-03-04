# OSX Programming

## Codesign

A command-line tool for signing OSX apps. e.g

```
codesign --verbose=4 -s "<Signature Key>" --deep --strict Foo.app
```

Verify if an app was signed;

```
codesign -dvvv --strict --deep-verify Foo.app
```

Verify if it'll be allowed to be executed;

```
spctl -a -t exec -vv Foo.app
```
