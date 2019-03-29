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



Day 5
-----------
### Video Resources (Echo Platoon)
- [Week 5 Videos](https://www.youtube.com/watch?v=c87wLe8Ahvc&list=PLu0CiQ7bzwER6FK4-K7kK2S8Y1g9jubbT)

AJAX is everywhere on the Internet and some would argue makes the user experience better for all. Whether or not you have noticed, you've probably used AJAX. Are you a Facebook user? Twitter? Youtube? You've used AJAX when you've scrolled to the bottom of the page only to find that there are more posts/tweets/videos (respectively) at the bottom. In many cases, there is the concept of `infinite scroll` that occurs to make your user experience better.

How about Google Maps? If you load up maps, you can zoom in and out of the page to see different businesses based on how far you've scrolled in and out. That certainly did not load up whenever you first loaded the page - based on user interaction with the website, AJAX requests are being made. Scroll over a business and see a street view photo and/or Google reviews - all AJAX!

If you Tweet and don't see your page refreshing, that's AJAX! Let's learn how to use it today:

--------------------------------------

With jQuery, we can make AJAX calls to web servers to

* _GET_ data and display it on our web pages
* _POST_ data and display the result on our web pages

The **GET** method should be used for non-destructive operations - operations where we are only _getting_ data
from the server, not _changing_ it. For example, a search.

The **POST** method is used for destructive operations - operations where we are _changing_ data on the server.
For example, posting a comment.

This can be done without the web page having to reload. AJAX stands for Asynchronous JavaScript And XML, 
and we will commonly pass data using JSON, JavaScript Object Notation. Generally speaking, Ajax does **not**
work across domains. A webpage loaded from www.yoursite.com is normally unable to make a request to www.mysite.com
as it would violate the same origin policy. CORS (Cross-Origin Resource Sharing) allows Ajax requests across domains.

For a simple test, let's practice retrieving some JSON data. Let's create an `ajax.html` file

```HTML
<head>
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="application.js"></script>
</head>
<body>
  <div id="response-data"></div>
</body>
```
Let's create it's corresponding `application.js` file:
```JavaScript
$(function () {
  $.getJSON("https://jsonplaceholder.typicode.com/todos",
    function(response) {
      $('#response-data').html(JSON.stringify(response));
    });
});
```

In the above exercise, we use `$.getJSON` to retrieve JSON data from the **jsonip** server,
which returns our IP address, along with some other stuff. This data is first made into a string
using `stringify` and then rendered on our webpage. There are lots of APIs out there to use, and
you will build many in your web development careers.

The next step will be to parse the JSON data and insert it into our HTML. To do that, let's add
an unordered list to our HTML with an `id` we can use in our JS. We'll then append list items
to it with each piece of data.

```HTML
<body>
  <ul id="response-data">
  </ul>
</body>
```
Add the changes in the JS file below to your JS file:
```JavaScript
$(function () {
  $.getJSON("https://jsonplaceholder.typicode.com/todos",
    function(response) {
      $.each(response, function(i, item) {
        $('#response-data').append("<li>" + item + "</li>");
      });
    });
});
```

## Practice
* Try adjusting the code above to display different pieces of the returned object.
* Add a console log to see what the object looks like before it is rendered.
* `getJSON` is just a simpler version of the full `$.ajax` jQuery call. Let's rewrite our method using the `$.ajax` method.

Your code should look something like this:
```JavaScript
$(function() {
  $.ajax("https://jsonplaceholder.typicode.com/todos", {
    success: function(response) {
      $.each(response, function(i, item) {
        $('#response-data').append("<li>" + item + "</li>");
      });
    }
  });
});
```

The `success` function above is code that is executed ONLY IF the AJAX call is successful.

### Dealing with errors
If something blows up in the AJAX request, we want to have something to handle errors so that something occurs and the user is notified when something goes wrong.

With our full function, error handling is fairly simple. We add the `error` callback, and add what we want to do
when there is an error.

```JavaScript
$(function() {
  $.ajax("https://jsonplaceholder.typicode.com/todos", {
    success: function(response) {
      $.each(response, function(i, item) {
        $('#response-data').append("<li>" + item + "</li>");
      });
    },
    error: function(request, errorType, errorMessage) {
      alert('Error: ' + errorType + ' with message: ' + errorMessage);
    }
  });
});
```

The above code won't trigger an error. An easy way to do so is to modify the URL to something that doesn't exist
or doesn't return JSON. Go ahead and do that now.

### Doing stuff before and after the request

Oftentimes, we want to show that our data is loading so that the user knows that something is going on while our
Ajax function sends and or receieves data. This can be done with the `beforeSend` and `complete` callbacks (find it [here](http://api.jquery.com/jquery.ajax/)). Let's
add those to our function, along with a `timeout` to indicate how long to wait for the data to load.

```JavaScript
$(function() {
  $.ajax("https://jsonplaceholder.typicode.com/todos", {
    success: function(response) {
      $.each(response, function(i, item) {
        $('#response-data').append("<li>" + item + "</li>");
      });
    },
    error: function(request, errorType, errorMessage) {
      alert('Error: ' + errorType + ' with message: ' + errorMessage);
    },
    timeout: 2000,
    beforeSend: function() {
      $('#loading').append('<h4 class="loading-text">Loading...</h4>');
    },
    complete: function() {
      $("h4").remove();
    }
  });
});
```
You may not see anything there because the successful call happens so fast. Maybe a `debugger` statement is good here?

## Forms

So far, we've learned how to **GET** data. Now, we will practice **POST** requests. We will submit this data online.
First, go to [PutsReq](http://putsreq.com/) and click 'Create a PutsReq.' This will create a little bucket for us
to send data to. Next, we need to alter the _response_ from the server so our `success` callback will fire (this is in the `PutsReq` you just made)

Response code:
```JavaScript
response.status = 200;
response.headers['Content-Type'] = 'application/json';
response.body = { 'msg': 'ok' };
```

Great. now we can build a simple form in HTML. Don't forget to add jQuery and your relevant JS file:

```HTML
<form id="commentForm">
  <input type="text" id="comment" name="comment">
  <button type="submit" id="submitComment">Submit Comment</button>
</form>
<div id="commentStatus">
</div>
```

Read the following JavaScript code carefully.

```JavaScript
$(function() {
  $("#commentForm").submit(function(e) {
    let formData = $("#comment").serialize();
    e.preventDefault();
    $(this).attr('disabled','disabled'); // Switch to default grey
    $(this).html("Sending"); // Change text of button
    $.ajax({
      async: true,
      type: 'POST',
      url: "<YOUR PUTSREQ URL>",
      data: formData,
      dataType: 'text',
      crossDomain: true,
      complete: function() {
        $("#submitComment").removeAttr('disabled'); // Change back text of button
      },
      error: function(request, errorType, errorMessage) {
        $("#commentStatus").text("Comment failed. Error: " + errorType + " " + errorMessage);
      },
      success: function(response) {
        $("#commentStatus").text("Comment sent successfully.");
        $('#submitComment').html("Submit Comment");
      }
    });
  });
});
```

- We use `preventDefault` to stop the browser from loading a new page.
- We add `type` to the `ajax` call and set it to `POST` indicating that this is a **POST** request.
- We `serialize` the data from the form and send it as text indicated by `dataType`
- Like before, we use the `complete`, `error`, and `success` callbacks to do different things.
- Add your PutsReq URL to make this work.

# Challenges
* [AJAX Challenge](https://github.com/indiaplatoon/ajax-challenge)
