# CSS

## Reset & Make Fonts Look Better

```css
* {
  font-weight: normal;
  -webkit-font-smoothing: antialiased !important;
  -moz-font-smoothing: antialiased !important;
  -moz-osx-font-smoothing: grayscale;
  speak: none;
  font-style: normal;
  font-weight: normal;
  font-variant: normal;
  text-transform: none;
  line-height: 1;
  -webkit-font-smoothing: antialiased;
}
```

## transition

Add transform property ease-in effect;

```css
-webkit-transition: all 0.3s ease-in;
-moz-transition: all 0.3s ease-in;
-o-transition: all 0.3s ease-in;
transition: all 0.3s ease-in;
```

Specify `all` instead of transform if effect should impact all properties.

## Rotate

Rotate an element;

```css
-webkit-transform: rotate(360deg);
-moz-transform: rotate(360deg);
-o-transform: rotate(360deg);
transform: rotate(360deg);
```

## Animation

Usage:

```css
-webkit-animation: fade 5s;
animation: fade 5s;
```

Definition:

```css
@-webkit-keyframes fade {
    from { opacity: 0 }
    to { opacity: 1 }
}

@keyframes fade {
    from { opacity: 0 }
    to { opacity: 1 }
}
```

## text-overflow

Add "..." into the end of the lines overflowing;

```css
overflow: hidden;
text-overflow: ellipsis;
white-space: nowrap;
```

#### not()
Apply rules to all except last one;

```
section:not(:last-child) { margin-bottom:1em; }
```

## nth-child()

Keywords available: `even`, `odd`

Example: Select every 3rd element
```
ul li:nth-child(3n+3)
```

## Masonry Layout

```html
<article>
  <section>foo</section>
  <section>bar</section>
</article>
```

```css
article {
 -moz-column-width: 13em;
 -webkit-column-width: 13em;
 -moz-column-gap: 1em;
 -webkit-column-gap: 1em;
}

section {
 display: inline-block;
 margin:  0.25rem;
 padding:  1rem;
 width:  100%;
 background:  #efefef;
}
```

## Grid Layout

```css
.grid {
    display: grid;
    width: 400px;
    grid-template-columns: 50% 50%;
    grid-template-rows: auto auto;
    grid-column-gap: 0px;
    grid-row-gap: 20px;
    justify-items: stretch;
    align-items: stretch;
}
```

## Hamburger Menu Icon

```css
.hamburger {
  position: relative;
  display: inline-block;
  width: 1.25em;
  height: 0.8em;
  margin-right: 0.3em;
  border-top: 0.2em solid #000;
  border-bottom: 0.2em solid #000;
}

.hamburger:before {
  content: "";
  position: absolute;
  top: 0.3em;
  left: 0px;
  width: 100%;
  border-top: 0.2em solid #000;
}
```

## Rainbow Text Animation

```css
.rainbow {
   /* Chrome, Safari, Opera */
  -webkit-animation: rainbow 1s infinite;

  /* Internet Explorer */
  -ms-animation: rainbow 1s infinite;

  /* Standard Syntax */
  animation: rainbow 1s infinite;
}

/* Chrome, Safari, Opera */
@-webkit-keyframes rainbow{
  20%{ color: rgb(225, 45, 0); }
  40%{ color: rgb(255, 175, 0); }
  60%{ color: rgb(0, 200, 100); }
  80%{ color: rgb(0, 175, 200); }
  100%{ color: rgb(200, 100, 150); }
}

/* Internet Explorer */
@-ms-keyframes rainbow{
  20%{ color: rgb(225, 45, 0); }
  40%{ color: rgb(255, 175, 0); }
  60%{ color: rgb(0, 200, 100); }
  80%{ color: rgb(0, 175, 200); }
  100%{ color: rgb(200, 100, 150); }
}

/* Standard Syntax */
@keyframes rainbow{
  20%{ color: rgb(225, 45, 0); }
  40%{ color: rgb(255, 175, 0); }
  60%{ color: rgb(0, 200, 100); }
  80%{ color: rgb(0, 175, 200); }
  100%{ color: rgb(200, 100, 150); }
}
```

## Shaking Effect

```css
/* also need keyframes and -moz-keyframes */
@-webkit-keyframes shake {
  8%, 41% {
    -webkit-transform: translateX(-10px);
  }
  25%, 58% {
    -webkit-transform: translateX(10px);
  }
  75% {
    -webkit-transform: translateX(-5px);
  }
  92% {
    -webkit-transform: translateX(0%);
  }
  5px, 100% {
    -webkit-transform: translateX(0);
  }
}
```
