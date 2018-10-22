## HTML
* What is HTML?
  * HTML = Hyper Text Markup Language
  * Instructs the web browser how to display a page.
  * Separates content from presentation.
  * Elements define content types by containing tags that contain or express content.
* HTML is not...
  * Programming in its purest sense.
  * Easy, because it requires quite a bit of memorization.
  * Easy, because different browsers display markup in different ways.

### Example
```HTML
<h1>This is a heading</h1>
```
* Breaking this down:
  * The `<h1>` is called a `tag`, _most_ tags will have openings `<h1>` and closings `</h1>`.
  * The `content` is what is between the tags. Tags can be used to express content in different ways.
  * The combination of everything: `<h1>This is a heading</h1>` is an element. The web is full of elements!
* Sometimes, `elements` have `children` (`<div>` has a child, `<h1>`):
```HTML
<div>
  <h1>Heading</h1>
</div>
```

### Display types
It is _crucial_ to know how an element is displayed.
* A `block` element, such as `<h1>` takes up the **entire** width of the browser window.
* An `inline` element, such as `<a>` only takes up the **space** of its content


## CSS Floats

The last big piece of this puzzle are floats. `float` allows us to shift the element box to the right or the left of a line with the surrounding content floating around it.

`float: left;` Takes the element out of the normal document flow and puts it on the left.
`float: right;` Does the same and puts it on the right. Try both of these out with your navbar!

