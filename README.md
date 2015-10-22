# sc-twitter-rails (Andy Weiss)

## App Design

This app is designed around two models, TwitterCall and User:

- TwitterCall has two string fields, handle and slug, each of which must be present and unique.
- TwitterCall implements a #response method, which fetches the 25 most recent tweets for its handle.
- The actual API call is made through the [Twitter Gem's](https://github.com/sferik/twitter) #user_timeline method.  
- #response also implements a low-level 5 minute cache and some basic error handling.
- User is just a simple [Devise](https://github.com/plataformatec/devise) backed user, with email and password fields.

## Routes, Controllers and Flashes

The only supported controller actions are #new, #create and #show.

- All TwitterCall controller actions have a :authenticate_user! before_action.
- #create utilizes a find_or_initialize_by syntax, such that repeated queries of the same handle don't necessitate additional DB records.
- ID has been obscured from the url, such that the url of a search will display as /twitter_calls/:slug, rather than twitter_calls/:id.
- If a user requests a handle that does not exist or that has no tweets, he is redirected to a new query with a flash alert that explains the redirect.

## Local Setup

This app uses the [dotenv-rails gem](https://github.com/bkeepers/dotenv) to handle sensitive keys.  You will need to clone the repo, and place a .env file at root that has the following four keys, and their associated values (which can be generated from your Twitter account):

        TWITTER_CONSUMER_KEY=
        TWITTER_CONSUMER_SECRET=
        TWITTER_ACCESS_TOKEN=
        TWITTER_ACCESS_TOKEN_SECRET=

From there a simple 

        bundle install
        rails server

from the command line will have you up and running, with the app accesible at localhost:3000.

## Heroku Deployment

The app uses a Puma server and Postgresql DB for deployment.  Presuming you have a Heroku account, all you need to do is run.

        heroku create
        git push heroku master

from the command line.  The app is currently deployed to [https://sc-twitter-rails.herokuapp.com](https://sc-twitter-rails.herokuapp.com).

## Testing

Tests are written in Rspec and can be accessed by running

        rake

from the command line.  

- Model tests are in /spec/models/twitter_call_spec.rb
- Helper tests are in /spec/helpers/twitter_calls_helper_spec.rb
- Capybara feature tests are in /spec/features/user_makes_a_helper_spec.rb
- Feature tests depend on methods defined in /spec/support/support_methods.rb
- Database Cleaner is used for breakdown between specs.

## Miscellaneous

- I do some simple parsing for @mentions in /helpers/twitter_calls_helper.rb.  It's possible some punctuation could throw the parser for a loop but I did some basic testing to try and prevent this with some regex matching that could be improved as errors are caught.
- Similarly, the app tries to parse urls and render them as hyperlinks to new tabs.
- Basic styling is done with [Bourbon](http://bourbon.io/), [Neat](http://neat.bourbon.io/) and [Refills](http://refills.bourbon.io/).