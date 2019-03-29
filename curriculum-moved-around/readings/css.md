## CSS
* _Cascading_ Style Sheets
    * The emphasis on cascading means that the last style line of code to run is what is rendered by the browser.
    * A way to think of the relationship between HTML and CSS is building a building.
      * The architecture of a building is the HTML
      * CSS is the color of the paint, the size of the windows, etc.
    * On the web, HTML contains and expresses content, CSS _styles_ the content.

* How to apply CSS
  1. Put it directly `inline`
    * `<p style="color: red;">Paragraph</p>`
  2. Create an internal stylesheet
    ```
    <html>
      <head>
        <style>
          p { color: red; }
        </style>
      </head>
      <body>
        <p>Paragraph</p>
      </body>
    </html>
    ```
  3. Link an external stylesheet:
    ```HTML
    <html>
      <head>
        <link rel="stylesheet" type="text/css" href="/assets/styles.css">
      </head>
    </html>
    ```
    `styles.css` file:
    ```CSS
    p { color: red; }
    ```

### The structure of CSS

`selector { property: value }`

1. `<h5>Text</h5>`
2.  Apply CSS `<h5 style="text-align: center;">Text</h5>`
3.  In this case, the `h5` is the `selector`, `text-align` is the property, and `center` is the value.

## CSS Specificity
* What happens if you you have `div`, `class`, or `id` elements with style conflicts? (i.e., a `div` has X style, a `class` has Y style, and an `id` has Z style)? The browser won't know what to do!
* Luckily, there is specificity built into CSS. The higher the weight,
the greater the superiority when styling conflicts occur.

Selector | Weight
--- | ---
`<>` | .001
`.class` | .010
`#id` | .100

Selectors can be combined to result in a greater weight.

`.red-text .capital { background-color: yellow; }`

The above carries a weight of `.020`


## The Box Model

### ~~Everything is a box.~~ Everything on the internet is a box.

![box model](https://cloud.githubusercontent.com/assets/2447940/21958828/a870607e-da7c-11e6-9447-6e7d8e4d67fe.PNG)

Check it out for yourself

![box-model-gif](https://cloud.githubusercontent.com/assets/2447940/21958874/76a5aff8-da7d-11e6-91d3-e9e4fd97cd2b.gif)

Let's make a box together.

```HTML
<style>
  div {
    border: 6px solid #949599;
    height: 200px;
    margin: 20px;
    padding: 20px;
    width: 200px;
  }
</style>
<div>Hello</div>
```

Hints:

* `border` is shorthand for setting multiple border properties.
* `#949599` is a hexadecimal color code.
* `div` is a tag that has no meaning, except that it is a block element. `span` is the same, except inline.

## Pseudo and Dynamic Classes

Pseudo and dynamic classes are created as a result of user actions. For example:

```HTML
a:link    { color: green; }
a:visited { color: yellow; }
```

If you were to create an html file and put this CSS in the `style` tag, you would see the above in action. (The first line of code would change the color of the links on the page to green, and if those links had been previously visited, they would be yellow.)

A commonly used dynamic class is `hover`.

```HTML
a:hover {
  text-decoration: none;
  color: blue;
  background-color: yellow;
}
```

The above code would cause links on the page to change colors only when hovered upon by the cursor.

## HTML Positioning

You may have noticed that you (at the moment) can only really put elements on the page _vertically_. Positioning allows us to move elements to different parts of the browser window.

The CSS property is `position`. Giving an element a `relative` position means that the element can be repositioned _relative_ to its parent. Another value, `absolute` pulls the element out of the flow of the document and it basically lives in its own world (or relative to the closest relatively positioned parent). A `fixed` position keeps the element in one place, even if the window is scrolled.

Using the HTML code below, style the navbar so that it appears on the left. A great place to implement the code above is on [CODEPEN](https://codepen.io/). Try making your navbar on there.
```HTML
<div class="navigation">
  <ul>
    <li><a href="/about">About Us</a></li>
    <li><a href="/contact">Contact</a></li>
  </ul>
</div>
<div class="content">
  <h1>Welcome to Interstellar Travel, Inc.</h1>
  <p>
    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos enim quam dignissimos officiis, nam ex molestiae
    adipisci aliquam officia natus, praesentium. Ipsa quo, inventore autem, quod neque esse quasi debitis!
  </p>
</div>
```