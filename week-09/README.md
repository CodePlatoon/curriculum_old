# Weekly Topics:
- Fetch and JavaScript promises (Introduced in Week 5)
- React Hooks and Component Lifecycles
- Service Oriented Architecture (SOA) and Django as an API
- Django as an API using Django REST Framework
- Heroku for app deployment

# Why is it important?
- Promises is the JS concept that allows us to make calls to web services. Understanding this concept is necessary for using fetch to bring dynamic data from an external source into an app you're building.
- Component lifecycles allow you to hook into a React class component at a particular stage, which has various effects. As a developer, you'll want certain important requests, such as calling out to you API, to happen at a certain stage and you'll use lifecycle methods to do so.
- React Hooks allow us to achieve a similar effect to lifecycle methods in functional components; this will become more important to apps you build as React moves away from class components.
- Real-world applications are often too large to be built entirely in Django, so you'll need to be able to create and handle applications which use Django as the "back-end" to read/write from your database and ReactJS for all the "front-end" logic.
- Once development is complete, you'll want to deploy apps so that they are available on a public server, not just your local device, and Heroku is a free and easy way to do this.

# What you'll be able to accomplish after this topic:
1. Understand the concept of promises in JS and how they allow us to make calls to web services
2. Clearly express the history of the web and why we used, but no longer use, AJAX
3. Use fetch to get asynchronous data from external sources and bring it into a React app
4. Use the lifecycle method componentDidMount() to connect to your API from a React class component
5. Use the React hook useEffect() to connect to your API from a React functional component
6. Create a Django API that returns JSON to be used in ReactJS
7. Deploy apps to Heroku
