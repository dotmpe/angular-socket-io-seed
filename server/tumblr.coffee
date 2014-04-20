{Blog, User} = require 'tumblr'

oauth =
  consumer_key: 'OAuth Consumer Key'
  consumer_secret: 'OAuth Consumer Secret'
  token: 'OAuth Access Token'
  token_secret: 'OAuth Access Token Secret'

blog = new Blog 'blog.tumblr.com', oauth

blog.text limit: 2, (error, response) ->
  throw new Error error if error
  console.log response.posts

user = new User oauth

user.info (error, response) ->
  throw new Error error if error
  console.log response.user


