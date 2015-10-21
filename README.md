# sc-twitter-rails (Andy Weiss)

## App Design

This app is designed around a single model, the TwitterCall:

- TwitterCall has two string fields, handle and slug, each of which must be present and unique.
- TwitterCall implements a #response method, which fetches the 25 must recent tweets for its handle.
- The actual API call is made through the [Twitter gem's](https://github.com/sferik/twitter) #user_timeline method.  
- #response also implements a low-level 5 minute cache and some basic error handling.

## Routes, Controllers and Flashes

The only supported controller actions are #new, #create and #show.

- #create utilizes a find_or_initialize_by syntax, such that repeated queries of the same handle don't necessitate additional DB records.
- ID has been obscured from the url, such that the url of a search will display as /twitter_calls/:slug, rather than twitter_calls/:id.
- If a user requests a handle that does not exist or that has no tweets, he is redirected to a new query with a flash alert that explains the redirect.