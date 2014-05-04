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
  - Node.js
  - Socket IO
  - Express
  - Bookshelf (SQL ORM)
  - Passport (authentication)

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
  - Mostly original seed project, added underscore.
  - Install CSS/JS using bower to public folder,
    no other asset management; paths directly to Jade.

  ToDo:
    - Need RequireJS at frontend.
    - Would want coffeescript/livescript at frontend.
    - Need to figure out how to do passport with angular, 
      look at what socket.io+angular does.
    - Compare against SocketStream stack.

  Feature: f_coffee

    - Started feature branch  for coffeescript. 
    - Working for backend, need to fix loading in frontend.

  Feature: f_tumblr
    - Started feature branch for tumblr.
    - Figure out OAuth first.

  Feature: f_oauth2
    - Need to get federated login. OAuth2 working easily, Oauth1 too
      complicated, use library: Passport.

  Feature: f_passport
      - Looking at passport module for authentication, tumblr module.

Fork: mongoose_demo
  Merged in mongoose-demo seed. 
  Working to rewrite to bookshelfjs

  Mongoos-demo seed had originally no angular; 
  but does have a working Passport implementation. 

  May want to check out backbone with ng separately.

  Since everyone talks about backbone and angular separately and exclusively,
  I'm probably better off hacking express+socketio+sqlite3 for now to get my
  things going.

  There is an Angular app called 'trojan' here.

Features
~~~~~~~~~

AngluarJS
__________

- TODO: read more about ``btford.socket-io`` in ``public/bower_components/angular-socket-io/README.md``

