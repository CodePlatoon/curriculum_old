# JavaScript and the web
## [JS 101 Presentation](https://github.com/golfplatoon/curriculum/blob/master/week-05/lecture_materials/JS-101.pdf)

* HTML is the **content**
* CSS is the **style**
* JS is the **behavior**

When it's time to _interact_ with websites, we reach in our toolbox for JavaScript. It provides dynamic interactivity on
websites.

### Hello World!

How can we use JavaScript to alter a website? Generally speaking, we first **select** what we want to alter, then we use JavaScript to determine **how** we want to alter it.

Let's create a simple script to a page to display "Hello World":
[gist to use](https://gist.github.com/KaraAJC/c7ffd5c4f6f8625319ebf402cbe5ee7e)
```HTML
<body>
  <h1 id="heading-1"></h1>
  <script>
    var text = document.getElementById('heading-1');
    text.textContent = 'Hello World!';
  </script>
</body>
```

As you can see, we first **select** the element, then modify it. This will be a common theme when we use JS with our applications.

### Events

Next, we want to add some real interactivity to our site. Let's try a button. We want the button to popup an alert that says something.
```html
<body>
  <button onclick=doSomething()> Click me!</button>
  <script>
    var doSomething = function() {
      alert("I DID A THING!!");
    }
  </script>
</body>
```

As you are writing your code, it's important (for now) to keep the `<script>` at the end of the `<body>`, as the browser will not know about setting the variable in the script until after it is rendered.

### ON YOUR OWN 1: Counter / Javascript Practice
* Use your JavaScript knowledge to implement a simple counter on a web page. It just needs to increment a number on your page, based on a user clicking on a button.

### ON YOUR OWN 2: Using JavaScript to alter CSS

One of the most common ways JS is used is to alter the look of a web page. There are special methods we can run on elements to change their CSS properties. Remember those?

Let's make a button that changes the background of our website.

1. Make a button in `HTML` with an `onclick` attribute that calls a javascript function.
2. Create a function with the name of the attribute's value that alters the background color of the webpage.
  * You may need `querySelector`. `querySelector` is a way we can select an element by its tag.
