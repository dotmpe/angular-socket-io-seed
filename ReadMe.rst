AngularJS + Socket IO, Express, Node
=======================================
:created: 2014-04-19
:url: git@github.com:dotmpe/angular-socket-io-seed.git

seed project
-------------
Forked from https://github.com/btford/angular-socket-io-seed

Frontend
  - AngularJS
  - JQuery & Bootstrap
  - Templates through Jade backend?

    TODO: read more about ``btford.socket-io`` in 
      ``public/bower_components/angular-socket-io/README.md``

Backend
  - Socket IO
  - Express
  - Node.js

- `Original Seed project ReadMe <ReadMe-Seed.md>`_

Installation and run::
  
  npm install -g bower \
    && bower install && npm install \
    && node app.js


Branch docs
~~~~~~~~~~~
master
  Original seed project.

  f_coffee
    - Started feature branch  for coffeescript. 
    - Working for backend, need to fix loading in frontend.

  f_tumblr
    - Started feature branch for tumblr.
    - Figure out OAuth first.

  f_oauth2
    - Need to get federated login. OAuth2 working easily, Oauth1 too
      complicated, use library: Passport.

    f_passport
      - Looking at passport module for authentication, tumblr module.

