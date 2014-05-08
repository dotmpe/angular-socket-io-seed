AngularJS, CoffeeScript, RequireJS + NodeJS, Socket IO, Express
===============================================================
:created: 2014-04-19
:url: git@github.com:dotmpe/angular-socket-io-seed.git

Seed project
-------------
Initial master forked from https://github.com/btford/angular-socket-io-seed
After some experimental features, mongoose_demo was imported from ...
RequireJS was merged onto f_markdown and could be needed elsewhere.


Frontend
  - AngularJS
  - JQuery & Bootstrap
  - Templates through Jade backend?
  - RequireJS 
  - CoffeeScript

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
  #cp config/imager.example.js config/imager.js

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

<<<<<<< HEAD
  ToDo:
    - Need RequireJS at frontend.
=======
  Subbranches have fixed various wanted features.
  Need to get back to master once some ORM starts rolling.

  ToDo:
>>>>>>> master
    - Would want coffeescript/livescript at frontend.
    - Need to figure out how to do passport with angular, 
      look at what socket.io+angular does.
    - Compare against SocketStream stack.

  Feature: f_coffee
    - Started feature branch  for coffeescript. 
    - Working for backend, need to fix loading in frontend.
    - Merged requirejs refactoring here, see if/what syntaxes this can support.
    - Added require-cs, now has working client-side coffescripts.

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

  Merged RequireJS seed here? Or one of the feature branches.
  Need to fix coffee-script, other frontend features
  and get back here.

  Feature: f_markdown
    - First feature branch for mongoose_demo. 
    - Create a client-side markdown editor. Needs RequireJS.
  
  Feature: f_backbone
    - need to get to the bare metal: xhr, dom and sync, fetch, etc.
    - added example, trying to choose paths to let various projects coexist.
      using as monolithic project right now.
    - 2014-05-08 merged into f_coffee

Features
~~~~~~~~~

AngluarJS
__________

- TODO: read more about ``btford.socket-io`` in ``public/bower_components/angular-socket-io/README.md``

Customizations and Extensions
_______________________________
Since NodeJS is a convenient framework for web prototyping, a mechanism to plug
portable components would be nice to have. The current refactoring is also
targetting a personalized Express 4 application, possibly working toward some
kind of plugin functionality.

At the very least, a standardized tree for files that make SCM forks and merges less
of a pain is given. See notes below and elsewhere.

Proposed paths:

- plugin/<module>/settings.default
- plugin/<module>/route 
- plugin/<module>/app
- plugin/<module>/ext-manifest

There is no name for the plugin mechanism. Also, there are perhaps a 1001 such
things out there.

Paths
------------
Some up to date notes on the paths in the project.

- config/config* - Static configuration files
- config/config.<module> - Extension module static config
- config/express - Express/Connect middleware init
- config/routes* - Express routes init
- config/routes.<module> - Extension module routes init

- app/ - application directory
- app/ext/<module>/ - appliction Extension directory

- public/ - Static HTTP resources
- public/script/ng-trojan/ - Client scripts for Angular app
- public/components/ - Bower component installation dir

See app/main.txt for more info on application paths.

The paths for extensions are in the same tree here, but
perhaps as installable they will end up as the list given in the previous
section.



