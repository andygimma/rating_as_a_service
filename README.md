# RatingAsAService

Welcome to the hottest new SAAS product, Rating As A Service!

Before RAAS (Rating as a Service) ratings for businesses were split up between web giants like Facebook, Google, and Yelp. But our idea to combine all ratings was so good, we are getting funding and support from all of those web giants? The last thing we need are developers to create beautiful and thoughtful frontends so users can consume our service. That's where you come in! Follow the directions below to create your stunning frontends!

## Set up

### Up and Running

Make sure you have Elixir, Phoenix, and Postgres up and running on your computer. Once you do, you can run `mix ecto.create` and `mix ecto.migrate` to get your database up and running.

### Analysis tools

You can run `mix credo` for linting, and `mix sobelow` for security checks.

### Populate the database

To populate the database, run `mix fetch_food_trucks`

### Explore the database with our API

Use a tool like postmas, or one like curl in the terminal, to hit this endpoint: http://localhost:4000/api/food_trucks


## Upcoming features

### Comments and Ratings

* The most important part of our app is the ability to leave comments and ratings. This is where we generate our value.
* We will add more search features, including GraphQL support.
* We will run credo and sobelow in a git hook, to ensure we are always passing these checks.
