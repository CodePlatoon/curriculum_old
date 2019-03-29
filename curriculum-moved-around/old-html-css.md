Day 1
---------
### Video Resources (Echo Platoon)
- [Week 5 Videos](https://www.youtube.com/watch?v=u5UT7jBwbEU&list=PLu0CiQ7bzwESK8JWt1KVzAHzjo7cVhs-f)

## Morning: Git Workshop #1
## Afternoon: HTML + CSS
* [HTML](https://docs.google.com/presentation/d/1TL9iBS7bZelSkcSQuc4cqNiv_Xphq4tueFm_mqgw-L0/edit?usp=sharing)
* [CSS](https://docs.google.com/presentation/d/154mAP_fYS4dH1nI9McczXNs5ZAkjqbDecWsbVD5odwg/edit?usp=sharing)

### Challenges
* [Make A Circle](https://github.com/indiaplatoon/make-a-circle)
* [Top Ten](https://github.com/indiaplatoon/top-ten)
* [Linkedin HTML](https://github.com/indiaplatoon/linkedin-html)
* [Recreate hacker news](https://github.com/indiaplatoon/html-sectioning) (stretch)

### Homework
* [Sections 1-7](http://learn.shayhowe.com/)

### Resources
* [HTML Reference](http://htmlreference.io/)
* [CSS Reference](http://cssreference.io/)
* Chrome Dev Tools
  * You can right-click on some text in your browser and select 'Inspect' to see some elements on your own on any page.




Day 2
--------

### Video Resources (Echo Platoon)
- [Week 5 Videos](https://www.youtube.com/watch?v=u5UT7jBwbEU&list=PLu0CiQ7bzwESK8JWt1KVzAHzjo7cVhs-f)

## Morning: Git Workshop #2
### Afternoon: CSS + Bootstrap
* Bootstrap is an open source CSS + JS framework originally developed by Twitter.
* Bootstrap is a giant blob of code that makes one able to develop "good looking" websites rapidly.

Pros:
* Mobile first. Meaning - if configured properly - your website will look nice on smaller screens.
* Compatible with all major browsers, back to Internet Explorer 9.
* Great documentation. [See here.](https://getbootstrap.com/docs/4.2/getting-started/introduction/)

Cons:
* Makes the web look very homogeneous. Bootstrap everywhere!
* Sometimes you write almost the equivalent amount of code to override Bootstrap as Bootstrap itself.
* You can't _effectively_ use Bootstrap without a sound understanding of HTML and CSS.


#### Challenges
* [Combining Selectors](https://github.com/indiaplatoon/html-combining-selectors)
* [Layering with multiple classes](https://github.com/indiaplatoon/html-layering)
* [Take your sectioning and semantic blog page to the next level. Apply positioning and floats!](https://github.com/indiaplatoon/complete-article)
* [Bootstrap Animals](https://github.com/indiaplatoon/bootstrap-animals)
* [Linkedin CSS](https://github.com/indiaplatoon/linkedin-css)
* [Review Shay Howe Section 10](http://learn.shayhowe.com/html-css/building-forms/)

#### Resources
* [Learn CSS Layout](http://learnlayout.com/) (resource we reviewed today)
* [Learn Grid Layout](http://learncssgrid.com/) (tutorial like `learn CSS layout`)
* [FlexBox Froggy game](http://flexboxfroggy.com/) 
* [Grid Garden game](http://cssgridgarden.com/)



Day 3
--------
### Video Resources (Echo Platoon)
- [Week 6 Videos](https://www.youtube.com/watch?v=u5UT7jBwbEU&list=PLu0CiQ7bzwESK8JWt1KVzAHzjo7cVhs-f)

### Lecture Topics
* JavaScript and the Web

### Challenges
* [Linkedin JS](https://github.com/indiaplatoon/linkedin-js)
* [Browser Storage](https://github.com/indiaplatoon/browser-storage)
* [Simple Todo](https://github.com/indiaplatoon/simple-todo)
* All assignments up to this point that have not yet been completed

### Homework
* [Review Javascript Intro](https://learn.shayhowe.com/advanced-html-css/jquery/#javascript)
* Read [Javascript Events Guide](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/Events)

### Resources
* [Mozilla Developer Network](https://developer.mozilla.org/en-US/docs)
* [Eloquent Javascript - Events](https://eloquentjavascript.net/14_event.html)



Day 4
------
### Video Resources (Echo Platoon)
- [Week 5 Videos](https://www.youtube.com/watch?v=c87wLe8Ahvc&list=PLu0CiQ7bzwER6FK4-K7kK2S8Y1g9jubbT)

## jQuery
Remember that:

Code |Effect
-----|------------
HTML | **content**
CSS  | **style**
JS   | **behavior**

As a result, we are able to change _content_ and _style_ based on user actions.

### What is jQuery?

jQuery is just a bunch of JavaScript code that makes it much easier for us to:

* _find_ Elements in an HTML document
* _change_ HTML content and CSS styles
* _observe_ What a user does and react to it
* _animate_ Content on a webpage
* _talk_ Over the network to retrieve data

When we learned about vanilla JS, we used code that looked like `document.getElementById`. The `document` is the webpage.
The browser creates a tree like structure to every webpage! We call this the DOM or the **Document Object Model**. Inside
DOM, HTML elements become `nodes` which are related to each other. You may remember using CSS classes to target the `children`
or `parents` of nodes, so we have some experience with this concept already. Here's a visual illustration:

![dom-tree](https://developers.google.com/web/fundamentals/performance/critical-rendering-path/images/dom-tree.png)

JavaScript gives us a language to _interact_ with the DOM.

### Using jQuery

The first step is to load the jQuery library on our page. Fortunately, we've done this before when we made our little
BootStrap carousel, which required jQuery. This is as simple as:

`<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>`

Now, to access jQuery, we use `jQuery(<code>)`. Alternatively, we can and _will_ use because we are lazy programmers:
`$(<code>)`. The `$` subs in for `jQuery`.

### Finding Nodes
Recall that to find an element before jQuery, we used `document.querySelector('h1')`.
With jQuery it's as simple as `$('h1')`. So much less typing!

### Changing content
After we have grabbed an element, we can do the same stuff we did with plain old JS. Except with less typing.
For example, to see an element's text, we can simply: `$('h1').text();`. To alter the text, we can just pass the text in like:
`$('h1').text('NEW TEXT');`
* Try this out on your own! What text do you expect to see in the `<h1>` tag?
```HTML
<head>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function() {
      $('h1').text('Hi')
    });
  </script>
  
</head>
<h1> Hey </h1>
```

**DOM LOADING**

One of the issues we encountered with our JS earlier is having to put the code into the end of the HTML file. We did this
because we need to make sure the DOM has finished loading the HTML content before we can reliably make changes to it. With
jQuery we can instead listen for this signal, and then run our code.

```JavaScript
$(document).ready(function() {
  <our code>
});
```
The above will only run once the DOM has finished loading. No more needing to put your Javascript `<script>` tags at the bottom of your HTML!

## Using `this`

Let's briefly compare these two blocks of code. Our HTML contains multiple `<button>` elements.

```JavaScript
$(document).ready(function() {
  $('button').on('click', function() {
    $('button').remove();
  });
});
```

```JavaScript
$(document).ready(function() {
  $('button').on('click', function() {
    $(this).remove();
  });
});
```

DOM traversal becomes much easier using `this`. The first block of code will remove **all** of the buttons. The second
will remove only the one that's clicked on (the power of `this`). Create an HTML document with a few buttons and run both sets of code to verify that it works!

### Assignments
* [Code Challenge](https://github.com/indiaplatoon/pizza-code-structure)
* [Traversing Challenge](https://github.com/indiaplatoon/pizza-traversing-dynamic-data)
* [Advanced Section #6](http://learn.shayhowe.com/)
