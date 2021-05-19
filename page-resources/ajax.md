AJAX stands for "**A**synchronous **J**avascript **A**nd **X**ML".

There's a concept of `promises` in Javascript. You make a request from a web page using AJAX and if it's successful, it does something. If it is not successful, we do something else. Here's a basic implementation of AJAX:

```javascript
$.ajax('https://jsonip.com', {
  success: function(data) {
    console.log(data);
  },
  error: function() {
    alert('something went wrong')
  }
})
```

This is not a terrible way to fetch data and do something with it. The original purpose of AJAX was just meant to grab data from widgets and then bring it back to your page. As the Internet grew, however, it became a bit more unmanageable. Here's a hypothetical example if Facebook were a single page app and they were using AJAX:

```javascript
$.ajax('https://www.facebook.com/login', {
  success: function(data) {
    // Login Successful - show home screen
  },
  error: function() {
    alert('something went wrong')
  }
})
```

While it may seem simple enough, this is probably not what's going on behind the scenes. There are probably a ton of other AJAX calls that would occur. You'd log in, hit the home screen, and then probably have some posts loaded via AJAX, maybe some photos, some statuses, etc. Your code might look more like a nightmare like this:

```javascript
$.ajax('https://www.facebook.com/login', {
  success: function(data) {
    // Login Successful - show home screen
    $.ajax('https://www.facebook.com/posts', {
      // Posts loaded
      $.ajax('https://www.facebook.com/posts/photos', {
        success: function(data){
          // Photos loaded
          $.ajax('https://www.facebook.com/posts/statuses', {
            success: function(data){
              // Statuses loaded
              $.ajax('https://www.facebook.com/posts/comments', {
                success: function(data){
                  // Comments loaded
                  $.ajax('https://www.facebook.com/posts/likes', {
                    success: function(data){
                      // Likes loaded
                    },
                    error: alert('something went wrong with likes')
                  })
                },
                error: alert('something went wrong with comments')
              })
            },
            error: alert('something went wrong with statuses')
          })
        },
        error: alert('something went wrong with photos')
      })
    }),
    error: function() {
      alert('sorry, error with posts')
    }
  },
  error: function() {
    alert('something went wrong')
  }
})
```

As you can begin to see with the AJAX calls above, it's beginning to form what's called the `JS Christmas Tree of Doom` or `Javascript Hell` or `Callback Hell`. It's very difficult to read and isn't read top to bottom. Instead, it's read from outside to inside. It's like a Quintin Tarantino movie. This, however, is how the web used to be written. The newer way to make HTTP requests is via the [Fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API)
