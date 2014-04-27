AngularJS + Socket IO, Express, Node
=======================================
:created: 2014-04-19
:url: git@github.com:dotmpe/angular-socket-io-seed.git

seed project
-------------
Forked from https://github.com/btford/angular-socket-io-seed

XXX: this is a merge with mongoose demo, see branche docs below.

Frontend
  - AngularJS
  - JQuery & Bootstrap
  - Templates through Jade backend?

Backend
  - Socket IO
  - Express
  - Node.js
  - Passport login

- `Original Seed project ReadMe <ReadMe-Seed.md>`_

Installation::

  npm install -g nodemon forever mocha
  npm install 
  cp config/config.example.js config/config.js
  cp config/imager.example.js config/imager.js

The global install is not really required here.
nodemon is used by npm start scripts, you will need to adjust the path there
if you decide to install nodemon locally. Module `forever` prefers to be global,
and `mocha` is just a preference. Personally I have more modules to use the
latest, globally installed version.

You want to create/set a few API keys for services you want to use.
  
Run::
  
  npm start

FIXME::

  npm install -g bower \
    && bower install && npm install \
    && node start


Branch docs
~~~~~~~~~~~
master
  - Mostly original seed project. 
  - Added underscore utils at backend.
  - Removed cached bower_components from GIT, added bootstrap CSS/JS at
    frontend using bower.
  - Need to figure out how to do passport with angular, and what socket.io+angular
    does exacatly.

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

mongoose_demo
  Merged master of both projects, this branch runs the mongoose demo project and has no angular;
  but it does have a working Passport implementation. 
  Bower and angular are working, but need to plan rewriting routing/templates.
  Not sure how far to take a single ng-app yet.

  Also may want to check out backbone with ng separately.
  And/or on another branch replace mongoose with sqlite3.

  Since everyone talks about backbone and angular separately and exclusively,
  I'm probably better off hacking express+socketio+sqlite3 for now to get my
  things going.

Features
~~~~~~~~~

AngluarJS
__________

- TODO: read more about ``btford.socket-io`` in ``public/bower_components/angular-socket-io/README.md``

